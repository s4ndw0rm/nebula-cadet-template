#!/usr/bin/env bash
# Builds the decoy content of the Lab 01 workstation (no flags here:
# flags are personal and planted at start time by nebula-agent).
set -euo pipefail
H=/home/cadet

# ---------- prompt
cat >> $H/.bashrc <<'RC'
PS1='\[\e[1;35m\]\u@\h\[\e[0m\]:\[\e[1;36m\]\w\[\e[0m\]\$ '
alias ll='ls -la'
RC

# ---------- /etc/nebula
mkdir -p /etc/nebula
cat > /etc/nebula/README <<'TXT'
This folder holds configuration files for the VEGA-7 station systems.
On Linux, configuration usually lives under /etc.
TXT
cat > /etc/nebula/comms.conf <<'TXT'
relay_primary   = relay-03.vega7.nebula
relay_backup    = relay-11.vega7.nebula
encryption      = enabled
TXT

# ---------- /var/log/nebula (long logs)
mkdir -p /var/log/nebula
gen_log () {  # $1=file $2=lines $3=seed
  awk -v n="$2" -v seed="$3" 'BEGIN{
    srand(seed);
    split("ENGINE COMMS AIRLOCK REACTOR NAV LIFE-SUPPORT HANGAR MEDBAY CARGO SHIELDS", sys, " ");
    split("nominal|routine check completed|pressure stable|sensor recalibrated|minor fluctuation detected, auto-corrected|crew shift change|telemetry packet received|diagnostic passed|filter replaced|power draw within limits|docking clearance granted|heartbeat OK", msg, "|");
    for(i=0;i<n;i++){
      d=1+int(i/400); h=int(rand()*24); m=int(rand()*60); s=int(rand()*60);
      printf "[2387-04-%02d %02d:%02d:%02d] %s: %s\n", (d>28?28:d), h, m, s, sys[1+int(rand()*10)], msg[1+int(rand()*12)];
    }}' > "$1"
}
gen_log /var/log/nebula/captain.log 6200 7
gen_log /var/log/nebula/reactor.log 1500 11
gen_log /var/log/nebula/comms.log 1500 23

# ---------- ~/cargo : files with lying extensions
mkdir -p $H/cargo
printf '\x89PNG\r\n\x1a\n\x00\x00\x00\x0dIHDR\x00\x00\x00\x10\x00\x00\x00\x10\x08\x02\x00\x00\x00' > $H/cargo/crate_01.png
head -c 2048 /dev/urandom >> $H/cargo/crate_01.png
echo "Spare parts inventory, sector 9" | gzip -c > $H/cargo/crate_02.pdf
cp /bin/true $H/cargo/crate_03.txt
printf 'RIFF\x24\x08\x00\x00WAVEfmt \x10\x00\x00\x00\x01\x00\x01\x00\x44\xac\x00\x00\x88\x58\x01\x00\x02\x00\x10\x00data\x00\x08\x00\x00' > $H/cargo/crate_04.wav
head -c 2048 /dev/urandom >> $H/cargo/crate_04.wav
printf '\xff\xd8\xff\xe0\x00\x10JFIF\x00\x01\x01\x00\x00\x01\x00\x01\x00\x00' > $H/cargo/crate_05.doc
head -c 1024 /dev/urandom >> $H/cargo/crate_05.doc
printf '%%PDF-1.4\n%%\xe2\xe3\xcf\xd3\n' > $H/cargo/crate_06.mp3
head -c 1024 /dev/urandom >> $H/cargo/crate_06.mp3
cat > $H/cargo/crate_08.txt <<'TXT'
Packing list - Crate 08
- thermal blankets (x20)
- spare boots (x6)
Nothing unusual here. Keep looking.
TXT

# ---------- ~/deck : the tidy-up task
mkdir -p $H/deck
for f in engine comms airlock reactor; do
  gen_log $H/deck/$f.log 40 $RANDOM
done
for f in crew_photo nebula_view mission_patch; do
  printf '\xff\xd8\xff\xe0\x00\x10JFIF\x00\x01\x01\x00\x00\x01\x00\x01\x00\x00' > $H/deck/$f.jpg
  head -c 512 /dev/urandom >> $H/deck/$f.jpg
done
cat > $H/deck/crew_roster.txt <<'TXT'
VEGA-7 :: Deck 3 crew roster (Q2 2387)
---------------------------------------
Cmdr. A. Okafor      Security Operations Lead
Lt.   S. Lindqvist   Network Engineering
Ofc.  M. Ruiz        Onboarding
Ofc.  K. Tanaka      Forensics
Cadet (you)          Security Operations
TXT
echo "temporary buffer - safe to delete" > $H/deck/junk.tmp
cat > $H/deck/README_FIRST.txt <<'TXT'
ORDERS FOR THE NEW CADET  -  from Officer M. Ruiz
===============================================

Deck 3 is a mess. Before inspection, please:

  1. Create two folders inside deck/:  logs  and  photos
  2. Move every .log file into deck/logs
  3. Move every .jpg file into deck/photos
  4. Make a BACKUP COPY of crew_roster.txt in this exact folder:
         deck/archive/2387/q2/
     (the original must stay where it is)
  5. Delete the file junk.tmp

When you are done, run this command to request the inspection:

     inspect-deck

If something is missing, the inspection report will tell you what.
TXT

chown -R cadet:cadet $H
