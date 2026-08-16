(require 'package)

;; Пакетные менеджеры
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
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
(setq-default fill-column 80)
(global-display-fill-column-indicator-mode t)

(electric-pair-mode 1)
(show-paren-mode 1)

(setopt use-short-answers t)

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Добавляем путь к сгенерированным темам DMS
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Функция для безопасной загрузки/перезагрузки темы
(defun load-dms-theme ()
  (interactive)
  (load-theme 'dank-emacs t))

;; Первичная загрузка темы при старте
(load-dms-theme)

;; Автоматический пересчет цветов, если Matugen обновил файл на диске
(use-package filenotify
  :ensure nil
  :config
  (let ((theme-file (expand-file-name "~/.emacs.d/themes/dank-emacs-theme.el")))
    (when (file-exists-p theme-file)
      (file-notify-add-watch
       theme-file
       '(change)
       (lambda (event)
         (when (memq 'changed event)
           ;; Запускаем с небольшой задержкой, чтобы файл успел перезаписаться полностью
           (run-with-timer 0.1 nil #'load-dms-theme)))))))


;; Keybinds
(global-set-key (kbd "C-c C-d") 'duplicate-line)
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "C-x /") 'consult-ripgrep)
(global-set-key (kbd "C-c g") 'magit)

;; (global-set-key (kbd "C-c C-c") 'compile)

;; Установка и настройка Company (автодополнение)
(unless (package-installed-p 'company)
  (package-install 'company))
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)

;; Magit GitFlow
(unless (package-installed-p 'magit-gitflow)
  (package-install 'magit-gitflow))
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; Eglot config
;; go-mode для синтаксиса

(require 'go-mode)
(require 'eglot)

;; Hooks
(add-hook 'go-mode-hook #'eglot-ensure)
(add-hook 'before-save-hook 'eglot-format-buffer)

;; Slime for Common Lisp
(require 'slime)
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy))
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

;; SLIME keybindings
(global-set-key (kbd "C-c s") 'slime)  ;; Запуск SLIME

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
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(dank-emacs))
 '(custom-safe-themes
   '("56ea9bccc9cbbe6a2eed5f3472914875e44bbc8f58d14885ada18ec22125844d"
	 "a10be2cb039228828c243dd66ad4e76a1cac691d001ea4e6d7e3dfe6a55b0d17"
	 "49361d39cd77efa1e363fde9c80aa08e7a3ddaada86bccd90f3205af8733174a" default))
 '(package-selected-packages
   '(all-the-icons base16-theme company consult magit magit-gitflow neotree
				   projectile rg slime vertico-posframe)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
