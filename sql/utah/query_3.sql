# Query 3
# Which populated places in Utah are located 10 or more miles from the nearest hospital?

# Objective:
# Identify and extract areas in Utah at that are located 10 or more miles from 
# the nearest hospital based on population

#Expected Output
#Table with 262 rows and 4 columns

select
pl.name as populated_place,
pl.fclass as place_type,
ST_Distance(pl.geom:: geography, nearest_hospital.geom::geography) / 1609.344 
as distance_to_hosp_mi,
pl.geom

from
places as pl

cross join lateral (
    select 
    p.geom

    from
    pois as p

    where
    p.fclass = 'hospital'

    order by
    ST_Distance(pl.geom:: geography, p.geom:: geography)
    limit 1
) as nearest_hospital

where
pl.fclass in ('city', 'town', 'village','suburb')
and ST_Distance(pl.geom:: geography, nearest_hospital.geom:: geography) >= 16093.44

order by
distance_to_hosp_mi DESC; 

