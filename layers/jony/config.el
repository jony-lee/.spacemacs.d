
;;(global-set-key (kbd "M-s o") 'occur-dwim)

;;(evilified-state-evilify-map occur-mode-map
;; :mode occur-mode)

(setq-default hungry-delete-mode 1)
(setq-default indent-tabs-mode 1)
(setq-default default-tab-width 4)
;; reuse dired buffer
(put 'dired-find-alternate-file 'disabled nil)

;; delay load dired mode
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(setq dired-dwim-target 1)
