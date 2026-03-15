create table coach (
    coach_id int primary key,
    coach_first_name varchar(50) not null,
    coach_last_name varchar(50) not null,
    coach_nationality varchar(3) not null
);

create table category (
    category_id int primary key,
    category_name varchar(20) not null,
    category_prize_pool decimal(12,2) not null
);

create table hotel (
    hotel_id int primary key,
    hotel_name varchar(100) not null,
    hotel_star_rating int not null
);

create table player (
    player_id int primary key,
    player_first_name varchar(50) not null,
    player_last_name varchar(50) not null,
    player_nationality varchar(3) not null,
    player_birth_date date not null,
    player_ranking int not null,
    player_gender varchar(1) not null,
    coach_id int null,           
    category_id int not null,
    hotel_id int null,          
    
    foreign key (coach_id) references coach(coach_id)
        on delete set null
        on update cascade,
    
    foreign key (category_id) references category(category_id)
        on delete restrict
        on update cascade,
    
    foreign key (hotel_id) references hotel(hotel_id)
        on delete set null
        on update cascade
);

create table umpire (
    umpire_id int primary key,
    umpire_first_name varchar(50) not null,
    umpire_last_name varchar(50) not null
);

create table court (
    court_id int primary key,
    court_name varchar(50) not null,
    court_surface varchar(20) not null,
    court_capacity int not null,
    court_is_covered boolean not null
);

create table `round` (
    round_id int primary key,
    round_name varchar(20) not null,
    round_order int not null
);

create table tournament (
    tournament_id int primary key,
    tournament_name varchar(100) not null,
    tournament_location varchar(100) not null,
    tournament_prize_pool decimal(12,2) not null
);

create table edition (
    edition_id int primary key,
    edition_year int not null,
    edition_start_date date not null,
    edition_end_date date not null,
    tournament_id int not null,
    
    foreign key (tournament_id) references tournament(tournament_id)
        on delete cascade       -- ✅ CASCADE car entité faible
        on update cascade
);

create table `match` (
    match_id int primary key,
    match_date date not null,
    match_start_time time not null,
    match_duration int not null,
    umpire_id int not null,
    court_id int not null,
    round_id int not null,
    edition_id int not null,
    
    foreign key (umpire_id) references umpire(umpire_id)
        on delete restrict
        on update cascade,
        
    foreign key (court_id) references court(court_id)
        on delete restrict
        on update cascade,
        
    foreign key (round_id) references `round`(round_id)
        on delete restrict
        on update cascade,
        
    foreign key (edition_id) references edition(edition_id)
        on delete restrict
        on update cascade
);

create table ticket_category (
    ticket_category_id int primary key,
    ticket_category_name varchar(30) not null,
    ticket_category_description varchar(200),
    ticket_category_price decimal(8,2) not null
);

create table spectator (
    spectator_id int primary key,
    spectator_first_name varchar(50) not null,
    spectator_last_name varchar(50) not null,
    spectator_email varchar(100) not null,
    spectator_phone_number varchar(20),
    referrer_spectator_id int null,

    foreign key (referrer_spectator_id) references spectator(spectator_id)
        on delete set null
        on update cascade
);

create table sponsor (
    sponsor_id int primary key,
    sponsor_company_name varchar(100) not null,
    sponsor_contract_amount decimal(12,2) not null,
    tournament_id int not null,

    foreign key (tournament_id) references tournament(tournament_id)
        on delete restrict
        on update cascade
);

create table ticket (
    ticket_id int primary key,
    ticket_purchase_date date not null,
    ticket_date date not null,              
    ticket_price decimal(8,2) not null,
    ticket_seat_number varchar(10) not null,
    ticket_category_id int not null,
    spectator_id int not null,
    court_id int not null,                  
    
    foreign key (ticket_category_id) references ticket_category(ticket_category_id)
        on delete restrict
        on update cascade,
    
    foreign key (spectator_id) references spectator(spectator_id)
        on delete cascade
        on update cascade,
    
    foreign key (court_id) references court(court_id)  
        on delete restrict
        on update cascade
);

create table `set` (
    set_id int primary key,
    set_number int not null,
    set_player1_score int not null,
    set_player2_score int not null,
    match_id int not null,

    foreign key (match_id) references `match`(match_id)
        on delete cascade
        on update cascade
);

create table match_statistic (
    statistic_id int primary key,
    statistic_aces_count int not null,
    statistic_double_faults_count int not null,
    statistic_break_points_count int not null,
    statistic_first_serve_percentage int not null,
    match_id int not null,
    player_id int not null,

    foreign key (match_id) references `match`(match_id)
        on delete cascade
        on update cascade,

    foreign key (player_id) references player(player_id)
        on delete cascade
        on update cascade
);

create table play (
    player_id int not null,
    match_id int not null,
    match_result varchar(10) not null,

    primary key (player_id, match_id),

    foreign key (player_id) references player(player_id)
        on delete cascade
        on update cascade,

    foreign key (match_id) references `match`(match_id)
        on delete cascade
        on update cascade
);

create table include_category (
    edition_id int not null,
    category_id int not null,

    primary key (edition_id, category_id),

    foreign key (edition_id) references edition(edition_id)
        on delete cascade
        on update cascade,

    foreign key (category_id) references category(category_id)
        on delete cascade
        on update cascade
);