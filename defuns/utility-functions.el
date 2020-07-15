(defun count (start end)
  "Returns the number of times the highlighted region appears in the buffer."
  (interactive "r")
  (let (start, end)
    (setq start (region-beginning))
    (setq end (region-end))
 	  
    (message "'%s' appears %d times."
	     (buffer-substring start end)
	     (how-many (buffer-substring start end) (point-min) (point-max)))))
