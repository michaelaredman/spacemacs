
;; escape keymap is *ordered* jk
(setq-default evil-escape-key-sequence "jk")

;; insert mode keymaps
(define-key evil-insert-state-map (kbd "s-l") 'forward-char)
(define-key evil-insert-state-map (kbd "s-h") 'backward-char)
(define-key evil-insert-state-map (kbd "<backtab>") 'yas/expand)
;; (define-key evil-insert-state-map (kbd "C-i") 'eval-expression)

;; normal mode maps to existing functions
(define-key evil-normal-state-map (kbd ";") 'evil-avy-goto-char-timer)

;; normal mode maps to user-functions
(define-key evil-normal-state-map (kbd "s-j") 'mike/visual-line-down)
(define-key evil-normal-state-map (kbd "s-o") 'mike/second-to-last-and-newline)

;; insert # with M-3
(define-key winum-keymap "\M-3" nil)
(global-set-key (kbd "M-3") (lambda ()
                              (interactive)
                              (insert "#")))

;; leader keymaps ;;
(spacemacs/set-leader-keys
  "d" 'other-window
  "fec" 'mike/find-user-config
  "feC" 'mike/find-user-init
  "ii" 'eval-expression
  "tq" 'toggle-debug-on-quit
  "ysv" 'set-variable
  "fmt" 'mike/find-todos
  "os" 'helm-spotify-plus
  "Os" 'outline-show-all)
