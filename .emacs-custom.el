;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUSTOM SET VARIABLES
;; I think maybe this should be last?

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("a014ef4b3727120595099d9984ae8d7dca7c18c2ca952eeccb9e5bef17d5bffc" "7ffc93886811a3d6b3ac1e3e0873e9ff1434a521f0030f43e6a7f81ff65a32ab" "6ba65d8f1ee44d796399dfecd573bf79ef46d51242ad216deff971495252d90d" "e985e4e74a426f4b9682636851ad6fe5036b7307957a095e4a609d66e23d848c" "810af45f734170f2a1f557ab18de765027c88b646779b02d4986ee4bee80613a" "92691cea1c27c2af59cd0f34030b221ecdcad977022c6b1ac4c8d71844b2b6be" default))
 '(list-command-history-max 3000)
 '(org-habit-graph-column 77)
 '(org-log-into-drawer t)
 '(org-priority-default 66)
 '(org-show-context-detail
   '((agenda . ancestors)
     (bookmark-jump . lineage)
     (isearch . lineage)
     (default . ancestors)))
 '(package-selected-packages
   '(counsel ido-grid-mode ido-vertical-mode ivy-avy ivy which-key bind-key free-keys ace-window)))
 ; LOGBOOK
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-set ((((class color) (min-colors 89)) (:foreground "blue" :background "white"))))
 '(custom-state ((((class color) (min-colors 89)) (:foreground "green4"))))
 '(font-lock-comment-delimiter-face ((((class color) (min-colors 89)) (:foreground "#8D8D84"))))
 '(font-lock-comment-face ((t (:foreground "gray50" :slant normal))))
 '(highlight ((t (:background "#5C7AB8" :foreground "white"))))
 '(org-agenda-calendar-event ((t (:background "white" :foreground "black" :weight normal))))
 '(org-agenda-current-time ((t (:foreground "#65baba" :underline nil))))
 '(org-agenda-date ((t (:foreground "black" :overline t :weight bold :height 1.3))))
 '(org-agenda-date-today ((t (:background "pale turquoise" :foreground "black" :overline t :weight bold :height 1.6))))
 '(org-agenda-date-weekend ((t (:foreground "black" :overline t :weight bold :height 1.3))))
 '(org-agenda-structure ((t (:foreground "black" :weight normal :height 1.4))))
 '(org-block ((t (:extend t :background "white" :foreground "gray53"))))
 '(org-block-begin-line ((t (:background "gray95" :foreground "black" :underline "#A7A6AA"))))
 '(org-block-end-line ((t (:background "gray95" :foreground "black" :overline "#A7A6AA"))))
 '(org-checkbox ((t (:background "#EEEEEE" :foreground "black" :box nil :weight bold))))
 '(org-date ((((class color) (min-colors 89)) (:underline t :foreground "#00459E"))))
 '(org-default ((t (:background "#FFFFFF" :foreground "#000000"))))
 '(org-document-info ((t (:foreground "gray50"))))
 '(org-document-title ((t (:foreground "grey50" :weight normal))))
 '(org-done ((((class color) (min-colors 89)) (:weight bold :box (:line-width 1 :color "#BBBBBB") :foreground "#BBBBBB" :background "#F0F0F0"))))
 '(org-drawer ((t (:inherit shadow))))
 '(org-ellipsis ((((class color) (min-colors 89)) (:underline nil :box (:line-width 1 :color "#999999") :foreground "#999999" :background "#FFF8C0"))))
 '(org-footnote ((((class color) (min-colors 89)) (:underline t :foreground "#008ED1"))))
 '(org-formula ((((class color) (min-colors 89)) (:foreground "chocolate1"))))
 '(org-habit-alert-face ((t (:background "#ffffd0" :foreground "#aa33cc" :weight bold))))
 '(org-habit-alert-future-face ((t (:background "#aa33cc" :foreground "#ffffd0"))))
 '(org-habit-clear-face ((t (:background "black" :foreground "white"))))
 '(org-habit-clear-future-face ((t (:background "#888888"))))
 '(org-habit-overdue-face ((t (:background "#ffffd0" :foreground "#aa33cc"))))
 '(org-habit-overdue-future-face ((t (:background "#ffaaff"))))
 '(org-habit-ready-face ((t (:background "#33dd33"))))
 '(org-habit-ready-future-face ((t (:background "#33dd33"))))
 '(org-headline-done ((((class color) (min-colors 89)) (:height 1.0 :weight normal :strike-through t :foreground "#ADADAD"))))
 '(org-hide ((t (:foreground "white"))))
 '(org-level-1 ((t (:extend nil :background "white" :foreground "black" :overline nil :weight normal :height 1))))
 '(org-level-2 ((t (:extend nil :background "white" :foreground "DarkOrchid4" :overline nil :weight normal :height 1.0))))
 '(org-level-3 ((t (:extend nil :background "white" :foreground "#005522" :weight normal :height 1.0))))
 '(org-level-4 ((t (:extend nil :foreground "dark red" :slant normal :weight normal :height 1.0))))
 '(org-level-5 ((t (:extend nil :foreground "#0077cc" :slant normal :weight normal :height 1.0))))
 '(org-level-6 ((t (:extend nil :foreground "DarkOrchid4" :slant normal :weight normal :height 1.0))))
 '(org-level-7 ((t (:extend nil :foreground "dark olive green" :slant normal :weight normal :height 1.0))))
 '(org-level-8 ((t (:extend nil :foreground "OrangeRed4" :slant normal :weight normal :height 1.0))))
 '(org-link ((t (:foreground "blue" :underline t :weight normal))))
 '(org-list-dt ((((class color) (min-colors 89)) (:weight bold :foreground "#335EA8"))))
 '(org-meta-line ((t (:inherit font-lock-comment-face))))
 '(org-property-value ((((class color) (min-colors 89)) (:foreground "#00A000"))) t)
 '(org-quote ((((class color) (min-colors 89)) (:slant italic :foreground "dim gray" :background "#FFFFE0"))))
 '(org-scheduled ((t (:foreground "black"))))
 '(org-scheduled-previously ((t (:foreground "chartreuse4"))))
 '(org-scheduled-today ((t (:background "pale turquoise" :foreground "#000000" :weight normal))))
 '(org-special-keyword ((t (:background "#f0f0f0" :foreground "#000000" :weight normal))))
 '(org-tag ((((class color) (min-colors 89)) (:weight normal :slant italic :foreground "#9A9FA4" :background "white"))))
 '(org-time-grid ((t (:foreground "#65bbbb"))))
 '(org-verbatim ((((class color) (min-colors 89)) (:foreground "#0066CC"))))
 '(shadow ((t (:foreground "#777777")))))
