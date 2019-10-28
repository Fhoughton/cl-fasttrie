(defsystem "cl-fasttrie"
  :author "Fhoughton"
  :license "LGPL-3.0"
  :description "A collection of functions and structs to allow a fast version of the trie data structure using hash tables."
  :version "1.0.0"
  
  ;; Project files / load order
  :components ((:module "src"
                :components ((:file "package")
                             (:file "stuff" :depends-on ("package"))
                             )))