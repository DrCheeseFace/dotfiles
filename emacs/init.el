(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq visible-bell t)
(setq tags-revert-without-query 1)


; backup files
(defvar my-backup-dir (expand-file-name "~/.emacs.d/backups/"))
(unless (file-exists-p my-backup-dir)
  (make-directory my-backup-dir t))
(setq backup-directory-alist `(("." . ,my-backup-dir)))
(setq make-backup-files t
      backup-by-copying t
      version-control t
      kept-old-versions 2
      kept-new-versions 10
      delete-old-versions t)
(setq auto-save-file-name-transforms `((".*" ,my-backup-dir t)))
(setq undo-tree-history-directory-alist `(("." . ,my-backup-dir)))

(setq undo-limit 80000000)        
(setq undo-strong-limit 100000000) 
(setq undo-outer-limit 100000000) 

(add-to-list 'default-frame-alist
             '(font . "Liberation Mono-18"))

(set-face-attribute 'default t
                    :font "Liberation Mono-18"
            :height 180
                    :weight 'normal
                    :slant 'normal)

;relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(dolist (mode '(org-mode-hook
        term-mode-hook
        shell-mode-hook
        eshell-mode-hook
        vterm-mode-hook
        treemacs-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode -1))))

;disable linewrap for text-mode
(global-visual-line-mode -1)
(auto-fill-mode -1)
(add-hook 'text-mode-hook (lambda()(setq truncate-lines nil)))
(add-hook 'prog-mode-hook (lambda()(setq truncate-lines t)))

;column indicator
(setq-default fill-column 80)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)

;scroll
(setq scroll-margin 8)
(setq scroll-conservatively 100)
(setq scroll-preserve-screen-position t)

; yank highlight 
(defface my/yank-face '((t (:background "yellow" :foreground "black"))) "face for yank flash")
(require 'pulse)
(defun my/flash-on-yank (beg end &rest _)
  "flash on yank"
  (let ((overlay (make-overlay beg end)))
    (overlay-put overlay 'face 'my/yank-face)
    (run-with-timer 0.1 nil (lambda (ov) (delete-overlay ov)) overlay)))

(advice-add 'evil-yank :after #'my/flash-on-yank)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

(use-package undo-tree
:init
(global-undo-tree-mode)
:config
(setq undo-tree-auto-save-history t)
(setq undo-tree-show-minibuffer-help t))

(use-package evil
:init
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-i-jump t)
(setq evil-set-undo-system 'undo-tree)
:config
(evil-mode 1))

(use-package evil-collection
:after evil
:config
(evil-collection-init))

(use-package evil-nerd-commenter)

(use-package move-text
  :config (move-text-default-bindings))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion))))
  :config
  (setq orderless-matching-styles '(orderless-literal orderless-regexp orderless-flex)))

(use-package vertico
:init (vertico-mode)
:bind (:map vertico-map
        ("C-j" . vertico-next)
        ("C-k" . vertico-previous)
        ("C-l" . vertico-insert)))

(use-package marginalia
:init (marginalia-mode))

(use-package wgrep
  :ensure t
  :config
  (setq wgrep-auto-save-buffer t))

(use-package consult
  :ensure t
  :config
  (setq consult-async-split-style nil))

(use-package projectile
  :init
  (projectile-mode 1)
  :config
  (setq projectile-completion-system 'default))

(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2)
  :bind (:map corfu-map ("C-l" . corfu-insert)))

(use-package vterm
  :ensure t
  :config
  (setq vterm-shell "zsh"))

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :init
  (setq markdown-split-window-direction 'right))

(add-hook 'c-mode-common-hook #'hide-ifdef-mode)

;quickfix list nav
(with-eval-after-load 'xref
  (let ((map (if (boundp 'xref-mode-map) xref-mode-map xref--xref-buffer-mode-map)))
    (define-key map (kbd "C-j") 'xref-next-line)
    (define-key map (kbd "C-k") 'xref-prev-line)
    (define-key map (kbd "e") 'wgrep-change-to-wgrep-mode)
    (define-key map (kbd "] d") 'quit-window)))

(global-set-key(kbd "M-f") 'find-file)
(global-set-key(kbd "M-b") 'project-compile)

;vertical split for compile
(add-to-list 'display-buffer-alist
             '("\\*compilation\\*"
               (display-buffer-in-side-window)
               (side . right)
               (slot . 0)
               (window-width . 0.5)))

(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)


;vertical split xref 
(add-to-list 'display-buffer-alist
             '("\\*xref\\*"
               (display-buffer-in-side-window)
               (side . right)
               (slot . 0)
               (window-width . 0.4)))

(use-package general
  :config
  (general-create-definer leader-keys
    :states '(normal visual)
    :prefix "SPC") 

  ;; leader bindings
  (leader-keys
    "ps" 'consult-grep
    "gf" 'consult-line  
    "pf" 'project-find-file
    "pv" 'dired-jump
    "u"  'undo-tree-visualize
    "t"  'vterm
    "l"  'save-buffer
    "vrn" 'project-query-replace-regexp
    "fr" 'project-find-regexp)

  (general-def 'normal
    "gd" 'xref-find-definitions
    "C-p" 'projectile-find-file
    "gc" 'evilnc-comment-or-uncomment-lines
    "C-j" 'next-error
    "C-k" 'previous-error)

  (general-def 'visual
    "J" 'move-text-down
    "K" 'move-text-up)
)

;theme 
(deftheme aesthetics
  "theme")
(let ((type "#94DD8E")
      (keyword "blue")
      (constant "magenta")
      (comment "yellow")
      (string "orange")
      (normal-fg "#FFFFFF")
      (normal-bg "#000900")
      (float-bg "#1e1e1e"))

  (custom-theme-set-faces
   'aesthetics
   
   `(default ((t (:foreground ,normal-fg :background ,normal-bg))))
   `(fringe ((t (:background ,normal-bg :foreground "#444444"))))
   
   `(font-lock-comment-face ((t (:foreground ,comment))))
   `(font-lock-string-face ((t (:foreground ,string))))
   `(font-lock-keyword-face ((t (:foreground ,keyword))))
   `(font-lock-type-face ((t (:foreground ,type))))
   `(font-lock-constant-face ((t (:foreground ,constant))))
   `(font-lock-builtin-face ((t (:foreground ,constant))))
   
   `(font-lock-function-name-face ((t (:foreground ,normal-fg))))
   `(font-lock-variable-name-face ((t (:foreground ,normal-fg))))
   `(font-lock-warning-face ((t (:foreground "red" :weight bold))))
   
   `(tooltip ((t (:background ,float-bg :foreground ,normal-fg))))
   `(company-tooltip ((t (:background ,float-bg :foreground ,normal-fg))))
   
   `(mode-line ((t (:background "#2e2e2e" :foreground ,normal-fg))))
   `(mode-line-inactive ((t (:background "#1a1a1a" :foreground "#888888")))))

(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-directory load-file-name))))

(enable-theme 'aesthetics)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
