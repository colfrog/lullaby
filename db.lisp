(in-package :lullaby)

(defvar *db-path* "lullaby.db")
(defvar *db* (sqlite:connect *db-path*))

(defun init (&optional username password)
  (uiop:run-program (list "sqlite3" *db-path* "--load" "schema.sql"))
  (when (and username password)
    (make-user username password)))

(defun get-md5 (s)
  "Returns the md5 sum of s as a string"
  (let ((sum (md5:md5sum-string s))
	(out ""))
    (dotimes (i (length sum))
      (setf out (concatenate 'string out (format nil "~2,'0x" (aref sum i)))))
    out))

(defun make-user (username password)
  (sqlite:execute-single *db* "INSERT INTO users (user_id, user_name, user_password_hash) SELECT max(user_id) + 1, ?, ? FROM users" username (get-md5 password)))
