;;  by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by addinargument(setq sml/theme 'dark)acs
;; mhig
;; You may argumentdelete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" default)))
 '(org-agenda-files (quote ("~/orgMode/test.org")))
 '(package-selected-packages
   (quote
    (highlight-parentheses adjust-parens buffer-move ace-jump-buffer counsel-projectile ace-jump-mode ace-window restclient magit-gitflow company yasnippet which-key bm ivy-hydra ace-popup-menu magit smartparens counsel ivy dashboard ob-tangle ox-twiki multi-web-mode haskell-mode org-bullets htmlize projectile zenburn-theme solarized-theme ox-twbs auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/custom/packages/")


;; add to custom theme path
(add-to-list 'custom-theme-load-path "~/.emacs.d/custom/themes/")

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org"         . "http://orgmode.org/elpa/"))
(package-initialize)

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
;; (require 'diminish)                ;; if you use :diminish
;; (require 'bind-key)                ;; if you use any :bind variant





;; load the packaged named xyz.
;;(load "ox-beamer") ;; best not to include the ending “.el” or “.elc”
;;(load "ox-beamer")
;;(load "ox-twbs") 
;;(load "ox-twiki")
;;(load "htmlize")
;;(load "haskell-mode")

(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(use-package smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)

;;show matching parens
(show-paren-mode 1)
(setq show-paren-delay 0)
(use-package paren)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#def")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

(use-package highlight-parentheses)

(define-globalized-minor-mode global-highlight-parentheses-mode highlight-parentheses-mode
  (lambda nil (highlight-parentheses-mode t)))

(global-highlight-parentheses-mode t)
;; (require 'helm-config)
;; (global-set-key (kbd "M-x") #'helm-M-x)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)
;; (helm-mode 1)

;; (use-package ivy)
;; (use-package counsel)
;; (ivy-mode 1)
;; (setq ivy-use-virtual-buffers t)
;; (setq enable-recursive-minibuffers t)
;; (global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "<f6>") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

(fset 'yes-or-no-p 'y-or-n-p)

(use-package bm
  :ensure t
  :bind (("C-c =" . bm-toggle)
         ("C-c [" . bm-previous)
         ("C-c ]" . bm-next)))


(use-package counsel
  :ensure t
  :bind
  (("M-x" . counsel-M-x)
   ("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

 (use-package swiper
   :pin melpa
   :diminish ivy-mode
   :ensure t
   :bind*
   (("C-s" . swiper)
    ("C-c C-r" . ivy-resume)
    ("C-x C-f" . counsel-find-file)
    ("C-c h f" . counsel-describe-function)
    ("C-c h v" . counsel-describe-variable)
    ("C-c i u" . counsel-unicode-char)
    ("M-i" . counsel-imenu)
    ("C-c g" . counsel-git)
    ("C-c j" . counsel-git-grep)
    ("C-c k" . counsel-ag)
    ("C-c l" . counsel-locate))
   :config
   (progn
     (ivy-mode 1)
     (setq ivy-use-virtual-buffers t)
     (define-key read-expression-map (kbd "C-r") #'counsel-expression-history)
     (ivy-set-actions
      'counsel-find-file
      '(("d" (lambda (x) (delete-file (expand-file-name x)))
         "delete"
         )))
     (ivy-set-actions
      'ivy-switch-buffer
      '(("k"
         (lambda (x)
           (kill-buffer x)
           (ivy--reset-state ivy-last))
         "kill")
        ("j"
         ivy--switch-buffer-other-window-action
         "other window")))))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))

(use-package ivy-hydra :ensure t)

(global-set-key (kbd "C-x k") 'kill-this-buffer)


(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode))


(use-package page-break-lines)
(use-package projectile)
(projectile-global-mode)
(use-package dashboard)
(turn-on-page-break-lines-mode)
(dashboard-setup-startup-hook)
;; Or if you use use-package
;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Set the banner
(setq dashboard-startup-banner 'official)
(setq dashboard-items '((bookmarks  . 10)
                        (recents . 10)
                        (projects . 10)
                        (agenda . 10)))

;; org-mode activation
(use-package org)
(use-package ob-tangle)
(use-package ox-twbs)
;;(require 'ox-twiki)
;;(require 'ox-tiddly)
(use-package ox-beamer)
(use-package htmlize)
(use-package haskell-mode)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-hide-leading-stars t)
(setq org-level-color-stars-only t)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-log-done t)

;; org-mode python support
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (scala  . t)
   (haskell   . t)
   (C  . t)
   ))
;; org mode fontify
(setq org-src-fontify-natively t)

;; org mode fontify latex fragments
(setq org-highlight-latex-and-related '(latex script entities))

;; org mode don't ask permision to execte these languages
(defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("C" "C++" "scala" "python" "haskell"))))


(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; Sample minted options.
(setq org-latex-minted-options '(
                                 ("frame" "lines")
                                 ("fontsize" "\\scriptsize")
                                 ("xleftmargin" "\\parindent")
                                 ("linenos" "")
                                 ))
;; (setq org-latex-listings 'listings)
;;   (setq org-latex-custom-lang-environments
;;         '((emacs-lisp "common-lispcode")))
;;   (setq org-latex-listings-options
;;         '(("frame" "lines")
;;           ("basicstyle" "\\footnotesize")
;;           ("numbers" "left")
;;           ("numberstyle" "\\tiny")))
;;   (setq org-latex-to-pdf-process
;;         '("pdflatex -interaction nonstopmode -output-directory %o %f"
;;           "pdflatex -interaction nonstopmode -output-directory %o %f"
;;           "pdflatex -interaction nonstopmode -output-directory %o %f"))


;;autocomplete
(ac-config-default)
;; (use-package company
;;     :ensure t
;;     ;;:bind (("C-c /". company-complete))
;;     :config
;;     (global-company-mode)
;;     )


;;yasnippets
;; (use-package yasnippet
;;   :ensure t
;;   :diminish yas
;;   :config
;;   (yas/global-mode 1)
;;   ;;(add-to-list 'yas-snippet-dirs (concat init-dir "snippets")
;;   ))


;; org mode use variable width for headings
;;(add-hook 'org-mode-hook (lambda () (variable-pitch-mode t)))

;; org mdoe line height adjust
;;(setq line-spacing '0.35)

;; org-bullets activation
;;(require 'org-bullets)
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;; org-mode hide leading stars
;;(setq org-hide-leading-stars t)


;;powerline
(use-package powerline)
(powerline-default-theme)


;;ace-popup-menu
(use-package ace-popup-menu)
(ace-popup-menu-mode 1)
(setq ace-popup-menu-show-pane-header t)


;;disable ugly default gui
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(tooltip-mode nil)
(setq show-help-function nil)


(global-prettify-symbols-mode 1)


;;vresion control
(use-package magit
  :ensure t
  :bind (("C-c m" . magit-status)))

(use-package magit-gitflow
  :ensure t
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))


;;rest support
(use-package restclient
  :ensure t)


;;window management
(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "C-x o") 'ace-window))

(use-package ace-jump-mode
  :ensure t
  :config
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode))

(use-package buffer-move
  :ensure t
  :config
  (define-key global-map (kbd "<C-s-up>")     'buf-move-up)
  (define-key global-map (kbd "<C-s-down>")     'buf-move-down)
  (define-key global-map (kbd "<C-s-left>")     'buf-move-left)
  (define-key global-map (kbd "<C-s-right>")     'buf-move-right))

;;spellcheck
(defun spell-buffer-english ()
  (interactive)
  (ispell-change-dictionary "en_US")
  (flyspell-buffer))

(use-package ispell
  :config
  (when (executable-find "hunspell")
    (setq-default ispell-program-name "hunspell")
    (setq ispell-really-hunspell t))

  ;; (setq ispell-program-name "aspell"
  ;;       ispell-extra-args '("--sug-mode=ultra"))
  :bind (("C-c n" . spell-buffer-english)))


(defun my-haskell-mode-hook ()
  (local-set-key (kbd "C-c C-c") 'inferior-haskell-load-and-run))


(defun my-haskell-load-and-run ()
  "Loads and runs the current Haskell file."
  (interactive)
  (inferior-haskell-load-and-run inferior-haskell-run-command)
  (sleep-for 0 100)
  (end-of-buffer))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
;;(add-hook 'haskell-mode-hook 'my-haskell-load-and-run)


;; (set-face-foreground 'font-lock-string-face "red")
;; (set-face-foreground 'font-lock-comment-face "light pink")
;; nice looking line colors
(global-hl-line-mode 1)
(set-face-background 'hl-line "#073642")
(set-face-attribute 'region nil :background "#839496")

;;line numbers
(use-package linum)
(add-hook 'prog-mode-hook #'linum-mode)
(add-hook 'org-mode-hook #'linum-mode)
;; (global-linum-mode 1)
; optional formatting to make line numbers prettier
(setq linum-format "%d ")
