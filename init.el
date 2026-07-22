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
(electric-pair-mode 1)
(show-paren-mode 1)


;; Keybinds
(global-set-key (kbd "C-c C-d") 'duplicate-line)

;; Установка и настройка Company (автодополнение)
(unless (package-installed-p 'company)
  (package-install 'company))
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)

;; Установка и настройка Yasnippet (шаблоны кода)
(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))
(yas-global-mode 1)

;; Интеграция Company и Yasnippet (чтобы шаблоны тоже появлялись в автодополнении)
(unless (package-installed-p 'company-box)
  (package-install 'company-box))
(add-hook 'company-mode-hook 'company-box-mode)


;; Eglot config
;; go-mode для синтаксиса
(require 'go-mode)
(require 'eglot)

(add-hook 'go-mode-hook #'eglot-ensure)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c"
	 "91db2df9490180a006964179f3aa4fcbc6bbf63cdcba189b41ea1ff5a606df33"
	 "653bc7ac0de0537b10facb11a2872b7dbe1da12eec99d19adead120aa6285712"
	 "228e932e23d80003c030090a00cb6ad31c2d55d4e8d9c994538d5b5175be1e8b"
	 default))
 '(package-selected-packages
   '(base16-theme company company-box exec-path-from-shell go-mode
				  yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
