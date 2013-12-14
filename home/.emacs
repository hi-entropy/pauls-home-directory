;; command to automatically reload the .emacs file
;; at the start so i can still reload when other stuff breaks
(defun reload-dotemacs-file ()
  (interactive)
  (load-file "~/.emacs"))

;; hooking up the server so i can use emacsclient
(server-start)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(save-interprogram-paste-before-kill t))

;; UI tweaks

;; trying to make the option key work as meta on OSX
(set-keyboard-coding-system nil)
(setq mac-option-modifier 'meta)

;; custom file mappings
(setq auto-mode-alist (cons '("\\.less$" . css-mode) auto-mode-alist))
 
;; load whatever packages are in myemacs.d
(add-to-list 'load-path "~/.emacs.d")

;; stuff with columns
(column-number-mode)

;; visualize whitespace
(require 'whitespace)

;; undo tree mode
(require 'undo-tree)
(global-undo-tree-mode)

;; ==================== LANGUAGE-SPECIFIC STUFF ==================
(setq indent-tabs-mode nil)

;; --------- JS ---------
(setq js-indent-level 2)
(add-hook 'js-mode-hook (lambda () (interactive) (column-marker-1 80) (setq indent-tabs-mode nil)))

;; --------- CLOJURE -----
(load "~/.emacs.d/clojure-mode.el")

;; --------- R -----------
;; emacs speaks statistics
(load "~/.emacs.d/ess/ess-autoloads.el")
(require 'ess-site)
(ess-toggle-underscore nil)

;; -------- PYTHON --------
(setq-default tab-width 4)

;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                'flymake-create-temp-inplace))
;;        (local-file (file-relative-name
;;             temp-file
;;             (file-name-directory buffer-file-name))))
;;       (list "pycheckers --checkers=pep8,pyflakes,pylint"  (list local-file))))
;;   ;; (add-to-list 'flymake-allowed-file-name-masks
;;     ;;         '("\\.py\\'" flymake-pyflakes-init))
;;   )
;;(load-library "flymake-cursor")	       

;;(setq python-check-command "pyflakes")

;; knewton stuff
;; use tabs with python
(require 'column-marker)
(if (getenv "KNEWTON")
    (progn
      (message "using knewton mode")
      (add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80) (setq indent-tabs-mode 0)))
      )
  (message "non-knewton mode")
  )


;; ===================== DISPLAY-RELATED ===========================
;; set color theme
(add-to-list 'load-path "~/.emacs.d/color-theme") 
(require 'color-theme)
(color-theme-initialize)
(setq custom-theme-load-path "~/.emacs.d")
(load "~/.emacs.d/cyberpunk-theme.el")

;; rainbow delimiters
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; highlight parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

;; ======================= EDITING ===========================
(add-to-list 'load-path "~/.emacs.d/iedit") 
(require 'iedit)
(define-key global-map (kbd "C-;") 'iedit-mode)
(define-key isearch-mode-map (kbd "C-;") 'iedit-mode)
(put 'upcase-region 'disabled nil)
