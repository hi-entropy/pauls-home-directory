;; command to automatically reload the .emacs file
;; at the start for when stuff breaks
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
(add-to-list 'load-path "~/.emacs.d/")

;; stuff with columns
(column-number-mode)

;; visualize whitespace
(require 'whitespace)

;; undo tree mode
(require 'undo-tree)
(global-undo-tree-mode)

;; ==================== LANGUAGE-SPECIFIC STUFF ==================
;; --------- JS ---------
(setq js-indent-level 2)

;; --------- R -----------
;; emacs speaks statistics
(load "~/.emacs.d/ess/ess-autoloads.el")
(require 'ess-site)
(ess-toggle-underscore nil)

;; knewton stuff
(require 'column-marker)
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80) (setq indent-tabs-mode 0)))


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
(require 'iedit)
(define-key global-map (kbd "C-;") 'iedit-mode)
(define-key isearch-mode-map (kbd "C-;") 'iedit-mode)
