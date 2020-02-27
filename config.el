;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here


(load-theme 'doom-acario-light t)
;; Show inline messages in org
(defun my/fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

;; after executing show the images
(add-hook 'org-babel-after-execute-hook 'my/fix-inline-images)
