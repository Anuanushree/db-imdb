show databases;
create database imdb;
use imdb;

create table director(
     director_id int  PRIMARY KEY ,
	 director_name varchar(50) NOT NULL );


 create table genre(
     genre_id int PRIMARY KEY,
     genre varchar(50) NOT NULL );
                   
 -- 1.. Movie can belongs to multiple Genre    
 
create table movie(
			movie_Id int PRIMARY KEY ,
			movie_Title varchar(50) NOT NULL ,
			movie_language varchar(30) NOT NULL ,
			movie_year int NOT NULL , director_id int ,
			genre_id int ,
			foreign key(director_id) references director(director_id),
			foreign key(genre_id) references genre(genre_id)
			);

-- 2.  Movie should have multiple media(Video or Image)

create table media (
			media_id INT PRIMARY KEY AUTO_INCREMENT,
			movie_Id INT,
			type ENUM('video', 'image'),
			url VARCHAR(255),
			foreign key(movie_Id) references movie(movie_Id)
			);
                   
-- 3. Movie can have multiple reviews and Review can belongs to a user
  
create table user( 
		   user_id int PRIMARY KEY ,
		   user_name varchar(40) NOT NULL,
		   user_mail varchar(70) NOT NULL,
		   user_password varchar(50) NOT NULL);

create table review( 
		 review_id int PRIMARY KEY,
		 movie_id int,
		 user_id int,
		 comment varchar(100),
		 rating int NOT NULL,
		 foreign key(movie_id) references movie(movie_Id),
		 foreign key(user_id) references user(user_id)
        );


 -- 4. Artist can have multiple skills
 
 create table skills( 
			skill_id int PRIMARY KEY,
			skill varchar(50) NOT NULL);
       

 create table actor(
			 actor_id int primary key, 
			 actor_name varchar(50) not null ,
			 actor_gender char(10) not null);


 -- 5. Artist can perform multiple role in a single film
 
create table role ( role_id int PRIMARY KEY ,
                   role varchar(60));  
 
 create table movie_role (
			  movie_id int ,
			  actor_id int ,
			  role_id int,
			  foreign key(movie_id) references movie(movie_Id),
			  foreign key(actor_id) references actor(actor_id),
			  foreign key(role_id) references role(role_id));
                       
show tables;






