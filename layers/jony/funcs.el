(defun jony/get-paste-string()
	(interactive)
	"test-paste"
	)

(defun jony/open-file-with-projectile-or-counsel-git ()
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

;;自定义modeline格式
  (setq-default mode-line-format
								;; get current window number
								(list
                 " "
                 ;; '(:eval (propertize
                 ;;          (window-number-mode-line)
								 ;; 					'face
                 ;;          'font-lock-type-face))
                 " ["
								 ;; get current layout name
                 '(:eval (jony/update-persp-name))
								 "] "
                 ;; the buffer name; the file name as a tool tip
                 '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                                     'help-echo (buffer-file-name)))

                 "["
								 ;; insert vs overwrite mode, input-method in a tooltip
                 '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                     'face 'font-lock-preprocessor-face
                                     'help-echo (concat "Buffer is in "
                                                        (if overwrite-mode
                                                            "overwrite"
                                                          "insert") " mode")))

                 ;; was this buffer modified since the last save?
                 '(:eval (when (buffer-modified-p)
                           (concat ","  (propertize "Mod"
                                                    'face 'font-lock-warning-face
                                                    'help-echo "Buffer has been modified"))))

                 ;; is this buffer read-only?
                 '(:eval (when buffer-read-only
                           (concat ","  (propertize "RO"
                                                    'face 'font-lock-type-face
                                                    'help-echo "Buffer is read-only"))))
                 "] "

                 ;; relative position, size of file
                 "["
                 (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
                 "/"
                 (propertize "%I" 'face 'font-lock-constant-face) ;; size
                 "] "

                 ;; the current major mode for the buffer.
                 '(:eval (propertize "%m " 'face 'font-lock-string-face
                                     'help-echo buffer-file-coding-system))

                 ;; my-flycheck-mode-line
                 ;; "%1 "

                 ;; evil state
                 '(:eval evil-mode-line-tag)

                 ;; minor modes
                 ;; minor-mode-alist
                 " "
                 ;; git info
                 `(vc-mode vc-mode)

                 " "

                 ;; global-mode-string goes in mode-line-misc-info
                 mode-line-misc-info

                 (mode-line-fill 'mode-line 38)

								 ;; line and column
                 ;; '%02' to set to 2 chars at least; prevents flickering
                 (propertize " (%02l,%02c) " 'face 'font-lock-type-face)

                 '(:eval (buffer-encoding-abbrev))
                 ;; add the time, with the date and the emacs uptime in the tooltip
                 '(:eval (propertize (format-time-string " %Y/%m/%d %H:%M %A") 'face 'font-lock-doc-face
                                     'help-echo
                                     (concat (format-time-string "%c; ")
                                             (emacs-uptime "uptime:%hh"))))
                 mode-line-end-spaces
                 ))
