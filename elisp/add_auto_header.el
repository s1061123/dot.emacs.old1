(defun my-short-buffer-file-coding-system (&optional default-coding)
  (let ((coding-str (format "%S" buffer-file-coding-system)))
    (cond ((string-match "shift-jis" coding-str) 'shift_jis)
          ((string-match "euc-jp" coding-str) 'euc-jp)
          ((string-match "utf-8" coding-str) 'utf-8)
          (t (or default-coding 'utf-8)))))
 
(defun my-insert-file-local-coding ()
  "ファイルの先頭に `coding:' を自動挿入する"
  (interactive)
  (save-excursion
    (goto-line 2) (end-of-line) ; ２行目の行末の移動
    (let ((limit (point)))
      (goto-char (point-min))
      (unless (search-forward "coding:" limit t) ; 2行目以内に `coding:'がない
        (goto-char (point-min))
        ;; #!で始まる場合２行目に記述
        (when (and (< (+ 2 (point-min)) (point-max))
                   (string= (buffer-substring (point-min) (+ 2 (point-min))) "#!"))
          (unless (search-forward "\n" nil t) ; `#!'で始まり末尾に改行が無い場合
            (insert "\n")))                   ; 改行を挿入
        (let ((st (point)))
          (insert (format "-*- coding: %S -*-\n" (my-short-buffer-file-coding-system)))
          (comment-region st (point)))))))
 

;; (defun insert-encoding-pragma ()
;;   "Insert encoding pragma for each programming languages"
;;   (interactive)
;;   (save-excursion
;;     (let* ((charset-list '(("utf-8") ("euc-jp") ("shift_jis")))
;;           (completion-ignore-case t)
;; 	  (charset "utf-8")
;; ;          (charset (completing-read "Charset: "
;; ;                           charset-list nil t "utf-8"))
;;           (pragma (concat "-*- coding:" charset " -*-")))
;;       (progn
;;           (beginning-of-line)
;;           (let ((region-begin (point)))
;;             (progn
;;               (insert pragma)
;;               (end-of-line)
;;               (let ((region-end (point)))
;;                 (comment-region region-begin region-end))))))))


