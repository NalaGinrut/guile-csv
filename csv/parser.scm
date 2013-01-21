;;  Copyright (C) 2013
;;      "Mu Lei" known as "NalaGinrut" <NalaGinrut@gmail.com>
;;  This file is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.

;;  This file is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU General Public License for more details.

;;  You should have received a copy of the GNU General Public License
;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.

(define-module (language csv parser)
  #:use-module (language csv lexer)
  #:use-module (system base lalr)
  #:export (csv-read))

(define* (syntax-error message #:optional token)
  (if (lexical-token? token)
      (throw 'syntax-error #f message
             (and=> (lexical-token-source token)
                    source-location->source-properties)
             (or (lexical-token-value token)
                 (lexical-token-category token))
             #f)
      (throw 'syntax-error #f message #f token #f)))

(define *eof-object*
  (call-with-input-string "" read-char))

(define (csv-read port)
  (let ((parse (make-parser)))
    (parse (make-csv-tokenizer port) syntax-error)))

(define (make-parser)
  (lalr-parser
   (;; keyword
    ;; TODO)

   (program (stmt) : $1
	    (*eoi*) : *eof-object*)
   )))




