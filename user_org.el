
;; Allow a blank line between org headings
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

;; org-capture templates with org-protocol
(with-eval-after-load 'org
  (add-to-list 'org-modules 'org-protocol)
  (setq org-capture-templates `(("t" "Todo" entry
                                 (file "todos.org")
                                 "* TODO %?\n%i\n%t")
                                ("l" "A link, for reading later." entry
                                 (file+headline "reading.org" "Reading List")
                                 "* %:description\n%u\n\n%c\n\n%i"
                                 :empty-lines 1)
                                ("p" "Protocol" entry (file+headline ,(concat org-directory "/chrome.org") "Inbox")
                                 "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
                                ("L" "Protocol Link" entry (file+headline ,(concat org-directory "/chrome.org") "Inbox")
                                 "* %? [[%:link][%:description]] \nCaptured On: %U"))))

(add-hook 'org-capture-mode-hook 'evil-insert-state)
