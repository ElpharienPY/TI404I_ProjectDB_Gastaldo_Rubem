-- ================================================================================
-- LEVEL 0 - Independent tables
-- ================================================================================

-- TABLE: TOURNAMENT (1 record)
INSERT INTO tournament (tournament_id, tournament_name, tournament_location, tournament_prize_pool) VALUES
    (1, 'Roland-Garros', 'Paris, France', 50000000.00);

-- TABLE: CATEGORY (5 records)
INSERT INTO category (category_id, category_name, category_prize_pool) VALUES
    (1, 'Men''s Singles',    15000000.00),
    (2, 'Women''s Singles',  15000000.00),
    (3, 'Men''s Doubles',     5000000.00),
    (4, 'Women''s Doubles',   5000000.00),
    (5, 'Mixed Doubles',      2000000.00);

-- TABLE: COACH (20 records)
INSERT INTO coach (coach_id, coach_first_name, coach_last_name, coach_nationality) VALUES
    (1,  'Carlos',    'Moya',         'ESP'),
    (2,  'Ivan',      'Lendl',        'CZE'),
    (3,  'Patrick',   'Mouratoglou',  'FRA'),
    (4,  'Goran',     'Ivanisevic',   'CRO'),
    (5,  'Stefan',    'Edberg',       'SWE'),
    (6,  'Boris',     'Becker',       'GER'),
    (7,  'Amelie',    'Mauresmo',     'FRA'),
    (8,  'Sven',      'Groeneveld',   'NED'),
    (9,  'Wim',       'Fissette',     'BEL'),
    (10, 'Toni',      'Nadal',        'ESP'),
    (11, 'Riccardo',  'Piatti',       'ITA'),
    (12, 'Magnus',    'Norman',       'SWE'),
    (13, 'Darren',    'Cahill',       'AUS'),
    (14, 'Brad',      'Gilbert',      'USA'),
    (15, 'Larry',     'Stefanki',     'USA'),
    (16, 'Roger',     'Rasheed',      'AUS'),
    (17, 'Sam',       'Sumyk',        'FRA'),
    (18, 'Nicolas',   'Peifer',       'FRA'),
    (19, 'Thomas',    'Hogstedt',     'SWE'),
    (20, 'Jose',      'Higueras',     'ESP');

-- TABLE: HOTEL (5 records)
INSERT INTO hotel (hotel_id, hotel_name, hotel_star_rating) VALUES
    (1, 'Pullman Paris Tour Eiffel',  4),
    (2, 'Hotel Lutetia',              5),
    (3, 'Hotel Le Marois',            4),
    (4, 'Novotel Paris Bercy',        4),
    (5, 'Hotel Molitor Paris',        5);

-- TABLE: UMPIRE (15 records)
INSERT INTO umpire (umpire_id, umpire_first_name, umpire_last_name) VALUES
    (1,  'Carlos',   'Ramos'),
    (2,  'James',    'Keothavong'),
    (3,  'Eva',      'Asderaki'),
    (4,  'Marija',   'Cicak'),
    (5,  'Damien',   'Dumusois'),
    (6,  'Kader',    'Nouni'),
    (7,  'Aurelie',  'Tourte'),
    (8,  'John',     'Blom'),
    (9,  'Alison',   'Hughes'),
    (10, 'Mohamed',  'Lahyani'),
    (11, 'Lina',     'Laskova'),
    (12, 'Naresh',   'Kumar'),
    (13, 'Pascal',   'Maria'),
    (14, 'Enric',    'Molina'),
    (15, 'Denis',    'Pitcairn');

-- TABLE: ROUND (7 records)
INSERT INTO `round` (round_id, round_name, round_order) VALUES
    (1, 'Round 1',       1),
    (2, 'Round 2',       2),
    (3, 'Round 3',       3),
    (4, 'Round of 16',   4),
    (5, 'Quarterfinals', 5),
    (6, 'Semifinals',    6),
    (7, 'Final',         7);

-- TABLE: COURT (5 records)
INSERT INTO court (court_id, court_name, court_surface, court_capacity, court_is_covered) VALUES
    (1, 'Philippe Chatrier',   'Clay', 15000, TRUE),
    (2, 'Suzanne Lenglen',     'Clay', 10000, FALSE),
    (3, 'Simonne Mathieu',     'Clay',  5000, TRUE),
    (4, 'Court 14',            'Clay',  3000, FALSE),
    (5, 'Court 7',             'Clay',  2000, FALSE);

-- TABLE: TICKET_CATEGORY (4 records)
INSERT INTO ticket_category (ticket_category_id, ticket_category_name, ticket_category_description, ticket_category_price) VALUES
    (1, 'VIP',               'VIP lounge access, premium seating, hospitality package', 500.00),
    (2, 'Premium Tribune',   'Covered tribune, excellent view, numbered seat',          200.00),
    (3, 'Standard Tribune',  'Open tribune, numbered seat',                              80.00),
    (4, 'General Admission', 'Access to outer courts and general areas',                 30.00);

-- ================================================================================
-- LEVEL 1 - One level of foreign keys
-- ================================================================================

-- TABLE: EDITION (2 records)
INSERT INTO edition (edition_id, edition_year, edition_start_date, edition_end_date, tournament_id) VALUES
    (1, 2024, '2024-05-26', '2024-06-09', 1),
    (2, 2025, '2025-05-25', '2025-06-08', 1);

-- TABLE: PLAYER (40 records — 20 men category_id=1, 20 women category_id=2)
INSERT INTO player (player_id, player_first_name, player_last_name, player_nationality, player_birth_date, player_ranking, player_gender, coach_id, category_id, hotel_id) VALUES
    -- Men (category_id = 1)
    (1,  'Novak',     'Djokovic',    'SRB', '1987-05-22',  1,  'M',  4,  1, 1),
    (2,  'Carlos',    'Alcaraz',     'ESP', '2003-05-05',  2,  'M',  1,  1, 2),
    (3,  'Jannik',    'Sinner',      'ITA', '2001-08-16',  3,  'M', 11,  1, NULL),
    (4,  'Daniil',    'Medvedev',    'RUS', '1996-02-11',  4,  'M', NULL,1, NULL),
    (5,  'Alexander', 'Zverev',      'GER', '1997-04-20',  5,  'M',  6,  1, 3),
    (6,  'Andrey',    'Rublev',      'RUS', '1997-10-20',  6,  'M', NULL,1, NULL),
    (7,  'Holger',    'Rune',        'DEN', '2003-04-29',  7,  'M',  3,  1, NULL),
    (8,  'Casper',    'Ruud',        'NOR', '1998-12-22',  8,  'M', NULL,1, NULL),
    (9,  'Stefanos',  'Tsitsipas',   'GRE', '1998-08-12',  9,  'M', NULL,1, 1),
    (10, 'Taylor',    'Fritz',       'USA', '1997-10-28', 10,  'M', 14,  1, NULL),
    (11, 'Frances',   'Tiafoe',      'USA', '1998-01-20', 12,  'M', NULL,1, NULL),
    (12, 'Sebastian', 'Korda',       'USA', '2000-07-05', 18,  'M', NULL,1, NULL),
    (13, 'Lorenzo',   'Musetti',     'ITA', '2002-03-03', 15,  'M', NULL,1, 4),
    (14, 'Ugo',       'Humbert',     'FRA', '1998-06-26', 14,  'M', NULL,1, NULL),
    (15, 'Nicolas',   'Jarry',       'CHI', '1995-10-11', 20,  'M', NULL,1, NULL),
    (16, 'Arthur',    'Fils',        'FRA', '2004-09-18', 22,  'M', NULL,1, NULL),
    (17, 'Grigor',    'Dimitrov',    'BUL', '1991-05-16', 16,  'M',  5,  1, NULL),
    (18, 'Ben',       'Shelton',     'USA', '2002-10-09', 17,  'M', NULL,1, NULL),
    (19, 'Felix',     'Auger-Aliassime', 'CAN', '2000-08-08', 19, 'M', NULL,1, NULL),
    (20, 'Alejandro', 'Davidovich Fokina', 'ESP', '1999-06-25', 25, 'M', NULL, 1, NULL),
    -- Women (category_id = 2)
    (21, 'Iga',       'Swiatek',     'POL', '2001-05-31',  1,  'F',  9,  2, 2),
    (22, 'Aryna',     'Sabalenka',   'BLR', '1998-05-05',  2,  'F', NULL,2, NULL),
    (23, 'Coco',      'Gauff',       'USA', '2004-03-13',  3,  'F', NULL,2, 3),
    (24, 'Elena',     'Rybakina',    'KAZ', '1999-06-17',  4,  'F',  8,  2, NULL),
    (25, 'Marketa',   'Vondrousova', 'CZE', '1999-06-28',  5,  'F', NULL,2, NULL),
    (26, 'Jessica',   'Pegula',      'USA', '1994-02-24',  6,  'F', NULL,2, NULL),
    (27, 'Barbora',   'Krejcikova',  'CZE', '1995-12-18',  7,  'F', NULL,2, 4),
    (28, 'Mirra',     'Andreeva',    'RUS', '2007-05-29', 11,  'F', NULL,2, NULL),
    (29, 'Daria',     'Kasatkina',   'RUS', '1997-05-07', 12,  'F', NULL,2, NULL),
    (30, 'Caroline',  'Wozniacki',   'DEN', '1990-07-11', 14,  'F',  7,  2, 5),
    (31, 'Karolina',  'Muchova',     'CZE', '1996-08-21',  8,  'F', NULL,2, NULL),
    (32, 'Madison',   'Keys',        'USA', '1995-02-17', 13,  'F', NULL,2, NULL),
    (33, 'Beatriz',   'Haddad Maia', 'BRA', '1996-05-30', 15,  'F', NULL,2, NULL),
    (34, 'Liudmila',  'Samsonova',   'RUS', '1998-08-10', 16,  'F', NULL,2, NULL),
    (35, 'Elise',     'Mertens',     'BEL', '1995-03-17', 18,  'F', 17,  2, NULL),
    (36, 'Elina',     'Svitolina',   'UKR', '1994-09-12', 20,  'F', NULL,2, NULL),
    (37, 'Petra',     'Kvitova',     'CZE', '1990-03-08', 22,  'F', NULL,2, NULL),
    (38, 'Emma',      'Raducanu',    'GBR', '2002-11-13', 30,  'F', NULL,2, NULL),
    (39, 'Sloane',    'Stephens',    'USA', '1993-03-20', 35,  'F', NULL,2, NULL),
    (40, 'Oceane',    'Dodin',       'FRA', '1996-03-18', 50,  'F', NULL,2, NULL);

-- TABLE: SPONSOR (5 records)
INSERT INTO sponsor (sponsor_id, sponsor_company_name, sponsor_contract_amount, tournament_id) VALUES
    (1, 'BNP Paribas', 20000000.00, 1),
    (2, 'Rolex',       15000000.00, 1),
    (3, 'Lacoste',     10000000.00, 1),
    (4, 'Peugeot',      7500000.00, 1),
    (5, 'Perrier',      5000000.00, 1);

-- TABLE: SPECTATOR (80 records)
-- First 64 without referrer, last 16 with referrer
INSERT INTO spectator (spectator_id, spectator_first_name, spectator_last_name, spectator_email, spectator_phone_number, referrer_spectator_id) VALUES
    (1,  'Marie',      'Dupont',      'marie.dupont@gmail.com',       '+33612345678', NULL),
    (2,  'Pierre',     'Martin',      'pierre.martin@gmail.com',      '+33623456789', NULL),
    (3,  'Sophie',     'Bernard',     'sophie.bernard@yahoo.fr',      '+33634567890', NULL),
    (4,  'Jean',       'Dubois',      'jean.dubois@orange.fr',        '+33645678901', NULL),
    (5,  'Claire',     'Thomas',      'claire.thomas@gmail.com',      '+33656789012', NULL),
    (6,  'Luc',        'Robert',      'luc.robert@hotmail.fr',        '+33667890123', NULL),
    (7,  'Isabelle',   'Richard',     'isabelle.richard@gmail.com',   '+33678901234', NULL),
    (8,  'Francois',   'Petit',       'francois.petit@sfr.fr',        '+33689012345', NULL),
    (9,  'Nathalie',   'Durand',      'nathalie.durand@gmail.com',    '+33690123456', NULL),
    (10, 'Michel',     'Leroy',       'michel.leroy@wanadoo.fr',      '+33601234567', NULL),
    (11, 'Sylvie',     'Moreau',      'sylvie.moreau@gmail.com',      '+33611111111', NULL),
    (12, 'Philippe',   'Simon',       'philippe.simon@gmail.com',     '+33622222222', NULL),
    (13, 'Veronique',  'Laurent',     'veronique.laurent@orange.fr',  '+33633333333', NULL),
    (14, 'Eric',       'Michel',      'eric.michel@gmail.com',        '+33644444444', NULL),
    (15, 'Laurence',   'Garcia',      'laurence.garcia@yahoo.fr',     '+33655555555', NULL),
    (16, 'Christophe', 'David',       'christophe.david@gmail.com',   '+33666666666', NULL),
    (17, 'Sandrine',   'Bertrand',    'sandrine.bertrand@sfr.fr',     '+33677777777', NULL),
    (18, 'Olivier',    'Roux',        'olivier.roux@gmail.com',       '+33688888888', NULL),
    (19, 'Catherine',  'Vincent',     'catherine.vincent@gmail.com',  '+33699999999', NULL),
    (20, 'Bruno',      'Fournier',    'bruno.fournier@orange.fr',     '+33600000001', NULL),
    (21, 'Agnes',      'Girard',      'agnes.girard@gmail.com',       '+33600000002', NULL),
    (22, 'Thierry',    'Bonnet',      'thierry.bonnet@gmail.com',     '+33600000003', NULL),
    (23, 'Valerie',    'Francois',    'valerie.francois@yahoo.fr',    '+33600000004', NULL),
    (24, 'Stephane',   'Legrand',     'stephane.legrand@gmail.com',   '+33600000005', NULL),
    (25, 'Helene',     'Garnier',     'helene.garnier@hotmail.fr',    '+33600000006', NULL),
    (26, 'Patrick',    'Faure',       'patrick.faure@gmail.com',      '+33600000007', NULL),
    (27, 'Monique',    'Rousseau',    'monique.rousseau@sfr.fr',      '+33600000008', NULL),
    (28, 'Daniel',     'Blanc',       'daniel.blanc@gmail.com',       '+33600000009', NULL),
    (29, 'Martine',    'Guerin',      'martine.guerin@orange.fr',     '+33600000010', NULL),
    (30, 'Alain',      'Muller',      'alain.muller@gmail.com',       '+33600000011', NULL),
    (31, 'Corinne',    'Henry',       'corinne.henry@gmail.com',      '+33600000012', NULL),
    (32, 'Herve',      'Chevalier',   'herve.chevalier@wanadoo.fr',   '+33600000013', NULL),
    (33, 'James',      'Smith',       'james.smith@gmail.com',        '+12125550101', NULL),
    (34, 'Emily',      'Johnson',     'emily.johnson@yahoo.com',      '+12125550102', NULL),
    (35, 'Michael',    'Williams',    'michael.williams@gmail.com',   '+12125550103', NULL),
    (36, 'Sarah',      'Jones',       'sarah.jones@outlook.com',      '+12125550104', NULL),
    (37, 'David',      'Brown',       'david.brown@gmail.com',        '+12125550105', NULL),
    (38, 'Jessica',    'Davis',       'jessica.davis@yahoo.com',      '+12125550106', NULL),
    (39, 'Daniel',     'Miller',      'daniel.miller@gmail.com',      '+12125550107', NULL),
    (40, 'Ashley',     'Wilson',      'ashley.wilson@outlook.com',    '+12125550108', NULL),
    (41, 'Marco',      'Rossi',       'marco.rossi@gmail.com',        '+39012345678', NULL),
    (42, 'Giulia',     'Ferrari',     'giulia.ferrari@yahoo.it',      '+39023456789', NULL),
    (43, 'Luca',       'Esposito',    'luca.esposito@gmail.com',      '+39034567890', NULL),
    (44, 'Chiara',     'Romano',      'chiara.romano@gmail.com',      '+39045678901', NULL),
    (45, 'Hans',       'Mueller',     'hans.mueller@gmail.com',       '+49030123456', NULL),
    (46, 'Anna',       'Schmidt',     'anna.schmidt@web.de',          '+49030234567', NULL),
    (47, 'Klaus',      'Fischer',     'klaus.fischer@gmail.com',      '+49030345678', NULL),
    (48, 'Maria',      'Weber',       'maria.weber@gmail.com',        '+49030456789', NULL),
    (49, 'Carlos',     'Rodriguez',   'carlos.rodriguez@gmail.com',   '+34912345678', NULL),
    (50, 'Ana',        'Martinez',    'ana.martinez@gmail.com',       '+34923456789', NULL),
    (51, 'Pablo',      'Lopez',       'pablo.lopez@yahoo.es',         '+34934567890', NULL),
    (52, 'Elena',      'Sanchez',     'elena.sanchez@gmail.com',      '+34945678901', NULL),
    (53, 'Piotr',      'Kowalski',    'piotr.kowalski@gmail.com',     '+48123456789', NULL),
    (54, 'Katarzyna',  'Nowak',       'katarzyna.nowak@wp.pl',        '+48234567890', NULL),
    (55, 'Marek',      'Wisniewski',  'marek.wisniewski@gmail.com',   '+48345678901', NULL),
    (56, 'Zofia',      'Wojcik',      'zofia.wojcik@gmail.com',       '+48456789012', NULL),
    (57, 'Nikolaos',   'Papadopoulos','nikolaos.papa@gmail.com',      '+30210123456', NULL),
    (58, 'Eleni',      'Georgiou',    'eleni.georgiou@gmail.com',     '+30210234567', NULL),
    (59, 'Kenji',      'Tanaka',      'kenji.tanaka@gmail.com',       '+81312345678', NULL),
    (60, 'Yuki',       'Suzuki',      'yuki.suzuki@gmail.com',        '+81323456789', NULL),
    (61, 'Lukas',      'Novak',       'lukas.novak@gmail.com',        '+420123456789', NULL),
    (62, 'Tereza',     'Dvorak',      'tereza.dvorak@seznam.cz',      '+420234567890', NULL),
    (63, 'Stefan',     'Popescu',     'stefan.popescu@gmail.com',     '+40212345678', NULL),
    (64, 'Ioana',      'Ionescu',     'ioana.ionescu@gmail.com',      '+40223456789', NULL),
    -- 16 with referrer
    (65, 'Romain',     'Leclerc',     'romain.leclerc@gmail.com',     '+33600000020',  1),
    (66, 'Julie',      'Perrin',      'julie.perrin@yahoo.fr',        '+33600000021',  1),
    (67, 'Antoine',    'Gros',        'antoine.gros@sfr.fr',          '+33600000022',  2),
    (68, 'Camille',    'Millet',      'camille.millet@gmail.com',     '+33600000023',  2),
    (69, 'Nicolas',    'Renard',      'nicolas.renard@orange.fr',     '+33600000024',  3),
    (70, 'Emilie',     'Baron',       'emilie.baron@gmail.com',       '+33600000025',  3),
    (71, 'Julien',     'Picard',      'julien.picard@gmail.com',      '+33600000026',  5),
    (72, 'Aurelie',    'Caron',       'aurelie.caron@hotmail.fr',     '+33600000027',  5),
    (73, 'Thomas',     'Colin',       'thomas.colin@gmail.com',       '+33600000028', 10),
    (74, 'Pauline',    'Denis',       'pauline.denis@sfr.fr',         '+33600000029', 10),
    (75, 'Maxime',     'Gautier',     'maxime.gautier@gmail.com',     '+33600000030', 15),
    (76, 'Lucie',      'Morin',       'lucie.morin@gmail.com',        '+33600000031', 15),
    (77, 'Guillaume',  'Noel',        'guillaume.noel@orange.fr',     '+33600000032', 20),
    (78, 'Manon',      'Olivier',     'manon.olivier@gmail.com',      '+33600000033', 20),
    (79, 'Kevin',      'Pons',        'kevin.pons@gmail.com',         '+33600000034', 33),
    (80, 'Laura',      'Quinn',       'laura.quinn@gmail.com',        '+33600000035', 34);

-- ================================================================================
-- LEVEL 2 - Two levels of foreign keys
-- ================================================================================

-- TABLE: MATCH (30 records)
-- match_id, match_date, match_start_time, match_duration, umpire_id, court_id, round_id, edition_id
INSERT INTO `match` (match_id, match_date, match_start_time, match_duration, umpire_id, court_id, round_id, edition_id) VALUES
    -- 2024 edition - Round 1
    (1,  '2024-05-27', '11:00:00', 120,  1, 1, 1, 1),
    (2,  '2024-05-27', '13:00:00', 150,  2, 2, 1, 1),
    (3,  '2024-05-27', '15:00:00', 105,  3, 3, 1, 1),
    (4,  '2024-05-28', '11:00:00', 180,  4, 4, 1, 1),
    (5,  '2024-05-28', '13:00:00', 135,  5, 5, 1, 1),
    (6,  '2024-05-28', '15:00:00', 200,  6, 1, 1, 1),
    -- 2024 edition - Round 2
    (7,  '2024-05-30', '11:00:00', 160,  7, 2, 2, 1),
    (8,  '2024-05-30', '13:00:00', 140,  8, 3, 2, 1),
    (9,  '2024-05-31', '11:00:00', 175,  9, 1, 2, 1),
    (10, '2024-05-31', '15:00:00', 120,  10,2, 2, 1),
    -- 2024 edition - Round 3
    (11, '2024-06-02', '13:00:00', 155, 11, 1, 3, 1),
    (12, '2024-06-02', '15:00:00', 130, 12, 2, 3, 1),
    -- 2024 edition - Round of 16
    (13, '2024-06-03', '11:00:00', 185,  1, 1, 4, 1),
    (14, '2024-06-03', '15:00:00', 145,  2, 2, 4, 1),
    -- 2024 edition - Quarterfinals
    (15, '2024-06-05', '13:00:00', 210,  3, 1, 5, 1),
    (16, '2024-06-05', '15:00:00', 165,  4, 2, 5, 1),
    -- 2024 edition - Semifinals
    (17, '2024-06-07', '13:00:00', 230,  5, 1, 6, 1),
    (18, '2024-06-07', '13:00:00', 190,  6, 2, 6, 1),
    -- 2024 edition - Final
    (19, '2024-06-09', '15:00:00', 260,  1, 1, 7, 1),
    -- 2025 edition - Round 1
    (20, '2025-05-26', '11:00:00', 115,  7, 1, 1, 2),
    (21, '2025-05-26', '13:00:00', 145,  8, 2, 1, 2),
    (22, '2025-05-27', '11:00:00', 130,  9, 3, 1, 2),
    (23, '2025-05-27', '15:00:00', 170,  10,4, 1, 2),
    -- 2025 edition - Round 2
    (24, '2025-05-29', '11:00:00', 155, 11, 1, 2, 2),
    (25, '2025-05-29', '13:00:00', 140,  12,2, 2, 2),
    -- 2025 edition - Round 3
    (26, '2025-05-31', '15:00:00', 180, 13, 1, 3, 2),
    -- 2025 edition - Round of 16
    (27, '2025-06-02', '11:00:00', 195, 14, 1, 4, 2),
    -- 2025 edition - Quarterfinals
    (28, '2025-06-04', '13:00:00', 220, 15, 1, 5, 2),
    -- 2025 edition - Semifinals
    (29, '2025-06-06', '13:00:00', 240,  1, 1, 6, 2),
    -- 2025 edition - Final
    (30, '2025-06-08', '15:00:00', 275,  2, 1, 7, 2);

-- TABLE: TICKET (150 records)
INSERT INTO ticket (ticket_id, ticket_purchase_date, ticket_date, ticket_price, ticket_seat_number, ticket_category_id, spectator_id, court_id) VALUES
    (1,  '2024-03-01', '2024-05-27', 500.00, 'VIP-1',  1,  1, 1),
    (2,  '2024-03-02', '2024-05-27', 500.00, 'VIP-2',  1,  2, 1),
    (3,  '2024-03-03', '2024-05-27', 200.00, 'A12',    2,  3, 1),
    (4,  '2024-03-04', '2024-05-27', 200.00, 'A13',    2,  4, 1),
    (5,  '2024-03-05', '2024-05-27',  80.00, 'B21',    3,  5, 1),
    (6,  '2024-03-06', '2024-05-27',  80.00, 'B22',    3,  6, 1),
    (7,  '2024-03-07', '2024-05-27',  30.00, 'GA-1',   4,  7, 2),
    (8,  '2024-03-08', '2024-05-27',  30.00, 'GA-2',   4,  8, 2),
    (9,  '2024-03-09', '2024-05-27', 200.00, 'A14',    2,  9, 2),
    (10, '2024-03-10', '2024-05-27', 200.00, 'A15',    2, 10, 2),
    (11, '2024-03-11', '2024-05-27',  80.00, 'B23',    3, 11, 2),
    (12, '2024-03-12', '2024-05-27',  80.00, 'B24',    3, 12, 2),
    (13, '2024-03-13', '2024-05-28', 500.00, 'VIP-3',  1, 13, 1),
    (14, '2024-03-14', '2024-05-28', 500.00, 'VIP-4',  1, 14, 1),
    (15, '2024-03-15', '2024-05-28', 200.00, 'A16',    2, 15, 1),
    (16, '2024-03-16', '2024-05-28', 200.00, 'A17',    2, 16, 1),
    (17, '2024-03-17', '2024-05-28',  80.00, 'B25',    3, 17, 3),
    (18, '2024-03-18', '2024-05-28',  80.00, 'B26',    3, 18, 3),
    (19, '2024-03-19', '2024-05-28',  30.00, 'GA-3',   4, 19, 3),
    (20, '2024-03-20', '2024-05-28',  30.00, 'GA-4',   4, 20, 3),
    (21, '2024-03-21', '2024-05-30', 500.00, 'VIP-5',  1, 21, 1),
    (22, '2024-03-22', '2024-05-30', 500.00, 'VIP-6',  1, 22, 1),
    (23, '2024-03-23', '2024-05-30', 200.00, 'A18',    2, 23, 1),
    (24, '2024-03-24', '2024-05-30', 200.00, 'A19',    2, 24, 1),
    (25, '2024-03-25', '2024-05-30',  80.00, 'B27',    3, 25, 2),
    (26, '2024-03-26', '2024-05-30',  80.00, 'B28',    3, 26, 2),
    (27, '2024-03-27', '2024-05-30',  30.00, 'GA-5',   4, 27, 2),
    (28, '2024-03-28', '2024-05-30',  30.00, 'GA-6',   4, 28, 2),
    (29, '2024-03-29', '2024-05-31', 500.00, 'VIP-7',  1, 29, 1),
    (30, '2024-03-30', '2024-05-31', 200.00, 'A20',    2, 30, 1),
    (31, '2024-03-31', '2024-05-31',  80.00, 'B29',    3, 31, 1),
    (32, '2024-04-01', '2024-05-31',  30.00, 'GA-7',   4, 32, 2),
    (33, '2024-04-02', '2024-06-02', 500.00, 'VIP-8',  1, 33, 1),
    (34, '2024-04-03', '2024-06-02', 200.00, 'A21',    2, 34, 1),
    (35, '2024-04-04', '2024-06-02',  80.00, 'B30',    3, 35, 1),
    (36, '2024-04-05', '2024-06-02',  30.00, 'GA-8',   4, 36, 2),
    (37, '2024-04-06', '2024-06-03', 500.00, 'VIP-9',  1, 37, 1),
    (38, '2024-04-07', '2024-06-03', 200.00, 'A22',    2, 38, 1),
    (39, '2024-04-08', '2024-06-03',  80.00, 'B31',    3, 39, 1),
    (40, '2024-04-09', '2024-06-03',  30.00, 'GA-9',   4, 40, 1),
    (41, '2024-04-10', '2024-06-05', 500.00, 'VIP-10', 1, 41, 1),
    (42, '2024-04-11', '2024-06-05', 500.00, 'VIP-11', 1, 42, 1),
    (43, '2024-04-12', '2024-06-05', 200.00, 'A23',    2, 43, 1),
    (44, '2024-04-13', '2024-06-05', 200.00, 'A24',    2, 44, 1),
    (45, '2024-04-14', '2024-06-05',  80.00, 'B32',    3, 45, 1),
    (46, '2024-04-15', '2024-06-05',  80.00, 'B33',    3, 46, 1),
    (47, '2024-04-16', '2024-06-05',  30.00, 'GA-10',  4, 47, 1),
    (48, '2024-04-17', '2024-06-05',  30.00, 'GA-11',  4, 48, 1),
    (49, '2024-04-18', '2024-06-07', 500.00, 'VIP-12', 1, 49, 1),
    (50, '2024-04-19', '2024-06-07', 500.00, 'VIP-13', 1, 50, 1),
    (51, '2024-04-20', '2024-06-07', 200.00, 'A25',    2, 51, 1),
    (52, '2024-04-21', '2024-06-07', 200.00, 'A26',    2, 52, 1),
    (53, '2024-04-22', '2024-06-07',  80.00, 'B34',    3, 53, 1),
    (54, '2024-04-23', '2024-06-07',  80.00, 'B35',    3, 54, 1),
    (55, '2024-04-24', '2024-06-07',  30.00, 'GA-12',  4, 55, 1),
    (56, '2024-04-25', '2024-06-07',  30.00, 'GA-13',  4, 56, 1),
    (57, '2024-04-26', '2024-06-09', 500.00, 'VIP-14', 1, 57, 1),
    (58, '2024-04-27', '2024-06-09', 500.00, 'VIP-15', 1, 58, 1),
    (59, '2024-04-28', '2024-06-09', 200.00, 'A27',    2, 59, 1),
    (60, '2024-04-29', '2024-06-09', 200.00, 'A28',    2, 60, 1),
    (61, '2024-04-30', '2024-06-09',  80.00, 'B36',    3, 61, 1),
    (62, '2024-05-01', '2024-06-09',  80.00, 'B37',    3, 62, 1),
    (63, '2024-05-02', '2024-06-09',  30.00, 'GA-14',  4, 63, 1),
    (64, '2024-05-03', '2024-06-09',  30.00, 'GA-15',  4, 64, 1),
    (65, '2024-05-04', '2024-06-09', 500.00, 'VIP-16', 1, 65, 1),
    (66, '2024-05-05', '2024-06-09', 200.00, 'A29',    2, 66, 1),
    (67, '2024-05-06', '2024-06-09',  80.00, 'B38',    3, 67, 1),
    (68, '2024-05-07', '2024-06-09',  30.00, 'GA-16',  4, 68, 1),
    (69, '2024-05-08', '2024-06-09',  30.00, 'GA-17',  4, 69, 1),
    (70, '2024-05-09', '2024-06-09',  30.00, 'GA-18',  4, 70, 1),
    -- 2025 tickets
    (71, '2025-02-01', '2025-05-26', 500.00, 'VIP-17', 1,  1, 1),
    (72, '2025-02-02', '2025-05-26', 500.00, 'VIP-18', 1,  2, 1),
    (73, '2025-02-03', '2025-05-26', 200.00, 'A30',    2,  3, 1),
    (74, '2025-02-04', '2025-05-26', 200.00, 'A31',    2,  4, 1),
    (75, '2025-02-05', '2025-05-26',  80.00, 'B39',    3,  5, 1),
    (76, '2025-02-06', '2025-05-26',  80.00, 'B40',    3,  6, 2),
    (77, '2025-02-07', '2025-05-26',  30.00, 'GA-19',  4,  7, 2),
    (78, '2025-02-08', '2025-05-26',  30.00, 'GA-20',  4,  8, 2),
    (79, '2025-02-09', '2025-05-27', 500.00, 'VIP-19', 1,  9, 1),
    (80, '2025-02-10', '2025-05-27', 200.00, 'A32',    2, 10, 1),
    (81, '2025-02-11', '2025-05-27',  80.00, 'B41',    3, 11, 3),
    (82, '2025-02-12', '2025-05-27',  30.00, 'GA-21',  4, 12, 3),
    (83, '2025-02-13', '2025-05-29', 500.00, 'VIP-20', 1, 13, 1),
    (84, '2025-02-14', '2025-05-29', 200.00, 'A33',    2, 14, 1),
    (85, '2025-02-15', '2025-05-29',  80.00, 'B42',    3, 15, 2),
    (86, '2025-02-16', '2025-05-29',  30.00, 'GA-22',  4, 16, 2),
    (87, '2025-02-17', '2025-05-31', 500.00, 'VIP-21', 1, 17, 1),
    (88, '2025-02-18', '2025-05-31', 200.00, 'A34',    2, 18, 1),
    (89, '2025-02-19', '2025-05-31',  80.00, 'B43',    3, 19, 1),
    (90, '2025-02-20', '2025-05-31',  30.00, 'GA-23',  4, 20, 1),
    (91, '2025-02-21', '2025-06-02', 500.00, 'VIP-22', 1, 21, 1),
    (92, '2025-02-22', '2025-06-02', 200.00, 'A35',    2, 22, 1),
    (93, '2025-02-23', '2025-06-02',  80.00, 'B44',    3, 23, 1),
    (94, '2025-02-24', '2025-06-02',  30.00, 'GA-24',  4, 24, 1),
    (95, '2025-02-25', '2025-06-04', 500.00, 'VIP-23', 1, 25, 1),
    (96, '2025-02-26', '2025-06-04', 500.00, 'VIP-24', 1, 26, 1),
    (97, '2025-02-27', '2025-06-04', 200.00, 'A36',    2, 27, 1),
    (98, '2025-02-28', '2025-06-04', 200.00, 'A37',    2, 28, 1),
    (99, '2025-03-01', '2025-06-04',  80.00, 'B45',    3, 29, 1),
    (100,'2025-03-02', '2025-06-04',  80.00, 'B46',    3, 30, 1),
    (101,'2025-03-03', '2025-06-06', 500.00, 'VIP-25', 1, 31, 1),
    (102,'2025-03-04', '2025-06-06', 500.00, 'VIP-26', 1, 32, 1),
    (103,'2025-03-05', '2025-06-06', 200.00, 'A38',    2, 33, 1),
    (104,'2025-03-06', '2025-06-06', 200.00, 'A39',    2, 34, 1),
    (105,'2025-03-07', '2025-06-06',  80.00, 'B47',    3, 35, 1),
    (106,'2025-03-08', '2025-06-06',  80.00, 'B48',    3, 36, 1),
    (107,'2025-03-09', '2025-06-06',  30.00, 'GA-25',  4, 37, 1),
    (108,'2025-03-10', '2025-06-06',  30.00, 'GA-26',  4, 38, 1),
    (109,'2025-03-11', '2025-06-08', 500.00, 'VIP-27', 1, 39, 1),
    (110,'2025-03-12', '2025-06-08', 500.00, 'VIP-28', 1, 40, 1),
    (111,'2025-03-13', '2025-06-08', 200.00, 'A40',    2, 41, 1),
    (112,'2025-03-14', '2025-06-08', 200.00, 'A41',    2, 42, 1),
    (113,'2025-03-15', '2025-06-08',  80.00, 'B49',    3, 43, 1),
    (114,'2025-03-16', '2025-06-08',  80.00, 'B50',    3, 44, 1),
    (115,'2025-03-17', '2025-06-08',  30.00, 'GA-27',  4, 45, 1),
    (116,'2025-03-18', '2025-06-08',  30.00, 'GA-28',  4, 46, 1),
    (117,'2025-03-19', '2025-06-08',  30.00, 'GA-29',  4, 47, 1),
    (118,'2025-03-20', '2025-06-08',  30.00, 'GA-30',  4, 48, 1),
    (119,'2024-03-01', '2024-05-27', 200.00, 'A42',    2, 71, 1),
    (120,'2024-03-02', '2024-05-27',  80.00, 'B51',    3, 72, 2),
    (121,'2024-03-03', '2024-05-27',  30.00, 'GA-31',  4, 73, 2),
    (122,'2024-03-04', '2024-05-28', 200.00, 'A43',    2, 74, 1),
    (123,'2024-03-05', '2024-05-28',  80.00, 'B52',    3, 75, 1),
    (124,'2024-03-06', '2024-05-30', 500.00, 'VIP-29', 1, 76, 1),
    (125,'2024-03-07', '2024-05-30', 200.00, 'A44',    2, 77, 1),
    (126,'2024-03-08', '2024-05-30',  80.00, 'B53',    3, 78, 2),
    (127,'2024-03-09', '2024-05-31', 500.00, 'VIP-30', 1, 79, 1),
    (128,'2024-03-10', '2024-05-31', 200.00, 'A45',    2, 80, 1),
    (129,'2024-04-01', '2024-06-02', 500.00, 'VIP-31', 1, 49, 1),
    (130,'2024-04-02', '2024-06-02', 200.00, 'A46',    2, 50, 2),
    (131,'2024-04-03', '2024-06-03', 500.00, 'VIP-32', 1, 51, 1),
    (132,'2024-04-04', '2024-06-03', 200.00, 'A47',    2, 52, 1),
    (133,'2024-04-05', '2024-06-05', 500.00, 'VIP-33', 1, 53, 1),
    (134,'2024-04-06', '2024-06-05', 200.00, 'A48',    2, 54, 1),
    (135,'2024-04-07', '2024-06-07', 500.00, 'VIP-34', 1, 55, 1),
    (136,'2024-04-08', '2024-06-07', 200.00, 'A49',    2, 56, 1),
    (137,'2024-04-09', '2024-06-09', 500.00, 'VIP-35', 1, 57, 1),
    (138,'2024-04-10', '2024-06-09', 200.00, 'A50',    2, 58, 1),
    (139,'2025-02-01', '2025-05-26',  80.00, 'B54',    3, 59, 4),
    (140,'2025-02-02', '2025-05-26',  30.00, 'GA-32',  4, 60, 5),
    (141,'2025-02-03', '2025-05-27',  80.00, 'B55',    3, 61, 4),
    (142,'2025-02-04', '2025-05-27',  30.00, 'GA-33',  4, 62, 5),
    (143,'2025-02-05', '2025-05-29',  80.00, 'B56',    3, 63, 4),
    (144,'2025-02-06', '2025-05-29',  30.00, 'GA-34',  4, 64, 5),
    (145,'2025-02-07', '2025-06-02',  80.00, 'B57',    3, 65, 4),
    (146,'2025-02-08', '2025-06-02',  30.00, 'GA-35',  4, 66, 5),
    (147,'2025-02-09', '2025-06-04',  80.00, 'B58',    3, 67, 4),
    (148,'2025-02-10', '2025-06-04',  30.00, 'GA-36',  4, 68, 5),
    (149,'2025-02-11', '2025-06-06',  80.00, 'B59',    3, 69, 4),
    (150,'2025-02-12', '2025-06-08',  30.00, 'GA-37',  4, 70, 5);

-- ================================================================================
-- LEVEL 3 - Complex dependencies
-- ================================================================================

-- TABLE: INCLUDE_CATEGORY (10 records)
INSERT INTO include_category (edition_id, category_id) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
    (2, 1), (2, 2), (2, 3), (2, 4), (2, 5);

-- TABLE: PLAY (60 records — exactly 2 players per match)
-- Men's matches: match_id 1-10, 13-15, 17, 19-20, 24-28, 30 use men (player_id 1-20)
-- Women's matches: match_id 11-12, 14, 16, 18, 21-23, 25, 29 use women (player_id 21-40)
INSERT INTO play (player_id, match_id, match_result) VALUES
    -- Match 1 (men)
    (1,  1,  'Winner'), (2,  1,  'Loser'),
    -- Match 2 (men)
    (3,  2,  'Winner'), (4,  2,  'Loser'),
    -- Match 3 (men)
    (5,  3,  'Winner'), (6,  3,  'Loser'),
    -- Match 4 (men)
    (7,  4,  'Winner'), (8,  4,  'Loser'),
    -- Match 5 (men)
    (9,  5,  'Winner'), (10, 5,  'Loser'),
    -- Match 6 (women)
    (21, 6,  'Winner'), (22, 6,  'Loser'),
    -- Match 7 (men)
    (1,  7,  'Winner'), (3,  7,  'Loser'),
    -- Match 8 (men)
    (5,  8,  'Winner'), (7,  8,  'Loser'),
    -- Match 9 (women)
    (23, 9,  'Winner'), (24, 9,  'Loser'),
    -- Match 10 (women)
    (25, 10, 'Winner'), (26, 10, 'Loser'),
    -- Match 11 (men)
    (1,  11, 'Winner'), (5,  11, 'Loser'),
    -- Match 12 (women)
    (21, 12, 'Winner'), (23, 12, 'Loser'),
    -- Match 13 (men)
    (1,  13, 'Winner'), (9,  13, 'Loser'),
    -- Match 14 (women)
    (21, 14, 'Winner'), (25, 14, 'Loser'),
    -- Match 15 (men)
    (2,  15, 'Winner'), (1,  15, 'Loser'),
    -- Match 16 (women)
    (22, 16, 'Winner'), (21, 16, 'Loser'),
    -- Match 17 (men)
    (2,  17, 'Winner'), (5,  17, 'Loser'),
    -- Match 18 (women)
    (22, 18, 'Winner'), (23, 18, 'Loser'),
    -- Match 19 (men - Final 2024)
    (2,  19, 'Winner'), (3,  19, 'Loser'),
    -- Match 20 (men)
    (1,  20, 'Winner'), (4,  20, 'Loser'),
    -- Match 21 (women)
    (21, 21, 'Winner'), (27, 21, 'Loser'),
    -- Match 22 (men)
    (2,  22, 'Winner'), (6,  22, 'Loser'),
    -- Match 23 (women)
    (28, 23, 'Winner'), (29, 23, 'Loser'),
    -- Match 24 (men)
    (1,  24, 'Winner'), (2,  24, 'Loser'),
    -- Match 25 (women)
    (21, 25, 'Winner'), (28, 25, 'Loser'),
    -- Match 26 (men)
    (1,  26, 'Winner'), (5,  26, 'Loser'),
    -- Match 27 (men)
    (1,  27, 'Winner'), (7,  27, 'Loser'),
    -- Match 28 (men)
    (1,  28, 'Winner'), (3,  28, 'Loser'),
    -- Match 29 (women)
    (21, 29, 'Winner'), (22, 29, 'Loser'),
    -- Match 30 (men - Final 2025)
    (1,  30, 'Winner'), (2,  30, 'Loser');

-- TABLE: SET (90 records — 3 sets per match on average)
INSERT INTO `set` (set_id, set_number, set_player1_score, set_player2_score, match_id) VALUES
    -- Match 1 (winner player 1 = player_id 1)
    (1,  1, 6, 4, 1), (2,  2, 6, 2, 1), (3,  3, 6, 3, 1),
    -- Match 2 (winner player 1 = player_id 3)
    (4,  1, 7, 5, 2), (5,  2, 3, 6, 2), (6,  3, 6, 4, 2),
    -- Match 3 (winner player 1 = player_id 5)
    (7,  1, 6, 1, 3), (8,  2, 6, 3, 3),
    -- Match 4 (winner player 1 = player_id 7)
    (9,  1, 6, 4, 4), (10, 2, 4, 6, 4), (11, 3, 7, 5, 4), (12, 4, 6, 3, 4),
    -- Match 5 (winner player 1 = player_id 9)
    (13, 1, 6, 3, 5), (14, 2, 6, 4, 5), (15, 3, 7, 6, 5),
    -- Match 6 (winner player 1 = player_id 21, women's — max 3 sets)
    (16, 1, 6, 2, 6), (17, 2, 6, 4, 6),
    -- Match 7 (winner player 1 = player_id 1)
    (18, 1, 6, 3, 7), (19, 2, 3, 6, 7), (20, 3, 6, 4, 7), (21, 4, 6, 2, 7),
    -- Match 8 (winner player 1 = player_id 5)
    (22, 1, 7, 6, 8), (23, 2, 6, 4, 8), (24, 3, 6, 2, 8),
    -- Match 9 (winner player 1 = player_id 23, women's)
    (25, 1, 6, 3, 9), (26, 2, 4, 6, 9), (27, 3, 6, 4, 9),
    -- Match 10 (winner player 1 = player_id 25, women's)
    (28, 1, 6, 1, 10), (29, 2, 6, 3, 10),
    -- Match 11 (winner player 1 = player_id 1)
    (30, 1, 6, 4, 11), (31, 2, 6, 2, 11), (32, 3, 6, 3, 11),
    -- Match 12 (winner player 1 = player_id 21, women's)
    (33, 1, 7, 5, 12), (34, 2, 6, 4, 12),
    -- Match 13 (winner player 1 = player_id 1)
    (35, 1, 6, 3, 13), (36, 2, 3, 6, 13), (37, 3, 6, 4, 13), (38, 4, 7, 5, 13),
    -- Match 14 (winner player 1 = player_id 21, women's)
    (39, 1, 6, 2, 14), (40, 2, 6, 3, 14),
    -- Match 15 (winner player 1 = player_id 2)
    (41, 1, 7, 6, 15), (42, 2, 4, 6, 15), (43, 3, 6, 4, 15), (44, 4, 3, 6, 15), (45, 5, 6, 4, 15),
    -- Match 16 (winner player 1 = player_id 22, women's)
    (46, 1, 6, 4, 16), (47, 2, 6, 3, 16),
    -- Match 17 (winner player 1 = player_id 2)
    (48, 1, 6, 3, 17), (49, 2, 7, 5, 17), (50, 3, 6, 4, 17),
    -- Match 18 (winner player 1 = player_id 22, women's)
    (51, 1, 7, 5, 18), (52, 2, 6, 4, 18),
    -- Match 19 (Final 2024, winner player 1 = player_id 2)
    (53, 1, 6, 4, 19), (54, 2, 3, 6, 19), (55, 3, 6, 3, 19), (56, 4, 6, 2, 19),
    -- Match 20 (winner player 1 = player_id 1)
    (57, 1, 6, 4, 20), (58, 2, 6, 3, 20), (59, 3, 6, 1, 20),
    -- Match 21 (winner player 1 = player_id 21, women's)
    (60, 1, 6, 2, 21), (61, 2, 6, 3, 21),
    -- Match 22 (winner player 1 = player_id 2)
    (62, 1, 6, 3, 22), (63, 2, 6, 4, 22), (64, 3, 6, 2, 22),
    -- Match 23 (winner player 1 = player_id 28, women's)
    (65, 1, 6, 4, 23), (66, 2, 4, 6, 23), (67, 3, 6, 3, 23),
    -- Match 24 (winner player 1 = player_id 1)
    (68, 1, 7, 6, 24), (69, 2, 6, 4, 24), (70, 3, 4, 6, 24), (71, 4, 6, 3, 24),
    -- Match 25 (winner player 1 = player_id 21, women's)
    (72, 1, 6, 3, 25), (73, 2, 6, 2, 25),
    -- Match 26 (winner player 1 = player_id 1)
    (74, 1, 6, 2, 26), (75, 2, 6, 4, 26), (76, 3, 7, 5, 26),
    -- Match 27 (winner player 1 = player_id 1)
    (77, 1, 6, 3, 27), (78, 2, 6, 4, 27), (79, 3, 6, 1, 27),
    -- Match 28 (winner player 1 = player_id 1)
    (80, 1, 7, 5, 28), (81, 2, 6, 3, 28), (82, 3, 6, 4, 28),
    -- Match 29 (winner player 1 = player_id 21, women's)
    (83, 1, 6, 4, 29), (84, 2, 7, 5, 29), (85, 3, 6, 3, 29),
    -- Match 30 (Final 2025, winner player 1 = player_id 1)
    (86, 1, 6, 4, 30), (87, 2, 4, 6, 30), (88, 3, 7, 6, 30), (89, 4, 6, 3, 30), (90, 5, 7, 5, 30);

-- TABLE: MATCH_STATISTIC (60 records — 2 per match)
-- statistic_id, aces, double_faults, break_points, first_serve_pct, match_id, player_id
INSERT INTO match_statistic (statistic_id, statistic_aces_count, statistic_double_faults_count, statistic_break_points_count, statistic_first_serve_percentage, match_id, player_id) VALUES
    (1,  10, 2,  6, 70, 1,  1),  (2,  4,  4,  2, 62, 1,  2),
    (3,  8,  3,  7, 68, 2,  3),  (4,  5,  2,  3, 65, 2,  4),
    (5,  12, 1,  8, 74, 3,  5),  (6,  3,  5,  1, 58, 3,  6),
    (7,  7,  4,  5, 66, 4,  7),  (8,  6,  3,  4, 63, 4,  8),
    (9,  9,  2,  7, 72, 5,  9),  (10, 4,  5,  2, 60, 5,  10),
    (11, 6,  3,  5, 69, 6,  21), (12, 3,  4,  2, 61, 6,  22),
    (13, 11, 2,  9, 75, 7,  1),  (14, 7,  3,  4, 67, 7,  3),
    (15, 8,  4,  6, 71, 8,  5),  (16, 5,  2,  3, 64, 8,  7),
    (17, 7,  3,  6, 70, 9,  23), (18, 4,  4,  3, 62, 9,  24),
    (19, 5,  2,  5, 68, 10, 25), (20, 3,  5,  2, 59, 10, 26),
    (21, 14, 1, 10, 78, 11, 1),  (22, 6,  4,  3, 63, 11, 5),
    (23, 8,  3,  7, 73, 12, 21), (24, 5,  3,  4, 65, 12, 23),
    (25, 15, 2, 11, 76, 13, 1),  (26, 7,  4,  4, 64, 13, 9),
    (27, 9,  2,  8, 74, 14, 21), (28, 4,  4,  3, 61, 14, 25),
    (29, 13, 3,  9, 73, 15, 2),  (30, 12, 2,  7, 72, 15, 1),
    (31, 7,  3,  5, 69, 16, 22), (32, 5,  4,  3, 63, 16, 21),
    (33, 16, 1, 12, 79, 17, 2),  (34, 8,  3,  5, 66, 17, 5),
    (35, 10, 2,  8, 74, 18, 22), (36, 6,  3,  4, 65, 18, 23),
    (37, 18, 2, 13, 80, 19, 2),  (38, 11, 3,  8, 71, 19, 3),
    (39, 13, 2, 10, 77, 20, 1),  (40, 5,  4,  3, 62, 20, 4),
    (41, 8,  3,  7, 71, 21, 21), (42, 4,  4,  3, 62, 21, 27),
    (43, 14, 1, 10, 76, 22, 2),  (44, 5,  4,  3, 63, 22, 6),
    (45, 6,  3,  5, 67, 23, 28), (46, 4,  4,  2, 60, 23, 29),
    (47, 15, 2, 11, 75, 24, 1),  (48, 12, 3,  8, 70, 24, 2),
    (49, 9,  2,  7, 73, 25, 21), (50, 5,  4,  4, 63, 25, 28),
    (51, 16, 1, 12, 78, 26, 1),  (52, 7,  3,  4, 65, 26, 5),
    (53, 17, 2, 13, 79, 27, 1),  (54, 6,  4,  4, 64, 27, 7),
    (55, 19, 2, 14, 81, 28, 1),  (56, 8,  3,  5, 66, 28, 3),
    (57, 11, 2,  9, 74, 29, 21), (58, 7,  4,  5, 65, 29, 22),
    (59, 20, 1, 15, 83, 30, 1),  (60, 14, 3, 10, 73, 30, 2);
