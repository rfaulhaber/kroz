#lang racket/base

(require
 "lexer.rkt"
 "tokenizer.rkt"
 "parser.rkt")

(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port path)))
  (strip-bindings
   #`(module kroz-mod kroz/expander
       #,parse-tree)))

(provide read-syntax)
