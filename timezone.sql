select a.shipment_gid, 
to_date(TO_CHAR((from_tz(to_timestamp(TO_CHAR(b.appointment_pickup,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'),'GMT') at TIME zone 'America/New_York' ), 'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS')
from 
shipment a, shipment_stop b
where 1=1
and a.shipment_gid = b.shipment_gid
and b.stop_num = 1
and a.domain_name = 'XXX'
and a.shipment_gid = 'XXXXX'
