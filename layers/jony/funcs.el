
(defun jony/open-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (jony/git-project-root)
      (counsel-git)
    (if (projectile-project-p)
        (projectile-find-file)
      (counsel-file-jump))))

(defun jony/git-project-root ()
  "Return the project root for current buffer."
  (let ((directory default-directory))
    (locate-dominating-file directory ".git")))

