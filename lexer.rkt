#lang racket/base

(require brag/support)

(define kroz-lexer
  (lexer-srcloc
   [(from/to ";" "\n") (token 'COMMENT #:skip? #t)]
   [any-string (token 'IDENTIFIER (list->string lexeme))]
   [whitespace (token lexeme #:skip? #t)]
   [(from/to "\"" "\"") (token 'STRING
                               (substring lexeme 1 (sub1 (string-length lexeme))))]
   [(:or "begin_game" "end_game" "prompt" "actions" ":" "->" "---") (token lexeme lexeme)]))

(provide kroz-lexer)
