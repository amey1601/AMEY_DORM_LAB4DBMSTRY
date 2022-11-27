DELIMITER && 
CREATE PROCEDURE proc()
BEGIN 
select report.supp_id, report.supp_name,report.average, 
CASE
	when report.average=5 then "EXCELLENT SERVICE"
    when report.average>=4 then "GOOD SERVICE"
    when report.average>2 then "AVERAGE SERVICE"
    ELSE "POOR SERVICE"
    
END AS Type_of_Service from

(select final.supp_id, supplier.supp_name, final.Average from (select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from

(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS 
from supplier_pricing inner join 
(select orderr.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from orderr inner join rating on rating. ord_id = orderr.ORD_ID) as test 
on test.PRICING_ID=supplier_pricing.PRICING_ID)
as test2 group by supplier_pricing.supp_id)



as final inner join supplier where final.supp_id = supplier.supp_id) as report;

END &&


call proc(); 
    
    