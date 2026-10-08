#!/usr/bin/env bash
# make-graph-demo.sh — builds a small repository with an interesting commit graph
# to project in class (sessions 2, 3 and 6). Open the result in GitKraken.
#
# Usage:   bash make-graph-demo.sh [target-folder]
# Default: ./graph-demo  (plus ./graph-demo-origin.git, a local stand-in for GitHub)
#
# Works on macOS, Linux and Windows (Git Bash). Needs only Git.
#
# What you get:
#   main           merge commit from feature/menu, plus one commit not pushed yet
#   origin/main    one commit behind main  -> "1 ahead" in GitKraken
#   feature/menu   merged with a merge commit, branch not deleted
#   feature/footer merged as a fast-forward (no merge commit)
#   fix/typo       open branch, not merged
#   experiment     old branch that is far behind main

set -euo pipefail

DEMO="${1:-graph-demo}"
ORIGIN="${DEMO}-origin.git"

if [ -e "$DEMO" ] || [ -e "$ORIGIN" ]; then
  echo "'$DEMO' or '$ORIGIN' already exists. Delete them or pass another name." >&2
  exit 1
fi

git init --quiet --bare "$ORIGIN"
git init --quiet "$DEMO"
cd "$DEMO"
git symbolic-ref HEAD refs/heads/main

# Fixed demo identity and dates so the graph looks the same every time.
export GIT_AUTHOR_NAME="Demo Teacher"   GIT_AUTHOR_EMAIL="teacher@example.com"
export GIT_COMMITTER_NAME="Demo Teacher" GIT_COMMITTER_EMAIL="teacher@example.com"
DAY=1
tick() {
  export GIT_AUTHOR_DATE="2026-09-$(printf '%02d' "$DAY")T10:00:00"
  export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"
  DAY=$((DAY + 1))
}
commit() { # commit <file> <line> <message>
  tick
  printf '%s\n' "$2" >> "$1"
  git add "$1"
  git commit --quiet -m "$3"
}

commit README.md      "# Graph demo"                       "Add README"
commit index.html     "<h1>Our cafe</h1>"                   "Add home page"

git switch --quiet -c experiment
commit experiment.txt "trying a new layout"                 "Try a new layout"

git switch --quiet main
commit style.css      "body { font-family: sans-serif; }"   "Add basic styling"

git switch --quiet -c feature/menu
commit menu.html      "<li>Soup</li>"                       "Add menu page"
commit menu.html      "<li>Toastie</li>"                    "Add toastie to menu"

git switch --quiet main
commit index.html     "<p>Open daily 8-18</p>"              "Add opening hours"

tick
git merge --quiet --no-ff feature/menu -m "Merge branch 'feature/menu'"

git switch --quiet -c fix/typo
commit README.md      "Fixed: cafe is spelled cafe"         "Fix typo in README"

git switch --quiet main
git switch --quiet -c feature/footer
commit index.html     "<footer>Made by our class</footer>"  "Add footer"

git switch --quiet main
tick
git merge --quiet --ff-only feature/footer

git remote add origin "../$ORIGIN"
git -c push.negotiate=false push --quiet --set-upstream origin main feature/menu fix/typo experiment feature/footer

# One local commit that isn't pushed: main is 1 ahead of origin/main.
commit index.html     "<a href=\"menu.html\">Menu</a>"      "Link menu from home page"

echo
echo "Done. Open '$(pwd)' in GitKraken (File > Open repo)."
echo
git log --oneline --graph --all --decorate
