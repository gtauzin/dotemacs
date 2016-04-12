(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(defvar my-packages '(
                      clang-format
                      cmake-font-lock
                      csv-mode
                      exec-path-from-shell
                      expand-region
                      flycheck
                      ggtags
                      ido-ubiquitous
		      flx-ido
		      ido-grid-mode
                      magit
                      markdown-mode
                      monokai-theme
                      scss-mode
                      smartparens
                      smex
                      solarized-theme
                      yaml-mode
                      zenburn-theme
                      elpy
                      company
                      irony
                      irony-eldoc
                      flycheck-irony
                      company-irony
                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
