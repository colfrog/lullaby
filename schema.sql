CREATE TABLE users (
       user_id INTEGER PRIMARY KEY,
       user_name TEXT,
       user_password_hash TEXT,
       user_preferred_name TEXT,
       user_info TEXT,
       UNIQUE (user_name)
);

CREATE TABLE posts (
       post_id INTEGER PRIMARY KEY,
       user_id INTEGER,
       post_cw_text TEXT,
       post_content TEXT,
       post_time DATETIME,
       post_edit_time DATETIME,
       post_reply_url TEXT
);

CREATE TABLE reposts (
       user_id INTEGER,
       repost_id INTEGER,
       repost_url TEXT,
       repost_time DATETIME,
       PRIMARY KEY (user_id, repost_id)
);

CREATE TABLE media (
       media_id INTEGER PRIMARY KEY,
       media_alt TEXT,
       media_type TEXT,
       media_mime_type TEXT,
       media_content BLOB
);

CREATE TABLE post_media (post_id INTEGER, media_id INTEGER);

CREATE TABLE inbox (inbox_id INTEGER, json TEXT);

CREATE TABLE followers (
       follower_id INTEGER PRIMARY KEY,
       follower_url TEXT,
       user_id INTEGER
);

CREATE TABLE following (
       following_id INTEGER PRIMARY KEY,
       following_url TEXT,
       user_id INTEGER
);

CREATE TABLE auth (
       auth_id TEXT PRIMARY KEY, -- Session ID made from md5(password%epoch)
       user_id INTEGER,
       auth_expires DATETIME
)
