;;取消部分快捷键冲突
;;evil快捷键冲突
(define-key evil-motion-state-map (kbd "C-e") nil)

(define-key global-map (kbd "C-c y") 'youdao-dictionary-search-at-point+)

(define-key undo-tree-map (kbd "C-/") nil)
(define-key global-map (kbd "C-/") 'evilnc-comment-or-uncomment-lines)
;; 快速访问jony配置
(spacemacs/set-leader-keys "fej" 'jony/find-jony)

;;配置自定义描述快捷键(一些描述帮助快捷键重新定义)

(spacemacs/set-leader-keys "fer" 'dotspacemacs/sync-configuration-layers)

(spacemacs/set-leader-keys "dB" 'spacemacs/browse-docs-online-at-point)
(spacemacs/set-leader-keys "db" 'describe-bindings)
(spacemacs/set-leader-keys "dc" 'describe-char)
(spacemacs/set-leader-keys "df" 'describe-function)
(spacemacs/set-leader-keys "dk" 'describe-key)
(spacemacs/set-leader-keys "dK" 'describe-keymap)
;;(spacemacs/set-leader-keys "dm" 'describe-mode)
(spacemacs/set-leader-keys "dM" 'describe-minor-mode)
(spacemacs/set-leader-keys "dp" 'describe-package)
(spacemacs/set-leader-keys "ds" 'ivy-spacemacs-help)
(spacemacs/set-leader-keys "dt" 'describe-theme)
(spacemacs/set-leader-keys "dv" 'describe-variable)

;;自定义o系列快捷键
(spacemacs/set-leader-keys "oc" 'shell-command)
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)

;;项目快捷键
(spacemacs/set-leader-keys "ps" 'spacemacs/search-project-ag)

