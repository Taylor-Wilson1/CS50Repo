# ARENACHAMPIONS.App
#### Video Demo:  https://youtu.be/jr_Y-GsFrTw
#### Description: Webpage game that pits Two Champions against each other to compete in an arena until one of them is defeated. The game is intended to run itself after clicking on the Start Match button.
TODO:
Click on the click on the "Start Match" button to start the game. The game will run itself.
Once the button is clicked, both champion's name and health will be randomly generated, announced and displayed for approximately 3 seconds.
Afterwards the champions will randomly attack each other for random damage.

After a champion attacks, the attacker's name will be displayed along with who their target was. For example: Attacker attacked Target.
Then the game will annouce how much damage the target was dealt and then it will display the target's remaining health.
Information regarding the attack will last for 3 seconds before another attack is placed.
The champions will continue to attack one another until one of them has been defeated.

Once a champion attacks, their animation will change from the Idle animation to the Attack Animation.
Upon being defeated, the champion's animation will channge from the Idle animation to the dead animaiton.
Refresh the browser to restart the game.

The project consists of three files:
index.html
style.css
Program.js

The Index.html file is a placeholder for what will be displayed on the web page. I've created a character one and character two container that
contains the placeholder for the Sprites and their name and health. An introductory and start match div were created as well. The introductory div
will announce and welcome the champions to the arena. The Start Match div will announce information regarding the attack such as who attack who and
for how much damage was dealt. It also links both the style sheet and the script.

The Style.css file designs what the index.html file is displaying. The style sheet instructs each character sprite where it should be placed and how
wide and tall it should be. The style sheet instructs the name and health for each character to be placed underneath the sprite it goes to.
The style sheet also instructs the Introductory and Start Match div where it should be and how it looks.
It also creates the idle, attack and dead animations for both Champions.

The Program.js file tells the index.html file what to do and how to do it.
In the script, two Fighter objects are created. Their health and names are randomly generated by the RandomHealth and GetRandomFighterName functions.

Run()
The run function is created and it will run the program once the "Start" Match button is clicked. Run() sets a timer to display the Introductory div
for 3 seconds before the Start Match div appears. It also sets an interval for both functions MakeAMove() and eraseContent() for 3 seconds.
The interval will continue until it is told to stop().


Champion Animations Functions were created for both champions.

cOneAttackAnimation()
Calls Champion One's attack animation that switches to the Attack animation from the Idle Animation

cOneIdleAnimation()
Calls Champion One's Idle animation that switches back to the Idle animation from the Attack Animation

cOneDeathAnimation()
Calls Champion One's dead animation that switches to the Dead animation from the Idle Animation

cTwoAttackAnimation()
Calls Champion Two's attack animation that switches to the Attack animation from the Idle Animation

cTwoIdleAnimation()
Calls Champion Two's Idle animation that switches back to the Idle animation from the Attack Animation

cTwoDeathAnimation()
Calls Champion Two's dead animation that switches to the Dead animation from the Idle Animation

displayChampionsInfo()
Removes the "hide" class from each targeted element in order to display each Champion's name and health when the Start Match button is clicked.

GetRandomFighterName()
Function that randomly generates a Champion's Name

RandomHealth()
Function that randomly generates a Champion's Health Points

MakeAMove()
Function that Randomly determines who which Champion attacks first. It calls on DealsDamage() to apply the damage to the Champion

DealDamage(attacker, target)
Function that Randomly generates damage and calls showInfo() to assign the Attacker's damage to the target

showInfo()
Function that displays information regarding the Attacker and the Target such as:
Who is the Attacker and their target: Attacker attacked Target.
How much damage the Target was dealt: Target was dealt __ damage.
Displays Target's remaining heath: Target's health is __
Displays who has been defeated

switchOut()
Function that adds and removes the hide class to certain elements by switching out which elements to display when called by the showInfo function.

stop()
Function clears the intervals in the run() once called.

defeated()
Function that plays defeated Champion's dead animation

eraseContent()
Function erases previous content in "Start Match" div in order for the new attack information to be displayed.