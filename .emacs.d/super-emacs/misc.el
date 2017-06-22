(defun super-emacs-reload-current-file ()
  "Reload the file loaded in current buffer from the disk"
  (interactive)
  (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                 (message "File reloaded")))
        (t (message "You're not editing a file!"))))

;Disable splash message, start *scratch* buffer by default
(setq initial-buffer-choice 
      t)
(setq initial-scratch-message 
      "")

;Enforce spaces for indentation, instead of tabs
(setq-default indent-tabs-mode 
              nil)

;Enable show-paren-mode
(show-paren-mode)

;Enable winner-mode
(winner-mode t)

;Enable windmove
(windmove-default-keybindings)

;Enable git-gutter globally
(global-git-gutter-mode +1)

;Setup multi-term
(setq multi-term-program "/bin/zsh")

;;Default tab and indentation behavior
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;Handles sourcing ZSH
(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))

;Set PYTHONPATH variable
(setenv "PYTHONPATH" "/home/omaciel/hacking:/home/omaciel/Dropbox/Hacking:/home/omaciel:/home/omaciel/hacking/katello-cli/src")



