create table if not exists profile_user (id INT(12), value TEXT, UNIQUE(id)) ENGINE=InnoDb CHARSET=UTF8; 
create table if not exists profile_created (id INT(12), value TEXT, UNIQUE(id)) ENGINE=InnoDb CHARSET=UTF8; 
create table if not exists profile_status (id INT(12), value TEXT, UNIQUE(id)) ENGINE=InnoDb CHARSET=UTF8; 
create table if not exists recipe_created (id INT(12), value TEXT, UNIQUE(id)) ENGINE=InnoDb CHARSET=UTF8;
create table if not exists recipe_status (id INT(12), value TEXT, UNIQUE(id)) ENGINE=InnoDb CHARSET=UTF8;
