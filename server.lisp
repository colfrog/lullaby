(in-package :lullaby)

(defparameter *port* 4242)

(defmacro start-lullaby ()
  (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port *port*)))
