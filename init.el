(require 'package)
(require 'project)

;; Пакетные менеджеры
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;; Глобальные настройки
(desktop-save-mode 1)

(tool-bar-mode -1)
(menu-bar-mode -1)


(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(setq-default tab-always-indent nil)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(setq-default fill-column 100)
(global-display-fill-column-indicator-mode t)


(electric-pair-mode 1)
(show-paren-mode 1)

(setopt use-short-answers t)

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))


;; Keybinds
(global-set-key (kbd "C-c C-d") 'duplicate-line)
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-x /") 'consult-ripgrep)
(global-set-key (kbd "C-c C-c") 'compile)

;; Установка и настройка Company (автодополнение)
(unless (package-installed-p 'company)
  (package-install 'company))
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)

;; Eglot config
;; go-mode для синтаксиса
(require 'go-mode)
(require 'eglot)

(add-hook 'go-mode-hook #'eglot-ensure)
(add-hook 'before-save-hook 'eglot-format-buffer)

;; Setting consult
(require 'vertico)
(vertico-mode 1)

(require 'consult)

;; Custom func
;; Delete all buffers
(defun kill-all-buffers ()
  "Kill all buffers"
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more thaпn one, they won't work right.
 '(custom-safe-themes
   '("d1d0bd3d8be9acb87bbdcd1ed3f8d2597403db3f53a9d79560e0213d20b8d780"
	 default))
 '(package-selected-packages
   '(company company-box consult exec-path-from-shell go-mode magit
			 orderless vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
