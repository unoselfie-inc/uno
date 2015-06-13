drop DATABASE if exists Unoselfie;
create DATABASE Unoselfie;
Use Unoselfie;

create table Location(
	Loc_ID MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Country TEXT,
	Province TEXT,
	City TEXT
);

create table User(
	User_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Account_type TINYTEXT, /* Facebook, Twitter, Email, LinkedIn, etc. */
	Account_id TINYTEXT, /* Login ID */
	Password char(128), /* SHA512 */
	Salt char(64), /* Random Salt */
	Privilege TINYINT UNSIGNED, /* Admin user, customer*/
	Email VARCHAR(60),
	FirstName VARCHAR(40),
	LastName VARCHAR(40),
	Profile_pic_location TEXT,
	Profile_video_location TEXT,
	Location MEDIUMINT UNSIGNED, /* Location_id from Location table */
	Link TEXT,
	Job_title TINYTEXT,
	Contacts TEXT, /* 1 string with concatenated all the contacts */
	Registered_time DATETIME,
	Switch Boolean, /* Activation */
	foreign key (Location) references Location(Loc_ID)
);

create table Company(
	Company_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Logo_location TEXT,
	Name TEXT,
	Location MEDIUMINT UNSIGNED,
	Description TEXT,
	Website_link TEXT,
	Num_employees INT UNSIGNED,
	Creator INT UNSIGNED,
	Time DATETIME,
	Founded DATETIME,
	foreign key (Creator) references User(User_id),
	foreign key (Location) references Location(Loc_ID)
);

create table Job(
	Job_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Company_id INT UNSIGNED,
	User_id INT UNSIGNED,
	Job_video TEXT,
	Title TEXT,
	Location MEDIUMINT UNSIGNED,
	Description TEXT,
	Time DATETIME,
	foreign key (User_id) references User(User_id),
	foreign key (Company_id) references Company(Company_id)
);

create table Followers(
	Target INT UNSIGNED NOT NULL,
	Follower INT UNSIGNED NOT NULL,
	Time DATETIME,
	Switch Boolean,
	foreign key (Target) references User(User_id),
	foreign key (follower) references User(User_id),
	primary key (Target, Follower)
);

create table Login_history(
	Login_Num BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	User_id INT UNSIGNED,
	IP varchar(15),
	Time DATETIME,
	Location MEDIUMINT UNSIGNED,
	foreign key (Location) references Location(Loc_ID),
	foreign key (User_id) references User(User_id)
);

create table Notification(
	Notif_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Target INT UNSIGNED,
	Source INT UNSIGNED,
	Noti_type TINYINT,
	Noti_target BIGINT,
	Description TEXT,
	Time DATETIME,
	foreign key (Target) references User(User_id),
	foreign key (Source) references User(User_id)
);

create table Message(
	Msg_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Target INT UNSIGNED,
	Source INT UNSIGNED,
	Message TEXT,
	Time DATETIME,
	foreign key (Target) references User(User_id),
	foreign key (Source) references User(User_id)
);

create table Job_history(
	Job_id BIGINT UNSIGNED,
	User_id INT UNSIGNED,
	Time DATETIME,
	foreign key (User_id) references User(User_id),
	foreign key (Job_id) references Job(Job_id)
);

create table Saved_job(
	Job_id BIGINT UNSIGNED,
	User_id INT UNSIGNED,
	Time DATETIME,
	foreign key (User_id) references User(User_id),
	foreign key (Job_id) references Job(Job_id)
);

create table Application(
	Application_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	User_id INT UNSIGNED,
	Job_id BIGINT UNSIGNED,
	Time DATETIME,
	foreign key (User_id) references User(User_id),
	foreign key (Job_id) references Job(Job_id)
);

create table Resume(
	Resume_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	User_id INT UNSIGNED,
	Resume_content TEXT,
	foreign key (User_id) references User(User_id)
);

create table Company_privilege(
	Company_id INT UNSIGNED,
	User_id INT UNSIGNED,
	privilege TINYINT UNSIGNED,
	foreign key (User_id) references User(User_id),
	foreign key (Company_id) references Company(Company_id)
);

create table Company_followers(
	Company_id INT UNSIGNED,
	Follower_id INT UNSIGNED,
	foreign key (Follower_id) references User(User_id),
	foreign key (Company_id) references Company(Company_id)
);

create table Post(
	Post_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	User_id INT UNSIGNED,
	Likes INT UNSIGNED,
	Content TEXT,
	Time DATETIME,
	foreign key (User_id) references User(User_id)
);

create table Comments(
	Comment_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Post_id BIGINT UNSIGNED,
	User_id INT UNSIGNED,
	Content TEXT,
	Likes INT UNSIGNED,
	Time DATETIME,
	foreign key (User_id) references User(User_id),
	foreign key (Post_id) references Post(Post_id)
);

create table Report_user(
	Report_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Target INT UNSIGNED,
	Source INT UNSIGNED,
	Report_type TINYINT,
	Description TEXT,
	Time DATETIME,
	foreign key (Target) references User(User_id),
	foreign key (Source) references User(User_id)
);

create table Report_Company(
	Report_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Target INT UNSIGNED,
	Source INT UNSIGNED,
	Report_type TINYINT,
	Description TEXT,
	Time DATETIME,
	foreign key (Target) references Company(Company_id),
	foreign key (Source) references Company(Company_id)
);

create table Report_Post(
	Report_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Target BIGINT UNSIGNED,
	Source BIGINT UNSIGNED,
	Report_type TINYINT,
	Description TEXT,
	Time DATETIME,
	foreign key (Target) references Post(Post_id),
	foreign key (Source) references Post(Post_id)
);

create table Report_Comment(
	Report_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Target BIGINT UNSIGNED,
	Source BIGINT UNSIGNED,
	Report_type TINYINT,
	Description TEXT,
	Time DATETIME,
	foreign key (Target) references Comments(Comment_id),
	foreign key (Source) references Comments(Comment_id)
);

create table Ticket(
	Ticket_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Ticket_type TINYINT,
	Start_time DATETIME,
	End_time DATETIME,
	Valid Boolean,
	User_id INT UNSIGNED,
	foreign key (User_id) references User(User_id)
);

