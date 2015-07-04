
(require 'cl)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(defvar spicycode/packages '(auto-complete
			     ac-slime
			     base16-theme 
			     coffee-mode
			     ido-vertical-mode
			     markdown-mode
			     minitest
			     nyan-mode
			     evil
			     evil-leader
			     rainbow-delimiters
			     ruby-mode
			     sass-mode
			     scss-mode
			     smex
			     yaml-mode)
  "Default packages")

(defun spicycode/packages-installed-p ()
  (loop for pkg in spicycode/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (spicycode/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg spicycode/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


; Don't display the ugly startup message (particularly ugly in the GUI)
(setq inhibit-startup-message t)

; No toolbar
(tool-bar-mode -1)

; Get rid of the butt ugly OSX scrollbars in GUI
(set-scroll-bar-mode nil)

; Use Source Code Pro 14pt in GUI
(set-face-attribute 'default nil :font "Source Code Pro for Powerline-18")

;; Use fonts everywhere
(setq global-font-lock-mode 1)

; Echo keystrokes fast
; don't use dialog boxes, and turn off beeping
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell nil)
(show-paren-mode t)

;; Visually show region
(setq transient-mark-mode t)

; autocomplete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)	

; smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

; VIM Type config
(global-evil-leader-mode)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "lf" 'ido-find-file
  "lb" 'ido-switch-buffer
  "d" 'ido-kill-buffer)


; Set cursor colors depending on mode
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

; Allow using esc to exit menu modes
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

; Use evil mode

; Give us back Ctrl+U for vim emulation
(setq evil-want-C-u-scroll t)

(require 'evil)
(evil-mode t)

(load-theme `base16-ocean-dark t)


(setq teach-extended-commands-p t)
(defalias 'qrr 'query-replace-regexp)
(defalias 'qr 'query-replace)
(defalias 'yes-or-no-p 'y-or-n-p)

;; do not confirm file creation
(setq confirm-nonexistent-file-or-buffer nil)

;; Debug on error
(setq debug-on-error t)

;; Do not confirm killing emacs
(setq confirm-kill-emacs nil)

;; Custom file
(setq custom-file "~/.emacs.d/elisp/custom.el")
(load custom-file 'noerror)

;; Auto-revert any buffers if file on disk changes
(global-auto-revert-mode t)

;; Don't truncate lines
(setq-default word-wrap nil)
(setq default-truncate-lines t)
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; Don't make backup files
(setq make-backup-files nil)

;; Disable VCS backends
(setq vc-handled-backends nil)


;; UTF-8
;;;;;;;;;;;;;;;;;;;;

;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(ido-mode t)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-everywhere t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)


;; uniquify changes conflicting buffer names from file<2> etc
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Remember where I was
(require 'saveplace)
(setq-default save-place t)

;; Dired
(require 'dired)
;; - is `cd ..` (like vim)
(define-key dired-mode-map "-" 'dired-up-directory)

;; Nyan MODE!!!!!
(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)
