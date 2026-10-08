# Rescue stations (session 6)

Five messes, five fixes. Work in pairs in **your own clone** of a practice repo.
At each station: set up the mess, predict the fix on paper, fix it, then show your
teacher the graph. About 7 minutes per station.

Golden rule for all of them: **if the commit is already pushed to a branch others use,
don't rewrite it; use revert.**

---

## Station 1: "I want to throw away my changes"

**Set up:** edit two files and save, but don't commit.

**Goal:** the folder is back to the last commit, nothing committed.

- GitKraken: right-click the file in *Unstaged Files* → **Discard changes** (or the trash icon for all).
- Command line: `git restore <file>` (or `git restore .` for everything)

**Check:** the WIP row at the top of the graph is gone.
**Careful:** discarded uncommitted changes can't be recovered.

---

## Station 2: "There's a typo in my last commit message"

**Set up:** commit something with the message `Ad recipe for soupp`. Don't push.

**Goal:** the message reads `Add recipe for soup`.

- GitKraken: select the commit, click the message in the commit panel, edit it, **Update Message** (only offered on the latest commit).
- Command line: `git commit --amend -m "Add recipe for soup"`

**Check:** the old commit is replaced; its hash changed. That's why you only amend unpushed commits.

---

## Station 3: "I'm halfway, but I must switch branches"

**Set up:** on a branch, edit a file without committing. Now you need to fix something on `main`.

**Goal:** switch to `main` with a clean folder, then later get your half-done work back.

- GitKraken: **Stash** button in the toolbar → switch branch → do the fix → switch back → **Pop**.
- Command line: `git stash` … `git switch main` … `git switch -` … `git stash pop`

**Check:** while stashed, a stash entry appears in the graph; after pop it's gone and your edits are back.

---

## Station 4: "A bad commit is already on GitHub"

**Set up:** on your own practice branch, commit a change that breaks the page (delete half of `index.html`). Push it.

**Goal:** undo it without rewriting history.

- GitKraken: right-click the bad commit → **Revert commit** → push.
- Command line: `git revert <commit-hash>` then `git push`

**Check:** the graph now has the bad commit *and* a new "Revert …" commit after it. History is honest; nothing was erased.

---

## Station 5: "I committed on main instead of a branch"

**Set up:** on `main`, make two commits. **Don't push.**

**Goal:** those two commits live on a new branch `recipe/oops`; `main` is back where GitHub has it.

- GitKraken:
  1. Right-click the latest commit → **Create branch here** → `recipe/oops`.
  2. Check out `main`. Right-click the `origin/main` commit → **Reset main to this commit → Hard**.
- Command line:
  ```
  git branch recipe/oops
  git reset --hard origin/main
  git switch recipe/oops
  ```

**Check:** `main` and `origin/main` sit on the same commit; `recipe/oops` has your two commits.
Predict this one carefully before you run it.

---

## Bonus: the safety net

`git reflog` lists every commit HEAD has pointed at, including ones no branch points at anymore.
Lost a commit after a reset? Find its hash in the reflog and run `git branch rescued <hash>`.
