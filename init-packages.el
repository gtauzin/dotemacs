(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defvar my-packages '(
                      clang-format
                      cmake-font-lock
                      csv-mode
                      exec-path-from-shell
                      expand-region
                      flycheck
                      flycheck-clojure
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
                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
