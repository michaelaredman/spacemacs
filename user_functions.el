
(defun mike/visual-line-down ()
  (interactive)
  (evil-visual-line)
  (evil-next-line))

(defun mike/second-to-last-and-newline ()
  (interactive)
  (evil-end-of-line)
  (newline-and-indent)
  (evil-insert 1))

(defun mike/find-user-config ()
  "Edit the `user-config', in the current window."
  (interactive)
  (find-file-existing "~/spacemacs/user_config.el"))
(defun mike/find-user-init ()
  "Edit the `user-init', in the current window."
  (interactive)
  (find-file-existing "~/spacemacs/user_init.el"))
(defun mike/find-todos ()
  "Edit the `user-init', in the current window."
  (interactive)
  (find-file-existing "~/org/todos.org"))

(defun mike/make-orgcapture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "remember")
                (width . 80) (height . 16) (top . 400) (left . 300)
                (font . "-apple-Monaco-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")))
  (select-frame-by-name "remember")
  (delete-other-windows)
  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
          (org-capture)))

(defadvice mike/org-capture-finalize
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame"
  (if (equal "remember" (frame-parameter nil 'name))
      (delete-frame)))

(defadvice mike/org-capture-destroy
    (after delete-capture-frame activate)
  "Advise capture-destroy to close the frame"
  (if (equal "remember" (frame-parameter nil 'name))
      (delete-frame)))

(defmacro measure-time (&rest body)
  "Measure the time it takes to evaluate BODY."
  `(let ((time (current-time)))
     ,@body
     (message "%.06f" (float-time (time-since time)))))
