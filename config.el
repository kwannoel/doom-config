;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Uses zsh instead of bash
;; use system-type to check
;; use sh-shell to confi
;; (setq vterm-shell (getenv "SHELL"))
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

;;; shell pop
(use-package! shell-pop
  :init (map! :leader
              :desc "Uses shell-pop" "t t" 'shell-pop)
  :config
  (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell))))
        shell-pop-term-shell (getenv "SHELL")
        shell-pop-window-size 30
        shell-pop-full-span nil
        shell-pop-window-position "bottom"
        ;; shell-pop-autocd-to-working-dir t
        ;; shell-pop-restore-window-configuration t
        shell-pop-cleanup-buffer-at-process-exit t))

;; Load agda, ensure agda-mode is installed via agda first
;; (load-file (let ((coding-system-for-read 'utf-8))
;;                 (shell-command-to-string "agda-mode locate")))

;; Enable neuron shortcuts
(map! :map neuron-mode-map
      :nv "SPC z l" #'neuron-create-and-insert-zettel-link)

;; quick hack to use gerbil repl
;; select and "g r"
(setf scheme-program-name "/home/noel/.nix-profile/bin/gxi")

;; Enable gerbil-mode
;; (use-package gerbil-mode
;;   :when (getenv "GERBIL_HOME")
;;   :ensure nil
;;   :defer t
;;   :mode (("\\.ss\\'"  . gerbil-mode)
;;          ("\\.pkg\\'" . gerbil-mode))
;;   :bind (:map comint-mode-map
;;               (("C-S-n" . comint-next-input)
;;                ("C-S-p" . comint-previous-input)
;;                ("C-S-l" . clear-comint-buffer))
;;               :map gerbil-mode-map
;;               (("C-S-l" . clear-comint-buffer)))
;;   :init
;;   (setf gambit "/home/noel/.gambit")
;;   (setf gerbil "/home/noel/.gerbil")
;;   ;; (setf gambit (getenv "GAMBIT_HOME"))
;;   ;; (setf gerbil (getenv "GERBIL_HOME"))
;;   (autoload 'gerbil-mode
;;     (concat gerbil "/etc/gerbil-mode.el") "Gerbil editing mode." t)
;;   :hook
;;   ((gerbil-mode . linum-mode)
;;    (inferior-scheme-mode-hook . gambit-inferior-mode))
;;   :config
;;   (require 'gambit
;;            (concat gambit
;;                    (if (equal "nixos" (system-name))
;;                      "/share/emacs/site-lisp/gambit.el"
;;                      "/misc/gambit.el")))
;;   (setf scheme-program-name (concat gerbil "/bin/gxi"))

;;   (let ((tags (locate-dominating-file default-directory "TAGS")))
;;     (when tags (visit-tags-table tags)))
;;   (visit-tags-table (concat gerbil "/src/TAGS"))

;;   (when (package-installed-p 'smartparens)
;;     (sp-pair "'" nil :actions :rem)
;;     (sp-pair "`" nil :actions :rem))

;;   (defun clear-comint-buffer ()
;;     (interactive)
;;     (with-current-buffer "*scheme*"
;;       (let ((comint-buffer-maximum-size 0))
;;         (comint-truncate-buffer)))))

;; (defun gerbil-setup-buffers ()
;;   "Change current buffer mode to gerbil-mode and start a REPL"
;;   (interactive)
;;   (gerbil-mode)
;;   (split-window-right)
;;   (shrink-window-horizontally 2)
;;   (let ((buf (buffer-name)))
;;     (other-window 1)
;;     (run-scheme "gxi")
;;     (switch-to-buffer-other-window "*scheme*" nil)
;;     (switch-to-buffer buf)))

;; (global-set-key (kbd "C-c C-g") 'gerbil-setup-buffers)

;; fly check is too laggy for haskell
(setq-default flycheck-disabled-checkers '(haskell-stack-ghc))

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.doom.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
