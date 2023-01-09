 (defun auto-compile-groff ()
  "automatically compile a groff document"
  ;;(when (eq major-mode 'nroff-mode)
        (interactive)
        (shell-command-to-string (format "eqn -Tpdf %s | groff -ms -Tpdf > %s.pdf" buffer-file-name buffer-file-name))) ;;)
(add-hook 'nroff-mode-hook
          (lambda () (local-set-key (kbd "C-c C-s") #'auto-compile-groff)))
;; (add-hook 'after-save-hook 'auto-compile-groff)
(defun compile-sagetex ()
  "compile sagetex by running pdflatex and sagetex commands"
  (interactive)
  (shell-command-to-string (format "pdflatex %s && sage %s.sage && pdflatex %s" buffer-file-name buffer-file-name buffer-file-name)))

(add-hook 'tex-mode-hook
          (lambda () (local-set-key (kbd "C-c C-x") #'compile-sagetex)))
