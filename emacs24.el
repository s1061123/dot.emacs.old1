;;;; -*- mode: emacs-lisp; coding: iso-2022-7bit -*-
;;; 
;;; dot.emacs24 (s1061123@)
;;;

;;
;; package.el
(require 'package)
;;$B%j%]%8%H%j$K(BMarmalade$B$rDI2C(B
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;$B%$%s%9%H!<%k$9$k%G%#%l%/%H%j$r;XDj(B
(setq package-user-dir (concat user-emacs-directory "vendor/elpa"))
;;$B%$%s%9%H!<%k$7$?%Q%C%1!<%8$K%m!<%I%Q%9$rDL$7$F%m!<%I$9$k(B
(package-initialize)


;; font
;; $B8GDjEyI}%U%)%s%H(B
;(set-face-attribute 'fixed-pitch    nil :family "BDF$BEl1@%4%7%C%/(B")
;; $B2DJQI}%U%)%s%H(B
;(set-face-attribute 'variable-pitch nil :family "BDF$BEl1@%4%7%C%/(B")
;(add-to-list 'default-frame-alist '(font . "BDF$BEl1@%4%7%C%/(B-12"))
;(set-face-font 'font-lock-comment-face       "BDF$BEl1@%4%7%C%/(B-12")
;(set-face-font 'font-lock-string-face        "BDF$BEl1@%4%7%C%/(B-12")
;(set-face-font 'font-lock-keyword-face       "BDF$BEl1@%4%7%C%/(B-12")
;(set-face-font 'font-lock-builtin-face       "BDF$BEl1@%4%7%C%/(B-12")
;(set-face-font 'font-lock-function-name-face "BDF$BEl1@%4%7%C%/(B-12")
;(set-face-font 'font-lock-variable-name-face "BDF$BEl1@%4%7%C%/(B-12")
;(set-face-font 'font-lock-type-face          "BDF$BEl1@%4%7%C%/(B-12")
;(set-face-font 'font-lock-constant-face      "BDF$BEl1@%4%7%C%/(B-12")
;(set-face-font 'font-lock-warning-face       "BDF$BEl1@%4%7%C%/(B-12")

;;; font-lock$B$N@_Dj(B
(global-font-lock-mode t)

;; Initial Frame
;; $B=i4|%U%l!<%`$N@_Dj(B
(setq default-frame-alist
      (append (list '(foreground-color . "black")
		    '(background-color . "LemonChiffon")
		    '(background-color . "gray")
		    '(border-color . "black")
		    '(mouse-color . "white")
		    '(cursor-color . "black")
		    '(width . 80)
		    '(height . 40)
		    '(top . 150)
		    '(left . 300))
	      default-frame-alist))

;; Last, move to home dir.
(cd "~/")
