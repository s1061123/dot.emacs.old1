;;;; -*- mode: emacs-lisp; coding:  Coding: utf-8 -*-
;;; 
;;; .emacs for win32 (s1061123@)
;;;

;; ---------------------------------------------
;; 印刷設定
;;  Ghostscriptが必要
;;   http://auemath.aichi-edu.ac.jp/~khotta/ghost/
;;  BoldFontが必要
;;   http://ftp.yz.yamagata-u.ac.jp/pub/GNU/intlfonts/intlfonts-1.2.1.tar.gz
;;
;;     M-x ps-print-buffer           バッファを白黒印刷
;;     M-x ps-print-buffer-with-face バッファをカラー印刷
;;     M-x ps-print-region           リージョンを白黒印刷
;;     M-x ps-print-region-with-face リージョンをカラー印刷
;; ---------------------------------------------
(require 'cl)
(defun listsubdir (basedir)
  (remove-if (lambda (x) (not (file-directory-p x)))
             (directory-files basedir t "^[^.]")))

; フォントパスを指定
(setq bdf-directory-list
      (listsubdir "c:/gnupack_basic-11.00/app/font/bdf/intlfonts"))

; ghostscriptの実行コマンド場所を指定
(setq ps-print-color-p t
      ps-lpr-command "c:/gnupack_basic-11.00/app/gs/bin/gswin32c.exe"
      ps-multibyte-buffer 'non-latin-printer
      ps-lpr-switches '("-sDEVICE=mswinpr2" "-dNOPAUSE" "-dBATCH" "-dWINKANJI")
      printer-name nil
      ps-printer-name nil
      ps-printer-name-option nil
      ps-print-header nil          ; ヘッダの非表示
      )
