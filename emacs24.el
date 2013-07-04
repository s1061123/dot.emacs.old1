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

;; for auto-install
;; (2) And put the following in your ~/.emacs startup file:
(require 'auto-install)
;; (3) Add this to your ~/.emacs to optionally specify a download directory:
(setq auto-install-directory "~/.emacs.d/elisp/")
;; (4) Optionally, if your computer is always connected Internet when Emacs start up,
;;     I recommend you add below to your ~/.emacs, to update package name when start up:
(auto-install-update-emacswiki-package-name t)
;;     And above setup is not necessary, because AutoInstall will automatically update
;;     package name when you just first call `auto-install-from-emacswiki',
;;     above setup just avoid *delay* when you first call `auto-install-from-emacswiki'.
;;
;; (5) I recommend you add below to your ~/.emacs for install-elisp users:
(auto-install-compatibility-setup)

;; anything
(require 'anything)
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)
(define-key global-map (kbd "C-x C-b") 'anything)

;;
(require 'tramp)
(setq default-process-coding-system '(sjis-dos . sjis-unix))
;(setq-default tramp-default-method "plink")
(setq-default tramp-default-method "pscp")

;;helm
;(require 'helm)
;(require 'helm-config)
;(helm-mode 1)

;; from Yoshiori
;(defun my-helm ()
;  (interactive)
;  (helm :sources '(
;                   helm-c-source-buffers-list
;                   helm-c-source-recentf
;                   helm-c-source-files-in-current-dir
;                   helm-c-source-mac-spotlight
;                   helm-c-source-buffer-not-found)
;        :buffer "*my helm*"))

;(global-set-key (kbd "C-x C-b") 'my-helm)
;(global-set-key (kbd "M-x") 'helm-M-x)

;(setq helm-samewindow nil)
;(push '("*helm-M-x*") popwin:special-display-config)
;; emacs$B$N=*N;;~$K!"MzNr$rJ]B8$9$k(B
;(remove-hook 'kill-emacs-hook 'helm-c-adaptive-save-history)
;; $B%G%#%l%$$O(B0.2$BIC(B
;(setq helm-input-idle-delay 0.02)
;; $B8uJd$N%G%#%l%/%H%j$,0l$D$7$+$J$$>l9g$K!"<+F0E*$KE83+$7$J$$(B
;(setq helm-ff-auto-update-initial-value nil)


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
