--create database RepositoryDB;

use RepositoryDB;

create table users(
id int identity NOT NULL,
username varchar(30) NOT NULL,
password varchar(30) NOT NULL,	
email varchar(50) NOT NULL,
constraint PK_users primary key(id)
);

create table repositories(
id int identity NOT NULL,
name varchar(50) NOT NULL,
constraint PK_repositories primary key(id)
);

create table RepositoriesContributors(
repository_id int,
contributor_id int,
constraint FK_RepositoriesContributors_repositories foreign key(repository_id)
references repositories(id),
constraint FK_RepositoriesContributors_users foreign key(contributor_id)
references users(id)
);

create table issues(
id int identity NOT NULL,
title varchar(255) NOT NULL,
issue_status varchar(6) NOT NULL,
repository_id int NOT NULL,
assignee_id int NOT NULL,
constraint PK_issues primary key(id),
constraint FK_issues_repositories foreign key(repository_id)
references repositories(id),
constraint FK_issues_users foreign key(assignee_id)
references users(id)
);

create table commits(
id int identity NOT NULL,
message varchar(255) NOT NULL,
issue_id int,
repository_id int,
contributor_id int,
constraint PK_commits primary key(id),
constraint FK_commits_issues foreign key(issue_id)
references issues(id),
constraint FK_commits_repositories foreign key(repository_id)
references repositories(id),
constraint FK_commits_users foreign key(contributor_id)
references users(id)
);

create table files(
id int identity NOT NULL,
name varchar(100) NOT NULL,
size numeric(8,2) NOT NULL,
parent_id int,
commit_id int NOT NULL,
constraint PK_files primary key(id),
constraint FK_files_commits foreign key(commit_id)
references commits(id)
);
