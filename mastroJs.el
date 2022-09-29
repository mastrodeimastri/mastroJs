;;; node-master.el --- Personal Master package for NodeJS

;;; Commentary:
;;; export all .org files recursively from a selected dir
;;; to a selected out with ow-twbs

;;; Code:

(require 'projectile)

(defun mastrojs-open ()
  "Open nodejs server page in the xwidget buffer."
  (interactive)
  (let ((url "http://localhost:8000/"))
    (mastro-start-server)
    (message "Server Started!!")
    (browse-url-default-macosx-browser url)))

(defun mastro-start-server ()
  "Start nodejs server or update from index.js."
  (let ((abuff-name "*Async Shell Command*"))
    (unless (not (bufferp (get-buffer abuff-name)))
      (save-current-buffer
        (kill-buffer abuff-name))))
  (projectile-run-async-shell-command-in-root "node index.js"))

(provide 'mastrojs)
;;; node-master.el ends here
