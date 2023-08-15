set search_path to solutions;

create table if not exists teams (
      team_id integer not null,
      team_name varchar(30) not null,
      unique(team_id)
  );


truncate table teams;
insert into teams (team_id, team_name) values (10,'Give' );
insert into teams (team_id, team_name) values (20,'Never' );
insert into teams (team_id, team_name) values (30,'You' );
insert into teams (team_id, team_name) values (40,'Up' );
insert into teams (team_id, team_name) values (50,'Gonna' );
