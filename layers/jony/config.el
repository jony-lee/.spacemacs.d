;; (setq-default indent-tabs-mode 1)
;; (setq-default default-tab-width 4)
;; (setq create-lockfiles nil)
;; org setting
(with-eval-after-load 'org
	;; (setq-default org-agenda-files '("~/org-agenda"))
	(setq org-todo-keywords
				'((sequence "TODO(t!)" "NEXT(n@/!)" "|" "DONE(d@/!)" "ABORT(a@/!)")
					))
	;;快速创建todo事项的模板
	(setq org-capture-templates
				'(
          ;;工作GTD笔记
          ("w" "工作安排" entry (file+headline "~/org-agenda/gtd.org" "工作安排")
					 "* TODO [#B] %?\n %i\n %U"
					 :empty-lines 1)
          ;;生活GTD笔记
					("l" "日常生活" entry (file+headline "~/org-agenda/gtd.org" "日程生活")
					 "* TODO [#B] %?\n %i\n"
					 :empty-lines 1)
          ;;专题学习
					("d" "设计模式专题" entry (file+headline "~/org-agenda/learn.org" "专题学习-设计模式")
					 "* TODO [#C] %?\n %i\n"
					 :empty-lines 1)
					("g" "golang专题" entry (file+headline "~/org-agenda/learn.org" "专题学习-golang")
					 "* TODO [#C] %?\n %i\n"
					 :empty-lines 1)
					("c" "快速记录" entry (file+headline "~/org-agenda/clipboard.org" "快速笔记")
					 "* TODO [#C] %?\n ~clipboard~ : %(jony/get-paste-string) %i\n ~note~ : \n %U\n"
					 )
					))
	)
(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))
;; (add-hook 'go-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-backends) '(company-anaconda))))
;;(with-eval-after-load 'go
;; (add-hook 'go-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-backends) '(lsp))
 ;;          ))
;; reuse dired buffer
(put 'dired-find-alternate-file 'disabled nil)

;; delay load dired mode
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; (setq dired-dwim-target 1)
;; 配中文输入法
;; ;; https://github.com/tumashu/pyim
;; (setq default-input-method "pyim")
;; (setq-default pyim-english-input-switch-functions
;; 							'(pyim-probe-dynamic-english
;; 								pyim-probe-isearch-mode
;; 								pyim-probe-program-mode
;; 								pyim-probe-org-structure-template))

;; (setq-default pyim-punctuation-half-width-functions
;; 							'(pyim-probe-punctuation-line-beginning
;; 								pyim-probe-punctuation-after-punctuation))
;; (setq-default pyim-isearch-mode 1)
;; (global-set-key (kbd "C-\\") 'toggle-input-method)
;; (global-set-key (kbd "C-,") 'pyim-convert-string-at-point)
;; (setq pyim-page-tooltip 'posframe)
;; (setq pyim-page-length 5)

;;配置缩写补全
;; (setq-default abbrev-mode 1)
;; (define-abbrev-table 'global-abbrev-table '(
;;                                             ;; Shifu
;;                                             ("8bd" "baidu")
;; 																						))
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
							 '(:eval (propertize (format-time-string " %Y-%m-%d %H:%M %A") 'face 'font-lock-doc-face
																	 'help-echo
																	 (concat (format-time-string "%c; ")
																					 (emacs-uptime "uptime:%hh"))))
							 mode-line-end-spaces
							 ))
