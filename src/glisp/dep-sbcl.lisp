;;; -*- Mode: Lisp; Syntax: Common-Lisp; Package: CL-USER; -*-
;;; ---------------------------------------------------------------------------
;;;     Title: SBCL dependent stuff + fixups
;;;   Created: 1999-05-25 22:32
;;;    Author: Gilbert Baumann <gilbert@base-engineering.com>
;;;   License: MIT style (see below)
;;; ---------------------------------------------------------------------------
;;;  (c) copyright 1999 by Gilbert Baumann

;;;  Permission is hereby granted, free of charge, to any person obtaining
;;;  a copy of this software and associated documentation files (the
;;;  "Software"), to deal in the Software without restriction, including
;;;  without limitation the rights to use, copy, modify, merge, publish,
;;;  distribute, sublicense, and/or sell copies of the Software, and to
;;;  permit persons to whom the Software is furnished to do so, subject to
;;;  the following conditions:
;;; 
;;;  The above copyright notice and this permission notice shall be
;;;  included in all copies or substantial portions of the Software.
;;; 
;;;  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;;;  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;;;  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
;;;  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
;;;  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
;;;  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
;;;  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(defun glisp::read-byte-sequence (&rest ap)
  (apply #'read-sequence ap))

(defun glisp::read-char-sequence (&rest ap)
  (apply #'read-sequence ap))

(defmacro glisp::with-timeout ((&rest options) &body body)
  (declare (ignore ignore))
  `(progn
     ,@body))

(defun glisp::open-inet-socket (hostname port)
  (values
   (sb-bsd-sockets:socket-make-stream 
    (let ((host (car (sb-bsd-sockets:host-ent-addresses
		      (sb-bsd-sockets:get-host-by-name hostname)))))
      (when host
	(let ((s (make-instance 'sb-bsd-sockets:inet-socket
				:type :stream :protocol :tcp)))
	  (sb-bsd-sockets:socket-connect s host port)
	  s)))
    :element-type '(unsigned-byte 8)
    :input t :output t)
   :byte))

(defstruct (server-socket (:constructor make-server-socket-struct))
  fd
  element-type
  port)


#||
(export 'glisp::make-server-socket :glisp)
(defun glisp::make-server-socket (port &key (element-type '(unsigned-byte 8)))
  (make-server-socket-struct :fd (ext:create-inet-listener port)
                             :element-type element-type
                             :port port))


(defun glisp::accept-connection/low (socket)
  (mp:process-wait-until-fd-usable (server-socket-fd socket) :input)
  (values
   (sys:make-fd-stream (ext:accept-tcp-connection (server-socket-fd socket))
                       :input t :output t
                       :element-type (server-socket-element-type socket))
   (cond ((subtypep (server-socket-element-type socket) 'integer)
          :byte)
         (t
          :char))))

(export 'glisp::close-server-socket :glisp)
(defun glisp::close-server-socket (socket)
  (unix:unix-close (server-socket-fd socket)))
||#

;;;;;;

(defun glisp::g/make-string (length &rest options)
  (apply #'make-array length :element-type 'character options))



(defun glisp::run-unix-shell-command (command)
  (sb-impl::process-exit-code
   (sb-ext:run-program "/bin/sh" (list "-c" command) :wait t :input nil
		       :output nil)))

(defun glisp::getenv (string)
  (sb-ext:posix-getenv string))
