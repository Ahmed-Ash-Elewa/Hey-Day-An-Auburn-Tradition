Hey Day Interactive Script 
About Hey Day

Hey Day is a beloved tradition at Auburn University that began in 1947 to create a welcoming environment for returning World War II soldiers. The tradition involves handing out nametags to students, faculty, and staff, and encouraging them to say “hey” to each other.

Over the years, Hey Day has grown to include free food, live entertainment, and events hosted by campus groups. The 78th Hey Day will be held on October 15, 2025, and will include live music, food, a pep rally, and other activities.

#############################################################################

What is this Script

The heyday.sh script creates an interactive terminal experience that connects Auburn students with notable alumni and fun Auburn facts. Specifically, it Prompts the user for their name and greets them with Auburn spirit.

Asks about their Auburn experience:

Which college they are in (e.g., Engineering, Business, Sciences, etc.).

Their favorite Auburn sport (Football, Basketball, Baseball, Gymnastics, etc.).

Uses regex tools such as grep, awk, sed to:

Display a notable Auburn person from their chosen college.

Display a notable Auburn athlete/coach from their favorite sport.

Show a random fun Auburn fact from the provided dataset.

###############################################################################

How to Run

Clone or download this repository.

Make the script executable:

chmod +x heyday.sh

Run the script:

./heyday.sh

Follow the interactive prompts!

########################################################################################

Files Included

heyday.sh → The main interactive script.

auburn_notables.txt → List of notable Auburn people (by college/sport).

auburn_facts.txt → Fun Auburn facts for random display.

################################################################################################

Example Output

What's your name? Ahmed
Hey Ahmed! War Eagle and happy Hey Day!

Which college are you in?
(Engineering, Business, Liberal Arts, Sciences, Agriculture, Education, or Veterinary Medicine)
College: Liberal Arts

What's your favorite Auburn sport?
(Football, Basketball, Baseball, Gymnastics, or other)
Sport: Football

From Liberal Arts, meet: Kathryn Tucker Windham|Liberal Arts|Alumni|Acclaimed storyteller and author
From Football, here's a notable Tiger: Bo Jackson|Liberal Arts|Athlete-Football-Baseball|1985 Heisman Trophy winner, MLB All-Star

Fun Auburn fact for you:
  • Auburn's basketball team reached the Final Four in 2019 and again in 2025, marking a golden era for the program.

Thanks for celebrating Hey Day, Ahmed! 🧡💙
####################################################################################################
Attribution

Auburn University Alumni Association → Hey Day tradition

Datasets (auburn_notables.txt and auburn_facts.txt) provided by comoutional biology course (BIOL-5800).

Script built using bash with grep, awk, sed, and other standard UNIX tools.
