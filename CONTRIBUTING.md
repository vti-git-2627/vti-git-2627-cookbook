# Contributing to the Class Cookbook

These are our team rules. They are short so everyone can follow all of them.

## The golden rules

1. **`main` always works.** Nobody commits to `main` directly. Every change arrives through a pull request.
2. **One task, one branch, one pull request.** Small pull requests get reviewed faster and conflict less.
3. **Pull `main` before you start** a new branch, and again before you open your pull request.
4. **Never force-push to `main`**, and never rewrite commits a teammate already has.

## Branch names

| Kind of work | Pattern | Example |
| --- | --- | --- |
| New recipe | `recipe/<dish>` | `recipe/pancakes` |
| Bug fix | `fix/<what>` | `fix/broken-pancake-link` |
| New feature or page | `feature/<what>` | `feature/contributors-footer` |
| Text or docs | `docs/<what>` | `docs/readme-team` |

Lowercase, words joined with hyphens, no spaces.

## Commit messages

- Start with a verb in the imperative: *Add*, *Fix*, *Remove*, *Update*, *Rename*.
- Say what changed, in under ~50 characters: `Add pancake recipe`, `Fix broken link on home page`.
- Need more? Leave a blank line and explain **why** in the body.

## Pull requests

- Title: what the PR does, like a commit message.
- Description: what changed, how to check it, and `Closes #<issue>`.
- Request at least one reviewer. You cannot approve your own PR.
- When `main` moved on and your PR has a conflict: merge `main` into your branch, resolve, push. The PR updates itself.

## Reviews

- Review the code, not the person.
- Be specific: quote the line and say what you'd change and why.
- Ask questions when you're unsure: "What happens if…?"
- Prefix small style remarks with `nit:` so the author knows they're optional.
- Approve when it's good enough, not when it's perfect.

## How we merge

Our team uses: **[ ] merge commit  [ ] squash and merge** ← tick one in your first PR and stick to it.

After merging: delete the branch on GitHub, switch to `main` locally, pull.
