
;;(global-set-key (kbd "M-s o") 'occur-dwim)

;;(evilified-state-evilify-map occur-mode-map
;; :mode occur-mode)
;;(spacemacs/toggle-hungry-delete-on)

(setq-default indent-tabs-mode 1)
(setq-default default-tab-width 4)

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
