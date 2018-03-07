;; packages
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

(require 'package)
(package-initialize)
(package-refresh-contents)

(setq my-packages
      '(
        auto-complete
        ;; cider
        ;; projectile
        ;; clojure-mode
        ;; expand-region
        ;; helm
        ;; jinja2-mode
        magit
        markdown-mode
        ;; nyan-mode
        ;; paredit
        ;; prodigy
        ;; wrap-region
        yaml-mode
        json-mode
        ))

(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Color theme
(load-theme 'light-blue t)

;; Font size
(set-face-attribute 'default nil :height 140)

;; encodings
(setq default-buffer-file-coding-system 'utf-8)
(setq-default coding-system-for-read 'utf-8)
(setq file-name-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
