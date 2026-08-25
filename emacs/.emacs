;;; -*- lexical-binding: t -*-

;; Vim everywhere
(require 'evil)
(evil-mode 1)

;; ── Dialog entry macro ─────────────────────────────────────────────
;; Transforms the current line into a dialog entry.
;;   hello world  ──▶  - "hello world"
;;
;; If the region is active, processes each line in the region instead.

(defun mar/dialogify-line ()
  "Wrap the current line's text content in a dialog-quote format: - \"text\".
If region is active, process every line in the region."
  (interactive)
  (if (and transient-mark-mode mark-active)
      ;; Region active — process each line in region
      (save-excursion
        (let ((start (region-beginning))
              (end   (region-end)))
          (goto-char start)
          (while (< (point) end)
            (mar/dialogify-current-line)
            (forward-line 1))))
    ;; No region — just the current line
    (mar/dialogify-current-line)))

(defun mar/dialogify-current-line ()
  "Transform the current line: strip leading/trailing whitespace, wrap as - \"text\"."
  (let* ((line-start (line-beginning-position))
         (line-end   (line-end-position))
         (text       (buffer-substring-no-properties line-start line-end))
         (trimmed    (string-trim text)))
    (unless (string-empty-p trimmed)
      (delete-region line-start line-end)
      (insert (format "- \"%s\"" trimmed)))))

;; Keybindings
(global-set-key (kbd "C-c d") 'mar/dialogify-line)
;; Also bind in Evil normal state
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "C-c d") 'mar/dialogify-line))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )