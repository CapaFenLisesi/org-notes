;;load-path of org-mode
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)

;;load-path of color-theme
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)


;;hide the menu bar
(menu-bar-mode 0)

;;syntax highlight
(setq org-src-fontify-natively t)
(require 'htmlize)


;;fast access TODO keywords, press C-c C-t followed by the selection key
(setq org-todo-keywords
           '((sequence "TODO(t)""IN-PROGRESS(i)" "|" "DONE(d)")
             (sequence "SETTING-UP(s@)" "PROGRAMMING(p!)" "BUG(b!)"  "|" "FIXED(f@)" "ANALYSING(a)")
	     (sequence "WAIT(w!)""READING(r!)" "VERIFY(v!)|" "CANCELED(c@)")))


;;Closing todo items, taking a notes when task is done
(setq org-log-done 'note)


;;TODO entry automatically marded DONE when the children are done
(defun org-summary-todo (n-done n-not-done)
       "Switch entry to DONE when all subentries are done, to TODO otherwise."
       (let (org-log-done org-log-states)   ; turn off logging
         (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
     
     (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


;;TAGS quick selection
(setq org-tag-alist 
      '(("@work" . ?w) ("@home" . ?h) ("@laptop" . ?l) ("@office" . ?o)
	("@shop" . ?s) ("@dorm" . ?d) ("@PC-mac" . ?c) ("@gym" . ?g)
	("linux") ("emacs" . ?e) ("physics" . ?p) ("fortran" . ?f)
	("openmp" . ?o) ("research" . ?r) ("ARCHIVE" . ?a)("borrow" . ?b)
        ("travel" . ?t) ("@library") ("reserve") ("return") ("c-program")
        ("girlfriend") ("cuda-C") ("windows") ("life")))

;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)
;;To save the clock history across Emacs sessions, use
     (setq org-clock-persist 'history)
     (org-clock-persistence-insinuate)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Documents/org/gtd/todo.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Calendar/Diary integration
;(setq org-agenda-include-diary t)
