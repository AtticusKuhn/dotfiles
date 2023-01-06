 (defun auto-compile-groff ()
  "automatically compile a groff document"
 ;;lj (when (eq major-mode 'nroff-mode)
        (shell-command (format "eqn -Tpdf %s | groff -ms -Tpdf > %s.pdf" buffer-file-name buffer-file-name))); )

(add-hook 'after-save-hook 'auto-compile-groff)
