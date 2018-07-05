(defun dotspacemacs/user-init ()

  (message "user-init started")

  ;; remove title from top of frame
  (setq dotspacemacs-frame-title-format nil)

  ;; Start the emacs daemon
  (server-start)
  ;; starting org-protocol in init might be required to work in emacs-port?
  (require 'org-protocol)

  (message "user-init completed")

)
