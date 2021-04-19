(defsystem "cl-crd"
  :version "0.1.0"
  :author "eggplants"
  :license ""
  :depends-on ("dexador")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "cl-crd/tests"))))

(defsystem "cl-crd/tests"
  :author "eggplants"
  :license ""
  :depends-on ("cl-crd"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-crd"
  :perform (test-op (op c) (symbol-call :rove :run c)))
