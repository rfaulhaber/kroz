#lang racket/base

(require brag/support)

(define kroz-lexer
  (lexer
   ["\n" (token 'NEWLINE lexeme)]
   [whitespace (token lexeme #:skip? #t)]
   [(from/to ";" "\n") (token 'COMMENT #:skip? #t)]
   [(:or "begin_game" "end_game" "prompt" "actions") (token lexeme lexeme)]
   [(from/stop-before alphabetic (:or whitespace ":")) (token 'IDENTIFIER lexeme)]
   [(from/to "\"" "\"") (token 'STRING
                               (substring lexeme 1 (sub1 (string-length lexeme))))]
   [":" (token 'COLON)]
   ["->" (token 'ARROW)]
   ["---" (token 'TRIPLE-DASH)]
   ))

(provide kroz-lexer)

(module+ test
  (require rackunit)

  (define (lex str)
    (apply-port-proc kroz-lexer str))

  (check-equal? (lex "") '())
  (check-equal? (lex " ") (list (token " " #:skip? #t)))
  (check-equal? (lex "\n") (list (token 'NEWLINE "\n")))
  (check-equal? (lex "begin_game") (list (token "begin_game" "begin_game")))
  (check-equal? (lex "foo bar") (list
                                 (token 'IDENTIFIER "foo")
                                 (token " " #:skip? #t)
                                 (token 'IDENTIFIER "bar")))
  (check-equal? (lex "\"foo bar\"") (list
                                     (token 'STRING "foo bar")))
  (check-equal? (lex "begin_game foo") (list
                                        (token "begin_game" "begin_game")
                                        (token " " #:skip? #t)
                                        (token 'IDENTIFIER "foo")))
  (check-equal? (lex "; this is a comment and should be totally ignored\n")
                (list (token 'COMMENT #:skip? #t)))
  (check-equal? (lex "prompt:") (list
                                 (token "prompt" "prompt")
                                 (token 'COLON)))
  (check-equal? (lex "foo:") (list
                                 (token 'IDENTIFIER "foo")
                                 (token 'COLON)))
  )


