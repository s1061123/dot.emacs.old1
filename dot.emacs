;;;; -*- mode: emacs-lisp; coding: utf-8 -*-
;;; 
;;; dot.emacs (s1061123@)
;;;

(menu-bar-mode 0)
(tool-bar-mode 0)
(setq display-time-24hr-format 't)
(display-time-mode)

;; load-pathの設定
;(setq load-path (cons (expand-file-name "~/src/elisp/") load-path))

;;; IMEの設定
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
(setq default-input-method "skk")
;(setq skk-kutouten-type 'en)
(setq skk-kutouten-type 'jp)
(setq skk-large-jisyo "C:/meadow/packages/etc/skk/SKK-JISYO.L")

;;; font-lockの設定
(global-font-lock-mode t)
(iswitchb-mode 't)
(setq next-line-add-newlines 't)

;(iswitchb-default-keybindings)
;(setq font-lock-support-mode 'lazy-look-mode)
; toggle-global-lazy-font-lock-mode
;(global-font-lock-mode t)

;;selected regionに色を付ける
(setq transient-mark-mode t)

;; 対応する括弧に色を付ける
(show-paren-mode t)
;(setq show-paren-style 'mixed)
;(set-face-background 'show-paren-match-face "gray10")
;(set-face-foreground 'show-paren-match-face "SkyBlue")

;; lisp関係で説明を下に表示。
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
    ;; "*scratch*" を作成して buffer-list に放り込む
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
    ;; *scratch* バッファで kill-buffer したら内容を消去するだけにする
          (function (lambda ()
                      (if (string= "*scratch*" (buffer-name))
                          (progn (my-make-scratch 0) nil)
                        t))))

(add-hook 'after-save-hook
; *scratch* バッファの内容を保存したら *scratch* バッファを新しく作る
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
(setq howm-menu-expiry-hours 2) ;; メニューを 2 時間キャッシュ
(setq howm-menu-refresh-after-save nil) ;; メモ保存時のメニュー更新も止める
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
;; for Win32
(when (bound-and-true-p w32-initialized)
  (load "~/.emacs.d/win32"))

;;;
;;; end of file
;;;
