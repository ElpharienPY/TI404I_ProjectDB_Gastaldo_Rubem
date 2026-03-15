-- ================================================================================
-- ROLAND-GARROS TOURNAMENT MANAGEMENT SYSTEM
-- ================================================================================

-- ================================================================================
-- CATEGORY 1: PROJECTIONS AND SELECTIONS (5 queries)
-- ================================================================================

-- Query 1: List all French players ranked in top 50
SELECT 
    player_first_name, 
    player_last_name, 
    player_ranking,
    player_gender
FROM player
WHERE player_nationality = 'FRA' AND player_ranking <= 50
ORDER BY player_ranking ASC;

-- Query 2: Matches played between June 1-10, 2024
SELECT 
    match_id, 
    match_date, 
    match_start_time,
    match_duration
FROM `match`
WHERE match_date BETWEEN '2024-06-01' AND '2024-06-10'
ORDER BY match_date, match_start_time;

-- Query 3: Covered courts with capacity greater than 5000
SELECT 
    court_name, 
    court_capacity, 
    court_surface,
    court_is_covered
FROM court
WHERE court_is_covered = TRUE AND court_capacity > 5000
ORDER BY court_capacity DESC;

-- Query 4: Players without a coach
SELECT 
    player_first_name, 
    player_last_name, 
    player_nationality,
    player_ranking
FROM player
WHERE coach_id IS NULL
ORDER BY player_ranking;

-- Query 5: All distinct nationalities of players
SELECT DISTINCT player_nationality
FROM player
ORDER BY player_nationality;

-- ================================================================================
-- CATEGORY 2: AGGREGATIONS (5 queries)
-- ================================================================================

-- Query 6: Number of matches played on each court
SELECT 
    c.court_name, 
    COUNT(m.match_id) as total_matches
FROM court c
LEFT JOIN `match` m ON c.court_id = m.court_id
GROUP BY c.court_id, c.court_name
ORDER BY total_matches DESC;

-- Query 7: Average ticket price per category
SELECT 
    tc.ticket_category_name, 
    ROUND(AVG(t.ticket_price), 2) as average_price,
    COUNT(t.ticket_id) as tickets_sold
FROM ticket_category tc
JOIN ticket t ON tc.ticket_category_id = t.ticket_category_id
GROUP BY tc.ticket_category_id, tc.ticket_category_name
ORDER BY average_price DESC;

-- Query 8: Number of players per nationality (only nationalities with 2+ players)
SELECT 
    player_nationality, 
    COUNT(*) as player_count
FROM player
GROUP BY player_nationality
HAVING COUNT(*) >= 2
ORDER BY player_count DESC, player_nationality;

-- Query 9: Average match duration per round
SELECT 
    r.round_name, 
    ROUND(AVG(m.match_duration), 0) as avg_duration_minutes,
    COUNT(m.match_id) as match_count
FROM `round` r
JOIN `match` m ON r.round_id = m.round_id
GROUP BY r.round_id, r.round_name
ORDER BY r.round_order;

-- Query 10: Total sponsorship revenue for the tournament
SELECT 
    SUM(sponsor_contract_amount) as total_sponsorship_revenue,
    COUNT(sponsor_id) as total_sponsors,
    ROUND(AVG(sponsor_contract_amount), 2) as avg_contract_amount
FROM sponsor;

-- ================================================================================
-- CATEGORY 3: JOINS (5 queries)
-- ================================================================================

-- Query 11: Match details with winner and loser player names
SELECT 
    m.match_id,
    m.match_date,
    c.court_name,
    p1.player_first_name as winner_firstname,
    p1.player_last_name as winner_lastname,
    p2.player_first_name as loser_firstname,
    p2.player_last_name as loser_lastname
FROM `match` m
JOIN play pl1 ON m.match_id = pl1.match_id AND pl1.match_result = 'Winner'
JOIN player p1 ON pl1.player_id = p1.player_id
JOIN play pl2 ON m.match_id = pl2.match_id AND pl2.match_result = 'Loser'
JOIN player p2 ON pl2.player_id = p2.player_id
JOIN court c ON m.court_id = c.court_id
ORDER BY m.match_date;

-- Query 12: Ticket details with spectator and category information
SELECT 
    t.ticket_id,
    s.spectator_first_name,
    s.spectator_last_name,
    s.spectator_email,
    tc.ticket_category_name,
    t.ticket_price,
    t.ticket_date,
    c.court_name
FROM ticket t
JOIN spectator s ON t.spectator_id = s.spectator_id
JOIN ticket_category tc ON t.ticket_category_id = tc.ticket_category_id
JOIN court c ON t.court_id = c.court_id
ORDER BY t.ticket_date, t.ticket_id
LIMIT 20;

-- Query 13: Players with their coach names (including players without coaches)
SELECT 
    p.player_first_name,
    p.player_last_name,
    p.player_nationality,
    p.player_ranking,
    COALESCE(CONCAT(c.coach_first_name, ' ', c.coach_last_name), 'No Coach') as coach_name
FROM player p
LEFT JOIN coach c ON p.coach_id = c.coach_id
ORDER BY p.player_ranking;

-- Query 14: Match information with umpire, round, and court details
SELECT 
    m.match_id,
    m.match_date,
    m.match_start_time,
    CONCAT(u.umpire_first_name, ' ', u.umpire_last_name) as umpire_name,
    r.round_name,
    c.court_name,
    e.edition_year
FROM `match` m
JOIN umpire u ON m.umpire_id = u.umpire_id
JOIN `round` r ON m.round_id = r.round_id
JOIN court c ON m.court_id = c.court_id
JOIN edition e ON m.edition_id = e.edition_id
ORDER BY m.match_date, m.match_start_time;

-- Query 15: Top 10 players by aces count with match statistics
SELECT 
    p.player_first_name,
    p.player_last_name,
    ms.statistic_aces_count,
    ms.statistic_first_serve_percentage,
    m.match_date
FROM match_statistic ms
JOIN player p ON ms.player_id = p.player_id
JOIN `match` m ON ms.match_id = m.match_id
ORDER BY ms.statistic_aces_count DESC
LIMIT 10;

-- ================================================================================
-- CATEGORY 4: SUBQUERIES (5 queries)
-- ================================================================================

-- Query 16: Players who never played a match
SELECT 
    player_first_name, 
    player_last_name,
    player_nationality,
    player_ranking
FROM player
WHERE player_id NOT IN (
    SELECT DISTINCT player_id
    FROM play
)
ORDER BY player_ranking;

-- Query 17: Courts that hosted more matches than the average
SELECT 
    c.court_name,
    (SELECT COUNT(*) FROM `match` WHERE court_id = c.court_id) as match_count
FROM court c
WHERE (SELECT COUNT(*) FROM `match` WHERE court_id = c.court_id) > (
    SELECT AVG(match_count)
    FROM (
        SELECT COUNT(*) as match_count
        FROM `match`
        GROUP BY court_id
    ) as counts
)
ORDER BY match_count DESC;

-- Query 18: Spectators who referred at least one other spectator
SELECT 
    s1.spectator_first_name, 
    s1.spectator_last_name,
    s1.spectator_email,
    (SELECT COUNT(*) FROM spectator WHERE referrer_spectator_id = s1.spectator_id) as referrals_count
FROM spectator s1
WHERE EXISTS (
    SELECT 1
    FROM spectator s2
    WHERE s2.referrer_spectator_id = s1.spectator_id
)
ORDER BY referrals_count DESC;

-- Query 19: Players ranked better than the average ranking
SELECT 
    player_first_name, 
    player_last_name, 
    player_ranking,
    player_nationality
FROM player
WHERE player_ranking < (
    SELECT AVG(player_ranking)
    FROM player
)
ORDER BY player_ranking;

-- Query 20: Matches with duration longer than average
SELECT 
    m.match_id, 
    m.match_date,
    m.match_duration,
    r.round_name
FROM `match` m
JOIN `round` r ON m.round_id = r.round_id
WHERE m.match_duration > (
    SELECT AVG(match_duration)
    FROM `match`
)
ORDER BY m.match_duration DESC;

-- ================================================================================
-- BONUS QUERIES: COMPLETE USAGE SCENARIO
-- Scenario: Tournament Director analyzing 2024 edition performance (real data insights)
-- ================================================================================

-- BONUS Query 1: Complete tournament overview for 2024 edition
-- Purpose: Get overall statistics for the 2024 tournament
SELECT 
    e.edition_year,
    COUNT(DISTINCT m.match_id) as total_matches,
    COUNT(DISTINCT p.player_id) as total_players,
    COUNT(DISTINCT t.ticket_id) as tickets_sold,
    SUM(t.ticket_price) as total_ticket_revenue,
    ROUND(AVG(m.match_duration), 0) as avg_match_duration
FROM edition e
LEFT JOIN `match` m ON e.edition_id = m.edition_id
LEFT JOIN play pl ON m.match_id = pl.match_id
LEFT JOIN player p ON pl.player_id = p.player_id
LEFT JOIN ticket t ON t.court_id = m.court_id AND t.ticket_date = m.match_date
WHERE e.edition_year = 2024
GROUP BY e.edition_id, e.edition_year;

-- BONUS Query 2: Top performers analysis (winners with most matches)
-- Purpose: Identify the most successful players in 2024
SELECT 
    p.player_first_name,
    p.player_last_name,
    p.player_nationality,
    COUNT(pl.match_id) as matches_won,
    ROUND(AVG(ms.statistic_aces_count), 1) as avg_aces,
    ROUND(AVG(ms.statistic_first_serve_percentage), 1) as avg_first_serve_pct
FROM player p
JOIN play pl ON p.player_id = pl.player_id
JOIN `match` m ON pl.match_id = m.match_id
JOIN edition e ON m.edition_id = e.edition_id
JOIN match_statistic ms ON m.match_id = ms.match_id AND p.player_id = ms.player_id
WHERE pl.match_result = 'Winner' AND e.edition_year = 2024
GROUP BY p.player_id, p.player_first_name, p.player_last_name, p.player_nationality
HAVING COUNT(pl.match_id) >= 2
ORDER BY matches_won DESC, avg_aces DESC;

-- BONUS Query 3: Court utilization and revenue analysis
-- Purpose: Analyze which courts generated most revenue and matches
SELECT 
    c.court_name,
    c.court_capacity,
    COUNT(DISTINCT m.match_id) as matches_hosted,
    COUNT(t.ticket_id) as tickets_sold,
    SUM(t.ticket_price) as revenue_generated,
    ROUND(SUM(t.ticket_price) / COUNT(DISTINCT m.match_id), 2) as avg_revenue_per_match
FROM court c
LEFT JOIN `match` m ON c.court_id = m.court_id
LEFT JOIN ticket t ON c.court_id = t.court_id
GROUP BY c.court_id, c.court_name, c.court_capacity
ORDER BY revenue_generated DESC;

-- BONUS Query 4: Spectator engagement analysis (referral program success)
-- Purpose: Evaluate the success of the referral program
SELECT 
    s1.spectator_first_name,
    s1.spectator_last_name,
    s1.spectator_email,
    COUNT(s2.spectator_id) as people_referred,
    COUNT(t.ticket_id) as tickets_purchased,
    COALESCE(SUM(t.ticket_price), 0) as total_spent
FROM spectator s1
LEFT JOIN spectator s2 ON s1.spectator_id = s2.referrer_spectator_id
LEFT JOIN ticket t ON s1.spectator_id = t.spectator_id
GROUP BY s1.spectator_id, s1.spectator_first_name, s1.spectator_last_name, s1.spectator_email
HAVING COUNT(s2.spectator_id) > 0 OR COUNT(t.ticket_id) > 0
ORDER BY people_referred DESC, total_spent DESC
LIMIT 15;
