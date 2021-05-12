#lang racket

(require kroz/parser
         kroz/tokenizer
         brag/support
         rackunit)

(check-equal?
 (parse-to-datum
  (apply-tokenizer-maker make-tokenizer "; this is a comment\n")) '(kroz-program))

(check-equal?
 (parse-to-datum
  (apply-tokenizer-maker make-tokenizer
                         "foo: prompt: \"You find yourself in a cave\" actions:
\"grab stick\" -> stick_action\n"))
 '(kroz-program))


