;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Uses zsh instead of bash
(setq vterm-shell "/run/current-system/sw/bin/zsh")
(setq multi-term-program "/run/current-system/sw/bin/bash")

(load-theme 'doom-one t)
;; Show inline messages in org
(defun my/fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

(setq doom-font (font-spec :family "Iosevka" :size 15 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Iosevka") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "Iosevka" :size 12)
      doom-big-font (font-spec :family "Iosevka" :size 19))

;; after executing show the images
(add-hook 'org-babel-after-execute-hook 'my/fix-inline-images)
