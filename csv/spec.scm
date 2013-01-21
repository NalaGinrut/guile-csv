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

(define-module (language csv spec)
  #:use-module (system base language)
  #:use-module (language csv compile-tree-il)
  #:use-module (language csv parser)
  #:export (csv))

;;;
;;; Language definition
;;;

;; Actually, CSV is not a language anyway, but we define this seudo language to 
;; convert CSV format into s-expr.
(define-language csv
  #:title	"CSV language"
  #:reader      (lambda (port env) 
		  (csv-read port))
  #:compilers   `((tree-il . ,compile-tree-il))
  #:printer	write
  )

