;;;; -*- mode: emacs-lisp; coding: iso-2022-7bit -*-
;;; 
;;; dot.emacs24 (s1061123@)
;;;

;;
;; package.el
(require 'package)
;;リポジトリにMarmaladeを追加
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;インストールするディレクトリを指定
(setq package-user-dir (concat user-emacs-directory "vendor/elpa"))
;;インストールしたパッケージにロードパスを通してロードする
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
;; emacsの終了時に、履歴を保存する
;(remove-hook 'kill-emacs-hook 'helm-c-adaptive-save-history)
;; ディレイは0.2秒
;(setq helm-input-idle-delay 0.02)
;; 候補のディレクトリが一つしかない場合に、自動的に展開しない
;(setq helm-ff-auto-update-initial-value nil)


;; font
;; 固定等幅フォント
;(set-face-attribute 'fixed-pitch    nil :family "BDF東雲ゴシック")
;; 可変幅フォント
;(set-face-attribute 'variable-pitch nil :family "BDF東雲ゴシック")
;(add-to-list 'default-frame-alist '(font . "BDF東雲ゴシック-12"))
;(set-face-font 'font-lock-comment-face       "BDF東雲ゴシック-12")
;(set-face-font 'font-lock-string-face        "BDF東雲ゴシック-12")
;(set-face-font 'font-lock-keyword-face       "BDF東雲ゴシック-12")
;(set-face-font 'font-lock-builtin-face       "BDF東雲ゴシック-12")
;(set-face-font 'font-lock-function-name-face "BDF東雲ゴシック-12")
;(set-face-font 'font-lock-variable-name-face "BDF東雲ゴシック-12")
;(set-face-font 'font-lock-type-face          "BDF東雲ゴシック-12")
;(set-face-font 'font-lock-constant-face      "BDF東雲ゴシック-12")
;(set-face-font 'font-lock-warning-face       "BDF東雲ゴシック-12")

;;; font-lockの設定
(global-font-lock-mode t)

;; Initial Frame
;; 初期フレームの設定
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
