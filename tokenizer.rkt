#lang racket/base

(require "lexer.rkt"
         brag/support)

(define (make-tokenizer ip)
  (port-count-lines! ip)
  (define (next-token) (kroz-lexer ip))
  next-token)

(provide make-tokenizer)
