; Set colors!
(set-background-color "black")
(set-face-background 'default "black")
(set-face-background 'region "pink")
(set-face-foreground 'default "white")
(set-face-foreground 'region "blue")
(set-foreground-color "white")
(set-cursor-color "red")

; Always do syntax highlighting
(global-font-lock-mode 1)

; Highlight parens
;(setq show-paren-delay 0
 ;     show-paren-style 'parenthesis)
;(show-paren-mode 1)

; This is the binary name of scheme implementation
(setq scheme-program-name "*.scm")

; Set the indentation style for C code
;(setq c-default-style "k&r")
(setq c-default-style '((java-mode . "ellemtel") (other . "k&r")))

; Bind the "Control-x p" key sequence to the function "indent-all".            
; The "indent-all" function indents all lines of the C program in the          
; current buffer according to the selected indentation style.                  
(defun indent-all()
   (interactive)
   (save-excursion
      (let ()
         (goto-char (point-min))
         (while (< (point) (point-max))
            (c-indent-command)
            (next-line 1)))))
(global-set-key "\C-xp" 'indent-all)

;turn on font-lock mode
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)


; Display the column number in the status bar
(setq column-number-mode t)

; Highlight matching parentheses, braces, and brackets.
(show-paren-mode t)

; Bind Ctrl-x l to goto-line
(global-set-key "\C-xl" 'goto-line)

; Bind M-n and M-p to next and previous line
(global-set-key "\M-n" 'next-line)
(global-set-key "\M-p" 'previous-line)

; Bind f6 to viper
(global-set-key [f6] 'toggle-viper-mode)

; Bind f7 to viper
(global-set-key [f7] 'viper-go-away)

; Set the comment character for asm-mode to '#'.                              
(setq asm-comment-char ?#)

; Indent using spaces instead of tabs in c-mode and asm-mode.              
(defun my-c-mode-common-hook ()
   (setq indent-tabs-mode nil))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(defun my-asm-mode-common-hook ()
   (setq indent-tabs-mode nil))
(add-hook 'asm-mode-hook 'my-asm-mode-common-hook)

; Bind the Home and End keys as appropriate for PuTTY.
(global-set-key [HOME]  'beginning-of-line)
(global-set-key [END] 'end-of-line)

; Bind the Home and End keys as appropriate for the Linux GNOME Terminal.
;(global-set-key "\C-[OH" 'beginning-of-line)
;(global-set-key "\C-[OF" 'end-of-line)

; Scroll down with the cursor, move down the buffer
; one line at a time, instead of in larger amounts
(setq scroll-step 1)

; Delete using the delete key
(delete-selection-mode t)


(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                           ("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'load-path "~/.elisp")

(load "php-mode")

(add-to-list 'auto-mode-alist
	          '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))


;; Toggle between PHP & HTML Helper mode.  Useful when working on
;; php files, that can been intertwined with HTML code
(defun toggle-php-html-mode ()
  (interactive)
  "Toggle mode between PHP & HTML Helper modes"
  (cond ((string= mode-name "HTML helper")
         (php-mode))
        ((string= mode-name "PHP")
         (html-helper-mode))))

(global-set-key [f5] 'toggle-php-html-mode)

; Toggle line numbers by f8
(global-linum-mode)
(autoload 'linum-mode "linum" "toggle line numbers on/off" t) 
(global-set-key [f8] 'linum-mode)

; Set up emacs for AuTex
(setq TeX-auto-save t) 
(setq TeX-parse-self t) 
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)


;Start up as full screen
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

; Setup default font size
(set-face-attribute 'default nil :height 90)

; Smooth scrolling
(require 'smooth-scroll)
(smooth-scroll-mode t)


(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
;(global-set-key "\C-xm" 'browse-url-at-point)

(setq w3m-use-cookies t)



(setq longlines-wrap-follows-window-size t)

;; current buffer name in title bar
(setq frame-title-format "%b")

(add-to-list 'load-path "/home/jhuang/emms/lisp/")
(require 'emms-setup)
(emms-standard)
(emms-default-players)
(put 'upcase-region 'disabled nil)

;configure tramp to use ssh
(setq tramp-default-method "ssh")

; add web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-script-offset 5)
)
(add-hook 'web-mode-hook  'web-mode-hook)
(put 'erase-buffer 'disabled nil)

; Setup hippie expand
(global-set-key "\M- " 'hippie-expand)

(setq hippie-expand-try-functions-list '(try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol))


; Bind M-f, M-b to viper style word movement
(setq viper-mode)
(require 'viper)
(global-set-key (kbd "M-f") 'viper-forward-word)
(global-set-key (kbd "M-b") 'viper-backward-word)

; Setup autopair
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers



