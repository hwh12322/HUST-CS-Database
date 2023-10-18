
use testdb1;
start transaction;
set @n = sleep(3);
select tickets from ticket where flight_no = 'MU2455';
set @n = sleep(4);
select tickets from ticket where flight_no = 'MU2455';
commit;
