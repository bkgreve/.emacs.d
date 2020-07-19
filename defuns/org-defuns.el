(require 'cal-iso)
(defun iso-week-to-date (year week day)
  "Converts iso week number to date"
  (pcase-let ((`(,m ,d ,y)
               (calendar-gregorian-from-absolute
                (calendar-iso-to-absolute (list week day year)))))
    (encode-time 0 0 0 d m y)))

(defun org-weekly-header (year week)
  "Create org-mode header for week in agenda"
  (concat
   (format-time-string "** Week %V (%A, %B %d - " (iso-week-to-date year week 1))
   (format-time-string "%A, %B %d, %Y)\n" (iso-week-to-date year week 5))))

(defun insert-weekly-headers ()
  "Inserts org headers for input week range

Prompts user to input the year and the start/end week numbers
and then inserts org headers of the following style:
** Week 01 (Monday, December 30 - Friday, January 03, 2020)" 
  (interactive)
  (let ((year (read-number "Please enter the year: " 2020))
        (first-week
         (read-number "Please enter the first week number: " 1))
        (last-week
         (read-number "Please enter the last week number: " 13)))
    (setq counter first-week)
    (while (<= counter last-week)
      (insert (org-weekly-header year first-week))
      (setq first-week (1+ first-week))
      (setq counter (1+ counter)))))
       
