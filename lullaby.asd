(asdf:defsystem lullaby
  :version "0.0.1"
  :author "Laurent Cimon <laurent@nilio.ca>"
  :maintainer "Laurent Cimon <laurent@nilio.ca>"
  :license "bsd-2-clause"
  :description "An ActivityPub server"
  :components ((:file "package")
	       (:file "db")
	       (:file "server")
	       (:file "auth"))
  :depends-on (#:hunchentoot #:sqlite #:md5)
  :build-operation "program-op"
  :build-pathname "lullaby"
  :entry-point "lullaby:start")
