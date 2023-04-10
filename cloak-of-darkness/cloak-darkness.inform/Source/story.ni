[ "Cloak_Basic" by Dr. Peter Bates ]
[ https://intfiction.org/t/for-those-fluent-in-inform7-how-long-would-it-take-you-to-implement-cloak-of-darkness/59518/48 ]

[#### NB due to differences in array structure between Glulx and Z-machine, this version needs to be compiled for Glulx ####]

Section - Setup

Room is a kind of value. rooms are Foyer of the Opera House, Cloakroom, Bar. A room has a text called description.
The description of Foyer of the Opera House is "An echoing, empty space with open doorways leading west to the cloakroom and south to the dimly lit bar. To the north, the open doors of the grand entrance lead back onto dark and rain-lashed streets.". ['dimly lit'-a feeble justification for why the cloak makes the bar dark but not the foyer or cloakroom]
The description of Cloakroom is "The walls of this small anteroom are bare, apart from a small brass hook[if cloak-position of the Cloakroom is hung] from which hangs a black velvet cloak[else if cloak-position of the Cloakroom is dropped]. Crumpled on the floor is a black velvet cloak[end if].".
The description of Bar is "Rows of gleaming glasses and  bottles line the polished mahogany bartop.[paragraph break]Your attention is drawn to a message scrawled [if the sawdust-disturbance of the Bar is not destroyed]into the sawdust [end if]on the floor.".



Cloak-position is a kind of value. The cloak-positions are player, dropped, hung.
The Cloakroom has a cloak-position.
Sawdust-disturbance is a kind of value. The sawdust-disturbances are pristine, scuffed, disturbed, destroyed.
The Bar has a sawdust-disturbance.
The location is initially Foyer of the Opera House.
The player-command is initially "".
Game-over is initially false.

Section - Main

To begin:
	say "[fixed letter spacing]";
	say "##################################################[line break]";
	say "#                                                #[line break]";
	say "#  WELCOME TO *BASIC INFORM* CLOAK OF DARKNESS!  #[line break]";
	say "#         (an exercise in retro fun)             #[line break]";
	say "#                                                #[line break]";
	say "#     You can enter one word commands only.      #[line break]";
	say "#                                                #[line break]";
	say "#                 Good luck!                     #[line break]";
	say "#      (type HELP for further information)       #[line break]";
	say "#                                                #[line break]";
	say "#         (c) 2023 Black Toad Software           #[line break]";
	say "#                                                #[line break]";
	say "##################################################[roman type][paragraph break]";
	look;
	while game-over is false:
		follow the turn sequence rules;
	say "[paragraph break][bracket]PRESS A KEY[close bracket][line break]";
	wait for a keypress;
	clear the screen;
	say "[fixed letter spacing]";
	say "############################[line break]";
	say "#                          #[line break]";	
	say "#    ***  THE END  ***     #[line break]";
	say "#                          #[line break]";	
	say "############################[line break]";
	
Section - Turn Sequence
	
The turn sequence rules are a rulebook.
rule for turn sequence:
	read the player_command;
	if player-command is "": [invalid input]
		do nothing;
	[deal with meta commands first so they don't cause a disturbance in the Bar]
	else if the player-command is "help":
		[self-justificatory preamble]
		clear the screen;
		say "[line break][bold type]ABOUT THIS STORY[roman type][paragraph break]";
		say "This is an implementation of the [']Cloak of Darkness['] example story, written (as an exercise in self-flagellation) in Basic Inform 7 (i.e. without Inform's built-in parser or the world model) and without using Basic Inform's object framework, in order to approximate the experience of coding in a general purpose rather than domain-specific language idiom.[paragraph break]The tightly limited parameters of the scenario allow it to be played out using single word commands, making implementing the parser relatively straightforward- the game logic similarly so, as the range of world-states permitted by the scenario is extraordinarily circumscribed.[paragraph break]Indeed, the greatest challenge was the ordinarily trivial task of getting user input from the keyboard, which I was surprised to find Basic Inform does not natively support and therefore required a little I6 hacking.[paragraph break]For once I followed my own advice- [']Don't simulate what doesn't need simulation['], so no doors for example (heh, heh) but I did try to deliberately take advantage of some elements of Inform that make for readable code and to minimise use of global variables.[paragraph break][bracket]PRESS A KEY[close bracket][line break]";
		wait for a keypress;
		clear the screen;
		[playing the game]
		say "[bold type]PLAYING THE GAME[roman type][paragraph break]";
		say "[line break][bold type]Your goal is simply to get to the bar for a drink... or so it seems at first![roman type][paragraph break]";
		say "You can move around by typing a cardinal compass direction- e.g. [bold type]n[roman type] or [bold type]north[roman type] (likewise [bold type]e[roman type] ,[bold type]s[roman type] ,[bold type]w[roman type])[paragraph break]";
		say "Some other commands you can use are:[line break]";
		say "    [bold type]inventory[roman type] (or [bold type]i[roman type] for short) - which lists everything you are carrying[line break]";
		say "    [bold type]examine[roman type] (or [bold type]x[roman type] for short) - which will tell you more about something nearby[line break]";
		say "    [bold type]take[roman type] or [bold type]get[roman type]  - which will allow you to pick up something nearby[line break]";
		say "    [bold type]wear[roman type] - which will allow you to put on something nearby[line break]";
		say "    [bold type]drop[roman type] - which will allow you put down something you are carrying or wearing[line break]";
		say "    [bold type]look[roman type] (or [bold type]l[roman type] for short) - which describes your immediate surroundings[paragraph break]";
		say "    [bold type]again[roman type] (or [bold type]g[roman type] for short) - repeats the last command you typed[paragraph break]";
		say "There is at least one other command you'll need to end the game in glory- that's for you to discover![paragraph break]";
		say "[bracket]PRESS A KEY[close bracket][line break]";
		wait for a keypress;
		clear the screen;
		look;
	else if the player-command is "score":
		say "Hmm.. How do [italic type]you[roman type] think you are doing?";
	[unimplemented meta commands]
	else if the player-command is "undo":
		say "This is BASIC Inform. Sadly, there's no UNDO command. But you really shouldn't need it!";
	else if the player-command is "save":
		say "This is BASIC Inform. Sadly, there's no SAVE command. But you really shouldn't need it!";
	[action-processing (ha, ha)]
	[deal with the special case of doing stuff in a dark Bar]
	else if the location is the Bar and the cloak-position of the Cloakroom is player and the player-command is not "n":
		say "Scuffling around in the dark is not going to further your cause!";
		if the sawdust-disturbance of the Bar is not destroyed:
			now the sawdust-disturbance of the Bar is the sawdust-disturbance after the sawdust-disturbance of the Bar;
	[deal with the rest]
	else if the player-command is "look" or the player-command is "l":
		look;
	else if the player-command is "inventory" or the player-command is "i":
		if the cloak-position of the Cloakroom is player:
			say "You are wearing a cloak of velvet, so black and dense it seems almost to suck the light from its surroundings.";
		else:
			say "You are disrobed.";
	else if the player-command is "n" or the player-command is "north":
		if the location is the Foyer of the Opera House:
			say "It's too early in the evening to be leaving without a drink!  Also- that rain!";
		else if the location is the Bar:
			go to Foyer of the Opera House;
		else:
			say "[cant_go].";
	else if the player-command is "e" or the player-command is "east":
		if the location is the Cloakroom:
			go to Foyer of the Opera House;
		else:
			say "[cant_go].";
	else if the player-command is "s" or the player-command is "south":
		if the location is the Foyer of the Opera House:
			go to Bar;
		else:
			say "[cant_go].";
	else if the player-command is "w" or the player-command is "west":
		if the location is the Foyer of the Opera House:
			go to Cloakroom;
		else:
			say "[cant_go].";
	else if the player-command is "x" or the player-command is "examine":
		if the location is the Foyer of the Opera House:
			if the cloak-position of the Cloakroom is player:
				say "You are wearing a cloak of velvet, so black and dense it seems almost to suck the light from its surroundings.";
			else:
				say "You are disrobed.";
		else if the location is the Bar:
			if the sawdust-disturbance of the Bar is:
				-- pristine:
					say "Scrawled into the";
				-- scuffed:
					say "Scrawled into the scuffed";
				-- disturbed:
					say "Scrawled into the badly scuffed";
				-- destroyed:
					say "Written on the floorboards  (revealed by your inept blunderings which have swept aside a thin layer of sawdust) is the timeless epigram 'You have lost!'";
			unless the sawdust-disturbance of the Bar is destroyed:
				say " sawdust is the timeless epigram 'You have won ";
				if the cloak-position of the Cloakroom is hung:
					say "magnificently";
				else:
					say "mundanely";
				say "!'";
			now game-over is true;
		else if the location is the Cloakroom:
			if the cloak-position of the Cloakroom is:
				-- player:
					say "The hook is bare.";
				-- hung:
					say "Your velvet cloak hangs from the brass hook.";
				-- dropped:
					say "Your velvet cloak lies crumpled on the floor below the brass hook.";
	else if the player-command is "drop" or  the player-command is "disrobe":
		if the cloak-position of the Cloakroom is player:
			if the location is Cloakroom:
				now the cloak-position of the Cloakroom is dropped;
				say "You drop the cloak to the floor, where it lies in a crumpled heap.";
			else:
				say "There surely must be somewhere more appropriate to leave it?";
		else:
			say "You are empty-handed.";
	else if the player-command is "hang" or  player-command is "put" or player-command is "place" or player-command is "drape":
		if the cloak-position of the Cloakroom is player:
			if the location is Cloakroom:
				now the cloak-position of the Cloakroom is hung;
				say "You hang the cloak from the brass hook.";
			else:
				say "There surely must be somewhere more appropriate to leave it?";
		else:
			say "You are empty-handed.";
	else if the player-command is "take" or the player-command is "wear" or the player-command is "get":
		if the location is Cloakroom and the cloak-position of the Cloakroom is hung or the cloak-position of the Cloakroom is dropped:
			say "You slip the velvet cloak back over your shoulders.";
			now the cloak-position of the Cloakroom is player;
		else:
			say "There's nothing available.";
	else:
		say "Sorry, I don't recognise the command '[player-command]'. Please try something different.";
		
Section - Reading the Player's Command

To read the player_command:
	say ">";
	read input;
	let pc be "";
	if the word-count is not 1: [entered no words or more than one word]
		say "Please enter a single-word command.[paragraph break]";
		now player-command is "";
	else: [construct command word]
		repeat with cx running from start-char to start-char + len-char - 1:
			now pc is the substituted form of "[pc][the character at position cx as a character]";
		unless pc is "g" or pc is "again":
			now player-command is pc;
			
Section - General Functions

To say cant_go: say "You can't go that way".

To go to (r - a room):
	now the location is r;
	look;
	
To look:
	if the location is the Bar and the cloak-position of the Cloakroom is player:
		say "[line break][bold type]In The Dark[roman type][line break]It's pitch dark and you can't see a thing- apart from a faint light from the foyer to the north.[paragraph break]";
	else:
		say "[line break][bold type][location][roman type][line break][description of the location][paragraph break]";

Section - I6		

To read input: (- VM_ReadKeyboard(buffer, parse) -).
To wait for a keypress: (- VM_KeyChar() -).
To clear the screen: (- VM_ClearScreen(WIN_MAIN) -).
To decide what number is the word-count: (- (parse-->0) -).
To decide what number is the start-char: (- (parse-->3) -).
To decide what number is the len-char: (- (parse-->2) -).
To decide what number is the/-- character at position/-- (n - a number): (- (buffer->{n}) -).
To say (n - a number) as a character: (- print (char) {n}; -).

Section - walkthrough
[
n/e/s/light/n/w/x/drop/l/take/suspend/hang/l/x/e/s/x  [to win magnificently]
n/e/s/light/n/w/x/drop/l/x/e/s/x  [to win mundanely]
n/e/s/light/w/help/drink/n/w/hang/e/s/x [to lose]
]