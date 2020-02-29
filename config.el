;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Uses zsh instead of bash
(setq vterm-shell "/run/current-system/sw/bin/zsh")
(setq multi-term-program "/run/current-system/sw/bin/zsh")

(load-theme 'doom-acario-dark t)
;; Show inline messages in org
(defun my/fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

;; after executing show the images
(add-hook 'org-babel-after-execute-hook 'my/fix-inline-images)
