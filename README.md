# kroz
Kroz is a programming language for making text-based adventure games.

Kroz is mostly an experiment in writing transpilers in Racket, as explored in 
[Beautiful Racket](https://beautifulracket.com/), though I hope you find it useful.

Every valid Kroz program outputs a text-based adventure game.

## Language reference
The language consists of a series of prompts and expected responses. A
Kroz game is a tree of decisions.

    ; this is a comment
    game_start:
        prompt "You find yourself in a dungeon cell with only a rope. What do you do?"
        with actions:
            "climb rope" -> climb_rope_action
            "yell" -> end_game "A guard comes and kills you."

    climb_rope_action:
        prompt:
        ---
        This is how you'd write a multi-line prompt.
        ---
        actions:
            "follow road" -> ...

    begin_game game_start

### Scenes

Every program is broken into scenes. Each scene has an identifier
specified with it:

    game_start:
    ...

Scenes have a `prompt` and `action`.

### Prompt

The prompt is the text that is displayed at the beginning of a scene.
Prompts can be strings surrounded by quotes, such as:

    prompt: "You enter a cave."

or multi-line string literals surrounded by `---`. The first `---` must
begin on a new line.

    prompt:
    ---
    This is a raw string.

    This will be displayed to the user exactly as you type it!
    ---

### Actions

Actions are essentially key-value mappings from accepted inputs to other
scenes, delimited by new lines. Their basic syntax is:

    ACTION = WORD_LIST -> SCENE_NAME \n
    WORD_LIST = WORD+
    WORD = ".*"

For example:

    actions:
    "follow road", "grab rope" -> next_scene_name
    "cut rope"                 -> different_scene

Whitespace is ignored on a line-by-line basis.

### Special actions

There are two special reserved actions, `begin_game` and `end_game`.

`begin_game`
------------

`begin_game` tells the program which scene kicks the game off.
Conventionally it should be placed at the end of a Kroz file.

    begin_game first_scene

`end_game`
----------

`end_game` ends the game. It takes no argument and can be used in an
action list.

    actions:
    "foo" -> end_game
