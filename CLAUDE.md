# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Academic database design project for EFREI TI404 course. Models a Roland-Garros tennis tournament management system using the **MERISE methodology** (French/European database design standard).

**Team:** Raphael GASTALDO & Adrian RUBEM

## Architecture

The project follows the MERISE design phases:

1. **Requirements analysis** — `/prompts/` contains the business rules prompt and AI-generated analysis (`ia_response.txt` has the 20 business rules and data dictionary)
2. **Conceptual Data Model (MCD)** — `/mcd/RolandGarros_MCD.loo` (Looping tool format) + `mcd_image.png`
3. **Logical Data Model (LDM)** — `LDM_RolandGarros.docx`
4. **Physical implementation** — `/scripts/` contains 4 SQL scripts (see below)

## Database Schema

16 entities across three domains:
- **Sports:** `player`, `match`, `set`, `umpire`, `coach`, `round`, `category`, `match_statistic`
- **Commercial:** `spectator`, `ticket`, `ticket_category`, `sponsor`, `hotel`
- **Organizational:** `tournament`, `edition`, `court`

Key design decisions in `1_creation.sql`:
- `SET` is a weak entity (depends on `MATCH`, CASCADE on delete)
- `PLAYER` has optional FK to `coach` and `hotel` (nullable)
- Referential integrity choices are annotated inline with ✅ comments

## SQL Scripts

Four scripts must be run **in order**:

| Script | Purpose |
|--------|---------|
| `1_creation.sql` | DDL — 18 tables, FK constraints, referential integrity |
| `2_contraintes.sql` | 15 CHECK constraints via ALTER TABLE |
| `3_insertion.sql` | ~590 sample rows across all 18 tables (editions 2024 & 2025) |
| `4_interrogation.sql` | 20 queries (projections, aggregations, joins, subqueries) + 4 bonus |

```bash
# MySQL
mysql -u <user> -p <database> < scripts/1_creation.sql
mysql -u <user> -p <database> < scripts/2_contraintes.sql
mysql -u <user> -p <database> < scripts/3_insertion.sql
mysql -u <user> -p <database> < scripts/4_interrogation.sql

# PostgreSQL
psql -U <user> -d <database> -f scripts/1_creation.sql
psql -U <user> -d <database> -f scripts/2_contraintes.sql
psql -U <user> -d <database> -f scripts/3_insertion.sql
psql -U <user> -d <database> -f scripts/4_interrogation.sql
```

No build tools, package managers, or test runners — this is a pure database design project.

## Sample Data (`3_insertion.sql`)

Covers 2 editions (Roland-Garros 2024 & 2025). Key volumes: 40 players (20M/20F), 30 matches, 150 tickets, 80 spectators (20% with referrer), 90 sets, 60 match statistics. Insertion prompt: `/prompts/prompt_insertion.txt`.

## MCD Tooling

The conceptual model was built with **Looping** (free MERISE tool). The `.loo` file in `/mcd/` can only be opened with Looping. The exported PNG is the human-readable version.

## Business Rules Reference

All 20 business rules are in `/prompts/ia_response.txt`. Key constraints:
- One category per player per tournament edition
- One court occupied by at most one match at any given date/time
- Men's matches: 2–5 sets; Women's matches: 2–3 sets
- Tournament phases: Qualifications → Round 1 → Round 2 → Round 3 → Round of 16 → Quarterfinals → Semifinals → Finals
