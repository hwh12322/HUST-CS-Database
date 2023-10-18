
select pro_income,count(pro_income) as presence
from property
group by pro_income
having count(*) >= all(select count(*) from property group by pro_income)
