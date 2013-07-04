;;;; -*- mode: emacs-lisp; coding: utf-8 -*-
;;; 
;;; dot.emacs for Meadow (s1061123@)
;;;

;; ;;; Mule-UCS の設定
;; ;; ftp://ftp.m17n.org/pub/mule/Mule-UCS/ が オフィシャルサイトですが、
;; ;; http://www.meadowy.org/~shirai/elisp/mule-ucs.tar.gz に既知のパッチ
;; ;; をすべて適用したものがおいてあります。
;; ;; (set-language-environment) の前に設定します
(require 'jisx0213)
(set-language-environment "Japanese")
(setq default-input-method "japanese-skk")

;; SKK
(require 'skk-autoloads)
(setq skk-tut-file "C:/meadow/packages/etc/skk/SKK.tut")

;;; マウスカーソルを消す設定
(setq w32-hide-mouse-on-key t)
(setq w32-hide-mouse-timeout 5000)

(w32-add-font
     "MS Gothic 16"
     '((spec
	((:char-spec ascii :height any)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 400 0 nil nil nil 0 1 3 0))
	((:char-spec ascii :height any :weight bold)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 700 0 nil nil nil 0 1 3 0)
	 ((spacing . -1)))
	((:char-spec ascii :height any :slant italic)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 400 0   t nil nil 0 1 3 0))
	((:char-spec ascii :height any :weight bold :slant italic)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 700 0   t nil nil 0 1 3 0)
	 ((spacing . -1)))
	((:char-spec japanese-jisx0208 :height any)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 400 0 nil nil nil 128 1 3 0))
	((:char-spec japanese-jisx0208 :height any :weight bold)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 700 0 nil nil nil 128 1 3 0)
	 ((spacing . -1)))
	((:char-spec japanese-jisx0208 :height any :slant italic)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 400 0   t nil nil 128 1 3 0))
	((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
	 strict
	 (w32-logfont "MS Gothic" 0 -16 700 0   t nil nil 128 1 3 0)
	 ((spacing . -1))))))
; 起動時およびnew-frame時のフレーム(ウィンドウ)の設定。
(add-to-list 'default-frame-alist '(font . "MS Gothic 16"))
; 現在のフレームの設定(.emacs中では省略可)
;(set-frame-font "MS Gothic 16")

;;; BDF フォント設定
;;; (方法その1) Netinstall パッケージを使う方法
;;; misc と intlfonts パッケージを入れます。
;;; .emacsの設定
;(setq bdf-use-intlfonts16 t)
;(setq initial-frame-alist '((font . "intlfonts16")))

;; 初期フレームの設定
(setq default-frame-alist
      (append (list '(foreground-color . "black")
		    '(background-color . "LemonChiffon")
		    '(background-color . "gray")
		    '(border-color . "black")
		    '(mouse-color . "white")
		    '(cursor-color . "black")
;;		    '(font "MS Gothic 16")
;;		    '(font "mule-fonts16")    ; BDF
;;		    '(font . "bdf-fontset")    ; BDF
;;		    '(font . "private-fontset"); TrueType
		    '(width . 80)
		    '(height . 40)
		    '(top . 150)
		    '(left . 300))
	      default-frame-alist))

;; ;;; shell の設定

;; ;;; Cygwin の bash を使う場合
;;(setq explicit-shell-file-name "bash.exe")
;;(setq shell-file-name "sh")
;;(setq shell-command-switch "-c") 

;; ;;; Virtually UN*X!にある tcsh.exe を使う場合
;; (setq explicit-shell-file-name "tcsh.exe") 
;; (setq shell-file-name "tcsh.exe") 
;; (setq shell-command-switch "-c") 

;; ;;; WindowsNT に付属の CMD.EXE を使う場合。
;;(setq explicit-shell-file-name "CMD.EXE") 
;;(setq shell-file-name "CMD.EXE") 
;;(setq shell-command-switch "\\/c") 

;; ;;; WindowsNT に付属の CMD.EXE を使う場合。
(setq explicit-shell-file-name "cmdproxy.EXE") 
(setq shell-file-name "cmdproxy.EXE") 
(setq shell-command-switch "\\/c") 

;; ;;; browse-url の設定
;; (global-set-key [S-mouse-2] 'browse-url-at-mouse)

;;; 印刷の設定
;; この設定で M-x print-buffer RET などでの印刷ができるようになります
;;
;;  notepad に与えるパラメータの形式の設定
(define-process-argument-editing "notepad"
  (lambda (x) (general-process-argument-editing-function x nil t)))

(defun w32-print-region (start end
				  &optional lpr-prog delete-text buf display
				  &rest rest)
  (interactive)
  (let ((tmpfile (convert-standard-filename (buffer-name)))
	   (w32-start-process-show-window t)
	   ;; もし、dos 窓が見えていやな人は上記の `t' を `nil' にします
	   ;; ただし、`nil' にすると Meadow が固まる環境もあるかもしれません
	   (coding-system-for-write w32-system-coding-system))
    (while (string-match "[/\\]" tmpfile)
	 (setq tmpfile (replace-match "_" t nil tmpfile)))
    (setq tmpfile (expand-file-name (concat "_" tmpfile "_")
				       temporary-file-directory))
    (write-region start end tmpfile nil 'nomsg)
    (call-process "notepad" nil nil nil "/p" tmpfile)
    (and (file-readable-p tmpfile) (file-writable-p tmpfile)
	    (delete-file tmpfile))))

(setq print-region-function 'w32-print-region)

;; ;;; fakecygpty の設定
;; ;; この設定で cygwin の仮想端末を要求するプログラムを Meadow から
;; ;; 扱えるようになります
(setq mw32-process-wrapper-alist
      '(("/\\(bash\\|openssl\\|tcsh\\|svn\\|ssh\\|gpg[esvk]?\\)\\.exe" .
	 (nil . ("fakecygpty.exe" . set-process-connection-type-pty)))))

;;; argument-editing の設定
(require 'mw32script)
(mw32script-init)

;; for tramp
;; to use it, try to "/plink:user@serv:~/location"
(when (require 'tramp nil 'noerror)
  (cond ((eq system-type 'windows-nt)
	 (setq tramp-default-method "plink"
	       tramp-completion-without-shell-p t)
	 (modify-coding-system-alist 'process "plink" 'euc-japan-unix))
	(t
	 (setq tramp-default-method "plink")))
  )

;; ;;; カーソルの設定
(set-cursor-type 'box)            ; Meadow-1.10互換 (SKK等で色が変る設定)
;; ;; (set-cursor-type 'hairline-caret) ; 縦棒キャレット


