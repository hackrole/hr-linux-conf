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
   '(ob-dart el-mock deft org-noter-pdftools org-noter clipetty rustic traad jedi vimish-fold ob-typescript youdao-dictionary jupyter csv-mode vue-mode edit-indirect ssass-mode vue-html-mode twittering-mode terraform-mode hcl-mode restclient-helm protobuf-mode pony-mode ob-restclient ob-http nix-mode leetcode aio ibuffer-projectile helm-nixos-options dash-docs graphviz-dot-mode graphql-mode geiser fasd transient es-mode spark polymode easy-hugo disaster company-restclient restclient know-your-http-well company-nixos-options nixos-options company-c-headers company-auctex cmake-mode lv clang-format parseedn parseclj a auctex treepy graphql dash-at-point ranger projectile-speedbar sr-speedbar flycheck-rust flycheck-pos-tip flycheck-haskell imenu-list vimrc-mode dactyl-mode jinja2-mode company-ansible ansible-doc ansible salt-mode mmm-jinja2 yasnippet-snippets ag zeal-at-point helm-dash sesman helm-gitlab gitlab magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache vmd-mode org-projectile org-category-capture org-present org-pomodoro org-mime org-download htmlize gnuplot xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help pdf-tools gmail-message-mode ham-mode html-to-markdown flymd edit-server fuzzy company-web web-completion-data company-quickhelp company-go company-cabal clojure-snippets magithub let-alist iedit anzu undo-tree spinner winum white-sand-theme powerline solarized-theme smartparens rebecca-theme pos-tip madhat2r-theme dash-functional parent-mode flycheck-credo flx exotica-theme ghub evil goto-chg request-deferred deferred diminish highlight bind-map bind-key packed f s dash avy popup async erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks yaml-mode web-mode web-beautify toml-mode typescript-mode tagedit slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake racer pug-mode plantuml-mode ob-elixir noflet minitest lua-mode livid-mode skewer-mode simple-httpd less-css-mode js2-refactor js2-mode js-doc intero hlint-refactor hindent helm-hoogle helm-css-scss haskell-snippets haml-mode go-guru go-eldoc go-mode flycheck-mix flycheck erlang ensime sbt-mode scala-mode emmet-mode company-ghci company-ghc ghc haskell-mode coffee-mode cmm-mode clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode chruby cargo rust-mode bundler inf-ruby alchemist elixir-mode smeargle orgit org magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit git-commit with-editor company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete pkg-info epl helm projectile helm-core hydra mmm-mode markdown-toc markdown-mode gh-md tn-theme docker json-mode tablist magit-popup json-snatcher nginx-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic mu4e-alert ht alert log4e mu4e-maildirs-extension gntp dockerfile-mode docker-tramp json-reformat sql-indent zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme ein websocket dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(safe-local-variable-values
   '((org-download-image-dir . "static/images/mono")
     (org-download-heading-lvl)
     (org-download-image-dir . static/images/mono)
     (python-format-on-save)
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
