;;evil-normal-state 有两个附加命令集，z和g,部分命令可以banding到这两个命令下操作，更快捷
;;取消部分快捷键冲突
;;evil快捷键冲突
(define-key evil-motion-state-map (kbd "C-e") nil)
(define-key  global-map(kbd "C-j") nil)
(define-key evil-normal-state-map (kbd "gb") 'dumb-jump-back)
(define-key evil-normal-state-map (kbd "RET") 'jony/insert-line-or-open-link)
;; (define-key evil-normal-state-map (kbd "<deletechar>") 'delete-char)
;; (define-key evil-normal-state-map (kbd "DEL") 'backward-delete-char)

;;org相关操作
(define-key global-map (kbd "C-c y") 'youdao-dictionary-search-at-point+)
(define-key global-map (kbd "C-c s") 'org-schedule)
(define-key global-map (kbd "C-c d") 'org-deadline)
(define-key global-map (kbd "C-c t") 'org-todo)
(define-key global-map (kbd "C-<return>") 'hippie-expand)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "ic" 'jony/insert-src-block)
(with-eval-after-load 'org
  (define-key org-src-mode-map (kbd "C-c C-c") 'org-edit-src-exit)
  (define-key org-mode-map (kbd "<normal-state> RET") 'jony/insert-line-or-open-link)
  ;;超80字符自动换行
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  )

;; (define-key dired-mode-map (kbd "<tab>") 'dired-find-file-other-window)

;; (define-key undo-tree-map (kbd "C-/") nil)
;; (define-key global-map (kbd "C-/") 'evilnc-comment-or-uncomment-lines)
;;evil插入模式下的光标移动
(define-key evil-insert-state-map (kbd "C-h") 'evil-backward-char)
(define-key evil-insert-state-map (kbd "C-j") 'evil-next-line)
(define-key evil-insert-state-map (kbd "C-k") 'evil-previous-line)
(define-key evil-insert-state-map (kbd "C-l") 'evil-forward-char)
(define-key evil-insert-state-map (kbd "C-a") 'mwim-beginning-of-code-or-line)
(define-key evil-insert-state-map (kbd "C-e") 'mwim-end-of-code-or-line)

;;设置函数区域匹配模式
(define-key evil-normal-state-map (kbd ".") 'evil-jump-item)
;; 翻译
(spacemacs/set-leader-keys "\`" 'spacemacs/alternate-window)
(spacemacs/set-leader-keys "<right>" 'spacemacs/alternate-window)
;; (spacemacs/set-leader-keys "\`" 'youdao-dictionary-search-at-point-tooltip)
;; 快速访问jony配置
(spacemacs/set-leader-keys "fer" 'dotspacemacs/sync-configuration-layers)
(spacemacs/set-leader-keys "fej" #'(lambda () (interactive) (find-file "~/.spacemacs.d/layers/jony/config.el")))
(spacemacs/set-leader-keys "da" #'(lambda () (interactive) (dired-jump nil "~/.spacemacs.d/")))
(spacemacs/set-leader-keys "fp" #'(lambda () (interactive) (dired-jump nil "~/project")))
(spacemacs/set-leader-keys "fek" #'(lambda () (interactive) (find-file "~/.spacemacs.d/layers/jony/keybindings.el")))
(spacemacs/set-leader-keys "fef" #'(lambda () (interactive) (find-file "~/.spacemacs.d/layers/jony/funcs.el")))
(spacemacs/set-leader-keys "fes" #'(lambda () (interactive) (dired-jump nil "~/.spacemacs.d/snippets/go-mode/")))
(spacemacs/set-leader-keys "feo" #'(lambda () (interactive) (dired-jump nil "~/org-agenda/")))
(spacemacs/set-leader-keys "fet" #'(lambda () (interactive) (find-file "~/org-agenda/table.org")))

;;配置自定义描述快捷键(一些描述帮助快捷键重新定)


;; (spacemacs/set-leader-keys "dB" 'spacemacs/browse-docs-online-at-point)
(spacemacs/set-leader-keys "dB" 'describe-bindings)
(spacemacs/set-leader-keys "dc" 'customize-group)
(spacemacs/set-leader-keys "dC" 'describe-char)
(spacemacs/set-leader-keys "df" 'describe-function)
(spacemacs/set-leader-keys "dk" 'describe-key)
(spacemacs/set-leader-keys "dK" 'describe-keymap)
(spacemacs/set-leader-keys "dl" 'ivy-spacemacs-help-layers)
(spacemacs/set-leader-keys "dM" 'describe-mode)
(spacemacs/set-leader-keys "dm" 'describe-minor-mode)
(spacemacs/set-leader-keys "dp" 'describe-package)
(spacemacs/set-leader-keys "ds" 'ivy-spacemacs-help)
(spacemacs/set-leader-keys "dt" 'describe-theme)
(spacemacs/set-leader-keys "dv" 'describe-variable)

;;自定义o系列快捷键，将所有的org相关绑定至o快捷

(spacemacs/set-leader-keys "oa" 'org-agenda)
(spacemacs/set-leader-keys "os" 'org-schedule)
(spacemacs/set-leader-keys "od" 'org-deadline)
(spacemacs/set-leader-keys "oc" 'org-capture)

(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point-tooltip)
(spacemacs/set-leader-keys "on" 'org-next-visible-heading)
(spacemacs/set-leader-keys "op" 'org-previous-visible-heading)
(spacemacs/set-leader-keys "ou" 'outline-up-heading)
(spacemacs/set-leader-keys "ol" 'org-insert-link)
(spacemacs/set-leader-keys "op" 'org-pomodoro)

;;搜索相关自定义键，用swiper替换vim的/搜索
;;统一搜索规范,当前文件搜索C-s，项目文件搜索SPC C-s
(spacemacs/set-leader-keys "ps" 'spacemacs/search-project-auto-region-or-symbol)
(spacemacs/set-leader-keys "C-s" 'spacemacs/search-project-auto)
(define-key evil-normal-state-map (kbd "/") 'swiper)
;; (spacemacs/set-leader-keys "pf" 'jony/open-file-with-projectile-or-counsel-git)

;;配置代码跳转和跳回，建议使用evil-normal-state 绑定的快捷键，少一次SPC操作，更快捷
(spacemacs/set-leader-keys (kbd "jg") 'spacemacs/jump-to-definition)
(spacemacs/set-leader-keys (kbd "jG") 'spacemacs/jump-to-definition-other-window)
(spacemacs/set-leader-keys (kbd "jb") 'xref-pop-marker-stack)
