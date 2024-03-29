(load-file "~/.emacs.d/init-packages.el")


;;;;;;;;;;;;;;
;; Behavior ;;
;;;;;;;;;;;;;;
(setq x-stretch-cursor t) ;; Wide cursor on tabs
(setq ring-bell-function 'ignore) ;; Turn off alarms
(line-number-mode t)
(column-number-mode t)
(setq-default cursor-type 'bar)
(blink-cursor-mode t)
(setq initial-scratch-message "")
(setq inhibit-splash-screen t) ;; No splash screen
(setq frame-title-format "%b - Emacs") ;; Buffer name in the title bar
(setq icon-title-format "%b - Emacs") ;; Buffer name in the title bar
(delete-selection-mode t) ;; Delete selected text
(setq mode-require-final-newline t)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(setq auto-save-timeout 60) ;; Autosave every minute
(savehist-mode 1) ;; Save minibuffer historic
(setq user-mail-address "ludwig@lud.cc")
(toggle-frame-fullscreen)
(setq current-language-environment "English")
(delete-selection-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-auto-revert-mode 1) ;; Auto refresh buffers when edits occur outside emacs
(show-paren-mode 1)

;;;;;;;;;;;;;;;;;;
;; coding style ;;
;;;;;;;;;;;;;;;;;;
(setq require-final-newline 't) ;; newline at the end of the file
(setq-default indent-tabs-mode nil) ;; no tabs
(setq tab-width 2) ;; tabs size
(setq indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;
;; Character encoding ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-input-method nil) ;; No funky input for normal editing
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8") ;; prefer utf-8 for language settings
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

;;;;;;;;;;;;;
;; Modules ;;
;;;;;;;;;;;;;

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward) ;; Overrides Emacs’ default mechanism for making buffer names unique

(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-auto-merge-work-directories-length -1
      ido-enable-flex-matching t
      ido-use-faces nil)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(require 'smex)
(smex-initialize)
(require 'flx-ido)
(flx-ido-mode 1)
(ido-grid-mode 1)
(setq ido-grid-mode-first-line nil
      ido-grid-mode-max-rows 3
      ido-grid-mode-min-rows 3)

(require 'saveplace)
(setq-default save-place t)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'expand-region)

(autoload 'markdown-mode "markdown-mode" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . scss-mode))

(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)

(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

(setq tramp-default-method "ssh")

(defun dont-kill-emacs ()
  (interactive)
  (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))
(global-set-key "\C-x\C-c" 'dont-kill-emacs)

(package-initialize)
(elpy-enable)

;;;;;;;;;;;;;;;
;; Shortcuts ;;
;;;;;;;;;;;;;;;
(windmove-default-keybindings 'meta) ;; Move point from window to window
(global-set-key  "\C-cc" 'compile)
(global-set-key "\M- " 'hippie-expand)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "M-x") 'smex)
(global-set-key [C-M-tab] 'clang-format-region)
(global-set-key [f11] 'toggle-frame-fullscreen)
(global-unset-key (kbd "C-z"))
(eval-after-load "elpy"
  '(cl-dolist (key '("M-<up>" "M-<down>" "M-<left>" "M-<right>"))
     (define-key elpy-mode-map (kbd key) nil)))

;;;;;;;;;;;;;;
;; Includes ;;
;;;;;;;;;;;;;;
(load-file "~/.emacs.d/init-appearance.el")
(load-file "~/.emacs.d/init-cpp.el")
(load-file "~/.emacs.d/init-gnu-global.el")
