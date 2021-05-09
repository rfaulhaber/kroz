#lang brag

kroz-program: (comment | scene | begin-game)*
comment: ";" any "\n"
begin-game: "begin_game" identifier
scene: scene-name "\n" prompt-def action-list "\n"
prompt-def: "prompt" ":" (single-line-string | multi-line-string)
action-list: "actions" ":" action-def+
action-def: STRING "->" scene-name "\n"
single-line-string: STRING "\n"
multi-line-string: "---" any "---"
scene-name: identifier ":"
identifier: IDENTIFIER
any: ANY

