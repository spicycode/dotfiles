(require 'cl)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(defvar spicycode/packages '(auto-complete
			     ac-slime
                             coffee-mode
                             evil
			     evil-leader
			     smex)
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
(when (display-graphic-p) (set-scroll-bar-mode nil))

; Use Source Code Pro 14pt in GUI
(when (display-graphic-p) (set-face-attribute 'default nil :font "Source Code Pro for Powerline-15"))

; Echo keystrokes fast
; don't use dialog boxes, and turn off beeping
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

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
(when (display-graphic-p)
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("green" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
)

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
