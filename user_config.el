(defun dotspacemacs/user-config ()

  (setq c-basic-offset 2)

  (defadvice org-capture-finalize
      (after delete-capture-frame activate)
    "Advise capture-finalize to close the frame"
    (if (equal "remember" (frame-parameter nil 'name))
        (delete-frame)))

  (defadvice org-capture-destroy
      (after delete-capture-frame activate)
    "Advise capture-destroy to close the frame"
    (if (equal "remember" (frame-parameter nil 'name))
        (delete-frame)))

  (defun make-orgcapture-frame ()
    "Create a new frame and run org-capture."
    (interactive)
    (make-frame '((name . "remember")
                  (width . 80) (height . 16) (top . 400) (left . 300)
                  (font . "-apple-Monaco-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")))
    (select-frame-by-name "remember")
    (delete-other-windows)
    (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
            (org-capture)))

  (defun find-user-config ()
    "Edit the `user-config', in the current window."
    (interactive)
    (find-file-existing "~/spacemacs/user_config.el"))
  (defun find-user-init ()
    "Edit the `user-init', in the current window."
    (interactive)
    (find-file-existing "~/spacemacs/user_init.el"))

  ;; insert mode keymaps ;;
  (setq-default evil-escape-key-sequence "jk")

  ;; leader keymaps ;;
  (spacemacs/set-leader-keys
    "d" 'other-window
    "fec" 'find-user-config
    "feC" 'find-user-init)

  ;; powerline settings
  (setq powerline-default-separator 'arrow)

  ;; disable flyspell by default
  (setq-default dotspacemacs-configuration-layers
                '((spell-checking :variables spell-checking-enable-by-default nil)))
  (spacemacs/set-default-font dotspacemacs-default-font)

  (require 'pretty-mode)
  (global-pretty-mode t)
  (pretty-activate-groups
   '(:greek :arithmetic-nary :punctuation))
  ;; :sub-and-superscripts

  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))

  ;; org-mode config ;;
  ;; Allow a space between org headings
  (setq org-cycle-separator-lines 1)
  ;; Exporting org files as Bootstrap html
  (require 'ox-publish)
  (setq org-publish-project-alist
        '(("org-notes"
           :base-directory "~/org/"
           :publishing-directory "~/public_html/"
           :publishing-function org-twbs-publish-to-html
           :with-sub-superscript nil
           :padline no)))

  (setq comint-scroll-to-bottom-on-input t)

)
