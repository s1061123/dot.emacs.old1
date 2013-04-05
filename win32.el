;;;; -*- mode: emacs-lisp; coding: iso-2022-7bit -*-
;;; 
;;; .emacs for win32 (s1061123@)
;;;

;; ---------------------------------------------
;; $B0u:~@_Dj(B
;;  Ghostscript$B$,I,MW(B
;;   http://auemath.aichi-edu.ac.jp/~khotta/ghost/
;;  BoldFont$B$,I,MW(B
;;   http://ftp.yz.yamagata-u.ac.jp/pub/GNU/intlfonts/intlfonts-1.2.1.tar.gz
;;
;;     M-x ps-print-buffer           $B%P%C%U%!$rGr9u0u:~(B
;;     M-x ps-print-buffer-with-face $B%P%C%U%!$r%+%i!<0u:~(B
;;     M-x ps-print-region           $B%j!<%8%g%s$rGr9u0u:~(B
;;     M-x ps-print-region-with-face $B%j!<%8%g%s$r%+%i!<0u:~(B
;; ---------------------------------------------
(require 'cl)
(defun listsubdir (basedir)
  (remove-if (lambda (x) (not (file-directory-p x)))
             (directory-files basedir t "^[^.]")))

; $B%U%)%s%H%Q%9$r;XDj(B
(setq bdf-directory-list
      (listsubdir "c:/gnupack_basic-11.00/app/font/bdf/intlfonts"))

; ghostscript$B$N<B9T%3%^%s%I>l=j$r;XDj(B
(setq ps-print-color-p t
      ps-lpr-command "c:/gnupack_basic-11.00/app/gs/bin/gswin32c.exe"
      ps-multibyte-buffer 'non-latin-printer
      ps-lpr-switches '("-sDEVICE=mswinpr2" "-dNOPAUSE" "-dBATCH" "-dWINKANJI")
      printer-name nil
      ps-printer-name nil
      ps-printer-name-option nil
      ps-print-header nil          ; $B%X%C%@$NHsI=<((B
      )
