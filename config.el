;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Uses zsh instead of bash
;; use system-type to check
;; use sh-shell to confi
(setq vterm-shell (getenv "SHELL"))
(setq multi-term-program (getenv "SHELL"))

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

;; Haskell mode indentation
(custom-set-variables
 ;; Customization related to indentation.
 '(haskell-indentation-layout-offset 4)
 '(haskell-indentation-starter-offset 4)
 '(haskell-indentation-left-offset 4)
 '(haskell-indentation-where-pre-offset 2)
 '(haskell-indentation-where-post-offset 2)

 ;; Customization for stylish-haskell
 '(haskell-stylish-on-save t)
 )

;; Enable goto-line in evil mode
(map! :n "g l" #'goto-line)

;;; Hoogle lookup
(map! :nv "SPC h h" #'hoogle)
