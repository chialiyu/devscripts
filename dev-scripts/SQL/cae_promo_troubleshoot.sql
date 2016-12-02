-- Promo_Item_Store
select *
from PROMO_ITEM_STORE
where Dept_i = 2
and class_i = 1
--and item_i = 1168
and store_i = 3200

-- Promo Product
select * from db2prod.PROMO a, db2prod.PROMO_PROD b where
a.PROMO_I = b.PROMO_I and a.MED_TYPE_C = 8 and a.START_D > '10/25/2015' and a.END_D < '11/21/2015'
with ur;

select * from db2prod.PROMO_ITEM

-- Promo on item/loc level

select e.DEPT_I, e.CLASS_I, e.ITEM_I, f.store_i, a.START_D, a.END_D
from db2prod.PROMO a, db2prod.PROMO_PROD b, db2prod.PROMO_VER_PROD c, db2prod.PROMO_ITEM e, db2prod.PROMO_ITEM_STORE f
where
a.PROMO_I = b.PROMO_I and a.PROMO_I = c.PROMO_I and b.PROMO_PROD_I = c.PROMO_PROD_I
and a.PROMO_I = e.PROMO_I and b.PROMO_PROD_I = e.PROMO_PROD_I and c.PROMO_I = e.PROMO_I and c.PROMO_PROD_I = e.PROMO_PROD_I
and a.PROMO_I = f.PROMO_I and b.PROMO_PROD_I = f.PROMO_PROD_I and c.PROMO_MED_VER_I = f.PROMO_MED_VER_I
and e.DEPT_I = f.DEPT_I and e.CLASS_I = f.CLASS_I and e.ITEM_I = f.ITEM_I
--and a.MED_TYPE_C = 8
--and a.PROMO_I = 129808
--and b.PROMO_PROD_I = 15
--and c.PROMO_MED_VER_I = 22798243
and a.START_D > '12/11/2013' and a.END_D < '12/31/2017'
and e.DEPT_I=2 and e.CLASS_I=2
and f.STORE_I=3200
with ur;
