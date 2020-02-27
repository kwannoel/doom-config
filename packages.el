;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el
(package! org-roam :recipe
  (:host github :repo "jethrokuan/org-roam" :branch "develop"))

(use-package! org-roam
      :hook
      (after-init . org-roam-mode)
      :custom (org-roam-directory "/home/noel/org-notes/")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-show-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))

;; Used to filter and browse files in org
(package! deft)

(use-package! deft
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "/home/noel/org-notes/"))
