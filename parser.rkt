#lang brag

kroz-program: (comment | scene | begin-game)*
begin-game: "begin_game" identifier
scene: scene-name newline prompt-def action-list newline
prompt-def: "prompt" colon (single-line-string | multi-line-string)
action-list: "actions" colon action-def+
action-def: string arrow scene-name newline
single-line-string: string newline
scene-name: identifier colon
multi-line-string: MULTI-LINE-STRING
identifier: IDENTIFIER
comment: COMMENT
string: STRING
colon: COLON
arrow: ARROW
triple-dash: TRIPLE-DASH
newline: NEWLINE
