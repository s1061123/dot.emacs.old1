;;;; -*- mode: emacs-lisp; coding: iso-2022-7bit -*-
;;; 
;;; dot.emacs for Meadow (s1061123@)
;;;

;; ;;; Mule-UCS $B$N@_Dj(B
;; ;; ftp://ftp.m17n.org/pub/mule/Mule-UCS/ $B$,(B $B%*%U%#%7%c%k%5%$%H$G$9$,!"(B
;; ;; http://www.meadowy.org/~shirai/elisp/mule-ucs.tar.gz $B$K4{CN$N%Q%C%A(B
;; ;; $B$r$9$Y$FE,MQ$7$?$b$N$,$*$$$F$"$j$^$9!#(B
;; ;; (set-language-environment) $B$NA0$K@_Dj$7$^$9(B
(require 'jisx0213)
(set-language-environment "Japanese")
(setq default-input-method "japanese-skk")

;; SKK
(require 'skk-autoloads)
(setq skk-tut-file "C:/meadow/packages/etc/skk/SKK.tut")

;;; $B%^%&%9%+!<%=%k$r>C$9@_Dj(B
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
; $B5/F0;~$*$h$S(Bnew-frame$B;~$N%U%l!<%`(B($B%&%#%s%I%&(B)$B$N@_Dj!#(B
(add-to-list 'default-frame-alist '(font . "MS Gothic 16"))
; $B8=:_$N%U%l!<%`$N@_Dj(B(.emacs$BCf$G$O>JN,2D(B)
;(set-frame-font "MS Gothic 16")

;;; BDF $B%U%)%s%H@_Dj(B
;;; ($BJ}K!$=$N(B1) Netinstall $B%Q%C%1!<%8$r;H$&J}K!(B
;;; misc $B$H(B intlfonts $B%Q%C%1!<%8$rF~$l$^$9!#(B
;;; .emacs$B$N@_Dj(B
;(setq bdf-use-intlfonts16 t)
;(setq initial-frame-alist '((font . "intlfonts16")))

;; $B=i4|%U%l!<%`$N@_Dj(B
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

;; ;;; shell $B$N@_Dj(B

;; ;;; Cygwin $B$N(B bash $B$r;H$&>l9g(B
;;(setq explicit-shell-file-name "bash.exe")
;;(setq shell-file-name "sh")
;;(setq shell-command-switch "-c") 

;; ;;; Virtually UN*X!$B$K$"$k(B tcsh.exe $B$r;H$&>l9g(B
;; (setq explicit-shell-file-name "tcsh.exe") 
;; (setq shell-file-name "tcsh.exe") 
;; (setq shell-command-switch "-c") 

;; ;;; WindowsNT $B$KIUB0$N(B CMD.EXE $B$r;H$&>l9g!#(B
;;(setq explicit-shell-file-name "CMD.EXE") 
;;(setq shell-file-name "CMD.EXE") 
;;(setq shell-command-switch "\\/c") 

;; ;;; WindowsNT $B$KIUB0$N(B CMD.EXE $B$r;H$&>l9g!#(B
(setq explicit-shell-file-name "cmdproxy.EXE") 
(setq shell-file-name "cmdproxy.EXE") 
(setq shell-command-switch "\\/c") 

;; ;;; browse-url $B$N@_Dj(B
;; (global-set-key [S-mouse-2] 'browse-url-at-mouse)

;;; $B0u:~$N@_Dj(B
;; $B$3$N@_Dj$G(B M-x print-buffer RET $B$J$I$G$N0u:~$,$G$-$k$h$&$K$J$j$^$9(B
;;
;;  notepad $B$KM?$($k%Q%i%a!<%?$N7A<0$N@_Dj(B
(define-process-argument-editing "notepad"
  (lambda (x) (general-process-argument-editing-function x nil t)))

(defun w32-print-region (start end
				  &optional lpr-prog delete-text buf display
				  &rest rest)
  (interactive)
  (let ((tmpfile (convert-standard-filename (buffer-name)))
	   (w32-start-process-show-window t)
	   ;; $B$b$7!"(Bdos $BAk$,8+$($F$$$d$J?M$O>e5-$N(B `t' $B$r(B `nil' $B$K$7$^$9(B
	   ;; $B$?$@$7!"(B`nil' $B$K$9$k$H(B Meadow $B$,8G$^$k4D6-$b$"$k$+$b$7$l$^$;$s(B
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

;; ;;; fakecygpty $B$N@_Dj(B
;; ;; $B$3$N@_Dj$G(B cygwin $B$N2>A[C<Kv$rMW5a$9$k%W%m%0%i%`$r(B Meadow $B$+$i(B
;; ;; $B07$($k$h$&$K$J$j$^$9(B
(setq mw32-process-wrapper-alist
      '(("/\\(bash\\|openssl\\|tcsh\\|svn\\|ssh\\|gpg[esvk]?\\)\\.exe" .
	 (nil . ("fakecygpty.exe" . set-process-connection-type-pty)))))

;;; argument-editing $B$N@_Dj(B
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

;; ;;; $B%+!<%=%k$N@_Dj(B
(set-cursor-type 'box)            ; Meadow-1.10$B8_49(B (SKK$BEy$G?'$,JQ$k@_Dj(B)
;; ;; (set-cursor-type 'hairline-caret) ; $B=DK@%-%c%l%C%H(B


