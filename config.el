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


(use-package! org-roam
  :commands (org-roam-insert org-roam-find-file org-roam-switch-to-buffer org-roam)
  :custom-face
  (org-roam-link ((t (:inherit org-link :foreground "#005200"))))
  :init
  ;; insert output after cursor rather than before
  ;; evil-mode specific workaround
  (defun org-roam-insert-after ()
    (interactive) (save-excursion (insert "  ")) (right-char 2) (command-execute #'org-roam-insert))
  (map! :leader
        :prefix "n"
        :desc "org-roam-mode" "l" #'org-roam
        :desc "org-roam-insert-after" "i" #'org-roam-insert-after
        :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
        :desc "org-roam-find-file" "f" #'org-roam-find-file
        :desc "org-roam-show-graph" "g" #'org-roam-show-graph
        :desc "org-roam-capture" "c" #'org-roam-capture)
  (setq org-roam-directory    (concat (getenv "HOME") "/Sync/org-notes/" )
        org-roam-db-location  (concat (getenv "HOME") "/org-roam-db/org-roam.db" ))
)

;; Enable goto-line in evil mode
(map! :n "g l" #'goto-line)

;;; Deft configuration
(use-package! deft
  :after org org-roam
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory org-roam-directory) ;;; Filter through index of org-roam
)

;;; Hoogle lookup
(map! :nv "SPC h h" #'hoogle)
