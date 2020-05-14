;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; disable UI clutters
(setq tool-bar-mode nil)
(setq scroll-bar-mode nil)

;; Uses zsh instead of bash
(setq vterm-shell "/bin/zsh")
(setq multi-term-program "/bin/zsh")

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

(use-package! org-roam
  :commands (org-roam-insert org-roam-find-file org-roam-switch-to-buffer org-roam)
  :hook
  (after-init . org-roam-mode)
  :custom-face
  (org-roam-link ((t (:inherit org-link :foreground "#005200"))))
  :init
  (map! :leader
        :prefix "n"
        :desc "org-roam" "l" #'org-roam
        :desc "org-roam-insert" "i" #'org-roam-insert
        :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
        :desc "org-roam-find-file" "f" #'org-roam-find-file
        :desc "org-roam-show-graph" "g" #'org-roam-show-graph
        :desc "org-roam-insert" "i" #'org-roam-insert
        :desc "org-roam-capture" "c" #'org-roam-capture)
  (setq org-roam-directory "/Users/kwannoel/org-notes/") ;; update to use dropbox
)

