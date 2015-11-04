;; require ag search plugin
(require 'ag)
;; ruby syntax check while coding
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; helm mode
(require 'helm)
(require 'helm-config)
(helm-mode 1)

;; ruby shell inside emacs
(global-set-key (kbd "C-c r r") 'inf-ruby)

;; load projectile project management plugin
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; fuzzy ido search
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching 1)
(setq ido-use-faces -1)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; robe mode
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

;; enable company robe
(require 'company-robe)
(global-company-mode 1)
(push 'company-robe company-backends)

;; highlight tabas and trailing white spaces
;; (hc-toggle-highlight-tabs)
(hc-toggle-highlight-trailing-whitespace)

;; slim mode
(require 'slim-mode)
;; coffee mode
(require 'coffee-mode)

;; powerline
(require 'powerline)
(powerline-default-theme)
