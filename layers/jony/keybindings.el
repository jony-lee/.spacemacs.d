;;evil-normal-state 有两个附加命令集，z和g,部分命令可以banding到这两个命令下操作，更快捷
;;取消部分快捷键冲突
;;evil快捷键冲突
(define-key evil-motion-state-map (kbd "C-e") nil)
(define-key evil-motion-state-map (kbd "gb") 'dumb-jump-back)

(define-key global-map (kbd "C-c y") 'youdao-dictionary-search-at-point+)

(define-key undo-tree-map (kbd "C-/") nil)
(define-key global-map (kbd "C-/") 'evilnc-comment-or-uncomment-lines)
;;evil插入模式下的光标移动
(define-key evil-insert-state-map (kbd "C-j") 'evil-next-line)
(define-key evil-insert-state-map (kbd "C-k") 'evil-previous-line)
(define-key evil-insert-state-map (kbd "C-a") 'mwim-beginning-of-code-or-line)
(define-key evil-insert-state-map (kbd "C-e") 'mwim-end-of-code-or-line)
;;设置函数区域匹配模式
(define-key evil-normal-state-map (kbd ".") 'evil-jump-item)
;; 翻译
(spacemacs/set-leader-keys "\`" 'youdao-dictionary-search-at-point+)
;; 快速访问jony配置
(spacemacs/set-leader-keys "fej" #'(lambda () (interactive) (find-file "~/.spacemacs.d/layers/jony/config.el")))
(spacemacs/set-leader-keys "fek" #'(lambda () (interactive) (find-file "~/.spacemacs.d/layers/jony/keybindings.el")))
(spacemacs/set-leader-keys "fef" #'(lambda () (interactive) (find-file "~/.spacemacs.d/layers/jony/funcs.el")))
;;配置自定义描述快捷键(一些描述帮助快捷键重新定)

(spacemacs/set-leader-keys "fer" 'dotspacemacs/sync-configuration-layers)

(spacemacs/set-leader-keys "dB" 'spacemacs/browse-docs-online-at-point)
(spacemacs/set-leader-keys "db" 'describe-bindings)
(spacemacs/set-leader-keys "dc" 'describe-char)
(spacemacs/set-leader-keys "df" 'describe-function)
(spacemacs/set-leader-keys "dk" 'describe-key)
(spacemacs/set-leader-keys "dK" 'describe-keymap)
(spacemacs/set-leader-keys "dl" 'ivy-spacemacs-help-layers)
(spacemacs/set-leader-keys "dm" 'describe-mode)
(spacemacs/set-leader-keys "dM" 'describe-minor-mode)
(spacemacs/set-leader-keys "dp" 'describe-package)
(spacemacs/set-leader-keys "ds" 'ivy-spacemacs-help)
(spacemacs/set-leader-keys "dt" 'describe-theme)
(spacemacs/set-leader-keys "dv" 'describe-variable)

;;自定义o系列快捷键，将所有的org相关绑定至o快捷

(spacemacs/set-leader-keys "oa" 'org-agenda)
(spacemacs/set-leader-keys "on" 'org-next-visible-heading)
(spacemacs/set-leader-keys "op" 'org-previous-visible-heading)
(spacemacs/set-leader-keys "ou" 'outline-up-heading)
(spacemacs/set-leader-keys "ol" 'org-insert-link)
(spacemacs/set-leader-keys "op" 'org-previous-visible-heading)

;;搜索相关自定义键，用swiper替换vim的/搜索
;;统一搜索规范,当前文件搜索C-s，项目文件搜索SPC C-s
(spacemacs/set-leader-keys "ps" 'spacemacs/search-project-ag)
(spacemacs/set-leader-keys "C-s" 'spacemacs/search-project-auto)
(define-key evil-normal-state-map (kbd "/") 'swiper)

;;配置代码跳转和跳回，建议使用evil-normal-state 绑定的快捷键，少一次SPC操作，更快捷
(spacemacs/set-leader-keys (kbd "jg") 'spacemacs/jump-to-definition)
(spacemacs/set-leader-keys (kbd "jG") 'spacemacs/jump-to-definition-other-window)
(spacemacs/set-leader-keys (kbd "jb") 'dumb-jump-back)
