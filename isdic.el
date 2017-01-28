(defvar isdic-waei-dictionary my-sdic-waei-dictionary)
(defvar isdic-eiwa-dictionary my-sdic-eiwa-dictionary)

(defvar isdic-waei-minimum-chars 3)
(defvar isdic-eiwa-minimum-chars 2)

(defun isdic-encode-string (str)
  (with-temp-buffer
    (save-excursion (insert str))
    (while (search-forward-regexp
            "\\(&\\)\\|\\(<\\)\\|\\(>\\)\\|\\(\n\\)" nil t)
      (replace-match (cond ((match-beginning 1) "&amp;")
                           ((match-beginning 2) "&lt;")
                           ((match-beginning 3) "&gt;")
                           ((match-beginning 4) "&lf;"))))
    (buffer-string)))

(defun isdic-decode-string (str)
  (with-temp-buffer
    (save-excursion (insert str))
    (while (search-forward-regexp
            "&\\(?:\\(amp\\)\\|\\(lt\\)\\|\\(gt\\)\\|\\(lf\\)\\);" nil t)
      (replace-match (cond ((match-beginning 1) "&")
                           ((match-beginning 2) "<")
                           ((match-beginning 3) ">")
                           ((match-beginning 4) "\n"))))
    (buffer-string)))

(defun isdic ()
  (select-window (split-window-below 30))
  (setq isdic-buffer (get-buffer-create "*isdic*"))
  )
