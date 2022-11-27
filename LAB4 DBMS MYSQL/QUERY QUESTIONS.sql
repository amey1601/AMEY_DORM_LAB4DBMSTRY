select cus_gender, count(cus_gender) count from customer 
where cus_id in (select cus_id from orderr where ord_amount >= 3000)
group by cus_gender;

select product.PRO_ID, product.PRO_NAME , orderr.*  from product inner join supplier_pricing on 
supplier_pricing.pro_id=product.pro_id inner join orderr 
on orderr.PRICING_ID=supplier_pricing.PRICING_ID where orderr.cus_id = 2;

select * from supplier where supp_id in (select supp_id  from supplier_pricing group by 
supp_id having count(pro_id)>1);


select t3.cat_id,t3.CAT_NAME,t3.pro_name, min(t3.min_price) as MIN_PRICE FROM
(select category.* , t2.pro_name, t2.min_price from category inner join  
(select product.* , t1.min_price from product inner join 
(select pro_id , min(supp_price) as MIN_PRICE from supplier_pricing group by pro_id) 
as t1 on product.pro_id=t1.pro_id) as t2 on category.CAT_ID=t2.CAT_ID) as t3 
group by t3.cat_id ;


select product.pro_id , product.pro_name from product natural join 
orderr natural join supplier_pricing 
where orderr.ord_date>"2021-10-05";


select cus_name,cus_gender from customer where cus_name like "%A" union 
select cus_name,cus_gender from customer where cus_name like "A%" order by cus_name;
