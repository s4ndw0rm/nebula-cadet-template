# 🚀 NEBULA — Cadet Program

> **Station VEGA-7 · Security Operations Office**
> Welcome aboard, cadet. This repository is your personal workstation for the
> *101 Introduction to Applied Cybersecurity* course.

Everything runs in your browser. You don't install anything, and you don't need admin rights.
Each lab starts a small, **disposable** world made of containers: virtual servers,
networks and evidence that exist only while you work and vanish when you are done.

---

## 1 · Setup (once, ~5 minutes)

1. **Create your own copy of this repository.**
   Click **`Use this template` → `Create a new repository`**.
   - Owner: your GitHub account
   - Name: anything you like (e.g. `nebula-cadet`)
   - Visibility: **Private** ✅ (your flags are personal)
2. In **your new repository**, click **`Code` → `Codespaces` → `Create codespace on main`**.
   Wait for the environment to load (the first time takes 1–2 minutes).
3. In the terminal at the bottom, run:
   ```bash
   ctf register
   ```
   Choose an **agent alias**. It is the name the leaderboard shows.
4. Follow the last instruction on screen: invite the **Nebula HQ** account as a
   collaborator of your repository (*Settings → Collaborators → Add people*).
   That is how your points reach the leaderboard.

## 2 · Every lab

```bash
ctf list                 # missions and progress
ctf mission lab01        # open the briefing
ctf start lab01          # launch the lab and enter it
# ... explore, investigate, find NEBULA{...} flags ...
exit                     # come back to your Codespace
ctf submit lab01-1 NEBULA{...}
ctf hint lab01-2         # stuck? hints are free (HQ only keeps count)
ctf stop lab01           # destroy the lab when you finish
```

Every correct flag is **committed and pushed** to your repository automatically.
That is your official record. The leaderboard refreshes about every 5 minutes.

## 3 · All commands

| Command | What it does |
|---|---|
| `ctf register` | Create your cadet profile (once) |
| `ctf list [lab]` | Labs, challenges and your progress |
| `ctf mission <lab>` | Open a lab's mission briefing |
| `ctf start <lab>` | Launch a lab environment and enter it |
| `ctf connect <lab>` | Re-enter a running lab |
| `ctf reset <lab>` | Destroy the lab and start it again from scratch |
| `ctf stop <lab\|all>` | Destroy lab environments |
| `ctf hint <challenge>` | Next hint for a challenge |
| `ctf submit <challenge> <flag>` | Submit a flag |
| `ctf check <challenge>` | Run the automatic check of a *task* challenge |
| `ctf status` | Your points and sync status |
| `ctf sync` | Push pending progress to GitHub |

## 4 · Station rules

- 🛰️ **Only attack what the labs give you.** All targets are simulated and live inside
  your Codespace. Testing real systems without written permission is illegal
  (see *The Law* in the CheatSheets).
- 🔑 **Flags are personal.** Each cadet gets different flags, so sharing them does not work.
  Share ideas, not answers.
- 🧰 **Don't edit the `.nebula/` folder.** It is the station's machinery.
- ⏱️ **Save your free hours.** When you finish, close the browser tab. The Codespace stops
  automatically after 30 minutes of inactivity. You can also stop it yourself from
  [github.com/codespaces](https://github.com/codespaces).

## 5 · Troubleshooting

| Problem | Fix |
|---|---|
| `ctf: command not found` | Open a new terminal (`+` icon), or run `.nebula/bin/ctf` |
| "Waiting for the Docker engine..." for a long time | `Ctrl+Shift+P` → **Codespaces: Rebuild Container** |
| "Saved locally but could not push" | Run `ctf sync` |
| I broke the lab | `ctf reset lab01`. It comes back brand new (your points stay) |
| "You are working on the course TEMPLATE" | You opened the original template. Do step 1 of Setup |

*Clear skies, cadet.* ✨
