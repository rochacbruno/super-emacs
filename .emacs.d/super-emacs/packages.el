;Create repositories cache, if required
(when (not package-archive-contents)
  (package-refresh-contents))

;Declare a list of required packages
(defvar super-emacs--required-packages
  '(
    ace-jump-mode
    auto-complete
    buffer-move
    dired-launch
    exec-path-from-shell
    flycheck
    git-gutter
    helm
    jedi
    magit
    markdown-mode
    material-theme
    meta-presenter
    multi-term
    multiple-cursors
    myterminal-controls
    neotree
    powerline
    switch-window
    theme-looper
    undo-tree
    which-key
    ztree
    ))

;Install required packages
(mapc (lambda (p)
        (package-install p))
      super-emacs--required-packages)

;Load default auto-complete configs
(ac-config-default)

;Start undo-tree
(global-undo-tree-mode)

;Set hooks for dired-launch-mode
(add-hook 'dired-mode-hook
          'dired-launch-mode)

;Start which-key-mode
(which-key-mode)

;Set up ace-jump-mode
(autoload 'ace-jump-mode 
  "ace-jump-mode" 
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark 
  "ace-jump-mode" 
  "Ace jump back:-"
  t)

;Enable powerline
(powerline-center-theme)
(setq powerline-default-separator
      'slant)

;Configure theme-looper
(theme-looper-set-theme-set '(deeper-blue
                              wheatgrass
                              wombat
                              material))
(theme-looper-set-customizations 'powerline-reset)

;Configure myterminal-controls
(myterminal-controls-set-controls-data
 '(("t" "Change color theme" theme-looper-enable-next-theme)
   ("r" "Reload file" super-emacs-reload-current-file)))

;Set up helm-mode
(helm-mode 1)
(helm-autoresize-mode 1)
(setq helm-split-window-in-side-p
      t)
