
;; set title bar to same color as theme background
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; powerline config
(setq powerline-default-separator 'slant)
(setq powerline-height 30)
(setq powerline-image-apple-rgb t)
;; spaceline needs compiling after this but must be done at end of init

;; ligatures
(require 'pretty-mode)
(global-pretty-mode t)
;; removed :sub-and-superscripts as it messes up python mode
(pretty-activate-groups
 '(:greek :arithmetic-nary :punctuation))

(global-prettify-symbols-mode 1)
;; hide ligatures when the cursor is over the character
(setq prettify-symbols-unprettify-at-point t)
;; org-mode ligatures
(add-hook 'org-mode-hook
          (lambda ()
            (push '("->" . "→") prettify-symbols-alist)))

;; org-levels in doom-dracula inherit from their parents so we must reduce height
;; instead set inheritance manually to be theme agnostic
(defun mike/org-bullet-faces ()
  "set org-level styles"
  (interactive)
  (set-face-attribute 'org-level-1 nil :height 1.2)
  (set-face-attribute 'org-level-2 nil :inherit 'org-level-1 :height 0.9)
  (set-face-attribute 'org-level-3 nil :inherit 'org-level-2 :height 0.9))
(add-hook 'org-mode-hook 'mike/org-bullet-faces)
