#!/bin/bash

# ============================================================
#  BASH TREASURE HUNT — Setup Script
#  For high school students learning basic terminal navigation
#  Commands practiced: ls, cd, cat
# ============================================================

BASE="treasure_hunt"
rm -rf "$BASE"
mkdir -p "$BASE"

# --- Helper: write a fake treasure.txt ---
fake() {
  local msgs=(
    "Nope, keep looking!"
    "So close... or are you?"
    "This is not the treasure."
    "Nice try, pirate."
    "Wrong chest, matey!"
    "The treasure is elsewhere..."
    "You found nothing but dust."
    "A dead end. Turn back!"
    "Almost! (not really)"
    "This ain't it chief."
  )
  # pick a random message
  echo "${msgs[$((RANDOM % ${#msgs[@]}))]}" > "$1"
}

# ============================================================
# STRUCTURE
# ============================================================

# --- Path 1: island/cave/deep/secret ---
mkdir -p "$BASE/island/cave/deep/secret"
fake         "$BASE/island/treasure.txt"
fake         "$BASE/island/cave/treasure.txt"
fake         "$BASE/island/cave/deep/treasure.txt"
echo "b4sh"  > "$BASE/island/cave/deep/secret/treasure.txt"   # ← THE REAL ONE

# --- Path 2: forest/hollow/old_tree ---
mkdir -p "$BASE/forest/hollow/old_tree"
fake         "$BASE/forest/treasure.txt"
fake         "$BASE/forest/hollow/treasure.txt"
fake         "$BASE/forest/hollow/old_tree/treasure.txt"

# --- Path 3: ship/cargo/locked_chest ---
mkdir -p "$BASE/ship/cargo/locked_chest"
fake         "$BASE/ship/treasure.txt"
fake         "$BASE/ship/cargo/treasure.txt"
fake         "$BASE/ship/cargo/locked_chest/treasure.txt"

# --- Path 4: village/market/back_alley ---
mkdir -p "$BASE/village/market/back_alley"
fake         "$BASE/village/treasure.txt"
fake         "$BASE/village/market/treasure.txt"
fake         "$BASE/village/market/back_alley/treasure.txt"

# --- Path 5: swamp/fog/quicksand ---
mkdir -p "$BASE/swamp/fog/quicksand"
fake         "$BASE/swamp/treasure.txt"
fake         "$BASE/swamp/fog/treasure.txt"
fake         "$BASE/swamp/fog/quicksand/treasure.txt"

# --- A clue file at the very top to get them started ---
cat > "$BASE/README.txt" << 'EOF'
🏴‍☠️  WELCOME TO THE BASH TREASURE HUNT  🏴‍☠️

Your mission: find the ONE treasure.txt that contains the secret phrase.

COMMANDS YOU'LL NEED:
  ls          — list what's in the current folder
  cd <folder> — move into a folder
  cd ..       — go back up one folder
  cat <file>  — read a file

Start by running:   ls

Good luck, pirate. The treasure is buried deep...
EOF

echo "✅  Treasure hunt created in ./$BASE/"
echo "    Share the '$BASE' folder with students."
echo "    The winning phrase is: b4sh"
