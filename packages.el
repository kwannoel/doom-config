;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el
(package! org-roam :recipe
  (:host github :repo "jethrokuan/org-roam" :branch "develop"))

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

(package! org-noter)
