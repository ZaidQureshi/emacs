;;; ox-twiki-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "ox-twiki" "ox-twiki.el" (22860 23173 138700
;;;;;;  666000))
;;; Generated autoloads from ox-twiki.el

(autoload 'org-twiki-export-as-twiki "ox-twiki" "\
Export current buffer to a text buffer.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting buffer should be accessible
through the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

When optional argument BODY-ONLY is non-nil, strip title, table
of contents and footnote definitions from output.

EXT-PLIST, when provided, is a property list with external
parameters overriding Org default settings, but still inferior to
file-local settings.

Export is done in a buffer named \"*Org Twiki Export*\", which
will be displayed when `org-export-show-temporary-export-buffer'
is non-nil.

You can set the following options inside of the document:
#+TWIKI_CODE_BEAUTIFY: t/nil
   controls whether code blocks are exported as %CODE{}% twiki
   blocks (requires the beautify twiki plugin).

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY BODY-ONLY EXT-PLIST)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ox-twiki-autoloads.el ends here
