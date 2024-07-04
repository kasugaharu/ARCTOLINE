(defun c:ArcToLine ( / ss i ent obj start end)
  (setq ss (ssget '((0 . "ARC")))) ; 获取所有选中的圆弧
  (if ss
    (progn
      (setq i 0)
      (while (< i (sslength ss))
        (setq ent (ssname ss i))
        (setq obj (vlax-ename->vla-object ent))
        (setq start (vlax-safearray->list (vlax-variant-value (vla-get-StartPoint obj))))
        (setq end (vlax-safearray->list (vlax-variant-value (vla-get-EndPoint obj))))
        (entmake (list (cons 0 "LINE") (cons 10 start) (cons 11 end)))
        (entdel ent) ; 删除原来的圆弧
        (setq i (1+ i))
      )
    )
  )
  (princ)
)
