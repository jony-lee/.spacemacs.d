

(define-key global-map (kbd "C-c y") 'youdao-dictionary-search-at-point+)


(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)


;;配置快捷键

(spacemacs/set-leader-keys "fer" 'dotspacemacs/sync-configuration-layers)

(spacemacs/set-leader-keys "db" 'describe-bindings)
(spacemacs/set-leader-keys "dB" 'spacemacs/browse-docs-online-at-point)
(spacemacs/set-leader-keys "dc" 'describe-char)
(spacemacs/set-leader-keys "df" 'describe-function)
(spacemacs/set-leader-keys "dk" 'describe-key)
(spacemacs/set-leader-keys "dK" 'describe-keymap)
;;(spacemacs/set-leader-keys "dm" 'describe-mode)
(spacemacs/set-leader-keys "dM" 'describe-minor-mode)
(spacemacs/set-leader-keys "dp" 'describe-package)
;;(spacemacs/set-leader-keys "ds" 'describe-package)
(spacemacs/set-leader-keys "dt" 'describe-theme)
(spacemacs/set-leader-keys "dv" 'describe-variable)

(spacemacs/set-leader-keys "oc" 'shell-command)
