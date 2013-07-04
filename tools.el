;;;; -*- mode: emacs-lisp; coding:  Coding: utf-8 -*-
;;;;
;;;;   private tools (s1061123@)
;;;;

;;階乗を求める x^y (a = 1は固定)
(defun calc-pow (x y &optional a)
  (if (null a) (setq a 1))
  (if (eq y 0) a
    (calc-pow x (- y 1) (* a x))))

;; 16進数表記のシンボル(数字+英数字)を10進に変換する関数(テーブル内包)
(defun calc-chartodec_d (h)
  (setq h (downcase h))
  (let
      ((hexformat (list '("0" . 0) '("1" . 1) '("2" . 2) '("3" . 3) '("4" . 4)
			'("5" . 5) '("6" . 6) '("7" . 7) '("8" . 8) '("9" . 9)
			'("a" . 10) '("b" . 11) '("c" . 12) '("d" . 13)
			'("e" . 14) '("f" . 15)
			)))
    (cdr (assoc h hexformat))))

(defun calc-hextodecs (h &optional ans)
  (if (string= h "") (int-to-string ans)
    (if (null ans) (setq ans 0))
    (let ((newans (+ (* ans 16) 
		     (calc-chartodec_d (substring h 0 1)))
		  ))
      (calc-hextodecs (substring h 1) newans))
    ))

					; 16進→10進変換関数
(defun calc-hextodecs-q (s)
  (interactive "shex number:\n")
  (message "dec: %s" (calc-hextodecs s)))

;; 10進→16進変換関数
(defun calc-dectohexs-q (i)   
  (interactive  "ndec number:\n")
  (message "hex: %s" (format "%x" i)))

					; 文字列注の先頭の.を排除する．
(defun calc-elimperiod (str) 
  (let ((matchidx (string-match "^\\." str)))
    (if (null matchidx) str (substring str  (+ matchidx 1)))))

(defun calc-convert-decip-to-hexip (str &optional ans)
  (if (string= str "") (substring ans 1)
    (if (null ans) (setq ans ""))
    (setq str (calc-elimperiod str))
    (setq num (substring str (string-match "[0-9]*" str) (match-end 0)))
    (calc-convert-decip-to-hexip (substring str (match-end 0)) 
				 (concat ans "." (format "%x" 
							 (string-to-int num))))
    ))

(defun calc-decip-to-hexip (m1 m2)
  (interactive "r")
  (let ((ipaddr (buffer-substring m1 m2)))
    (goto-char m1)
    (delete-char (- m2 m1))
    (insert (calc-convert-decip-to-hexip ipaddr))
    )
  )

(defun calc-convert-hexip-to-decip (str &optional ans)
  (if (string= str "") (substring ans 1)
    (if (null ans) (setq ans ""))
    (setq str (calc-elimperiod str))
    (setq num (substring str (string-match "[0-9a-fA-F]*" str) (match-end 0)))
    (calc-convert-hexip-to-decip (substring str (match-end 0))
				 (concat ans "." (calc-hextodecs num))))
  )

(defun calc-hexip-to-decip (m1 m2)
  (interactive "r")
  (let ((ipaddr (buffer-substring m1 m2)))
    (goto-char m1)
    (delete-char (- m2 m1))
    (insert (calc-convert-hexip-to-decip ipaddr))
    )
  )

(defun calc-hex-to-dec (m1 m2)
  (interactive "r")
  (let ((num (buffer-substring m1 m2)))
    (goto-char m1)
    (delete-char (- m2 m1))
    (insert (calc-hextodecs num))
    )
  )

(defun calc-dec-to-hex (m1 m2)
  (interactive "r")
  (let ((num (buffer-substring m1 m2)))
    (goto-char m1)
    (delete-char (- m2 m1))
    (insert (format "%x" (string-to-int num)))
    )
  )

;; mcolmで改行する
(defun add-newline (mcolm) 
  (interactive "nmaxcolumn:\n")
  (let 
      ((oldp (point))
       (curp (point-min))
       (mpoint (point-max))
       (newp 0)
       )
    (setq mcolm (+ mcolm 1))
    (while (< curp mpoint)
      (setq newp (+ curp mcolm))
      (goto-char newp)
      (insert "\n")
      (setq curp (+ curp mcolm))
      )
    ;; move to previous point
    (goto-char oldp)
    )
  )

;; This replace is only once for entire string.
;; (i.e. "test test" (s/test/xxx/) -> "xxx test"
;; if you want replace all, please use replace-str-with-expand2
(defun replace-str-with-expand (val st inc m1 m2)
  (interactive "sreplace string:\nsreplace string: %s\tbegin:\nsreplace string: %s\tbegin: %s\tinc:\nr")
  (let ((basetext (buffer-substring m1 m2))
	(counter  (string-to-number st))
	(incend   (string-to-number inc))
	(reps     "")
	(cnt 0))
    (insert "\n")
    (while (< cnt incend)
      (let ((v (number-to-string (+ counter cnt))))
	(string-match val basetext) 
	(insert (concat (replace-match v t nil basetext) "\n"))
	(setq cnt (+ cnt 1))
	))
    )
  )


;; replace everytime.
(defun replace-str-with-expand2 (val st inc m1 m2)
  (interactive "sreplace string:\nsreplace string: %s\tbegin:\nsreplace string: %s\tbegin: %s\tinc:\nr")
  (let ((basetext (buffer-substring m1 m2))
	(counter  (string-to-number st))
	(incend   (string-to-number inc))
	(reps     "")
	(cnt 0))
    (insert "\n")
    (while (< cnt incend)
      (let ((v (number-to-string (+ counter cnt))))
	(string-match val basetext) 
	(let ((newtext (replace-match v t nil basetext)))
	  (while (string-match val newtext)
	    (setq newtext (replace-match v t nil newtext)))
	  (insert (concat newtext "\n")) )
	(setq cnt (+ cnt 1))
	)
      )
    )
  )
