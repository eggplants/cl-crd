(defpackage cl-crd/tests/main
  (:use :cl
        :cl-crd
        :rove))
(in-package :cl-crd/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-crd)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
