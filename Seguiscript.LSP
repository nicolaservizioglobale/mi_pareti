(defun C:seguiscript ( /)
  (setq filer (open "c:\\Acad_tmp\\listan.scr" "r"))
  (setq filew (open "c:\\Acad_tmp\\listan1.scr" "w"))
  (setq ndisopen (getvar "dwgname"))
  (setq ndisopen (vl-filename-base ndisopen))
  (setq scrive nil)
  (while (setq riga (read-line filer))
    (if scrive (write-line riga filew)
      (progn
	(setq ndisriga (substr riga (- (vl-string-search ".dwg" riga) 9) 10))
	(if (= ndisopen ndisriga)
	  (setq scrive t))
	)
      )
    )
  (close filer)
  (close filew)
  )

;; Merda