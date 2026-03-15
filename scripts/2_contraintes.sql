-- PLAYER CONSTRAINTS

-- Constraint 1: Player gender must be either 'M' (Male) or 'F' (Female)
ALTER TABLE player ADD CONSTRAINT chk_player_gender
    CHECK (player_gender IN ('M', 'F'));

-- Constraint 2: Player ranking must be a positive integer
ALTER TABLE player ADD CONSTRAINT chk_player_ranking
    CHECK (player_ranking > 0);

-- Constraint 3: Player nationality code must be exactly 3 characters (ISO 3166-1 alpha-3)
ALTER TABLE player ADD CONSTRAINT chk_player_nationality
    CHECK (LENGTH(player_nationality) = 3);

-- SET CONSTRAINTS

-- Constraint 4: Set scores must be between 0 and 7 (valid tennis scores)
ALTER TABLE `set` ADD CONSTRAINT chk_set_scores
    CHECK (set_player1_score >= 0 AND set_player1_score <= 7
       AND set_player2_score >= 0 AND set_player2_score <= 7);

-- Constraint 5: Set number must be between 1 and 5 (maximum 5 sets in a match)
ALTER TABLE `set` ADD CONSTRAINT chk_set_number
    CHECK (set_number >= 1 AND set_number <= 5);

-- COURT CONSTRAINTS

-- Constraint 6: Court capacity must be a positive integer (at least 1 spectator)
ALTER TABLE court ADD CONSTRAINT chk_court_capacity
    CHECK (court_capacity > 0);

-- Constraint 7: Court surface must be one of the valid tennis surfaces
ALTER TABLE court ADD CONSTRAINT chk_court_surface
    CHECK (court_surface IN ('Clay', 'Hard', 'Grass', 'Carpet'));

-- HOTEL CONSTRAINTS

-- Constraint 8: Hotel star rating must be between 1 and 5 stars
ALTER TABLE hotel ADD CONSTRAINT chk_hotel_rating
    CHECK (hotel_star_rating >= 1 AND hotel_star_rating <= 5);

-- MATCH CONSTRAINTS

-- Constraint 9: Match duration must be positive (in minutes)
ALTER TABLE `match` ADD CONSTRAINT chk_match_duration
    CHECK (match_duration > 0);

-- COACH CONSTRAINTS

-- Constraint 10: Coach nationality code must be exactly 3 characters (ISO 3166-1 alpha-3)
ALTER TABLE coach ADD CONSTRAINT chk_coach_nationality
    CHECK (LENGTH(coach_nationality) = 3);

-- MATCH_STATISTIC CONSTRAINTS

-- Constraint 11: First serve percentage must be between 0 and 100
ALTER TABLE match_statistic ADD CONSTRAINT chk_first_serve_percentage
    CHECK (statistic_first_serve_percentage >= 0 AND statistic_first_serve_percentage <= 100);

-- Constraint 12: Number of aces must be non-negative
ALTER TABLE match_statistic ADD CONSTRAINT chk_aces_count
    CHECK (statistic_aces_count >= 0);

-- Constraint 13: Number of double faults must be non-negative
ALTER TABLE match_statistic ADD CONSTRAINT chk_double_faults_count
    CHECK (statistic_double_faults_count >= 0);

-- Constraint 14: Number of break points must be non-negative
ALTER TABLE match_statistic ADD CONSTRAINT chk_break_points_count
    CHECK (statistic_break_points_count >= 0);

-- TICKET CONSTRAINTS

-- Constraint 15: Ticket price must be positive
ALTER TABLE ticket ADD CONSTRAINT chk_ticket_price
    CHECK (ticket_price > 0);

-- EDITION CONSTRAINTS

-- Constraint 16: Edition end date must be after start date
ALTER TABLE edition ADD CONSTRAINT chk_edition_dates
    CHECK (edition_end_date > edition_start_date);

-- PLAY CONSTRAINTS

-- Constraint 17: Match result must be either 'Winner' or 'Loser'
ALTER TABLE play ADD CONSTRAINT chk_match_result
    CHECK (match_result IN ('Winner', 'Loser'));

-- CATEGORY CONSTRAINTS

-- Constraint 18: Category prize pool must be positive
ALTER TABLE category ADD CONSTRAINT chk_category_prize_pool
    CHECK (category_prize_pool > 0);