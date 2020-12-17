;; (load-org "lisp.org")

(load-org "python.org")

;; (load-org "prolog.org")

(setq sh-basic-offset 2)

;; (push '("\\.arr$" . pyret-mode) auto-mode-alist)

;; (require 'pyret "/path/to/code/src/pyret-lang/tools/emacs/pyret.el" t)

;; (use-package haskell-mode
;;   :ensure t
;;   :init
;;   (add-hook 'haskell-mode-hook #'interactive-haskell-mode)
;;   ;; (add-hook 'haskell-mode-hook #'turn-on-haskell-unicode-input-method)

;;   ;; patch for https://github.com/haskell/haskell-mode/issues/1553
;;   (setq haskell-process-args-ghci
;;         '("-ferror-spans" "-fshow-loaded-modules")

;;         haskell-process-args-cabal-repl
;;         '("--ghc-options=-ferror-spans --ghc-options=-fshow-loaded-modules")

;;         haskell-process-args-stack-ghci
;;         '("--ghci-options=-ferror-spans --ghc-options=-fshow-loaded-modules"
;;           "--no-build" "--no-load")

;;         haskell-process-args-cabal-new-repl
;;         '("--ghc-options=-ferror-spans --ghc-options=-fshow-loaded-modules"))

;;   ;; add-hooks above needed because below doesn't work
;;   ;; :hook (interactive-haskell-mode turn-on-haskell-unicode-input-method)
;;   )

;; (push '("\\.m$" . octave-mode) auto-mode-alist)

;; (use-package go-mode :ensure t)

(load-org "js.org")
   ;; (push '("\\.js$" . js2-mode) auto-mode-alist)

;; (push '("\\.agda$" . haskell-mode) auto-mode-alist)

;; (push '("\\.st\\'" . smalltalk-mode) auto-mode-alist)
;; (autoload 'smalltalk-mode
;;   "/path/to/code/src/smalltalk/smalltalk-mode.el" "" t)

(use-package sql
  :config (setq sql-postgres-login-params
                '((user :default "postgres")
                  (database :default "postgres")
                  (server :default "localhost")
                  (port :default 5432)))
  :hook (sql-interactive-mode
         . (lambda () (toggle-truncate-lines t))))

;; (add-hook 'rust-mode-hook
;;           #'(lambda ()
;;               (cargo-minor-mode 1)))

;; (push '("/Cargo.lock$" . toml-mode) auto-mode-alist)
;; (push '("\\.toml$" . toml-mode) auto-mode-alist)

;; (use-package scala-mode
;;   :interpreter
;;   ("scala" . scala-mode))

;; (push '("\\.sol$" . solidity-mode) auto-mode-alist)

;; (load-org "nand2tetris.org")

(load-org "org.org")

(load-org "gnus.org")

(use-package pinentry
  :ensure t
  :config (pinentry-start))

;; See https://wiki.archlinux.org/index.php/Emacs#Slow_startup_if_helm-mode_is_enabled

;; must be done before (helm-mode 1)

(use-package tramp
  :init (progn
          (setq tramp-ssh-controlmaster-options
                "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

          ;; This is temporary until the main emacs tree catches up
          ;; (add-to-list load-path "~/media/data/tie/path/to/code/src/tramp/lisp")
          )
  :demand)

;; (require 'tramp)

(add-hook 'text-mode-hook
          #'(lambda ()
              (auto-fill-mode 1)
              (flyspell-mode)
              ;; (abbrev-mode)
              ))

;; Server mode often used from browser.
(add-hook 'edit-server-text-mode-hook
          #'(lambda ()
              (auto-fill-mode -1)
              (visual-line-mode 1)))

;; Fill a line with space after a period
(setq sentence-end-double-space nil)

;; (cond
;;  ;; try hunspell at first
;;   ;; if hunspell does NOT exist, use aspell
;;  ((executable-find "hunspell")
;;   (setq ispell-program-name "hunspell")
;;   (setq ispell-local-dictionary "en_US,nl_NL")
;;   (setq ispell-local-dictionary-alist
;;         ;; Please note the list `("-d" "en_US")` contains ACTUAL parameters passed to hunspell
;;         ;; You could use `("-d" "en_US,en_US-med")` to check with multiple dictionaries
;;         '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
;;         ("nl_NL" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "nl_NL") nil utf-8))))

;;  ((executable-find "aspell")
;;   (setq ispell-program-name "aspell")
;;   ;; Please note ispell-extra-args contains ACTUAL parameters passed to aspell
;;   (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))))
;; ;;    ;; ask about dicts.
;; ;;    (defvar mydicts "en_GB,nl_NL,en_US")
;; ;;       (setq ispell-hunspell-dicts-paths-alist
;; ;;             ;; '(("en_US" "//share/en_US.aff"))
;; ;;             '(
;; ;;             ;; ("en_US" "/usr/share/hunspell/en_US.dic")
;; ;;             ("nl_NL" . "~/emacs.d/hunspell_dicts/nl_NL-ise.dic")
;; ;;             ("en_GB" . "~/emacs.d/hunspell_dicts/en_GB-ise.dic")
;; ;;             ))




;; ;;       (use-package ispell
;; ;;         :config
;; ;;         (setq ispell-program-name "hunspell"
;; ;;               ispell-dictionary mydicts
;; ;;                   ispell-really-hunspell t)
;; ;;             (ispell-set-spellchecker-params)
;; ;;             ;; ...must be called before...
;; ;;             (ispell-hunspell-add-multi-dic mydicts))

;; ;;       ;;     (defun default-dicts ()
;; ;;       ;;       (interactive)
;; ;;       ;;       (ispell-change-dictionary mydicts))

;;             (defun nederlands ()
;;             (interactive)
;;             (ispell-change-dictionary "nl_NL"))
;;           (defun english ()
;;             (interactive)
;;             (ispell-change-dictionary "en_US"))


;; ;;       ;;     (defalias #'dutch #'nederlands)


;; ;;       ;;     (defun american ()
;; ;;       ;;       (interactive)
;; ;;       ;;       (ispell-change-dictionary "en_US"))

;; ;;       ;;     (defun british ()
;; ;;       ;;       (interactive)
;; ;;       ;;       (ispell-change-dictionary "british"))

;; ;;       ;;     (defun espanol ()
;; ;;       ;;       (interactive)
;; ;;       ;;       (ispell-change-dictionary "es_ES"))

;; ;;       ;;     (defun toggle-dict ()
;; ;;       ;;       "Toggle between English and Dutch"
;; ;;       ;;       (interactive)
;; ;;       ;;       (ispell-change-dictionary
;; ;;       ;;        (if (equal ispell-current-dictionary "dutch")
;; ;;       ;;            "english"
;; ;;       ;;          "dutch"))
;; ;;       ;;       (message ispell-current-dictionary))

;; ;;       ;;     ;; (push '("american" "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil)
;; ;;       ;;     ;;       ispell-dictionary-alist)
;; ;;           ;; (setq ispell-program-name "aspell"
;; ;;           ;;       ispell-dictionary "british"
;; ;;           ;;       ispell-silently-savep t
;; ;;           ;;       ispell-really-aspell t
;; ;;           ;;       ispell-grep-command "grep")

(use-package powerthesaurus
  :commands powerthesaurus-lookup-word-at-point
  :bind (:map text-mode-map
              ("C-c p" . powerthesaurus-lookup-word-at-point)))

(use-package google-translate
  :bind ("C-c r" . google-translate-smooth-translate))

(use-package rainbow-mode :ensure t)

(use-package web-mode :ensure t)

(dolist (m '(web-mode))
  (add-hook m (lambda () (hexcolour-mode 1))))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (let ((offset 2))
    (setq web-mode-markup-indent-offset offset
          web-mode-css-indent-offset    offset
          web-mode-code-indent-offset   offset
          ))
  (whitespace-mode -1)
  (rainbow-mode 1))

(add-hook 'web-mode-hook 'my-web-mode-hook)
(add-hook 'css-mode-hook 'my-web-mode-hook)

(push '("\\.html$" . web-mode) auto-mode-alist)
(push '("\\.rdf$"  . web-mode) auto-mode-alist)

;; Validation is slow in big xml files, default to off
(setq rng-nxml-auto-validate-flag nil)
(add-hook 'nxml-mode-hook
          (defun my-nxml-validate-hook ()
            (when (< (buffer-size) 9000000)
              (rng-validate-mode 1))))

;; https://emacs.stackexchange.com/questions/20016/no-html-jsx-indentation-in-jsx-mode
(add-hook 'web-mode-hook
          (lambda ()
            ;; short circuit js mode and just do everything in jsx-mode
            (if (equal web-mode-content-type "javascript")
                (web-mode-set-content-type "jsx")
              (message "now set to: %s" web-mode-content-type))))

(load-org "dired.org")

(load-org "latex.org")

;; (git-flavoured)-markdown-mode

(defun md-hook ()
  (visual-line-mode 1)
  (auto-fill-mode -1)
  (whitespace-mode -1)
  ;; (window-margin-mode 1)
  )

;; (use-package window-margin
;;   :ensure t
;;   :commands (window-margin-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :hook (gfm-mode . markdown-mode))

(defun rmd-mode ()
  "ESS Markdown mode for rmd files"
  (interactive)
  (require 'poly-R)
  (require 'poly-markdown)
  (poly-markdown+r-mode))

(push '("\\.[Rr]md\\'" . rmd-mode) auto-mode-alist)

(use-package adoc-mode
  :ensure t
  :mode (("\\.asciidoc\\'" . adoc-mode)))

(load-org "vc.org")

(setq-default browse-url-browser-function
              '(;; ("path/to/media/hypertext" . eww-browse-url)
                ("." . browse-url-chrome))
              browse-url-chrome "/opt/google/chrome"
              browse-url-new-window-flag t
              shr-external-browser 'browse-url-firefox
              eww-download-directory "~/tmp/")

;; (load "~/.emacs.d/lisp/PG/generic/proof-site")

(push '("resources$" . xrdb-mode) auto-mode-alist)
(add-hook 'xrdb-mode-hook
          (lambda ()
            (require 'rainbow-mode)
            (push 'xrdb-mode rainbow-x-colors-major-mode-list)
            (rainbow-mode)))

(push '("settings$" . conf-mode) auto-mode-alist)

(use-package helm :ensure t)

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        ;; try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(use-package beacon
  :ensure t
  :config (beacon-mode 1))

;; https://www.reddit.com/r/emacs/comments/7bxz0v/what_feature_do_you_miss_most_from_other_editors/dpm39bi/

(use-package vlf
  :ensure t
  :defer t
  :init
  (require 'vlf-setup)
  :config
  (add-hook 'vlf-mode-hook
            (defun my-vlf-turn-off-undo-tree ()
              "undo-tree doesn't seem to work under vlf"
              (undo-tree-mode -1))))

(setq large-file-warning-threshold 14000000) ; tweakable

(add-hook 'find-file-hook
          (defun my-find-file-large-file-read-only-hook ()
            "If a file is over a given size, make the buffer read only.
Though typically large files should open with vlf, we don't
want to slow down if we pressed `o' by mistake or forgot to
install vlf."
            (when (> (buffer-size) large-file-warning-threshold)
              (setq buffer-read-only t)
              (buffer-disable-undo)
              (fundamental-mode)
              (font-lock-mode -1)
              (message "File size > %d, running in fundamental mode"
                       large-file-warning-threshold))))

(push '("\\.service$" . conf-mode) auto-mode-alist)
(push '("\\.timer" . conf-mode) auto-mode-alist)
(push '(".*/etc/netctl/.*$" . sh-mode) auto-mode-alist)

;; (use-package helpful
;;   :ensure t
;;   :config
;;   (progn
;;     (global-set-key (kbd "C-h f") 'helpful-function)
;;     (global-set-key (kbd "C-h v") 'helpful-variable)
;;     (global-set-key (kbd "C-h .") 'helpful-at-point)))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(use-package nginx-mode
  :ensure t
  :config (setq nginx-indent-level 2))

(use-package pkgbuild-mode :ensure t)

;; ;; mailcap-mode is not in packages but in our lisp dir check dit later
;; (load-library "mailcap-mode")
;; (push '("mailcap" . mailcap-mode) auto-mode-alist)

;; (use-package pdf-tool

;;   :ensure t
;;   :config
;;   (pdf-tools-install)
;;   (setq-default pdf-view-display-size 'fit-page)
;;   (use-package org-pdfview
;;     :ensure t))
;; (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)

(use-package yaml-mode :ensure t)

(use-package toml-mode :ensure t)

;; (load-library "blimp")
;; (add-hook 'image-mode-hook 'blimp-mode)

(load-org "etc.org")

;; (with-eval-after-load 'org
;;   (modify-syntax-entry ?/ "(/" org-mode-syntax-table)
;;   (modify-syntax-entry ?= "(=" org-mode-syntax-table)
;;   (add-hook 'org-mode-hook 'electric-pair-mode))
;; ;; (with-eval-after-load 'js2
;;   ;; (modify-syntax-entry ?/ "" org-mode-syntax-table)
;; ;; (modify-syntax-entry ?= "(=" org-mode-syntax-table)
;; (modify-syntax-entry ?$ "$=" bibtex-mode-syntax-table)
;; (electric-pair-mode)

;; ;; (define-minor-mode electric-pair-mode
;; ;;   "Toggle automatic parens pairing (Electric Pair mode).
;; ;; With a prefix argument ARG, enable Electric Pair mode if ARG is
;; ;; positive, and disable it otherwise.  If called from Lisp, enable
;; ;; the mode if ARG is omitted or nil.

;; ;; Electric Pair mode is a global minor mode.  When enabled, typing
;; ;; an open parenthesis automatically inserts the corresponding
;; ;; closing parenthesis.  (Likewise for brackets, etc.). To toggle
;; ;; the mode in a single buffer, use `electric-pair-local-mode'."
;; ;;   :global t :group 'electricity
;; ;;   (if electric-pair-mode
;; ;;       (progn
;; ;;         (add-hook 'post-self-insert-hook
;; ;;                   #'electric-pair-post-self-insert-function)
;; ;;         (electric--sort-post-self-insertion-hook)
;; ;;         (add-hook 'self-insert-uses-region-functions
;; ;;                   #'electric-pair-will-use-region))
;; ;;     (remove-hook 'post-self-insert-hook
;; ;;                  #'electric-pair-post-self-insert-function)
;; ;;     (remove-hook 'self-insert-uses-region-functions
;; ;;                  #'electric-pair-will-use-region)))

(abbrev-mode -1)
(setq abbrev-file-name "~/.emacs.d/.abbrev_defs")

(venv-set-location "~/.virtualenvs")

;; (add-to-list `load-path "/usr/local/share/emacs/site-lisp/mu4e")
;;    (require `mu4e)
;;    (setq mu4e-maildir "~/.mails/live")
;;    (setq mu4e-contexts
;;          `( ,(make-mu4e-context
;;       :name "live"
;;       :match-func (lambda (msg) (when msg
;;         (string-prefix-p "/live" (mu4e-message-field msg :maildir))))
;;       :vars '(
;;         (mu4e-trash-folder . "/live/[live].Trash")
;;         (mu4e-refile-folder . "/Gmail/[live].Archive")
;;         ))
;;             ,(make-mu4e-context
;;               :name "plekje"
;;               :match-func (lambda (msg) (when msg
;;         (string-prefix-p "/plekje" (mu4e-message-field msg :maildir))))
;;       :vars '(
;;         (mu4e-trash-folder . "/plekje/[live].Trash")
;;         (mu4e-refile-folder . "/plekjex/[live].Archive")
;;         ))
;;     ))

;; (setq mu4e-sent-folder "/sent"
;;         ;; mu4e-sent-messages-behavior 'delete ;; Unsure how this should be configured
;;         mu4e-drafts-folder "/drafts"
;;         user-mail-address "paul_lodder@live.nl"
;;         smtpmail-default-smtp-server "smtp-mail.outlook.com"
;;         smtpmail-smtp-server "smtp-mail.outlook.com"
;;         smtpmail-smtp-service 587)
;; (defvar my-mu4e-account-alist
;;   '(("live"
;;      (mu4e-sent-folder "/sent")
;;      (user-mail-address "paul_lodder@live.nl")
;;      (smtpmail-smtp-user "paul_lodder@live.nl")
;;      (smtpmail-local-domain "outlook.com")
;;      (smtpmail-default-smtp-server "xosmtp-mail.outlook.com")
;;      (smtpmail-smtp-server "smtp-mail.outlook.com")
;;      (smtpmail-smtp-service 587)
;;      )
;;     ("plekje"
;;      (mu4e-sent-folder "/sent")
;;      (user-mail-address "info@plekje.nu")
;;      (smtpmail-smtp-user "info@plekje.nu")
;;      (smtpmail-local-domain "plekje.nu")
;;      (smtpmail-default-smtp-server "smtp.transip.email")
;;      (smtpmail-smtp-server "smtp.transip.email")
;;      (smtpmail-smtp-service 465)
;;      )
;;      ;; Include any other accounts here ...
;;     ))
;;     (setq mu4e-update-interval 60

;;     mu4e-get-mail-command "offlineimap -a live -f Inbox,Spam,Sent")
;; (defun my-mu4e-set-account ()
;;   "Set the account for composing a message.
;;    This function is taken from:
;;      https://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html"
;;   (let* ((account
;;           (if mu4e-compose-parent-message
;;               (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
;;                 (string-match "/\\(.*?\\)/" maildir)
;;                 (match-string 1 maildir))
;;             (completing-read (format "Compose with account: (%s) "
;;                                      (mapconcat #'(lambda (var) (car var))
;;                                                 my-mu4e-account-alist "/"))
;;                              (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
;;                              nil t nil nil (caar my-mu4e-account-alist))))
;;          (account-vars (cdr (assoc account my-mu4e-account-alist))))
;;     (if account-vars
;;         (mapc #'(lambda (var)
;;                   (set (car var) (cadr var)))
;;               account-vars)
;;       (error "No email account found"))))
;; ;; (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

;; (defun my-render-html-message ()
;;   (let ((dom (libxml-parse-html-region (point-min) (point-max))))
;;     (erase-buffer)
;;     (shr-insert-document dom)
;;     (goto-char (point-min))))

;;     ;; (setq mu4e-view-show-images t)

;;     ;; use imagemagick, if available
;;     ;; (when (fboundp 'imagemagick-register-types)
;;     ;; (imagemagick-register-types))
;; (setq mu4e-html2text-command 'my-render-html-message)

;;   (setq mu4e-hide-index-message 1)
;;   (setq mu4e-hide-index-messages 1)
;;   (setf  mu4e-display-index-messages   nil)
;; (eval-after-load 'mu4e-utils
;;   '(defun mu4e-info-handler (info)))

;; (add-hook `after-change-major-mode-hook `my-after-change-major-mode-prog-mode)
;; (defun my-after-change-major-mode-prog-mode ()
;;   "Custom `after-change-major-mode-hook' behaviours."
;;   ;; (when (derived-mode-p `mu4e-compose-mode-hook)
;;   ;;   (lambda ()
;;   ;;                                   (message "JAWEL here")
;;   ;;                                   (auto-fill-mode -1)
;;   ;;                                   (visual-line-mode)))
;;   )
;; (add-hook 'mu4e-compose-mode-hook (lambda ()
;;                                     (message "JAWEL") ;; (setq
;;                                                       ;;  `auto-fill-function t)
;;                                     (auto-fill-mode -1)
;;                                     (visual-line-mode)))

;; (use-package mu4e-alert
;;   :ensure t
;;   :after mu4e
;;   :init
;;   (setq mu4e-alert-interesting-mail-query
;;     (concat
;;      "flag:unread maildir:/live/Inbox "
;;      "OR "
;;      "flag:unread maildir:/ml/INBOX"
;;      ))
;;   (mu4e-alert-enable-mode-line-display)

  ;; (defun gjstein-refresh-mu4e-alert-mode-line ()
  ;;   (interactive)
  ;;   (mu4e~proc-kill)
  ;;   (mu4e-alert-enable-mode-line-display)
  ;;   )
  ;; (run-with-timer 0 3 'gjstein-refresh-mu4e-alert-mode-line)
  ;; )

    ;; (use-package mu4e-alert
    ;;   :ensure t
    ;;   :after mu4e
    ;;   :init
    ;;   (setq mu4e-alert-interesting-mail-query
    ;;     (concat
    ;;      "flag:unread maildir:/live/INBOX"
    ;;      ))
    ;;   (mu4e-alert-enable-mode-line-display)
    ;;   (defun gjstein-refresh-mu4e-alert-mode-line ()
    ;;     (interactive)
    ;;     (mu4e~proc-kill)
    ;;     (mu4e-alert-enable-mode-line-display)
    ;;     )
    ;;   (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line)
    ;;   )

  ;; (defun my-mu4e-html2text (msg)
  ;;   "My html2text function; shows short message inline, show
  ;; long messages in some external browser (see `browse-url-generic-program')."
  ;;   (let ((html (or (mu4e-message-field msg :body-html) "")))
  ;;     (if (> (length html) 20000)
  ;;       (progn
  ;;   (mu4e-action-view-in-browser msg)
  ;;   "[Viewing message in external browser]")
  ;;       (mu4e-shr2text msg))))

  ;; (setq mu4e-html2text-command 'my-mu4e-html2text)



(setq indium-chrome-executable "/usr/bin/chromium")
  ;; (defun indium-chrome--default-executable ()
  ;;   "Return a default executable based on the OS."
  ;;   (cond ((string-equal system-type "darwin")
  ;;          "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
  ;;         ((string-equal system-type "windows-nt")
  ;;          "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe")
  ;;         (t "/usr/bin/chromium")))

  (add-to-list 'exec-path "/usr/bin/")

(defun indium-start ()
(interactive)
(if (get-buffer "*Shell Command Output*") ""
  (shell-command "chromium --remote-debugging-port=9222 http:localhost:8000"))
(indium-launch))

;; ;;advise swiper to recenter on exit
;; (defun bjm-swiper-recenter (&rest args)
;;   "recenter display after swiper"
;;   (recenter)
;;   )
;; (advice-add 'swiper :after #'bjm-swiper-recenter)

;;   (defun ajv/human-readable-file-sizes-to-bytes (string)
;;     "Convert a human-readable file size into bytes."
;;     (interactive)
;;     (cond
;;      ((string-suffix-p "G" string t)
;;       (* 1000000000 (string-to-number (substring string 0 (- (length string) 1)))))
;;      ((string-suffix-p "M" string t)
;;       (* 1000000 (string-to-number (substring string 0 (- (length string) 1)))))
;;      ((string-suffix-p "K" string t)
;;       (* 1000 (string-to-number (substring string 0 (- (length string) 1)))))
;;      (t
;;       (string-to-number (substring string 0 (- (length string) 1))))
;;      )
;;     )
;; ;; (defface highlight
;; ;;        '((((class color) (min-colors 88) (background light))
;; ;;           :background "darkseagreen2")
;; ;;          (((class color) (min-colors 88) (background dark))
;; ;;           :background "darkolivegreen")
;; ;;          (((class color) (min-colors 16) (background light))
;; ;;           :background "darkseagreen2")
;; ;;          (((class color) (min-colors 16) (background dark))
;; ;;           :background "darkolivegreen")
;; ;;          (((class color) (min-colors 8))
;; ;;           :background "green" :foreground "black")
;; ;;          (t :inverse-video t))
;; ;;        "Basic face for highlighting."
;; ;;        :group 'basic-faces)
;;   (defun paul/bytes-to-human-readable-file-sizes (bytes)
;;     "Convert number of bytes to human-readable file size."
;;     (interactive)
;;     (setq out
;;     (cond
;;      ((> bytes 1000000000) (format "%10.1fG" (/ bytes 1000000000.0)))
;;      ((> bytes 100000000) (format "%10.0fM" (/ bytes 1000000.0)))
;;      ((> bytes 1000000) (format "%10.1fM" (/ bytes 1000000.0)))
;;      ((> bytes 100000) (format "%10.0fk" (/ bytes 1000.0)))
;;      ((> bytes 1000) (format "%10.1fk" (/ bytes 1000.0)))
;;      (t (format "%10d" bytes))))
;;      ;; (message (format "string width: %s" (type-of out)))
;;      ;; (add-face-text-property 0 1 '(:foreground "red") out)
;;     out
;;     )

;;   ;; Use human readable Size column instead of original one
;;   (define-ibuffer-column size-h
;;     (:name "Size"
;;      :inline t
;;      :summarizer
;;      (lambda (column-strings)
;;        (let ((total 0))
;;          (dolist (string column-strings)
;;            (setq total
;;            ;; like, ewww ...
;;            (+ (float (ajv/human-readable-file-sizes-to-bytes string))
;;         total)))
;;         ;; (message total)
;;          (paul/bytes-to-human-readable-file-sizes total)))	 ;; :summarizer nil
;;      )
;;     (paul/bytes-to-human-readable-file-sizes (buffer-size))

;;     )

;;   ;; Modify the default ibuffer-formats
;;   (setq ibuffer-formats
;;         '((mark modified read-only locked " "
;;           (name 20 20 :left :elide)
;;           " "
;;           (size-h 11 -1 :right)
;;           " "
;;           (mode 16 16 :left :elide)
;;           " "
;;           filename-and-process)
;;     (mark " "
;;           (name 16 -1)
;;           " " filename)))

(add-hook 'persp-mode-hook (lambda ()
(setq ibuffer-use-other-window nil)))
