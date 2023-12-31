-- members
Create table members(id bigint primary key auto_increment, email varchar(50) not null unique,passwd varchar(20) not null ,name varchar(50) not null
,birth DATE not null, sex Enum('M','F'), phone_number varchar(15) not null, nickname varchar(50) unique,
role Enum('user','admin') not null default('user'), active tinyint(1) default 0);

-- movies
Create table movies(id bigint primary key auto_increment, summary text not null, review varchar(1000), content_rating Enum(
'All','12years','15years','No Adolescent') not null, running_time INT unsigned not null, trailer varchar(255),
release_date DATE not null,title varchar(250) not null);

-- disabled_members
create table disabled_members(id bigint primary key auto_increment, member_id bigint not null, reason varchar(1000) not null, advise varchar(1000),
foreign key(member_id) references members(id));

-- review 
create table review(id bigint primary key auto_increment,grade tinyint unsigned not null, movie_id bigint not null,
user_id bigint not null, detail text not null ,
created_date datetime default current_timestamp,
update_date datetime default current_timestamp,
foreign key(movie_id) references movies(id) on delete cascade on update cascade,foreign key(user_id) references members(id));

-- favorite 
create table favorite(id bigint primary key auto_increment,movie_id bigint not null, user_id bigint not null,love tinyint(1) not null default 0, 
dislike tinyint(1) not null default 0,
created_date datetime default current_timestamp,
update_date datetime default current_timestamp,
foreign key(movie_id) references movies(id) on delete cascade on update cascade,
foreign key(user_id) references members(id));

-- watched_movie 
create table watched_movie(id bigint primary key auto_increment,movie_id bigint not null, user_id bigint not null,
foreign key(movie_id) references movies(id) on delete cascade on update cascade,
created_date datetime default current_timestamp,
update_date datetime default current_timestamp,
foreign key(user_id) references members(id));

-- award
create table award(id bigint primary key auto_increment, award varchar(50) not null);
-- movie_award
create table movie_award(id bigint primary key auto_increment, award_id bigint  not null, movie_id bigint not null,
foreign key(award_id) references award(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);

-- genre
create table genre(id bigint primary key auto_increment, genre varchar(50) not null);
create table movie_genre(id bigint primary key auto_increment, genre_id bigint  not null, movie_id bigint not null,
foreign key(genre_id) references genre(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);

-- ott 
create table ott(id bigint primary key auto_increment, ott varchar(50) not null);
create table movie_ott(id bigint primary key auto_increment, ott_id bigint  not null, movie_id bigint not null,
foreign key(ott_id) references ott(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);

-- actor 
create table actor(id bigint primary key auto_increment, actor varchar(50) not null,info varchar(255));
create table movie_actor(id bigint primary key auto_increment, actor_id bigint  not null, movie_id bigint not null,
foreign key(actor_id) references actor(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);

-- director 
create table director(id bigint primary key auto_increment, directorr varchar(50) not null);
create table movie_director(id bigint primary key, director_id bigint  not null, movie_id bigint not null,
foreign key(director_id) references director(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);

-- nation 
create table nation(id bigint primary key auto_increment, nation varchar(50) not null);
create table movie_nation(id bigint primary key, nation_id bigint  not null, movie_id bigint not null,
foreign key(nation_id) references nation(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);