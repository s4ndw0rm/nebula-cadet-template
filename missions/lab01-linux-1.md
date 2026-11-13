# 🛰️ Mission 01 — Welcome aboard VEGA-7
**Lab 01 · Linux I** · Day 1 · ⏱️ ~60 min · 🏅 1000 pts

---

## 📡 Briefing

> *Station VEGA-7, Orion Spur. 06:00 station time.*
>
> Your shuttle has just docked. You are the newest cadet of **NEBULA**'s Security
> Operations Office, and you have been assigned workstation **WS-042** on Deck 3.
>
> Officer **M. Ruiz**, in charge of onboarding, left your welcome kit on the machine.
> It is scattered all over the system, though, and the station computers don't have
> windows or icons. Only a **terminal**.
>
> No mouse, no problem. By the end of this shift you will move around a Linux system
> like you were born on the station.

## 🎯 Objectives

By the end of this mission you will be able to:

- Read the **prompt** and know *who* you are and *where* you are
- Move around the file system (`pwd`, `ls`, `cd`)
- Read files (`cat`, `less`) and find hidden ones (`ls -a`)
- Know the main Linux folders (`/etc`, `/home`, `/var/log`, `/tmp`...)
- Identify a file by its content, not by its name (`file`)
- Create, copy, move and delete files and folders (`mkdir`, `cp`, `mv`, `rm`)

## 🚀 Launch

From your Codespace terminal:

```bash
ctf start lab01
```

You will "enter" workstation WS-042. Notice how the **prompt** changes:

```
cadet@vega7-ws042:~$
│     │           │└─ $ = regular user (# would mean root, the superuser)
│     │           └── ~ = you are in your home folder (/home/cadet)
│     └────────────── machine name
└──────────────────── your user
```

Type `exit` at any moment to come back to your Codespace. Run `ctf connect lab01` to go back in.

## 🧭 Field guide

| Command | What it does | Example | CheatSheets |
|---|---|---|---|
| `pwd` | Where am I? (*print working directory*) | `pwd` | Bk 1 · P.130 |
| `ls` | List files | `ls`, `ls -l`, `ls -la` | Bk 1 · P.130 |
| `cd` | Change directory | `cd /etc`, `cd ..`, `cd ~` | Bk 1 · P.132 |
| `cat` | Print a file | `cat notes.txt` | Bk 1 · P.169 |
| `less` | Read long files (`/text` search, `n` next, `q` quit) | `less big.log` | Bk 1 · P.170 |
| `file` | What *really* is this file? | `file photo.jpg`, `file *` | Bk 1 · P.182 |
| `mkdir` | Create folders (`-p` nested) | `mkdir -p a/b/c` | Bk 1 · P.166 |
| `cp` | Copy (`-r` for folders) | `cp a.txt backup/` | Bk 1 · P.165 |
| `mv` | Move or rename | `mv *.log logs/` | Bk 1 · P.167 |
| `rm` | Delete (no recycle bin!) | `rm junk.tmp` | Bk 1 · P.168 |
| `clear` | Clean the screen (or `Ctrl+L`) | `clear` | Bk 1 · P.162 |

**Superpowers:**

- `Tab` completes names for you. Press it twice to see the options.
- `↑` / `↓` bring back previous commands.
- `Ctrl+R` searches your command history.
- `Ctrl+C` cancels whatever is running.

## 🏁 Challenges

| ID | Challenge | Pts | Your mission |
|---|---|---|---|
| `lab01-1` | **First Contact** | 100 | Read the welcome letter waiting in your home folder. |
| `lab01-2` | **Hidden in Plain Sight** | 100 | Your access badge is in your home folder... but `ls` doesn't show it. |
| `lab01-3` | **Station Map** | 100 | Find the station's main configuration file and read its onboarding code. |
| `lab01-4` | **The Captain's Log** | 200 | The captain left a PRIVATE note inside a very long log file. |
| `lab01-5` | **Not What It Seems** | 200 | In `~/cargo` one file is lying about what it is. |
| `lab01-6` | **Tidy Up the Deck** | 300 | Follow the orders in `~/deck/README_FIRST.txt` and pass `inspect-deck`. |

Found a flag? Leave the lab (`exit`) and submit it:

```bash
ctf submit lab01-1 NEBULA{welcome_aboard_xxxxxxxxxxxx}
```

> 💡 **Copy & paste in the terminal:** select text to copy it, then `Ctrl+Shift+V` (or right click) to paste.
> Stuck? `ctf hint lab01-3` gives a hint without spoiling everything.

## 🧠 Debrief (think about it)

1. Why would an attacker look in `/etc` first after getting into a server?
2. Hidden files are not *protected*, just hidden. What's the difference?
3. In challenge 5, a "photo" was really a text file. How could a malicious file use the same trick?
4. `rm` has no recycle bin. What habits would protect you from deleting the wrong thing?

## ✅ When you finish

```bash
ctf list lab01   # check your progress
ctf stop lab01   # destroy the workstation (it can always be recreated)
```

*Officer Ruiz is proud of you. See you tomorrow on Deck 3.* 🌌
