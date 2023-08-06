;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(asciidoc
     nginx
     php
     csv
     ansible
     graphviz
     vimscript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (erc :variables
            erc-server-list
            '(("irc.freenode.net"
               :port "6697"
               :ssl t
               :nick "hackrole"
               :password "freeme")))
     helm
     ;; ivy
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     nixos
     ;; wakatime dashboard
     ;; expand $HOME variable
     (wakatime :variables wakatime-cli-path "/home/hackrole/.asdf/shims/wakatime")
     ;; racket
     racket
     ;; c and c++
     (c-c++ :variables c-c++-backend 'lsp-clangd
            c-c++-lsp-enable-semantic-highlight 'rainbow
            c-c++-enable-google-style t)
     ;; password from pass
     pass
     (restclient restclient-use-org t)
     (tree-sitter :variables tree-sitter-syntax-highlight-enable t
                  tree-sitter-fold-enable t)
     ;; sphinx and rst-mode
     sphinx
     restructuredtext
     ;; flycheck for syntax checking
     (syntax-checking :variables syntax-checking-use-original-bitmaps t)
     ;; contains auto-complete/yasnippet/company
     (auto-completion :variables auto-completion-enable-sort-by-usage t
                        auto-completion-return-key-behavior nil
                        auto-completion-tab-key-behavior nil
                        auto-completion-complete-with-key-sequence nil ;; this not work
                        auto-completion-complete-with-key-sequence-delay 0
                        auto-completion-minimum-prefix-length 1
                        auto-completion-private-snippets-directory (concat)
                        auto-completion-enable-snippets-in-popup t
                        spacemacs-default-company-backends '(company-files company-capf company-yasnippet)
                        require-final-newline nil
                        auto-completion-enable-help-tooltip t)
     ;; better-defaults
     ;; themes, no which I like
     themes-megapack
     ;; imenu-list, like vim-tagbar
     imenu-list
     ;; dash doc viewer
     (dash :variables  helm-dash-browser-func 'eww
           ;; dash-autoload-common-docsets nil
           ;; helm-dash-docset-newpath "/Users/daipeng/Library/Application Support/Dash/DocSets"
           dash-docs-docset-path "/Users/daipeng/Library/Application Support/Dash/DocSets"
           ;; config for ubuntu zeal
           ;; dash-docs-docset-newpath "~/.local/share/Zeal/Zeal/docsets"
           )
     git
     ;; (github :variables gist-ask-for-description t
     ;;         gist-ask-for-filename t)
     ;; plantuml
     plantuml
     ;; saltstack
     salt
     ;; ansible, XXX this now will lead describe-key not work
     ;;ansible
     ;; vimscript
     vimscript
     (latex :variables latex-build-command "LaTex"
            latex-enable-folding t
            latex-enable-magic t)
     osx
     eww
     ;; markdown
     (markdown :variables markdown-live-preview-engine 'vmd
               markdown-mmm-auto-modes '("c" "c++" "rust" "python" "go" "scala" ("elisp" "emacs-lisp")))
     ;; terraform
     (terraform :variables terraform-auto-format-on-save t
                terraform-backend 'lsp)
     ;; interative debug
     dap
     ;; fasd
     fasd
     command-log
     (elfeed :variables elfeed-feeds '(("https://draveness.me/feed.xml" linux golang)
                                       ("https://planet.emacslife.com/atom.xml" emacs))
             elfeed-enable-goodies nil)
     (org :variables org-enable-org-journal-support t
          org-journal-dir "~/org/journal/"
          org-enable-hugo-support t
          org-enable-roam-support t
          org-enable-roam-ui t
          org-roam-ui-open-on-start nil
          org-enable-reveal-js-support t
          org-enable-roam-protocol t
          org-roam-capture-templates '(("d" "default" plain
                                        "%?"
                                        :if-new (file+head "%<%Y%m%d>-${slug}.org" "#+title: ${title}\n")
                                        :unnarrowed t)
                                       ("w" "work" plain
                                        "%?"
                                        :if-new (file+head "work/%<%Y-%m-%d>-${slug}.org" "#+title: ${title}\n")
                                        :unnarrowed t)
                                       ("s", "shortcut", plain
                                        "%?"
                                        :if-new (file+head "shortcuts/%<%Y-%m-%d>-${slug}.org" "#+title: ${title}\n")
                                        :unnarrowed t)
                                       ("p" "plan" plain
                                        "$?"
                                        :if-new (file+head "plan/%<%Y-%m-%d>-${slug}.org" "#+title: ${title}\n")
                                        :unnarrowed t)
                                        )
          org-journal-file-format "%Y-%m-%d"
          org-journal-date-format "%A, %B %d %Y")
     ;; (ranger :variables
     ;;         ranger-show-literal t
     ;;         ranger-show-hidden t
     ;;         ranger-cleanup-on-disable t
     ;;         ranger-parent-header-func 'ranger-parent-header-line
     ;;         ranger-cleanup-eagerly t
     ;;         ranger-parent-depth 2
     ;;         ranger-ignored-extensions '("mvk" "iso" "mp4"))
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            ;; shell-default-shell 'ansi-term
            shell-default-shell 'vterm
            shell-default-term-shell "/bin/zsh")
     ;; spell check make emacs hangs and slow
     ;; (spell-checking :variables
     ;;                 enable-flyspell-auto-completion t
     ;;                 spell-checking-enable-auto-dictionary t)
     ;; version-control
     ;; emacs lisp
     emacs-lisp
     (groovy :variables
             groovy-backend 'lsp
             groovy-lsp-jar-path "/opt/groovy-language-server/groovy-language-server-all.jar")
     ;; python and ipython
     (python :variables python-test-runner 'pytest
             ;; tmp nil for the project not too diff
             ;; python-enable-yapf-format-on-save nil
             python-formatter 'black
             python-format-on-save t
             python-sort-imports-on-save t
             python-backend 'lsp
             python-lsp-server 'pyright
             ;; python-backend 'anaconda
             flycheck-flake8-maximum-complexity 12)
     ;; (ipython-notebook :variables
     ;;                   ein:jupyter-default-server-command "/home/hackrole/.virtualenvs/jupyter3/bin/jupyter")
     django
     ;; scheme
     (scheme :variables scheme-implementations '(racket guile))
     ;; c/c++
     c-c++
     ;;(csharp :variables csharp-backend 'lsp)
     ;; erlang
     erlang
     ;; lsp
     (lsp :variable lsp-modeline-code-actions-enable t
          lsp-modeline-code-actions-segments '(count icon))
     ;; golang
     (go :variables go-tab-width 2
         go-format-before-save t
         go-use-golangci-lint t
         go-backend 'lsp
         godoc-at-point-function 'godoc-gogetdoc
         go-fmt-command "goimports")
     ;; haskell
     (haskell :variables haskell-completion-backend 'lsp)
     ;; html
     (html :variables web-fmt-tool 'prettier)
     (typescript :variables typescript-fmt-on-save t
                 typescript-fmt-tool 'prettier
                 typescript-linter 'eslint)
     (java :variables java-backend 'lsp)
     (javascript :variables javascript-import-tool 'import-js
                 javascript-backend 'lsp
                 javascript-import-tool 'import-js
                 javascript-lsp-linter nil
                 javascript-fmt-tool 'prettier
                 javascript-fmt-on-save t
                 javascript-repl 'nodejs
                 node-add-modules-path t
                 js2-include-node-externs t
                 js2-mode-show-strict-warnings nil
                 js2-mode-show-parse-errors nil)
     prettier
     import-js
     react
     ;; lua
     lua
     ;; plant uml
     plantuml
     ;;elixir
     ;; clojure
     ;;clojure
     ;; scala
     ;;scala
     ;; ruby
     ruby
     ;; yaml
     yaml
     ;; rust
     (rust :variables rust-format-on-save t
           rust-backend 'lsp)
     (sql :variables
          sql-backend 'lsp
          sql-lsp-sqls-workspace-config-path 'worksapce
          sql-capitalize-keywords nil)
     ;; kubernetes
     docker
     pdf
     epub
     chrome
     twitter
     ;; (mu4e :variables mu4e-maildir "~/Maildir"
     ;;       ;; mu4e-use-maildirs-extension t
     ;;       mu4e-enable-async-operations t
     ;;       mu4e-enable-notifications t
     ;;       mu4e-trash-folder "/Trash"
     ;;       mu4e-refile-folder "/Archive"
     ;;       mu4e-get-mail-command "mbsync -a"
     ;;       mu4e-update-interval 300
     ;;       ;; not show threads
     ;;       mu4e-headers-show-threads nil
     ;;       mu4e-compose-signature-auto-include nil
     ;;       mu4e-view-show-images t
     ;;       message-send-mail-function 'smtpmail-send-it
     ;;       mu4e-view-show-addresses t
     ;;       mu4e-attachment-dir "~/Downloads"
     ;;       mu4e-maildir-shortcuts
     ;;       '(("/mb_gmail/INBOX" . ?g)
     ;;         ("/mb_haomaiyi/INBOX" . ?w)
     ;;         ("/mb_hk_gmail/INBOX" . ?h)
     ;;         ("/Trash" . ?T))
     ;;       mu4e-bookmarks
     ;;       `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
     ;;         ("flag:flagged" "starred message" ?s)
     ;;         ("date:today..now" "Today's messages" ?t)
     ;;         ;; ("flag: flagged" ?f)
     ;;         ("date:7d..now" "Last 7 Days" ?w)
     ;;         ("mime:image/*" "Messages with images" ?p)
     ;;         (,(mapconcat 'identity
     ;;                      (mapcar
     ;;                       (lambda (maildir)
     ;;                         (concat "maildir:" (car maildir)))
     ;;                       mu4e-maildir-shortcuts) " OR ")
     ;;          "All inboxes" ?i))
     ;;       mu4e-account-alist
     ;;       '(("mb_gmail"
     ;;          (mu4e-sent-messages-behavior delete)
     ;;          (mu4e-sent-folder "/mb_gmail/[Gmail]/.Sent Mail")
     ;;          (mu4e-drafts-folder "/mb_gmail/[Gmail]/.Drafts")
     ;;          (user-mail-address "daipeng123456@gmail.com")
     ;;          (user-full-name "daipeng")
     ;;          (smtpmail-smtp-server "smtp.gmail.com")
     ;;          (smtpmail-smtp-user "daipeng123456@gmail.com")
     ;;          (smtpmail-stream-type starttls)
     ;;          (smtpmail-smtp-service 587)
     ;;          ;; make the gmail imap works.
     ;;          (mu4e-sent-messages-behavior delete))
     ;;         ("mb_haomaiyi"
     ;;          (mu4e-sent-messages-behavior sent)
     ;;          (mu4e-sent-folder "/mb_haomaiyi/Sent Items")
     ;;          (mu4e-drafts-folder "/mb_haomaiyi/Drafts")
     ;;          (user-mail-address "daipeng@haomaiyi.com")
     ;;          (smtpmail-smtp-server "smtp.exmail.qq.com")
     ;;          (smtpmail-smtp-user "daipeng@haomaiyi.com")
     ;;          (smtpmail-stream-type ssl)
     ;;          (smtpmail-smtp-service 465)
     ;;          (user-full-name "daipeng"))
     ;;         ("mb_gmail_hackrole"
     ;;          (mu4e-sent-folder "/mb_hk_gmail/[Gmail]/.Sent Mail")
     ;;          (mu4e-drafts-folder "/mb_hk_gmail/[Gmail]/.Drafts")
     ;;          (user-mail-address "hack.role@gmail.com")
     ;;          (user-full-name "hackrole")
     ;;          (smtpmail-smtp-server "smtp.gmail.com")
     ;;          (smtpmail-smtp-user "hack.role@gmail.com")
     ;;          (smtpmail-stream-type starttls)
     ;;          (smtpmail-smtp-service 587)
     ;;          ;; make the gmail imap works.
     ;;          (mu4e-sent-messages-behavior delete)))
     ;;       )
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(yasnippet-snippets
                                      easy-hugo
                                      es-mode
                                      ob-ipython
                                      ob-rust
                                      ob-typescript
                                      ob-go
                                      clipetty
                                      jupyter
                                      ;; projectile-direnv ;; TODO not work
                                      graphql-mode
                                      ;; buku bookmark emacs bind
                                      ebuku
                                      ;; youdao dictionary
                                      youdao-dictionary
                                      ;; open-with
                                      openwith
                                      ;; atomic-chrome similer to edit-with-emacs
                                      atomic-chrome
                                      (leetcode :location (recipe :fetcher github
                                                                    :repo "kaiwk/leetcode.el"))
                                      ;; swagger
                                      (openapi-yaml-mode :location (recipe :fetcher github
                                                                           :repo "magoyette/openapi-yaml-mode"))
                                      ;; edit with emacs
                                      atomic-chrome
                                      ;; (flycheck-swagger-tools :location (recipe :fetcher github
                                      ;;                                           :repo "magoyette/flycheck-swagger-tools"))
                                      vue-mode
                                      protobuf-mode)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   ;dotspacemacs-excluded-packages '(tn-theme)
   dotspacemacs-excluded-packages '(tn-theme
                                    company-tern
                                    firebelly-theme
                                     niflheim-theme
                                     importmagic
                                     pastels-on-dark-theme
                                     tronesque-theme
                                     zonokai-theme)
   ;; dotspacemacs-excluded-packages '(mu4e-maildirs-extension)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'lisp-interaction-mode
   ;; title format to show full file path
   dotspacemacs-frame-title "%f"
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; spacemacs-mode-line-theme
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   ;; XXX this fuck me, fuck spacemacs
   ;; dotspacemacs-line-numbers nil
   dotspacemacs-line-numbers '(:relative t
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         org-mode
                                         pdf-view-mode)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; use proxy and uninsure connection
  (setq dotspacemacs-elpa-https nil)
  ;; use hybrid edit style
  ;; (setq-default dotspacemacs-editing-style '(hybrid :variables
  ;;                                                   hybrid-mode-enable-evilified-state t
  ;;                                                   hybrid-mode-enable-hjkl-binds nil
  ;;                                                   hybrid-mode-default-state 'normal))
  ;; default themes
  (setq-default dotspacemacs-themes '(spacemacs-light leuven zenburn tn))
  (setq-default paradox-github-token "7476df42c6216208c061c0e71d786227b76e9035")
  (setq-default vc-follow-symlinks t)

  ;; leetcode init
  (setq leetcode-account "daipeng123456")
  (setq leetcode-prefer-language "python3")

  ;; golang
  (setq lsp-diagnostics-provider :none)

  ;;;; use `oxs` layout instead
  ;; skip `gls` warning on macos
  ;; (when (string= system-type "darwin")
  ;;   ;; (setq dired-use-ls-dired nil)
  ;;   (setq insert-directory-program "/usr/local/bin/gls"))

  ;; dash config
  (setq helm-dash-browser-func 'eww)

  ;; watch company-go
  ;; (defun wt (sym nv op wh)
  ;;   (message "%s %s %s %s" sym nv op wh))
  ;; (add-variable-watcher 'company-backends 'wt)
  ;; (add-variable-watcher 'go-mode-hook 'wt)

  ;; python
  (setq flycheck-python-flake8-executable "flake8")
  ;; (setq lsp-enable-snippet nil)
  ;;; use for debug lsp
  ;; (setq lsp-log-io t)
  (setq lsp-completion-provider :none)
  (setq lsp-prefer-capf nil)


  ;; pick shell variables
  (setq exec-path-from-shell-variables '("PATH"
                                         "GOPATH"
                                         "GOROOT"
                                         "GOTOOLDIR"))


  ;; react/web mode
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)
  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

  ;; set default browser
  ;;(setq browse-url-browser-function 'browse-url-chrome)
  ;; (setq browse-url-browser-function 'browse-url-chrome)

  ;; XXX this would cause this C-q bind fails
  ;;(global-git-commit-mode t)

  ;; key binding
  ;; org agent
  (global-set-key (kbd "\C-cl") 'org-store-link)
  (global-set-key (kbd "\C-ca") 'org-agenda)
  (global-set-key (kbd "\C-cb") 'org-iswitchb)
  ;; eshell
  (global-set-key (kbd "<f8>") 'eshell)
  ;; ielm
  (global-set-key (kbd "<f7>") 'ielm)
  ;; switch C-x to C-q
  (global-set-key (kbd "C-q") ctl-x-map)
  (global-unset-key (kbd "C-x"))
  ;; change font size
  (global-set-key (kbd "C-c C-=") 'text-scale-increase)
  (global-set-key (kbd "C-c C--") 'text-scale-decrease)
  ;; emms
  (global-set-key (kbd "<f6>") 'emms-playlist-mode-go)
  (global-set-key (kbd "C-c <f6>") 'emms-add-playlist)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (global-company-mode t)

  ;; TODO use pdf with zathura
  ;; (defun hr-dired-open-file ()
  ;;   "in dired, open the file named *.pdf on this line."
  ;;   (interactive)
  ;;   (let* ((file (dired-get-filename nil t)))
  ;;     (message "Opening %s..." file)
  ;;     (call-process "zathura" nil 0 nil file)
  ;;     (message "Opening %s done" file)))
  ;; (evil-define-key 'normal dired-mode-map (kbd "f") 'hr-dired-open-file)

  ;; skip boring files
  (setq-default helm-ff-skip-boring-files t)

  ;; plantuml
  (setq sp-org-plantuml-jar-path (or (getenv "sp-org-plantuml-jar-path") "/opt/plantuml/plantuml.jar"))
  (setq org-plantuml-jar-path sp-org-plantuml-jar-path)
  (setq plantuml-jar-path sp-org-plantuml-jar-path)

  ;; org-roam
  (setq org-roam-directory (file-truename "~/org-roam"))
  ;; (setq spaceline-org-clock-p t)

  ;; k8s-mode indent
  (setq k8s-indent-offset nil)

  ;; scheme config
  (setq geiser-chicken-binary "chicken-csi")

  (setq projectile-project-search-path '("~/projects/" "~/hr-conf/"))
  (setq projectile-fd-executable "fd")
  ;; (setq-default helm-boring-file-regexp-list)

  ;; enable mode line display of org clock
  (setq spaceline-org-clock-p t)

  ;; lsp-ui-mode
  (setq lsp-ui-doc-enable t)
  (setq lsp-signature-auto-activate t)
  (setq lsp-enable-symbol-highlighting t)
  ;; lsp completion
  (setq lsp-completion-provider :none)
  (setq lsp-prefer-capf nil)
  (add-hook 'python-mode-hook '(lambda () (setq company-backends '((company-capf :with company-yasnippet)))))

  ;; enable copy to clipboard while in terminal-emacs and wsl
  (global-clipetty-mode)

  ;; fix helm history duplicats
  (setq history-delete-duplicates t)
  (setq history-length 10)

  ;; config org-present
  ;; (setq org-present-text-scale 20)

  (setq visual-fill-column-width 80
        visual-fill-column-center-text t)

  (defun my/org-present-prepare-slide (buffer-name heading)
    ;; Show only top-level headlines
    (org-overview)

    ;; Unfold the current entry
    (org-show-entry)

    ;; Show only direct subheadings of the slide but don't expand them
    (org-show-children))

  (defun my/org-present-start ()
    "configure display while in org-present"
    (message "present start")
    ;; Tweak font sizes
    ;; (setq-local face-remapping-alist '((default (:height 1.5) variable-pitch)
    ;;                                    (header-line (:height 4.0) variable-pitch)
    ;;                                    (org-document-title (:height 1.75) org-document-title)
    ;;                                    (org-code (:height 1.55) org-code)
    ;;                                    (org-verbatim (:height 1.55) org-verbatim)
    ;;                                    (org-block (:height 1.25) org-block)
    ;;                                    (org-block-begin-line (:height 0.7) org-block)))

    ;; Set a blank header line string to create blank space at the top
    (setq header-line-format " ")

    ;; Display inline images automatically
    (org-display-inline-images)

    ;; Center the presentation and wrap lines
    (visual-fill-column-mode t)
    (visual-line-mode t)
    )

  (defun my/org-present-end ()
    "reset display while end org-present"
    (message "present end")
    (setq-local face-remapping-alist '((default variable-pitch default)))

    ;; Clear the header line string so that it isn't displayed
    (setq header-line-format nil)

    ;; Stop displaying inline images
    (org-remove-inline-images)

    ;; Stop centering the document
    (visual-fill-column-mode 0)
    (visual-line-mode 0))

  (add-hook 'org-present-mode-hook 'my/org-present-start t)
  (add-hook 'org-present-mode-quit-hook 'my/org-present-end t)
  (add-hook 'org-present-after-navigate-functions 'my/org-present-prepare-slide)

  ;; wakatime-mode
  ;; (global-wakatime-mode t)
  (setq wakatime-api-key (f-read-text "~/.wakatime.key" 'utf-8))

  ;; epub nov config
  (setq nov-text-width 80)
  (defun my-nov-font-setup ()
    (face-remap-add-relative 'variable-pitch :family "Source Code Pro"
                             :size 32
                             :height 1.5))
  (add-hook 'nov-mode-hook 'my-nov-font-setup)

  ;;;; setup flymd using firefox
  ;; on linux or windows
  ;; (defun my-flymd-browser-fucntion (url &rest args)
  ;;   (let ((browse-url-browser-function 'browse-url-firefox))
  ;;     (browse-url url)))
  ;; (setq flymd-browser-open-function 'my-flymd-browser-function)
  ;; on mac os
  (defun my-flymd-browser-function (url)
    (let ((process-environment (browse-url-process-environment)))
      (apply 'start-process
             (concat "firefox" url)
             nil
             "/usr/bin/open"
             (list "-a" "/Applications/Firefox Developer Edition.app" url))))
  (setq flymd-browser-open-function 'my-flymd-browser-function)

  ;; TODO add some files default readonly

  ;; set openwith
  (when (require 'openwith nil 'noerror)
    (setq openwith-associations
          (list
           (list (openwith-make-extension-regexp
                  '("mpg" "mpeg" "mp3" "mp4" "avi" "wmv" "mov" "flv"
                    "ogm" "ogg" "mkv"))
                 "mpv" '(file))
           ;; (list (openwith-make-extension-regexp
           ;;        '("pdf" ))
           ;;       "zathura" '(file))
           ))
    (openwith-mode 1))
  ;; swagger
  (require 'openapi-yaml-mode)
  ;; (require 'flycheck-swagger-tools)

  ;; edit chrome with emacs
  (require 'atomic-chrome)
  (atomic-chrome-start-server)
  (setq atomic-chrome-default-major-mode 'markdown-mode)
  (setq atomic-chrome-url-major-mode-alist
        '(("github\\.com" . gfm-mode)
          ("redmine" . texttile-mode)))
  (setq atomic-chrome-buffer-open-style 'frame)

  ;;;; org config
  ;; enable org shortkey to insert code
  (require 'org-tempo)
  ;; default fold src-block on org-file
  (setq org-hide-src-block-startup nil)
  (add-hook 'org-mode-hook 'org-hide-block-all)

  ;; ;;;; emacs-jupyter config
  ;; (require 'jupyter)
  ;; ;; this need to disable ob-ipython
  ;; (with-eval-after-load 'org
  ;;   (add-to-list 'org-babel-load-languages '(jupyter . t))
  ;;   (add-to-list 'org-babel-load-languages '(python . t))
  ;;   (add-to-list 'org-babel-load-languages '(julia . t)))

  ;;;; ob-ipython config, remember to add ipython startup.ob-ipython-config.py
  ;; http://mpwang.github.io/2019/02/07/how-to-use-ob-ipython/
  ;; (use-package use-package-ensure-system-package
  ;;   :ensure t)
  ;; (use-package ob-ipython
  ;;   :ensure-system-package ((jupyter . "pip3 install jupyter")))
  (require 'ob-typescript)
  (with-eval-after-load 'org
    (add-to-list 'org-babel-load-languages '(ipython . t))
    (add-to-list 'org-babel-load-languages '(rust . t))
    (add-to-list 'org-babel-load-languages '(go . t))
    (add-to-list 'org-babel-load-languages '(http . t))
    (add-to-list 'org-babel-load-languages '(js . t))
    (add-to-list 'org-babel-load-languages '(typescript . t))
    (add-to-list 'org-babel-tangle-lang-exts '("js" . "js"))
    (add-to-list 'org-babel-load-languages '(java . t))
    (add-to-list 'org-babel-load-languages '(haskell . t))
    ;; (nconc org-babel-default-header-args:java '((:dir . "/tmp")))
    (setq org-confirm-babel-evaluate nil)
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append))

  (defun ob-js-insert-session-header-arg (session)
    "Insert ob-js `SESSION' header argument.
    - `js-comint'
    - `skewer-mode'
    - `Indium'
   "
    (interactive (list (completing-read "ob-js session: "
                                        '("js-comint" "skewer-mode" "indium"))))
    (org-babel-insert-header-arg
     "session"
     (pcase session
       ("js-comint" "\"*Javascript REPL*\"")
       ("skewer-mode" "\"*skewer-repl*\"")
       ("indium" "\"*JS REPL*\""))))

  (define-key org-babel-map (kbd "J") 'ob-js-insert-session-header-arg)

  ;;;; TODO not work projectile direnv
  ;; (add-hook 'projectile-mode-hook 'projectile-direnv-export-variables)

  ;; latex
  (add-hook 'doc-view-minor-mode-hook 'auto-revert-mode)

  ;; - to dired-mode
  (evil-define-key 'normal dired-mode-map (kbd "-") 'dired-up-directory)
  (define-key evil-normal-state-map (kbd "-")
    (lambda ()
      (interactive)
      (dired (file-name-directory (buffer-file-name)))))

  ;; set Esc key to jk
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)

  ;; disable mypy check
  (setq-default flycheck-disabled-checkers '(python-mypy python-pylint))
  (define-coding-system-alias 'utf8 'utf-8)

  (setq-default lsp-pyls-configuration-sources ["flake8"])


  ;; dash
  (setq helm-dash-min-length 6)
  (setq helm-dash-browser-func 'eww)
  (defun go-doc ()
    (interactive)
    (setq-local dash-docs-docsets '("Go")))
  (add-hook 'go-mode-hook 'go-doc)

  ;; close flymake mode, it's fucked
  (setq flymake-diagnostic-functions '(t))
  (global-flycheck-mode 0)
  (add-hook 'python-mode-hook '(lambda () (flymake-mode 0)) t)

  ;; mu4e config for alert
  (with-eval-after-load 'mu4e-alert
    (mu4e-alert-set-default-style 'notifications)) ;; for linux
    ;; (mu4e-alert-set-default-style 'notifier)) ;; for mac OSX

  ;; javascript config
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

  ;;;; golang config
  ;; golang dap debug support
  (add-to-list 'spacemacs--dap-supported-modes 'go-mode)
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))
  (require 'dap-go)
  (add-hook 'dap-stopped-hook
            (lambda (arg) (call-interactively #'dap-hydra)))

  ;;;; golang config
  ;; golang dap debug support
  (add-to-list 'spacemacs--dap-supported-modes 'go-mode)
  (require 'dap-go)
  (add-hook 'dap-stopped-hook
            (lambda (arg) (call-interactively #'dap-hydra)))

  ;; es-mode setup
  (spacemacs/set-leader-keys-for-major-mode 'es-mode
    "u" 'es-set-endpoint-url
    "c" 'es-copy-as
    "j" 'es-execute-request-dwim
    "n" 'es-goto-next-request
    "p" 'es-goto-previous-request)

  ;; easy hugo setup
  (setq easy-hugo-basedir "~/hr-conf/hugo_note")
  (setq easy-hugo-url "https://hackrole.github.io/")
  (spacemacs/declare-prefix "o" "personal-customer-prefix")
  (spacemacs/set-leader-keys "o h" 'easy-hugo)
  (spacemacs/set-leader-keys-for-major-mode 'easy-hugo
    "n" 'easy-hugo-newpost
    "D" 'easy-hugo-article
    "p" 'easy-hugo-preview
    "P" 'easy-hugo-publish
    "o" 'easy-hugo-open
    "d" 'easy-hugo-delete
    "e" 'easy-hugo-open
    "c" 'easy-hugo-open-config
    "f" 'easy-hugo-open
    "N" 'easy-hugo-no-help
    "v" 'easy-hugo-view
    "r" 'easy-hugo-refresh
    "g" 'easy-hugo-refresh
    "s" 'easy-hugo-sort-time
    "S" 'easy-hugo-sort-char
    "G" 'easy-hugo-github-deploy
    "A" 'easy-hugo-amazon-s3-deploy
    "q" 'easy-delete-buffer)


  ;; tab always indent
  (setq tab-always-indent t)

  ;; scheme layer config
  (setq geiser-active-implementations '(racket))

  ;; force disable linum-mode in doc-view-mode(pdf-tools)
  (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

  ;; web-mode for js/vue/react
  ;; (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  ;; (add-hook 'web-mode-hook 'company-mode)
  ;; (add-hook 'web-mode-hook #'lsp-vue-enable)
  ;; vue-mode for vue
  (require 'vue-mode)
  (add-to-list 'vue-mode-hook #'smartparens-mode)
  ;; (require 'lsp-mode)
  ;; (require 'lsp-vue)
  ;; (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)
  ;; (require 'company-lsp)
  ;; (push 'company-lsp company-backends)

  ;;; python setup
  ;; XXX tmp init virtual global virtualenv
  ;;(pyvenv-workon "fitroom2.7")
  ;; (setq flycheck-python-flake8-executable "/home/hackrole/.asdf/shims/python3")
  ;; (setq flycheck-flake8rc "/home/hackrole/.config/flake8")
  ;; use pdbpp to toggle breakpoint
  (defun hr-conf/python-toggle-breakpoint ()
    "add a breakpoint for pdbpp"
    (interactive)
    (let ((trace "import pdb;pdb.set_trace()")
          (line (thing-at-point 'line)))
      (if (and line (string-match trace line))
          (kiil-while-line)
        (progn
          (back-to-indentation)
          (insert trace)
          (insert "\n")
          (python-indent-line)))))
  ;; XXX use xref-pop-marker-stack, cause anaconda error
  (add-hook 'python-mode-hook (lambda ()
                                ;; (spacemacs/set-leader-keys-for-major-mode 'python-mode
                                ;;   "gb" 'xref-pop-marker-stack)
                                (spacemacs/set-leader-keys-for-major-mode 'python-mode
                                  "db" 'hr-conf/python-toggle-breakpoint)
                                ))
  (add-hook 'python-mode-hook (lambda ()
                                (setq flycheck-select-checker 'python-flake8)))

  ;; google translate
  (setq google-translate-default-target-language "zh-CN")

  ;; set nodenv path
  ;; (setenv "PATH" (concat "/home/hackrole/.nodenv/bin" (getenv "PATH")))
  ;; (add-to-list 'exec-path "/home/hackrole/.nodenv/bin")
  ;; (add-to-list 'exec-path "/home/hackrole/.nodenv/shims")
  ;; set asdf path
  ;; (setenv "PATH" (concat "/home/hackrole/.asdf/bin" "/home/hackrole/.asdf/shims" (getenv "PATH")))
  (add-to-list 'exec-path "/home/hackrole/.asdf/bin")
  (add-to-list 'exec-path "/home/hackrole/.asdf/shims")
  ;; go env
  ;; (setenv "GOPATH" "/home/hackrole/projects/mygo")
  ;; (add-to-list 'exec-path "/home/hackrole/projects/mygo/bin")

  ;; yassnippet
  (spacemacs/declare-prefix "y" "yas-and-youdao-customer-prefix")
  (spacemacs/set-leader-keys "y d" 'yas-describe-tables)
  (spacemacs/set-leader-keys "y v" 'yas-visit-snippet-file)
  (spacemacs/set-leader-keys "y n" 'yas-new-snippet)
  (define-key evil-insert-state-map (kbd "C-e") 'yas-expand)
  (defun my-yas-hook ()
    "my yas hook to remove tab keybind"
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    (define-key yas-minor-mode-map (kbd "C-e") 'yas-expand)
    (define-key yas-keymap [(tab)] nil)
    (define-key yas-keymap (kbd "TAB") nil)
    (define-key yas-keymap [(shift tab)] nil)
    (define-key yas-keymap [backtab] nil)
    (define-key yas-keymap (kbd "C-n") 'yas-next-field)
    (define-key yas-keymap (kbd "C-p") 'yas-prev-field))
  (add-hook 'yas-global-mode-hook 'my-yas-hook)
  (add-hook 'yas-minor-mode-hook 'my-yas-hook)

  ;; youdao-dictionary
  (spacemacs/set-leader-keys "y p" 'youdao-dictionary-search-at-point)
  (spacemacs/set-leader-keys "y P" 'youdao-dictionary-search-at-point+)
  (spacemacs/set-leader-keys "y i" 'youdao-dictionary-search-from-input)
  (spacemacs/set-leader-keys "y I" 'youdao-dictionary-search-from-input+)
  (spacemacs/set-leader-keys "y v" 'youdao-dictionary-play-voice-at-point)
  (spacemacs/set-leader-keys "y V" 'youdao-dictionary-play-voice-of-current-word)

  ;; leetcode
  (spacemacs/set-leader-keys "a l" 'leetcode)
  (spacemacs/declare-prefix-for-mode 'python-mode "L" "leetcode")
  (spacemacs/set-leader-keys-for-major-mode 'python-mode
    "L t" 'leetcode-try
    "L s" 'leetcode-submit)
  ;; set for git
  (setq magit-repository-directories '("~/projects/" "~/workspaces/"))

  ;; edit key
  (define-key evil-insert-state-map (kbd "C-o") "jko")
  (define-key evil-insert-state-map (kbd "M-o") (kbd "<RET>jkO"))

  ;; add keybinding for company-complete manual
  (add-hook 'company-mode-hook (lambda()
                                 (define-key evil-insert-state-map (kbd "<f1>") 'company-complete)))

  (setq org-agenda-files '("~/org-roam/daily/" "~/org-roam/plan/"))
  ;; org-export not run code especially in org-hugo
  (setq org-export-babel-evaluate nil)

  ;; org-roam
  (setq org-roam-directory (file-truename "~/org-roam"))
  ;; (add-hook 'after-init-hook 'org-roam-mode)
  (org-roam-db-autosync-mode)
  (org-roam-ui-mode t)
  (setq org-roam-completion-everywhere t)
  (spacemacs/set-leader-keys "a o r e" 'org-roam-extract-subtree)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode
    "r e" 'org-roam-extract-subtree)

  ;; (global-set-key (kbd "C-q r l") 'helm-bookmarks)
  ;; (global-set-key (kbd "C-q s") 'helm-projectile-switch-project)
  ;; (if (featurep 'helm)
  ;;     (progn
  ;;       (global-set-key (kbd "C-q r l") 'helm-bookmarks)))
  ;; (if (featurep 'helm-projectile)
  ;;     (progn
  ;;       (define-key 'ctl-x-map (kbd "s") 'helm-projectile-switch-project)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#383838" t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (openapi-yaml-mode openwith ebuku anaphora csv-mode vue-mode edit-indirect ssass-mode vue-html-mode twittering-mode terraform-mode hcl-mode restclient-helm protobuf-mode pony-mode ob-restclient ob-http nix-mode leetcode aio ibuffer-projectile helm-nixos-options dash-docs graphviz-dot-mode graphql-mode geiser fasd transient es-mode spark polymode easy-hugo disaster company-restclient restclient know-your-http-well company-nixos-options nixos-options company-c-headers company-auctex cmake-mode lv clang-format parseedn parseclj a auctex treepy graphql dash-at-point ranger projectile-speedbar sr-speedbar flycheck-rust flycheck-pos-tip flycheck-haskell imenu-list vimrc-mode dactyl-mode jinja2-mode company-ansible ansible-doc ansible salt-mode mmm-jinja2 yasnippet-snippets ag zeal-at-point helm-dash sesman helm-gitlab gitlab magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache vmd-mode org-projectile org-category-capture org-present org-pomodoro org-mime org-download htmlize gnuplot xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help pdf-tools gmail-message-mode ham-mode html-to-markdown flymd edit-server fuzzy company-web web-completion-data company-quickhelp company-go company-cabal clojure-snippets magithub let-alist iedit anzu undo-tree spinner winum white-sand-theme powerline solarized-theme smartparens rebecca-theme pos-tip madhat2r-theme dash-functional parent-mode flycheck-credo flx exotica-theme ghub evil goto-chg request-deferred deferred diminish highlight bind-map bind-key packed f s dash avy popup async erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks yaml-mode web-mode web-beautify toml-mode typescript-mode tagedit slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake racer pug-mode plantuml-mode ob-elixir noflet minitest lua-mode livid-mode skewer-mode simple-httpd less-css-mode js2-refactor js2-mode js-doc intero hlint-refactor hindent helm-hoogle helm-css-scss haskell-snippets haml-mode go-guru go-eldoc go-mode flycheck-mix flycheck erlang ensime sbt-mode scala-mode emmet-mode company-ghci company-ghc ghc haskell-mode coffee-mode cmm-mode clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode chruby cargo rust-mode bundler inf-ruby alchemist elixir-mode smeargle orgit org magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit git-commit with-editor company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete pkg-info epl helm projectile helm-core hydra mmm-mode markdown-toc markdown-mode gh-md tn-theme docker json-mode tablist magit-popup json-snatcher nginx-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic mu4e-alert ht alert log4e mu4e-maildirs-extension gntp dockerfile-mode docker-tramp json-reformat sql-indent zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme ein websocket dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(send-mail-function (quote smtpmail-send-it))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#383838" t)
 '(lsp-prefer-flymake nil)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(org-noter-pdftools org-noter clipetty rustic traad jedi vimish-fold ob-typescript youdao-dictionary jupyter csv-mode vue-mode edit-indirect ssass-mode vue-html-mode twittering-mode terraform-mode hcl-mode restclient-helm protobuf-mode pony-mode ob-restclient ob-http nix-mode leetcode aio ibuffer-projectile helm-nixos-options dash-docs graphviz-dot-mode graphql-mode geiser fasd transient es-mode spark polymode easy-hugo disaster company-restclient restclient know-your-http-well company-nixos-options nixos-options company-c-headers company-auctex cmake-mode lv clang-format parseedn parseclj a auctex treepy graphql dash-at-point ranger projectile-speedbar sr-speedbar flycheck-rust flycheck-pos-tip flycheck-haskell imenu-list vimrc-mode dactyl-mode jinja2-mode company-ansible ansible-doc ansible salt-mode mmm-jinja2 yasnippet-snippets ag zeal-at-point helm-dash sesman helm-gitlab gitlab magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache vmd-mode org-projectile org-category-capture org-present org-pomodoro org-mime org-download htmlize gnuplot xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help pdf-tools gmail-message-mode ham-mode html-to-markdown flymd edit-server fuzzy company-web web-completion-data company-quickhelp company-go company-cabal clojure-snippets magithub let-alist iedit anzu undo-tree spinner winum white-sand-theme powerline solarized-theme smartparens rebecca-theme pos-tip madhat2r-theme dash-functional parent-mode flycheck-credo flx exotica-theme ghub evil goto-chg request-deferred deferred diminish highlight bind-map bind-key packed f s dash avy popup async erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks yaml-mode web-mode web-beautify toml-mode typescript-mode tagedit slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake racer pug-mode plantuml-mode ob-elixir noflet minitest lua-mode livid-mode skewer-mode simple-httpd less-css-mode js2-refactor js2-mode js-doc intero hlint-refactor hindent helm-hoogle helm-css-scss haskell-snippets haml-mode go-guru go-eldoc go-mode flycheck-mix flycheck erlang ensime sbt-mode scala-mode emmet-mode company-ghci company-ghc ghc haskell-mode coffee-mode cmm-mode clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode chruby cargo rust-mode bundler inf-ruby alchemist elixir-mode smeargle orgit org magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit git-commit with-editor company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete pkg-info epl helm projectile helm-core hydra mmm-mode markdown-toc markdown-mode gh-md tn-theme docker json-mode tablist magit-popup json-snatcher nginx-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic mu4e-alert ht alert log4e mu4e-maildirs-extension gntp dockerfile-mode docker-tramp json-reformat sql-indent zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme ein websocket dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(safe-local-variable-values
   '((python-format-on-save)
     (python-sort-imports-on-save)
     (org-export-babel-evaluate)
     (python-backend 'anaconda)
     (python-sort-imports-on-save nil)
     (python-format-on-save nil)
     (typescript-backend . lsp)
     (javascript-backend . lsp)
     (go-backend . go-mode)
     (go-backend . lsp)
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking)))
 '(send-mail-function 'smtpmail-send-it)
 '(sql-connection-alist
   '(("local_zipkin"
      (sql-product 'mysql)
      (sql-user "root")
      (sql-database "zipkin")
      (sql-server "127.0.0.1"))
     ("knobs"
      (sql-product 'mysql)
      (sql-user "root")
      (sql-database "knobs")
      (sql-server "127.0.0.1"))))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
)
