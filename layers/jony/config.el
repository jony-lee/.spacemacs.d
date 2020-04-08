(setq-default indent-tabs-mode 1)
(setq-default default-tab-width 4)
(setq create-lockfiles nil)
;; org setting
(with-eval-after-load 'org
	;; (setq-default org-agenda-files '("~/org-agenda"))
	(setq org-todo-keywords
				'((sequence "TODO(t!)" "NEXT(n@/!)" "|" "DONE(d@/!)" "ABORT(a@/!)")
					))
	;;快速创建todo事项的模板
	(setq org-capture-templates
				'(("t" "GTD" entry (file+headline "~/org-agenda/gtd.org" "工作安排")
					 "* TODO [#B] %?\n %i\n %U"
					 :empty-lines 1)
					("c" "cyclic task" entry (file+headline "~/org-agenda/cyclic-task.org" "周期任务")
					 "* TODO [#B] %?\n %i\n"
					 :empty-lines 1)
					("q" "question" entry (file+headline "~/org-agenda/gtd.org" "问题描述")
					 "* TODO [#B] %?\n 问题描述：%?\n"
					 :empty-lines 1)
					("c" "cyclic task" entry (file+headline "~/org-agenda/cyclic-task.org" "周期任务")
					 "* TODO [#B] %?\n %i\n"
					 :empty-lines 1)
					("l" "LEARN" entry (file+headline "~/org-agenda/learn.org" "学习")
					 "* TODO [#C] %?\n %i\n"
					 :empty-lines 1)
					("g" "golang" entry (file+headline "~/org-agenda/learn.org" "golang学习")
					 "* TODO [#C] %?\n %i\n"
					 :empty-lines 1)
					("C" "Clipboard" entry (file+headline "~/org-agenda/clipboard.org" "Quick notes")
					 "* TODO [#C] %?\n clipboard: %(jony/get-paste-string) %i\n %U"
					 )
					("i" "IDEA" entry (file+headline "~/org-agenda/idea.org" "good idea")
					 "* TODO [#B] %?\n %i\n"
					 :empty-lines 1)
					))
	)
;; reuse dired buffer
(put 'dired-find-alternate-file 'disabled nil)

;; delay load dired mode
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(setq dired-dwim-target 1)
;; ;; 配中文输入法
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
;; (setq pyim-page-tooltip 'popup)
;; (setq pyim-page-length 5)

;;配置缩写补全
(setq-default abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
                                            ;; Shifu
                                            ("8bd" "baidu")
																						))
