;;;; -*- mode: emacs-lisp; coding: iso-2022-7bit -*-
;;; 
;;; dot.emacs (s1061123@)
;;;

(menu-bar-mode 0)
(tool-bar-mode 0)
(setq display-time-24hr-format 't)
(display-time-mode)

;; load-path$B$N@_Dj(B
;(setq load-path (cons (expand-file-name "~/src/elisp/") load-path))

;;; IME$B$N@_Dj(B
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
(setq default-input-method "skk")
;(setq skk-kutouten-type 'en)
(setq skk-kutouten-type 'jp)
(setq skk-large-jisyo "C:/meadow/packages/etc/skk/SKK-JISYO.L")

;;; font-lock$B$N@_Dj(B
(global-font-lock-mode t)
(iswitchb-mode 't)
(setq next-line-add-newlines 't)

;(iswitchb-default-keybindings)
;(setq font-lock-support-mode 'lazy-look-mode)
; toggle-global-lazy-font-lock-mode
;(global-font-lock-mode t)

;;selected region$B$K?'$rIU$1$k(B
(setq transient-mark-mode t)

;; $BBP1~$9$k3g8L$K?'$rIU$1$k(B
(show-paren-mode t)
;(setq show-paren-style 'mixed)
;(set-face-background 'show-paren-match-face "gray10")
;(set-face-foreground 'show-paren-match-face "SkyBlue")

;; lisp$B4X78$G@bL@$r2<$KI=<(!#(B
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

;; for lookup
(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)
(setq lookup-search-agents
      '(
	(ndeb "c:/tom/dic" :coding sjis-dos :alias "dics")
;;	(ndeb "c:/tom/dic/dic/eijiro" :coding sjis-dos :alias "dics")
;;	(ndeb "c:/tom/dic/dic/waeijiro" :coding sjis-dos :alias "dics")
	(ndspell)
	))
(global-set-key "\C-cw" 'lookup-pattern)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; for gnuserv
(require 'gnuserv)
(gnuserv-start) 

;; for elscreen
(setq elscreen-prefix-key "\C-]")
(setq elscreen-display-tab nil)
(require 'elscreen)

;;my lisp
(load "~/.emacs.d/tools")

;;scrach
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    ;; "*scratch*" $B$r:n@.$7$F(B buffer-list $B$KJ|$j9~$`(B
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg (progn (setq arg 0)
                   (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
          ((= arg 1) (message "another *scratch* is created")))))

(defun my-buffer-name-list ()
  (mapcar (function buffer-name) (buffer-list)))

(add-hook 'kill-buffer-query-functions
    ;; *scratch* $B%P%C%U%!$G(B kill-buffer $B$7$?$iFbMF$r>C5n$9$k$@$1$K$9$k(B
          (function (lambda ()
                      (if (string= "*scratch*" (buffer-name))
                          (progn (my-make-scratch 0) nil)
                        t))))

(add-hook 'after-save-hook
; *scratch* $B%P%C%U%!$NFbMF$rJ]B8$7$?$i(B *scratch* $B%P%C%U%!$r?7$7$/:n$k(B
          (function (lambda ()
                      (unless (member "*scratch*" (my-buffer-name-list))
                        (my-make-scratch 1)))))

;; auto-save-buffer
(load "~/.emacs.d/auto-save-buffers.el")
(require 'auto-save-buffers)
(run-with-idle-timer 0.5 t 'auto-save-buffers) 

;; Disable migemo
;(setq migemo-isearch-enable-p nil)

;; Howm
(require 'howm)
(setq howm-menu-expiry-hours 2) ;; $B%a%K%e!<$r(B 2 $B;~4V%-%c%C%7%e(B
(setq howm-menu-refresh-after-save nil) ;; $B%a%bJ]B8;~$N%a%K%e!<99?7$b;_$a$k(B
(setq howm-menu-file "~/howm/0000-00-00-000000.howm")

;; Wanderlust email
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
(setq gnutls-min-prime-bits 1024)
(require 'elscreen-wl)
(require 'wl-util)
;; to read html mails...
(require 'mime-w3m)
(require 'cl-lib)

;;XML-mode
(setq auto-mode-alist (append '(("\.xul$" . xml-mode) 
				("\.rdf$" . xml-mode))
			      auto-mode-alist))

;;Haskell mode
;(load "haskell-site-file")

;; for meadow
(when (fboundp 'Meadow-version)
  (load "~/.emacs.d/meadow"))
;; for emcas24
(when (>= emacs-major-version 24)
  (load "~/.emacs.d/emacs24"))

;;;
;;; end of file
;;;
