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
             '(font . "Liberation Mono-14"))

(set-face-attribute 'default t
                    :font "Liberation Mono-14"
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

(setq echo-keystrokes 0.01)
(setq evil-esc-delay 0.01)

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
  :config
  (setq vertico-multiform-commands
        '((find-file flat)
          (projectile-find-file flat)))
  (vertico-multiform-mode)
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

(global-set-key (kbd "M-!") 'projectile-run-shell-command-in-root)

(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2)
  :bind (:map corfu-map ("C-l" . corfu-insert)))

(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (setq dabbrev-friend-buffer-function #'always)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

(defun my/load-project-files ()
  "Open all .c and .h files in the current project into buffers."
  (interactive)
  (let ((root (projectile-project-root)))
    (when root
      (let ((files (projectile-project-files root)))
        (dolist (file files)
          (when (string-match-p "\\.[ch]$" file)
            (find-file-noselect (expand-file-name file root))))
        (message "Project files loaded into buffers.")))))

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

(use-package magit
  :ensure t
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package dumb-jump
  :ensure t
  :custom
  (dumb-jump-prefer-searcher 'rg)
  (xref-show-definitions-function #'consult-xref)
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

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

(defun my/close-side-windows ()
  "close compilation and xref windows from anywhere."
  (interactive)
  (dolist (buf '("*compilation*" "*xref*" "*grep*"))
    (let ((win (get-buffer-window buf)))
      (when win (delete-window win)))))



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
    "vrn" 'projectile-replace-regexp
    "fr" 'project-find-regexp)

  (general-def 'normal
    "gd" 'xref-find-definitions
    "C-p" 'projectile-find-file
    "gc" 'evilnc-comment-or-uncomment-lines
    "C-j" 'next-error
    "C-k" 'previous-error
    "] d" 'my/close-side-windows)

  (general-def 'visual
    "J" 'move-text-down
    "K" 'move-text-up)
)

(use-package elfeed
:ensure t)

(setq elfeed-feeds '(
	("https://news.ycombinator.com/rss" hackernews)

	("https://www.thecrazyprogrammer.com/feed" the-crazy-programmer)

	("https://www.reddit.com/r/ProgrammerHumor.rss?feed=b5bfe0dca93d4cf04bd999d67ef4fc32e0293420&user=DrCheeseFace" reddit-programming-humor)
	("https://www.reddit.com/r/cprogramming.rss?feed=b5bfe0dca93d4cf04bd999d67ef4fc32e0293420&user=DrCheeseFace" reddit-cprogramming)
	("https://www.reddit.com/r/wallstreetbets.rss?feed=b5bfe0dca93d4cf04bd999d67ef4fc32e0293420&user=DrCheeseFace" reddit-wsb)
	("https://www.reddit.com/r/Grapplerbaki.rss?feed=b5bfe0dca93d4cf04bd999d67ef4fc32e0293420&user=DrCheeseFace" reddit-grapplerbaki)))

(setq-default elfeed-search-filter "@1week +unread")
(setq elfeed-curl-max-connections 2)

;; org 
(require 'org)
(require 'org-habit)
(add-to-list 'org-modules 'org-habit t)

(setq org-startup-indented t)
(setq org-hide-leading-stars t)
(setq org-ellipsis " ▾")
(setq org-hide-emphasis-markers t)
(setq org-agenda-files '("~/org/projects.org" 
                         "~/org/tracking.org"))

(setq org-todo-keywords
      '((sequence "TODO(t)" "INPROGRESS(i)" "NEXT(n)" "PROJ(p)" "|" "DONE(d!)" "CANCELED(c@)")))

(setq org-habit-graph-column 60)
(setq org-habit-show-habits-only-for-today t)
(setq org-agenda-repeating-timestamp-show-all nil)
(setq org-agenda-skip-scheduled-if-done t)

(setq org-log-into-drawer "LOGBOOK")

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'org-update-all-dblocks nil 'local)))

(global-set-key (kbd "C-c a") 'org-agenda)

(defun my/org-clock-in-to-inprogress ()
  "Switch task to INPROGRESS when clocking in if the task is TODO or NEXT."
  (when (member (org-get-todo-state) '("TODO" "NEXT"))
    (org-todo "INPROGRESS")))

(add-hook 'org-clock-in-hook 'my/org-clock-in-to-inprogress)

(use-package org-modern
  :ensure t
  :config
  (global-org-modern-mode)
  (setq org-modern-star ["•" "•" "•" "•" "•"])
  (setq org-modern-table nil)
  (setq org-modern-todo-faces
        '(("TODO"       . (:background "orange" :foreground "black"))
          ("INPROGRESS" . (:background "yellow" :foreground "black"))
          ("NEXT"       . (:background "cyan" :foreground "black"))
          ("PROJ"       . (:background "magenta" :foreground "black"))
          ("DONE"       . (:background "green" :foreground "black"))
          ("CANCELED"   . (:background "gray" :foreground "black"))))
  )

(use-package org-super-agenda
  :ensure t
  :config
  (org-super-agenda-mode)
  (setq org-super-agenda-groups
        '((:name "Habit Tracker"
                 :habit t)
          (:name "Today's Focus"
                 :time-grid t
                 :todo "TODO")
          (:name "In Progress"
                 :todo "INPROGRESS")
          (:name "Next Steps"
                 :todo "NEXT")
          (:name "Projects"
                 :todo "PROJ"))))

(add-hook 'org-mode-hook (lambda () (org-hide-drawer-all)))

(with-eval-after-load 'org
  (set-face-attribute 'org-level-1 nil :foreground "#FFFFFF" :weight 'bold :height 1.2)
  (set-face-attribute 'org-level-2 nil :foreground "#FFFFFF" :weight 'bold)
  (set-face-attribute 'org-level-3 nil :foreground "#FFFFFF" :weight 'bold)
  (set-face-attribute 'org-level-4 nil :foreground "#FFFFFF" :weight 'bold)
  (set-face-attribute 'org-level-5 nil :foreground "#FFFFFF" :weight 'bold)
  (set-face-attribute 'org-level-6 nil :foreground "#FFFFFF" :weight 'normal)
  (set-face-attribute 'org-level-7 nil :foreground "#FFFFFF" :weight 'normal)
  (set-face-attribute 'org-level-8 nil :foreground "#FFFFFF" :weight 'normal)
  (set-face-attribute 'org-headline-done nil :foreground "#666666" :strike-through nil))

;theme 
(deftheme aesthetics
  "theme")
(let ((type "#94DD8E")
      (keyword "blue")
      (constant "magenta")
      (comment "yellow")
      (string "orange")
      (normal-fg "#FFFFFF")
      (normal-bg "#062625")
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
   `(mode-line-inactive ((t (:background "#1a1a1a" :foreground "#888888"))))
   )

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
 '(elfeed-feeds
   '("https://www.reddit.com/r/Grapplerbaki.rss?feed=b5bfe0dca93d4cf04bd999d67ef4fc32e0293420&user=DrCheeseFace"
     ("https://news.ycombinator.com/rss" hackernews)
     ("https://www.thecrazyprogrammer.com/feed" the-crazy-programmer)
     ("https://www.reddit.com/r/ProgrammerHumor.rss?feed=b5bfe0dca93d4cf04bd999d67ef4fc32e0293420&user=DrCheeseFace"
      reddit-programming-humor)
     ("https://www.reddit.com/r/cprogramming.rss?feed=b5bfe0dca93d4cf04bd999d67ef4fc32e0293420&user=DrCheeseFace"
      reddit-cprogramming)
     ("https://www.reddit.com/r/wallstreetbets.rss?feed=b5bfe0dca93d4cf04bd999d67ef4fc32e0293420&user=DrCheeseFace"
      reddit-wsb)
     ("https://www.reddit.com/r/Grapplerbaki.rss?feed=b5bfe0dca93d4cf04bd999d67ef4fc32e0293420&user=DrCheeseFace"
      reddit-grapplerbaki)))
 '(package-selected-packages
   '(cape clang-format company consult corfu dumb-jump eldoc-box elfeed
	  evil-collection evil-nerd-commenter evil-surround general
	  gruber-darker-theme harpoon magit marginalia markdown-mode move-text
	  multi-vterm multiple-cursors orderless org-modern org-super-agenda
	  org-tree-slide projectile undo-tree vertico wgrep-ag xcscope)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
