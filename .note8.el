(require 'org-publish)
(setq org-export-with-section-numbers nil) ;this set the section with no number
(setq org-html-validation-link nil) ;makes no validation below
(setq org-publish-project-alist

      '(
;;first, the notes component
	("org-notes"
	 :base-directory "~/Documents/org/notes/"
	 :base-extension "org"
	 :publishing-directory "~/Documents/org/publish/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble nil
	 :htmlize-source t ;this set source-code highlighting in html publish
;	 :org-html-head-include-default-style nil ;set default html style to nil
	 :html-style:nil
	 )
;;second,the static component
	("org-static"
	 :base-directory "~/Documents/org/notes"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/Documents/org/publish/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
;;third, the publish component
	("org" :components ("org-notes" "org-static"))

      ))
