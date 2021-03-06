;;; -*- Mode: Lisp; Syntax: Common-Lisp; Package: R2; -*-
;;; ---------------------------------------------------------------------------
;;;     Title: Fake package definition for R2
;;;   Created: ???
;;;    Author: Gilbert Baumann <gilbert@base-engineering.com>
;;;   License: MIT style (see below)
;;; ---------------------------------------------------------------------------
;;;  (c) copyright 2005 by Gilbert Baumann

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

(in-package :R2)

;; evil

(import '(closure-protocol:element-p
          closure-protocol:element-parent
          closure-protocol:element-children
          closure-protocol:element-attribute
          closure-protocol:element-gi
          closure-protocol:text-element-p
          closure-protocol:element-text

          ;; css support protocol
          closure-protocol:element-css-class
          closure-protocol:element-css-id
          closure-protocol:pseudo-class-matches-p
          closure-protocol:element-style-cache
          closure-protocol:element-implicit-style
          closure-protocol:element-explicit-style
   
          ;; renderer support protocol
          closure-protocol:element-replaced-element-1
          closure-protocol:element-replaced-element
          closure-protocol:*user-agent*
          closure-protocol:*document-language*
          closure-protocol:element-base-url
          closure-protocol:element-imap
          closure-protocol:render
          closure-protocol:root-element-embedded-style
          ))
