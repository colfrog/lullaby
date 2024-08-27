(in-package :lullaby)

(defmacro with-layout ((&optional title headers) &body body)
  `(cl-who:with-html-output-to-string (*standard-output* nil :prologue t)
     (:html
      (:head
       (str ,headers)
       (:meta :name "viewport" :content "width=device-width, initial-scale=1")
       (:link :rel "icon" :type "image/x-icon" :href "/favicon.ico")
       (:link :rel "stylesheet" :href "/style.css")
       (:title (cl-who:str (if ,title ,title "lullaby")))
       (:body
	(:header (:h1 "lullaby"))
	(:main ,@body)
	(:nav)
	(:footer (:small "Created by Laurent Cimon")))))))

(defun 404-page ()
  (with-layout ("Not Found")
    (:h1 "404 Not Found")))
