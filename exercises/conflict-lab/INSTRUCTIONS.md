# Conflict lab (session 4)

Work in pairs on the **shared repository from session 3**. Partner A and Partner B
each have their own clone. You'll edit `exercises/conflict-lab/menu.md`.

**Before every merge or pull: predict.** Sketch the graph you expect on paper.
Then do it and compare with GitKraken.

**Resolving a conflict, every time:**

1. Read *both* versions out loud to each other.
2. Decide together what the line should be. It may be one side, the other, or a mix.
3. Edit the file so it contains only the final text. Delete all three marker lines
   (`<<<<<<<`, `=======`, `>>>>>>>`).
4. Stage the file and commit (GitKraken pre-fills the merge message).
5. Push, and let your partner pull.

---

## Round 1: same line, on main (A resolves)

Both of you start by pulling `main`.

| Partner A | Partner B |
| --- | --- |
| Change the veggie burger price to €9.00 | Change the veggie burger price to €7.50 |
| Commit: `Raise veggie burger price` | Commit: `Lower veggie burger price` |
| **Wait for B to push first** | Push |
| Push → rejected. Pull → **conflict**. Resolve. Push. | Pull to get A's resolution |

Question: why did Git stop here, but not in session 3 when you both changed files?

---

## Round 2: branches (B resolves)

Both pull `main` first.

| Partner A | Partner B |
| --- | --- |
| Create branch `dessert-icecream` | Create branch `dessert-glutenfree` |
| Change the dessert to `chocolate cake with ice cream` | Change the dessert to `chocolate cake (gluten-free)` |
| Commit and push the branch | Commit and push the branch |

Now **B** does everything on B's laptop:

1. Switch to `main`, pull.
2. Merge `origin/dessert-icecream` into `main` (predict: fast-forward or merge commit?).
3. Merge `dessert-glutenfree` into `main` → **conflict**.
4. The right answer is neither side alone: `chocolate cake with ice cream (gluten-free)`.
5. Commit, push. A pulls.

---

## Round 3: delete versus edit (A resolves)

Both pull `main` first.

| Partner A | Partner B |
| --- | --- |
| Delete the Fries line completely | Change the fries price to €3.50 |
| Commit: `Remove fries from menu` | Commit: `Raise fries price` |
| Wait | Push |
| Push → rejected. Pull → **conflict**. | |

Git can't know whether fries should exist. **Decide together**, then A resolves and pushes.

---

## Escape hatch

Start a merge that conflicts, then **abort** it instead of resolving:

- GitKraken: the **Abort** button above the conflicted files.
- Command line: `git merge --abort`

Check the graph: everything is exactly as before you started.
