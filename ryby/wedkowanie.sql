create database wedkowanie;
use wedkowanie;

create table Ryby (
  id int not null auto_increment,
  nazwa text not null,
  wystepowanie text not null,
  styl_zycia int not null,
  primary key (id)
);

create table Okres_ochronny (
    id int not null auto_increment,
    Ryby_id int not null,
    od_miesiaca int not null,
    do_miesiaca int not null,
    wymiar_ochronny int not null,
    primary key (id),
    foreign key (Ryby_id) references Ryby(id)
);

create table Lowisko (
    id int not null auto_increment,
    Ryby_id int not null,
    akwen text not null,
    wojewodztwo text not null,
    rodzaj int not null,
    primary key (id),
    foreign key (Ryby_id) references Ryby(id)
);

-- insert -- 

insert into Ryby (id, nazwa, wystepowanie, styl_zycia) values
(1, 'Łosoś', 'Wodospady, rzeki, jeziora', 1),
(2, 'Pstrąg', 'Rzeki, jeziora', 2),
(3, 'Sum', 'Rzeki', 1),
(4, 'Karp', 'Jeziora', 3),
(5, 'Szczupak', 'Morza', 2),
(6, 'Węgorz', 'Morza, oceany', 2),
(7, 'Śledź', 'Stawy', 1),
(8, 'Okoń', 'Jeziora, stawy', 3),
(9, 'Kołczuga', 'Rzeki, stawy', 2),
(10, 'Klen', 'Rzeki', 2),
(11, 'Karaś', 'Stawy, oceany', 3),
(12, 'Świnka', 'Morza, rzeki', 1);

insert into Okres_ochronny (id, Ryby_id, od_miesiaca, do_miesiaca, wymiar_ochronny) values
(1, 1, 1, 12, 30),
(2, 2, 1, 12, 30),
(3, 3, 1, 12, 30),
(4, 4, 1, 12, 30),
(5, 5, 1, 12, 30),
(6, 6, 1, 12, 30),
(7, 7, 1, 12, 30),
(8, 8, 1, 12, 30),
(9, 9, 1, 12, 30),
(10, 10, 1, 12, 30),
(11, 11, 1, 12, 30),
(12, 12, 1, 12, 30);

insert into Lowisko (id, Ryby_id, akwen, wojewodztwo, rodzaj) values
(1, 1, 'Jezioro', 'Mazowieckie', 1),
(2, 2, 'Jezioro', 'Mazowieckie', 1),
(3, 3, 'Jezioro', 'Mazowieckie', 1),
(4, 4, 'Jezioro', 'Mazowieckie', 1),
(5, 5, 'Jezioro', 'Mazowieckie', 1),
(6, 6, 'Jezioro', 'Mazowieckie', 1),
(7, 7, 'Jezioro', 'Mazowieckie', 1),
(8, 8, 'Jezioro', 'Mazowieckie', 1),
(9, 9, 'Jezioro', 'Mazowieckie', 1),
(10, 10, 'Jezioro', 'Mazowieckie', 1),
(11, 11, 'Jezioro', 'Mazowieckie', 1),
(12, 12, 'Jezioro', 'Mazowieckie', 1);


