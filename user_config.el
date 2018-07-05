(defun dotspacemacs/user-config ()

  ;; manually set shell $PATH
  (setenv "PATH"
          (concat
           "/Users/Mike/anaconda/bin" ":"
           "/Library/Frameworks/Python.framework/Versions/3.4/bin" ":"
           "/usr/local/bin:/usr/bin" ":"
           "/bin" ":"
           "/usr/sbin" ":"
           "/sbin" ":"
           "/Library/TeX/texbin" ":"
           "/usr/local/MacGPG2/bin" ":"
           "/opt/X11/bin" ":"
           "/Applications/Wireshark.app/Contents/MacOS:"
           "/Users/Mike/Code/Scripts" ":"
           (getenv "PATH")))

  ;; load other user config files
  (add-to-list 'load-path "~/spacemacs/")
  (load "user_functions") ;; assorted functions
  (load "user_org")       ;; org-mode config
  (load "user_keys")      ;; keymaps
  (load "user_face")      ;; appearance of emacs

  ;; timeout from typing to selection in evil-avy-goto-char-timer
  (setq avy-timeout-seconds 0.35)

  ;; indentation levels for different modes/situations
  (setq c-basic-offset 2)
  (setq LaTeX-indent-level 0)
  (setq LaTeX-item-indent 0)

  ;; syntax checking
  ;; disable flyspell by default
  (setq-default dotspacemacs-configuration-layers
                '((spell-checking :variables spell-checking-enable-by-default nil)))
  (spacemacs/set-default-font dotspacemacs-default-font)
  ;; only perform flycheck on file save, *not* when a newline is created
  (setq flycheck-check-syntax-automatically '(save))

  ;; appearance

  ;; insert mode in shell buffers scrolls to bottom
  (setq comint-scroll-to-bottom-on-input t)

  ;; keep history short to prevent any issues with large savehist lagging
  (setq history-length 100)
  (put 'minibuffer-history 'history-length 50)
  (put 'evil-ex-history 'history-length 50)
  (put 'kill-ring 'history-length 25)

  ;; Stop :q from killing the frame
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  ;; Need to type out :quit to close emacs
  (evil-ex-define-cmd "quit" 'evil-quit)

)
