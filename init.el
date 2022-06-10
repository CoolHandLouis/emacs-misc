 

;;;; My .emacs init file
;;;; Started on 02/07/2022
;;;; Style Guide: https://github.com/bbatsov/emacs-lisp-style-guide
;;;; Another style guide: https://google.github.io/styleguide/lispguide.xml#Comment_semicolons
;;;; yasg: https://www.gnu.org/software/emacs/manual/html_node/elisp/Comment-Tips.html
;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; REQUIRE PACKAGE AND SET PACKAGE ARCHIVES
;; By default, Emacs 24 or later is set up with the GnuELPA package archive. If you need to add more sources to your list-packages, include Emacs code like the following to your InitFile:

;; (also see https://www.emacswiki.org/emacs/InstallingPackages) 
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MISCELLANEOUS EMACS CUSTOMIZATONS

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
;; "makes Emacs behave sanely by using visible regions like other editors."
(transient-mark-mode 1)

;; MY CUSTOM PACKAGE LOAD PATH
;; This can be used for non-melpa packages I manually install?
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))   ; emacs lisp files?

;; Misc ???
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; Note this has no effect in MacOS GUI mode since the menu bar is part of the GUI
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Why should this be disabled? Explicitly enabling it.
(tooltip-mode 1)

;; help with parens
(show-paren-mode t)
;; (setq show-paren-style 'expression) ;; highlights entire expression between parens

;; Remap C-x C-b from list-buffers to buffer-menu
;; They are the same command, except list-buffers opens in new/other window,
;; buffer-menu opens in same window
;; (But also consider using M-x ibuffer command!)


;; keep the cursor blinking so I can find it
(setq blink-cursor-blinks 0)


;; MacOS uses M-% which emacs uses for query replace. So I'm going to
;; remap both of those to M-p and C-M-p.  p means "percent sign".
(global-set-key (kbd "M-p") 'query-replace)
(global-set-key (kbd "C-M-p") 'query-replace-regexp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Minor Modes
;;
;; Emacs minor modes are kind of like built in packages.  They don't
;; (typically?) need to be "activated" by loading, other than simply
;; assigning shortcut keys?  I'm not sure about that.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; follow mode
;; see https://www.emacswiki.org/emacs/FollowMode
;; https://github.com/emacs-mirror/emacs/blob/master/lisp/follow.el


(global-set-key (kbd "C-c f f") #'follow-mode) ; toggle follow mode
(global-set-key (kbd "C-c f 1") #'follow-delete-other-windows-and-split) ; simliar idea as C-x 1



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ELPA and other external package setups
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Beeminder
(require 'request)
(require 'anaphora)
(require 'beeminder)

;; To get the token, go to https://www.beeminder.com/api/v1/auth_token.json
(setq beeminder-username "coolhandlouis"
      beeminder-auth-token  "qubNHL7DqDK4a9y86qZM")

(global-set-key "\C-cba" #'beeminder-add-data)
(global-set-key "\C-cbg" #'beeminder-goals)
(global-set-key "\C-cbi" #'beeminder-my-goals-org)
(global-set-key "\C-cbr" #'beeminder-refresh-goal)
(global-set-key "\C-cbt" #'beeminder-submit-clocked-time)
(global-set-key "\C-cbw" #'beeminder-whoami)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable which-key package https://github.com/justbur/emacs-which-key
;;
;; NOTE: I've also installed free-keys.  Call via M-x free-keys
;; https://github.com/Fuco1/free-keys/blob/master/free-keys.el
;; 
(require 'which-key)
(which-key-mode)
(global-set-key (kbd "C-M-\`") #'which-key-show-top-level)

;; Note that this thread describes a way to be able to search or complete
;; within the *results* of which key.  Basically, an improvement to hunting
;; through the which-key pages: https://www.reddit.com/r/emacs/comments/otjn19/is_there_a_way_to_add_search_to_whichkey_instead/
;; Quick summary: use of Embark, 
;; 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; IDO MODE

;; ido allows interactive completions. consider ivy or Helm they're more advanced

;; Turn on ido-mode
(ido-mode 1)

;; You can type any characters. So "ct" will match both cat and tick in list: dog cat got tick
;; (Without this setting, ido would require you to type in order, like "ot" to match "got"
(setq ido-enable-flex-matching t)

;; Ido  mode to work with C-x C-f (find-files) then add this as well:
(setq ido-everywhere t)

;; emphasize these types of files in ido
(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))


;; Now you can customize that variable as well:
;;
;;    M-x customize-variable RET completion-ignored-extensions
;;
;; Go ahead and add all the useless object files,
;; backup, autosave and other computing flotsam you don’t want Ido to show.
(setq ido-ignore-extensions t)

;; Disable ido mode's irritating "search recent buffers" behavior
(setq ido-auto-merge-work-directories-length -1)

;; Save and restore emacs buffers and windows
(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IDO VERTICAL MODE
;;
;; TODO - additional customizations
;; https://github.com/creichert/ido-vertical-mode.el

;; Basic install from the readme
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IDO GRID MODE
;;
;; Installed but not configured yet.

;; Simple configuration when you're ready:
;; (ido-grid-mode 1)    ; turn gridmode on
;; (ido-grid-mode -1)   ; turn gridmode off

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs needs an unfill
;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph (&optional region)
      "Takes a multi-line paragraph and makes it into a single line of text."
      (interactive (progn (barf-if-buffer-read-only) '(t)))
      (let ((fill-column (point-max))
            ;; This would override `fill-column' if it's an integer.
            (emacs-lisp-docstring-fill-column t))
        (fill-paragraph nil region)))
    
    ;; Handy key definition

;; I don't want this defined at this time.
;; (define-key global-map "\M-q" 'unfill-paragraph)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some font choices
;; set up fonts for different OSes. OSX toggles to full screen.
;;

(setq myfont "InputSerif")

;; COMMENTED CODE BELOW IS A WAY TO CUSTOMIZE FOR DIFFERENT MACHINES
;;
;;(cond ((string-equal system-name "dls-macbook-2017.local") (set-face-attribute 'default nil :
;; font myfont :
;; height 144) (toggle-frame-fullscreen))
;;
;;((string-equal system-name "doesnotexist1.local") (set-face-attribute 'default nil :
;; font myfont :
;; height 144))
;;
;;((string-equal system-name "dne2") (set-face-attribute 'default nil :
;; font myfont :
;; height 106))
;;
;;((string-equal system-name "dne3") (set-face-attribute 'default nil :
;; font myfont :
;; height 104)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IVY mode installed (with counsel and swiper)
;; IVY is interactive commpletions
;; See http://oremacs.com/swiper/ for documentation.
(if nil
    (load "~/.emacs.d/init-ivy.el")
    (message "Ivy not installed.")
    )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG MODE CONFIGURATIONS!!!


;; Enable Org mode





;; removing this because of https://emacs.stackexchange.com/questions/70081/how-to-deal-with-this-message-important-please-install-org-from-gnu-elpa-as-o
;; (basically, this method is deprecated)
;;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(require 'org)


;; The following command will make lines wrap in org mode.
;; M-q is bound to fill-paragraph by default, but probably you don't
;; want to use it within org-mode.
(define-key org-mode-map "\M-q" 'toggle-truncate-lines)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The following is the default in recent emacsen so prob not needed.
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;(add-to-list 'auto-mode-alist '("\\.text\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;; Don't show me an empty line between collapsed trees
;; This sets the threshold before an empty line is shown
;; 0=don't show any lines, 1=show max 1 line, etc.
(setq org-cycle-separator-lines 1)

;; Tell org to use UUID's for links so they can be found even if the target
;; changes locaation.
;; Note that when I use templates, I might want to change this to another value
;; to avoid unnecessary proliferation of uuid.  See docs on the variable.
;;(setq org-id-link-to-org-use-id t)
(setq org-id-link-to-org-use-id 'create-if-interactive)

;; This is the default setting, just want to be explicit.
(setq org-id-method 'uuid)

;; tell org to use ido for completions. any chars in any order to select
(setq org-completion-use-ido t)

;; Don't delete hidden trees
(setq org-ctrl-k-protect-subtree t)

;; If idle more than 15 min, notify me
;; note on macos, this is based on MACOS idle time, not just emacs idle time!
;; There might be ways to get this to work similarly on other OS's.
(setq org-clock-idle-time 15)

;; dont' show done tasks in agenda view
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)


;; start the emacs server so I can open files from the command line in this instance
(server-start)

;; real-auto-save saves all open buffers every X seconds
;; this might NOT be what you want in some cases, so I limit it to
;; my org mode files only.
;;
;; See https://github.com/ChillarAnand/real-auto-save
;; https://www.emacswiki.org/emacs/AutoSave
;; https://www.reddit.com/r/emacs/comments/tqpcie/newbie_how_would_i_add_this_orgmodehook_saving/
;; THIS MIGHT BE DATED: https://emacs.stackexchange.com/questions/477/how-do-i-automatically-save-org-mode-buffers
(require 'real-auto-save)
(add-hook 'org-mode-hook 'real-auto-save-mode)
(setq real-auto-save-interval 10) ;; every X seconds

;; set git commit key-binding. I don't know what this is doing really
;; taken from https://www.reddit.com/r/emacs/comments/ticvrq/org_mode_are_you_ever_concerned_that_you_might/i1kwjwm/?context=3
;;
;; keybinding:
;;
;; C-1    commit to git silently
;;(global-set-key [(control \1)]
;;  (lambda () (interactive)
;;      (execute-shell-command-on-buffer "git commit -a -m\"emacs newbie commit.\" ")
;;      (message "Issued git command")
;; 
;;  )
;;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bind C-c k to execute a git commit.
;;
;; This must be VERY non-standard.
;; I got this from https://www.reddit.com/r/emacs/comments/ticvrq/org_mode_are_you_ever_concerned_that_you_might/i1kwjwm/
;; And had to figure out two bugs, to correct that advice to the following, using
;; https://stackoverflow.com/questions/10121944/passing-emacs-variables-to-minibuffer-shell-commands
;; and
;; https://gist.github.com/tenpn/2367513

(defun execute-shell-command-on-buffer (shell-command-text)
    (interactive "MShell command:")
    (shell-command (format shell-command-text (shell-quote-argument buffer-file-name)))
    )


;; 
(global-set-key (kbd "C-c k")
  (lambda () (interactive)
    (execute-shell-command-on-buffer "git commit -a -m\"execute-shell-command-on-buffer commit.\" ")
    (message "Issued git command")
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set up org mode
(setq org-startup-indented t)
(setq org-startup-folded "showall")
(setq org-directory "~/org")

;; Suggested by https://orgmode.org/guide/Introduction.html#Introduction
;; "useful in any Emacs buffer, not just Org buffers. Please choose suitable keys yourself."
(global-set-key (kbd "C-c l") #'org-store-link)
;;changed this to default to org-id-store-link
;;(global-set-key (kbd "C-c l") #'org-id-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)


;; Swap C-> and C-! as that seems to make more sense to me
(define-key org-mode-map (kbd "C-c !") 'org-goto-calendar)
(define-key org-mode-map (kbd "C-c >") 'org-time-stamp-inactive)


(setq org-default-notes-file "~/org/inbox.org")

(setq org-capture-templates 'nil)  ;; this would use the org default capture template

;; This is a copy of the org default capture template
(setq org-capture-templates
     '(("t" "Task" entry (file+headline "~/org/inbox.org" "Tasks")
            "* TODO %?\n  %u\n  %a")))

;; Make changes to this one
(setq org-capture-templates
     '(("t" "Task" entry (file+headline "~/org/inbox.org" "Tasks")
            "* TODO %^{Headline}\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?%a")))

;; Cycle for TODO states
;; Note that you can have multiple sequences
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "|" "DONE(d)")
;;         (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
;;         (sequence "|" "CANCELED(c)")))
;;
;; also note you can require notes or automate time stamps
;;
;; (setq org-todo-keywords
;;      '((sequence "TODO(t)" "PROJ(p)" "WAIT(w@/!)" "SOMEDAY(s)" "ONEDAY(o)" "INBOX(i)" "|" "DONE(d!)" "CANCELED(c)")))
;;
;; ROLL is for rolling forward something without wanting to track it as "DONE".  DONE should
;; be reserved for something actually done.
;;
;; JUMP(j!) is for "jumping forward" or rolling forward without wanting to call it DONE.

;;;;;;;;;;;;;;;;;;
;; Note that for repeating events, what event does it reset to?
;;
;; ANSWER: The target state is taken from, in this sequence,
;; 1. ‘REPEAT_TO_STATE’ property
;; 2. the variable org-todo-repeat-to-state if it is a string
;; 3. the previous TODO state if org-todo-repeat-to-state is t
;; 4 the first state of the TODO state sequence.
;;
;; I am defaulting to #3, the previous TODO state.  That means a repeating
;; event is not a workflow state.  We don't move a repeating event from TODO=>NEXT=>DONE=>TODO
;;
;; If I have a repeating event moved from TODO=>NEXT, then I mark it as "DONE", then the date
;; will be updated and it will cycle fromm "DONE" to "NEXT" again, since that was its previous
;; state.  If I want to use a workflow on a repeating state, I'll need to set the
;; REPEAT_TO_STATE property for that task.
(setq org-todo-repeat-to-state t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "TOREFILE(f)" "=====>(=)" "REMBER(m)" "NEXT(n!)" "PROJ(p)" "TOBEE(b)" "HABIT(h)" "RECR(R)" "APPT(a)" "WAIT(w@)" "WIP(k!)" "SOMEDAY(s!)" "ONEDAY(o!)" "HOLD(h@)" "Z(z)" "|" "IDEA(i!)" "DONE(d!)" "DATA(a!)" "LOG(l!)" "CANCELLED(c@)" "ROLL(r!)")))

;; Don't allow edits of invisible text
(setq-default org-catch-invisible-edits 'smart)

;; This allows tab to be used for folding anywhere under the heading 
(setq org-cycle-emulate-tab 'white)

;; activate org-habits
;; See https://lists.gnu.org/archive/html/emacs-orgmode/2010-04/msg00122.html 
(add-to-list 'org-modules 'org-habit)

(setq org-agenda-files '("~/org"))
;; (setq org-agenda-files "~/org/")
;; setq org-agenda-files (list "~/org/work.org"
;;                             "~/org/school.org" 
;;                             "~/org/home.org"))


;; Refile targets
;; This confused me at first, so here's some examples
;; see explanations in these posts
;; https://www.reddit.com/r/orgmode/comments/g5006o/can_you_add_the_current_file_to_orgrefiletargets/
;; https://www.reddit.com/r/emacs/comments/4366f9/how_do_orgrefiletargets_work/
;; (setq org-refile-targets '((nil :maxlevel . 9)
;;                            (org-agenda-files :maxlevel . 3)
;;                           (org-buffer-list :maxlevel . 2))
;; )

;;(setq org-refile-targets (quote (("tickler.org" :maxlevel . 1)
;;                                          ("organizer.org" :level . 1)
;;                                          ("someday.org" :level . 2))))

;; So here's my refile targets command
;; nil means "current buffer
;; I'm just going with above example for now 
(setq org-refile-targets '((nil :maxlevel . 9)))

;; I was using (setq org-refile-targets '((nil :maxlevel . 9))) but need go grow,
;; so now set it to org-agenda-files
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 9))))

;; Ok I need even better now.
(setq org-agenda-files
      '("notes.org" "inbox.org" "orgzly.org" "journals.org"))

;; The first number is the level I can refile in current buffer
;; The second number is the level I can refile in other buffers.
(setq org-refile-targets
      '((nil :maxlevel . 9)
        (org-agenda-files :maxlevel . 9)))

;; Make tags more visible in agenda
(setq org-agenda-tags-column 80)

;; Standard set of tags
;; See https://orgmode.org/manual/Setting-Tags.html
(setq org-tag-alist '(("today" . ?t) ("@home" . ?h) ("@laptop" . ?l) ("@CLS" . ?c) ("@Out" .?o) ("refactor" . ?r) ("ignore" .?i)))

;; Switch to "Google Style" searching.  The default behavior of org agenda
;; search command `C-c a s` is to require a + sign on the first word so for example
;;
;;     dog  cat      will search for the literal string "dog   cat"
;;     dog +cat      will search for the literal string "dog +cat"
;;    +dog +cat      will search for heading containing both dog and cat
;;  
;; In Google search we have this:
;;
;;     dog cat       will search for pages containing both dog and cat.
;;    "dog cat"      will search for pages containing the string "dog cat"
;;
;; so the following setting switchs the default behavior to "google style"
;; This does not limit the ability of the search at all. It just means that if you
;; want to search for longer strings, you need to use quotes.
(setq org-agenda-search-view-always-boolean t)

(setq org-refile-allow-creating-parent-nodes 'confirm)
;; Refile using outline path
;;
;; not sure what the different options do, I think 'nil' means file to
;; top level only.
;;
;; Documentation:
;; Non-nil means provide refile targets as paths.
;; So a level 3 headline will be available as level1/level2/level3.
;; 
;; When the value is ‘file’, also include the file name (without directory)
;; into the path.  In this case, you can also stop the completion after
;; the file name, to get entries inserted as top level in the file.
;; 
;; When ‘full-file-path’, include the full file path.
;; 
;; When ‘buffer-name’, use the buffer name.
(setq org-refile-use-outline-path 'file)

;; If using ido (or other completion package), you can set to nil so
;; you don't need to complete in steps
;;
;; SETTING THIS TO NIL WAS CONFUSING AT FIRST SO I'M TURNING IT ON
;; I MIGHT TURN BACK OFF LATER
(setq org-outline-path-complete-in-steps t)

;; When refiling, set new items to be put as the first child instead of last
;; nil = last, non-nil = first
(setq org-reverse-note-order t)

;; Entries with repeat shedule and ":PROPERTY: habit" only show one event in Agenda
;; (setq org-agenda-show-future-repeats 'next)
;;
;;  org-agenda-show-future-repeats and org-agenda-prefer-last-repeat

;; I'm hitting C-x C-t (transpose-lines) too often when I mean C-c C-t
;; Just redefine to nil
(with-eval-after-load 'Org
  (bind-key "C-x C-t" #'nil))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Put the full current context in the header.
;; taken from this excellent Q/A: https://emacs.stackexchange.com/questions/61101/keep-displaying-current-org-heading-info-in-some-way
;; 

(defun ndk/heading-title ()
   "Get the heading title."
   (save-excursion
     (if (not (org-at-heading-p))
       (org-previous-visible-heading 1))
     (org-element-property :title (org-element-at-point))))

(defun ndk/org-breadcrumbs ()
   "Get the chain of headings from the top level down
    to the current heading."
   (let ((breadcrumbs (org-format-outline-path
                         (org-get-outline-path)
                         (1- (frame-width))
                         nil " | "))
         (title (ndk/heading-title)))
     (if (string-empty-p breadcrumbs)
         title
       (format "%s | %s" breadcrumbs title))))



;; This includes the full heading.  If you just want the containing heading, use
;;  (setq header-line-format '(:eval (ndk/heading-title)))
(defun ndk/set-header-line-format()
  (setq header-line-format '(:eval (ndk/org-breadcrumbs))))

(add-hook 'org-mode-hook #'ndk/set-header-line-format)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Avoid slow-downs.

;; See https://notes.neeasade.net/annoying-org-typing-slowdowns.html



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG MODE CONFLICT NOTES
;; 
;; https://orgmode.org/manual/Conflicts.html
   ;; `cua.el' by Kim F. Storm
   ;; `ecomplete.el' by Lars Magne Ingebrigtsen
   ;; `filladapt.el' by Kyle Jones
   ;; `viper.el' by Michael Kifer
   ;; `windmove.el' by Hovav Shacham
   ;; `yasnippet.el'
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; AVY BINDINGS https://github.com/abo-abo/avy  
;;
;; Avy lets you jump anywhere on the screen using a one or
;; two character input.
;;
;; So to jump to the word "Score" you might type
;;
;;    C-' RET sc
;;
;; Then Avy will change all instances of sc to unique one or two
;; letters such as
;;
;;    xyore
;;
;; Then you press xy and it'll take you to that position.

    (require 'avy)

    ;; Integrate avy with iSearch
    ;; First enter iSearch, then whatever pattern to search, then C-'
    ;; C-s PATTERN C-'
    ;; Note that the C-' is bound here ONLY in the context of an interactive iSearch
    (avy-setup-default)  
          
    ;; not sure what this does  
    ;; (global-set-key (kbd "C-c C-j") 'avy-resume)  
        
    ;; Suggested bindings from avy github docs  
    (global-set-key (kbd "C-:") 'avy-goto-char)  
    (global-set-key (kbd "C-'") 'avy-goto-char-2)  
    (global-set-key (kbd "M-g f") 'avy-goto-line)  
    (global-set-key (kbd "M-g w") 'avy-goto-word-1)  
    (global-set-key (kbd "M-g e") 'avy-goto-word-0)  
    
;; For some reason my C-' isn't gettig bound in my org file. I think it has
;; something to do with this code:
;; ###autoload
;; (defun avy-setup-default ()
;;   "Setup the default shortcuts."
;;   (eval-after-load "isearch"
;;     '(define-key isearch-mode-map (kbd "C-'") 'avy-isearch)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;; Avy Org-mode commands NOTES

	;; avy-org-goto-heading-timer: Type part of an Org heading. When you stop typing,
	;; if only one heading on the screen matches, it will be jumped to; if more than
	;; one matches, you can jump to a heading with Avy. This is like avy-goto-char-timer
	;; but for Org headings.

	;; avy-org-refile-as-child: With point in an entry you want to refile, run this command,
	;; select a heading with Avy, and the entry will be refiled as its first child heading.
	;; This makes it quick and easy to refile to headings that are visible on-screen, even
	;; to other windows or buffers.





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; avy/ace jump mode
;;(use package avy
;;     :ensure t
;;     :bind ("M-s" . avy-goto-char))

;; (global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
;; (global-set-key (kbd "s-.") 'avy-goto-word-or-subword-1)
;; (global-set-key (kbd "s-w") 'ace-window)

;; Standard avy 2 char jump mode

;; The following sets C-' as a global keymap, but that does NOT override
;; org mode's use of C-'  because of emacs' Active Bindings.  See
;; https://www.reddit.com/r/emacs/comments/tapqik/why_doesnt_my_binding_for_c_work_in_my_notesorg/i030gw2/?context=3
;; https://emacsdocs.org/docs/elisp/Active-Keymaps
;; https://jwiegley.github.io/use-package/keywords/#bind-bind
;; 
(global-set-key (kbd "C-'") 'avy-goto-char-2)
;;
;; So instead we use this (from reddit suggestion, I don't know how this works (yet).
(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map (kbd "C-'") #'avy-goto-char-2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRE-CUSTOM CHANGES
;;
;; Make some manual custom changes.  These can get overwritten
;; by the EZ Custom Changes stored in .emacs-custom.el
;; So if these don't work, check that file.
;; These may eventually go in a separate file.

;; Priorities and priority faces
(setq org-default-priority ?A)
(setq org-highest-priority ?A)
(setq org-lowest-priority ?D)
(setq org-priority-faces '((?A . (:foreground "#FF0000" :weight bold))
                           (?B . (:foreground "#000000" :weight normal))
                           (?C . (:foreground "#000000" :weight normal))
                           (?D . (:foreground "#777777"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUSTOM CHANGES BY 3RD PARTY SHOULD NOT GO IN *THIS* FILE
;; (Instead, it should go into .emacs-custom.el
;;
;; I think this should be last in the file.  It needs to be after org-mode stuff.

(setq custom-file "~/.emacs.d/.emacs-custom.el")
(load custom-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Overrides to anything I put in custom changes
''

;; Harsh red
(set-face-attribute 'org-todo nil :box '(:line-width 1 :color "#808080") :weight 'normal  :foreground "#FF00FF" :background "#f0f0f0")

;;(set-face-attribute 'org-imminent-deadline nil :foreground "#FF33FF")


(set-face-attribute 'org-warning nil :background "#ffffa0" :foreground "#ff33ff" :weight 'normal)

;; Softer Color purplish
;; org-warning is used for org-imminent-deadline
(set-face-attribute 'org-warning nil :background "#ffffd0" :foreground "#aa33cc" :weight 'normal)
(set-face-attribute 'org-upcoming-deadline nil :foreground "#aa33cc")
(set-face-attribute 'org-upcoming-distant-deadline nil :foreground "#aa33cc")

(set-face-attribute 'org-todo nil :box '(:line-width 1 :color "#808080") :weight 'normal  :foreground "#aa33cc" :background "#f0f0f0")

(set-face-attribute 'org-agenda-done nil :foreground "#808080")

;; Pale Turquoise is "#afeeee". I made it softer and lighter
(set-face-attribute 'org-scheduled-today nil :foreground "#222222" :background "#dff8f8")
(set-face-attribute 'org-agenda-date-today nil :foreground "#222222" :background "#dff8f8")

(set-face-attribute 'org-agenda-calendar-event nil :foreground "#222222")


;; maybe I want black todo font
(set-face-attribute 'org-todo nil :box '(:line-width 1 :color "#808080") :weight 'normal  :foreground "#000000" :background "#f0f0f0")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; POST CUSTOM-CHANGES CHANGES
;;
;; If I want to override a custom change, make it below here.
;;
;; This should be the really last stuff in this file.
;;
;; I don't know if I'll need this.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Override for org-meta-return to use org-insert-heading-after-current instead
;; of org-insert-heading
;; I just copied org-meta-return
(defun dls-org-meta-return (&optional arg)
  "David Stein override. Insert a new heading or wrap a region in a table.
Calls `org-insert-heading-after-current' [INSTEAD OF ORG-INSERT-HEADING], `org-insert-item' or
`org-table-wrap-region', depending on context.  When called with
an argument, unconditionally call `org-insert-heading'."
  (interactive "P")
  
  (org-check-before-invisible-edit 'insert)
  (or (run-hook-with-args-until-success 'org-metareturn-hook)
      (call-interactively (cond (arg #'org-insert-heading-after-current)
				((org-at-table-p) #'org-table-wrap-region)
				((org-in-item-p) #'org-insert-item)
				(t #'org-insert-heading)))))



