(in-package :cl-user)
(defpackage cl-crd
  (:use :cl)
  (:export :request))
(in-package :cl-crd)

(defparameter *api-endpoint-url* "http://crd.ndl.go.jp/api/refsearch")
(defparameter *search-type-list* '(reference manual collection profile all))
(defparameter *neat-parameters-list*
  '(query crt-date_from crt-date_to
    reg-date_from reg-date_to
    lst-date_from lst-date_to))
;;(defparameter **)
(defun alistp (value)
  (or (null value)
      (and (consp value)
           (mapl (lambda (tree)
                   (unless (and (consp (first tree))
                                (not (consp (first (first tree))))
                                (listp (rest tree)))
                     (return-from alistp nil)))
                 value)
           t)))

(defun dotpairp (obj)
  (and (consp obj)
       (= 2 (length obj))))

(defun alist-dotp (obj)
  (and
   (alistp obj)
   (every #'dotpairp obj)))


(defun alist-to-qparamstring (alist)
  (if (alist-dotp alist)
      (let ((qparams (mapcar #'dotpair-to-qparam alist)))
        (format nil "?~{~A~^&~}" qparams))
      (error (format nil "~A is not alist<dot-pair>" alist))))

(defun dotpair-to-qparam (dotpair)
  (let ((key (car dotpair))
        (value (cadr dotpair)))
    (if (stringp value)
        (format nil "~(~A~)=~A" key value)
        (error (format nil "~A is not string. value must be string." value)))))


(defun check-query (query)
  query)

(defun request (query)
  (check-query query)
  (princ (concatenate 'string *api-endpoint-url* (alist-to-qparamstring query))
)
  (let ((res
        (dex:get (concatenate 'string *api-endpoint-url* (alist-to-qparamstring query)))))
  (format t "~A" res)))
