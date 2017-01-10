

;;;;;;;;;;;;;;;;;;;;LoadPath;;;;;;;;;;;;;;;;;;;;
;; load-pathを再帰的に追加。
(defun add-to-load-path (&rest paths)
(let (path)
    (dolist (path paths paths)
    (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
    (add-to-list 'load-path default-directory)
     (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
         (normal-top-level-add-subdirs-to-load-path))))))

;;elispをロードパスに追加
(add-to-load-path "elisp")

;; elpa配下をロードパスに指定。
(add-to-load-path "elpa")


;;行数を表示
(global-linum-mode t)

;;背景色
(set-background-color"Black")
;;前景色
(set-foreground-color"LightGray")
;;カーソルの色
(set-cursor-color"Gray")
;;透過度の設定
(set-frame-parameter nil 'alpha 75)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; C-kで行全体を削除する
(setq kill-whole-line t)

;; スタートアップを表示させない
(setq inhibit-startup-screen t)
;;scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; 予約語を色分けする
(global-font-lock-mode t)

;;バックアップを作成しない
(setq make-backup-files nil)

;;現在の行をハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "#CC0066"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;;追加機能

;;auto-installの設定
(require 'auto-install)
(auto-install-compatibility-setup)

;;MELPAを追加
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")))
;;auto-complete
(require 'auto-complete-config)
(ac-config-default)

;;helm
(require 'helm-config)
(helm-mode 1)

;;helm設定
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
