;;  Copyright (C) 2012
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

(define-module (language csv lexer)
  #:use-module (system base lalr)
  #:use-module (ice-9 receive)
  #:use-module (ice-9 rdelim)
  #:export (make-csv-tokenizer))

	  
(define (port-source-location port)
  (make-source-location (port-filename port)
                        (port-line port)
                        (port-column port)
                        (false-if-exception (ftell port))
                        #f))

(define imp-tokenizer
  (lambda (port)
    (let* ((loc (port-source-location port))
	   (return (lambda (category value)
		     (make-lexical-token category loc value)))
	   (c (peek-char port)))
      (cond
       ((eof-object? c) '*eoi*)
       ;; TODO
       (else
	(error "wrong syntax!" c))))))

(define (make-imp-tokenizer port)
  (lambda ()
    (imp-tokenizer port)))

;; (define imp-tokenize
;;   (lambda (port)
;;     (let lp ((out '()))
;;       (let ((tok (imp-tokenizer port)))
;; 	(if (eq? tok '*eoi*)
;; 	    (reverse! out)
;; 	    (lp (cons tok out)))))))
