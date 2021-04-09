(defun c:Aggcart ()

(command "_zoom" "_e")
  (setq  gr (ssget "x" (list '(0 . "INSERT") '(2 . "INTESTAZIONE"))))
  (setq ent (ssname gr 0))
  (setq entpt (entget (entnext (entnext
				 (entnext ent)))))
  (setq pt (cdr (assoc '11 entpt)))
  (setq pt1 pt)
  (setq grdel (ssget "_W" (List (- (car pt) 169) (+ (cadr pt) 47.5)) (List (+ (car pt) 2.6) (- (cadr pt) 5.5))))
  (IF GRDEL (command "_erase" grdel ""))
  (command "_-refedit" (list (car pt) (+ (cadr pt) 7.4394)) "Ok" "_A" "_N")
  
  (setq grdel2 (ssget "_W" (setq pa (list (- (car pt) 167.4687) (+ (cadr pt) 42.4383))) (setq pb  (list (- (car pt) 133.4773) (+ (cadr pt) 8.4427)))))
  (setq grdel3 (ssget "_W" (list (- (car pt) 167.4687) (+ (cadr pt) 6.4389)) (list (- (car pt) 17.0) (- (cadr pt) 1.0))))
  (IF GRDEL2 (command "_erase" grdel2 ""))
  (IF GRDEL3 (command "_erase" grdel3 ""))
  (command "_insert" "*c:\\acad_tmp\\loghi" "_non" pt "1" "0")
  

  (command "_refclose" "_S")

  (command "_-plot"
	     "_y"
	     ""
	     "DWG To PDF.pc3" ;"FinePrint pdfFactory.pc3"
	     "a3" ;"A3"
	     "_m"
	     "o"
	     ""
	     "_L"
	     "1=1.0"
	     "0,7"
	     "_y"
	     ""
	     "_y"
	     ""
	     "_y"
	     "_n"
(STRCAT "C:\\ACAD_TMP\\PDF\\" (VL-FILENAME-BASE (GETVAR"DWGNAME")))
	   
	     ""
	     "_Y"
	  )
(COMMAND"_QSAVE")

)

(defun C:seguiscript ()
  (setq filer (open "c:\\Acad_tmp\\lista_tmp.scr" "r"))
  (setq filew (open "c:\\Acad_tmp\\lista.scr" "w"))
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