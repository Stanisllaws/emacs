

;; Import
(load "~/.emacs.d/emacs-moduals/nix-commands.el")
(load "~/.emacs.d/emacs-moduals/etra-programs.el") 
(load "~/.emacs.d/emacs-moduals/meow.el") 
(load "~/.emacs.d/emacs-moduals/Ekeymap.el")
(load "~/.emacs.d/emacs-moduals/Escripts.el")
(load "~/.emacs.d/emacs-moduals/text-tools.el")
;;(load "~/.emacs.d/emacs-moduals/buffer-to-pdf.el") 
;;(load "~/.emacs.d/emacs-moduals/buffer-to-pdf/pkg-buffer-to-pdf.el") 	


;;; -*- lexical-binding: t 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-enabled-themes '(modus-vivendi-tinted))
 '(custom-safe-themes
   '("3ea6a13b8119d69238e9651c05092d4491816b4d8066481e84e36901b6542089"
     default))
 '(package-selected-packages
   '(buffer-to-pdf nix-mode org-mode sly solarized-theme spacemacs-theme
		   tangotango-theme tree-sitter-langs vterm))
 '(package-vc-selected-packages
   '((buffer-to-pdf :vc-backend Git :url
		    "https://github.com/protesilaos/buffer-to-pdf.git"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; No tool bar
(tool-bar-mode -1)

;; Font size
(set-face-attribute 'default nil :height 145)





;;root privilges
;;(require 'sudo-edit)
;;(global-set-key (kbd "C-c C-r") 'sudo-edit)
;; FOR SUDO HELP USE EX. Use C-x C-f and type out /su::/etc/hostname

;; saving recent files edits
(recentf-mode 1)

;; Saving entry to main buffer
(setq history-length 25)
(savehist-mode 1)

;; No sroll bar
 (scroll-bar-mode -1)

;; # BACK UPS

;; Create backup directory if it doesn't exist
;; (make-directory "~/.emacs.d/files-emacs-backup" t)

;; Store all backup files in one directory
(setq backup-directory-alist
      '(("." . "~/.emacs.d/files-emacs-backup")))

;; Store all autosave files in one directory
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/files-emacs-backup/" t)))

;; Optional: keep multiple backup versions
(setq delete-old-versions t)
(setq kept-new-versions 40)
(setq kept-old-versions 40)
(setq version-control t)












;;Auto refresh etc..
(global-auto-revert-mode 1)
(add-hook 'dired-mode-hook 'auto-revert-mode )
(setq auto-revert-interval 1)
;(auto-revert-set-timer)


;;Custime keybinds screen splits
;; Bind C-c h to split horizontally
(global-set-key (kbd "C-c h") 'split-window-horizontally)

;;MAY USE LATER
;; Example: Bind C-c s to split and open a specific file
;;(defun open-init-file ()
 ;; (interactive)
 ;; (split-window-horizontally)
 ;; (other-window 1)
 ;; (find-file "~/.emacs.d/init.el"))
;; (global-set-key (kbd "C-c s") 'open-init-file)   

;; LINE NUMBER
(global-display-line-numbers-mode 1 )

(setq dispaly-line-numbers-type t)

;; TERMINAL
(setenv "TERM" "st-direct")

;; TOP BAR

;; No top bar
(menu-bar-mode -1)   

 
(put 'upcase-region 'disabled nil)



(put 'dired-find-alternate-file 'disabled nil)

;; Set sort Dired
;;(setq dired-listing-switches"-alh --group-directories-first-A")

;; Theme back ground
(load-theme 'solarized-wombat-dark t)

;;Nix colore code
(use-package nix-mode
  :ensure t)

(use-package org-mode
  :ensure t) 


;; buffer to pdf
;; pkg under GPLv3
(use-package buffer-to-pdf
  :ensure nil
  :init
  ;; Then upgrade it with the command `package-vc-upgrade' or `package-vc-upgrade-all'.
  (unless (package-installed-p 'buffer-to-pdf)
    (package-vc-install "https://github.com/protesilaos/buffer-to-pdf.git"))
  :config
  ;; Configure `buffer-to-pdf-directory' to specify where PDF files are stored.
  ;; This is the default value:
  (setq buffer-to-pdf-directory (expand-file-name "~/")))
