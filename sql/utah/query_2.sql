# Query 2
# How many healthcare facilities of each type are located within each county in utah?

#Objective:
# Extract the number of healthcare facilities by county
# Expected Outcome: Table with 66 rows and 4 columns

select 
aa.name as county_name, 
p.fclass as healthcare_type,
COUNT(DISTINCT p.osm_id) as facility_count,
aa.geom

from
adminareas_a as aa 

join
pois as p on ST_Intersects(aa.geom, p.geom)

where
aa.fclass = 'admin_level6'
and p.fclass IN( 'hospital', 'pharmacy', 'clinic', 'doctors', 'dentist')

group by
aa.name, p.fclass, aa.geom

order by 
aa.name,
facility_count DESC;