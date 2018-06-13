(defun dotspacemacs/user-init ()

  mac-right-option-modifier nil

  (setq powerline-default-separator 'arrow)
  (setq powerline-height 35)
  (setq powerline-image-apple-rgb t)
  ;; (setq ns-use-srgb-colorspace nil)

  ;; Start the emacs daemon
  (server-start)
)
