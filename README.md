# TI404I_ProjectDB_Gastaldo_Rubem
# Roland-Garros Tournament Management System
 
## 👥 Team Members
- **Raphael GASTALDO**
- **Adrian RUBEM**
 
**Course:** TI404 - Databases 1  
**Instructor:** Lena TREBAUL/Amir CHACHAOUI  
**Deadline:** February 27, 2026
 
---
 
## 🎯 Project Overview
 
Database design for Roland-Garros tennis tournament management using the MERISE methodology.
 
**Scope:**
- Sports: Players, matches, statistics
- Commercial: Tickets, spectators, sponsors
- Organizational: Courts, tournament editions
 
---
 
## 📋 Part 1: Requirements Analysis & MCD
 
### 1. Domain Selection
 
**Domain:** Professional Tennis Tournament Management  
**Organization:** French Tennis Federation (FFT)  
**Tournament:** Roland-Garros Grand Slam
 
---
 
### 2. Requirements Analysis
 
#### 2.1 Prompt Used
 
Full prompt: [`prompts/prompt_analyse_besoins.txt`](prompts/prompt_analyse_besoins.txt)
 
We used the RICARDO framework to query an AI assistant (Claude) for business requirements.
 
#### 2.2 AI Response
 
Full response: [`prompts/ia_response.txt`](prompts/ia_response.txt)
 
---
 
### 3. Business Rules
 
1. Each player must be registered with a unique identification number and have an official ATP or WTA ranking
2. A player can only participate in one category during the tournament (either Men's Singles or Women's Singles)
3. Each match must be played on exactly one court at a specific date and time
4. A court can host multiple matches throughout the tournament but only one match at a time
5. Each match is officiated by one chair umpire and multiple line judges
6. A match consists of a minimum of 2 sets and maximum of 5 sets for men, and 2 to 3 sets for women
7. Each player may have one registered coach who can accompany them during the tournament
8. Tournament progresses through defined phases: Qualifications, Round 1, Round 2, Round 3, Round of 16, Quarterfinals, Semifinals, and Finals
9. A player advances to the next round only by winning their current round match
10. Courts are characterized by surface type (all clay for Roland-Garros), capacity, and whether they are covered or open-air
11. Spectators must purchase tickets for specific dates and court sessions
12. Tickets are categorized by access type: VIP lounges, Tribune seats, or General lawn access
13. Each spectator ticket is valid for one specific date and grants access to specific courts
14. Sponsors have contracts specifying their sponsorship level and visibility benefits
15. Prize money is distributed according to the round reached by each player
16. Players are accommodated in partner hotels with pre-negotiated rates
17. Match statistics (aces, double faults, break points) are recorded for each set of every match
18. An umpire can officiate multiple matches but not simultaneously
19. Each tournament edition has a fixed total prize pool that is distributed among participants
20. Player rankings may change after the tournament based on their performance
 
---
 
### 4. Data Dictionary
 
| Meaning of the Data | Type | Size |
|---------------------|------|------|
| Player identification number | INTEGER | 10 |
| Player first name | TEXT | 50 |
| Player last name | TEXT | 50 |
| Player nationality | TEXT | 3 |
| Player date of birth | DATE | 10 |
| Player ATP/WTA ranking | INTEGER | 5 |
| Player gender | TEXT | 1 |
| Match identification number | INTEGER | 10 |
| Match date | DATE | 10 |
| Match start time | TIME | 8 |
| Match duration in minutes | INTEGER | 4 |
| Court identification number | INTEGER | 5 |
| Court name | TEXT | 50 |
| Court surface type | TEXT | 20 |
| Court capacity | INTEGER | 6 |
| Court covered status | BOOLEAN | 1 |
| Set number | INTEGER | 1 |
| Set score player 1 | INTEGER | 2 |
| Set score player 2 | INTEGER | 2 |
| Umpire identification number | INTEGER | 10 |
| Umpire first name | TEXT | 50 |
| Umpire last name | TEXT | 50 |
| Umpire certification level | TEXT | 20 |
| Coach identification number | INTEGER | 10 |
| Coach first name | TEXT | 50 |
| Coach last name | TEXT | 50 |
| Round name | TEXT | 30 |
| Tournament year | INTEGER | 4 |
| Total prize pool | DECIMAL | 12 |
| Prize amount by round | DECIMAL | 10 |
| Ticket identification number | INTEGER | 10 |
| Ticket category | TEXT | 20 |
| Ticket price | DECIMAL | 8 |
| Spectator email | TEXT | 100 |
| Sponsor company name | TEXT | 100 |
| Sponsorship contract amount | DECIMAL | 12 |
 
**Total: 35 data items**
 
---
 
### 5. Conceptual Data Model (MCD)
 
![MCD](mcd/mcd_image.png)
 
**Source file:** [`mcd/roland_garros_orga.loo`](mcd/RolandGarros_MCD.loo)
 
#### MCD Statistics
 
- **Entities:** 16
- **Attributes:** 67
- **Relationships:** 18
- **Normalization:** 3NF
 
#### Entities by Domain
 
**Sports (8):** PLAYER, MATCH, SET, UMPIRE, COACH, ROUND, CATEGORY, MATCH_STATISTIC
 
**Commercial (5):** SPECTATOR, TICKET, TICKET_CATEGORY, SPONSOR, HOTEL
 
**Organizational (3):** TOURNAMENT, EDITION, COURT
 
#### Advanced Modeling Elements
 
**1. Weak Entity:** SET depends on MATCH
- A set cannot exist without its parent match
- Relationship: MATCH **contains** SET (1,1 ↔ 1,n)
 
**2. Recursive Relationship:** SPECTATOR invites SPECTATOR
- Represents a referral/sponsorship program
- Cardinalities: 0,n (referrer) ↔ 0,1 (referred)
 
---
 
## 📁 Project Structure
```
ProjectDB_Nom1_Nom2/
├── README.md
├── prompts/
│   ├── prompt_analyse_besoins.txt
│   └── ia_response.txt
└── mcd/
    ├── RolandGarros_MCD.loo
    └── mcd_image.png
```
 
---
 
## 🔧 Tools Used
 
- **Looping** - MCD modeling
- **Claude (Anthropic)** - Requirements analysis
- **MERISE** - Database design methodology
- **Git/GitHub** - Version control in bash
 
---
 
## 📚 References
 
- [Roland-Garros Official Website](https://www.rolandgarros.com)
- [ATP Tour](https://www.atptour.com)
- [WTA Tennis](https://www.wtatennis.com)
- [French Tennis Federation](https://www.fft.fr)
