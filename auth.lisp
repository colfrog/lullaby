(in-package :lullaby)

(defun is-logged-in ()
  (session-value :username)
  ;; TODO: check in db
  )

(defun credentials-valid (username password)
  (let ((pass-md5 (sqlite:execute-single *db* "SELECT user_password_hash FROM users WHERE user_name = ?" username)))
    (when pass-md5 (equal (get-md5 password) pass-md5))))

(define-easy-handler (login-page :uri "/login")
    ((username :request-type :POST)
     (password :request-type :POST))
  (if (is-logged-in) (redirect "/")
      (let ((error-message nil))
	(when (and username password)
	  (if (credentials-valid username password)
	      (progn
	        (setf (session-value :username) username)
		(redirect "/"))
	      (setf error-message "Invalid username or password")))
	(with-layout ("Login")
	  (when error-message
	    (htm (:h5 :class "error" (str error-message))))
	  (:form :method "POST" :action "/login"
		 (:input :type "text" :name "username")
		 (:input :type "password" :name "password")
		 (:input :type "submit"))))))

(define-easy-handler (logout-page :uri "/logout") ()
  (remove-session (start-session))
  (redirect "/"))

(define-easy-handler (home-page :uri "/") ()
  (with-layout ()
    (:h3 (str (if (is-logged-in) (conc "Logged in as " (session-value :username)) "Not logged in")))
    (when (is-logged-in) (htm (:a :href "/logout" "logout")))))
