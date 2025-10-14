
# heyday.sh — Interactive Hey Day script
set -u  # fail on unset variables

NOTABLES="auburn_notables.txt"
FACTS="auburn_facts.txt"

# --- file checks  ---
if [[ ! -f "$NOTABLES" || ! -f "$FACTS" ]]; then
  echo "Error: Expected data files '$NOTABLES' and '$FACTS' in the current directory."
  exit 1
fi

echo "---------------------------------------------"
echo "      Auburn Hey Day — Welcome!  🐅"
echo "---------------------------------------------"
echo

# 1) Greeting 
read -r -p "What's your name? " NAME
# Conditional validation
if [[ -z "${NAME// }" ]]; then
  echo "No name entered—I'll call you 'Friend'."
  NAME="Friend"
fi
echo "Hey ${NAME}! War Eagle and happy Hey Day!"
echo

# 2) Ask about their Auburn experience
echo "Which college are you in?"
echo "(Engineering, Business, Liberal Arts, Sciences, Agriculture, Education, or Veterinary Medicine)"
read -r -p "College: " COLLEGE

echo
echo "What's your favorite Auburn sport?"
echo "(Football, Basketball, Baseball, Gymnastics, or other)"
read -r -p "Sport: " SPORT
echo

# 3) some regex tools 
COLLEGE_MATCH=$(
  grep -iE "$COLLEGE" "$NOTABLES" | shuf -n 1 2>/dev/null
)

if [[ -n "${COLLEGE_MATCH:-}" ]]; then
  # Clean the line a bit to highlight the person:
  # 1) sed -E 's/^[[:space:]-]*//'  → remove leading dashes/whitespace
  # 2) awk -F ' - |: ' '{print $NF}' → split by " - " OR ":" and print the last field (usually the name)
  COLLEGE_NAME=$(echo "$COLLEGE_MATCH" \
    | sed -E 's/^[[:space:]-]*//' \
    | awk -F ' - |: ' '{print $NF}')
  echo "From ${COLLEGE}, meet: $COLLEGE_NAME"
else
  echo "I couldn't find a notable person for the college '${COLLEGE}'."
fi

# --- Find an athlete/coach from their favorite sport ---
# Again, case-insensitive regex search.
SPORT_MATCH=$(
  grep -iE "$SPORT" "$NOTABLES" | shuf -n 1 2>/dev/null
)

if [[ -n "${SPORT_MATCH:-}" ]]; then
  SPORT_NAME=$(echo "$SPORT_MATCH" \
    | sed -E 's/^[[:space:]-]*//' \
    | awk -F ' - |: ' '{print $NF}')
  echo "From ${SPORT}, here's a notable Tiger: $SPORT_NAME"
else
  echo "No exact match found for the sport '${SPORT}', but War Eagle anyway!"
fi

echo

# --- Random fun fact from auburn_facts.txt ---
# 'shuf -n 1' selects exactly one random line.
if FACT=$(shuf -n 1 "$FACTS" 2>/dev/null); then
  echo "Fun Auburn fact for you:"
  echo "  • $FACT"
else
  echo "Couldn't read a fun fact — is '$FACTS' non-empty?"
fi

echo
echo "Thanks for celebrating Hey Day, ${NAME}! 🧡💙"

# Bonus: write a short transcript to a file (example of redirection)
{
  echo "User: $NAME"
  echo "College entered: $COLLEGE"
  echo "Sport entered: $SPORT"
  echo "College match: ${COLLEGE_MATCH:-none}"
  echo "Sport match: ${SPORT_MATCH:-none}"
} > heyday_session.log
# (The above block uses redirection to create a simple log.)

