(defun jony/get-paste-string()
  "Return string from clipboard"
	(interactive)
	(gui-get-selection 'CLIPBOARD 'UTF8_STRING)
	)

(defun jony/open-file-with-projectile-or-counsel-git ()
  "Use projectile or counsel-git to search project file"
  (interactive)
  (if (jony/git-project-root)
      (counsel-git)
    (if (projectile-project-p)
        (projectile-find-file)
      (counsel-file-jump))))

(defun jony/git-project-root ()
  "Return the project root for current buffer."
  (let ((directory default-directory))
    (locate-dominating-file directory ".git")))

(defun jony/update-persp-name ()
	(when (bound-and-true-p persp-mode)
		;; There are multiple implementations of
		;; persp-mode with different APIs
		(progn
			(or (not (string= persp-nil-name (safe-persp-name (get-frame-persp))))
					"Default")
			(let ((name (safe-persp-name (get-frame-persp))))
				(propertize name
										'face 'font-lock-preprocessor-face
										'help-echo "Current Layout name.")))))

(defun jony/insert-line-below-and-move()
  "Insert line below and move cursor to the new line"
  (interactive)
  (spacemacs/insert-line-below-no-indent 1)
  (next-line 1))


;; (defun spaceline--unicode-number (str)
;;   "Return a nice unicode representation of a single-digit number STR."
;;   (cond
;;    ((string= "1" str) "➊")
;;    ((string= "2" str) "➋")
;;    ((string= "3" str) "➌")
;;    ((string= "4" str) "➍")
;;    ((string= "5" str) "➎")
;;    ((string= "6" str) "➏")
;;    ((string= "7" str) "➐")
;;    ((string= "8" str) "➑")
;;    ((string= "9" str) "➒")
;;    ((string= "0" str) "➓")))

;; (defun window-number-mode-line ()
;;   "The current window number. Requires `window-numbering-mode' to be enabled."
;;   (when (bound-and-true-p window-numbering-mode)
;;     (let* ((num (window-numbering-get-number))
;;            (str (when num (int-to-string num))))
;;       (spaceline--unicode-number str))))

(defun mode-line-fill (face reserve)
	"Return empty space using FACE and leaving RESERVE space on the right."
	(unless reserve
		(setq reserve 20))
	(when (and window-system (eq 'right (get-scroll-bar-mode)))
		(setq reserve (- reserve 3)))
	(propertize " "
							'display `((space :align-to
																(- (+ right right-fringe right-margin) ,reserve)))
							'face face))

(defun buffer-encoding-abbrev ()
	"The line ending convention used in the buffer."
	(let ((buf-coding (format "%s" buffer-file-coding-system)))
		(if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
				(match-string 1 buf-coding)
			buf-coding)))

;;thanks to http://wenshanren.org/?p=327
(defun jony/insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '(
						"go"
						"C"
						"C++"
						"emacs-lisp"
						"js"
						"latex"
						"lilypond"
						"lisp"
						"org"
						"perl"
						"plantuml"
						"python"
						"ruby"
						"scheme"
						"screen"
						"sql"
						"sqlite"
						)))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

