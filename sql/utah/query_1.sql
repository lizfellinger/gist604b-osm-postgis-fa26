-- Query 1
-- Where are hospitals located throughout Utah?

-- Objective:
-- Extract the name and locations of hospitals
-- Expected Outcome: Table with 2 columns (geom & name), 5 rows
select 
    geom, name
from 
    pois 
where
    fclass = 'hospital';
