#lang info

(define collection "kroz")
(define version "0.1")
(define author "Ryan Faulhaber <ryf@sent.as>")
(define scribblings '(("scribblings/kroz.scrbl")))
(define test-omit-paths '("kroz-test.rkt"))
(define deps '("base"
               "brag"
               "syntax-color-lib"))

(define build-deps '("scribble-lib"))

