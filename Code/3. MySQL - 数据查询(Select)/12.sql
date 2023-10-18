 -- 12) 综合客户表(client)、资产表(property)、理财产品表(finances_product)、保险表(insurance)和
 --     基金表(fund)，列出客户的名称、身份证号以及投资总金额（即投资本金，
 --     每笔投资金额=商品数量*该产品每份金额)，注意投资金额按类型需要查询不同的表，
 --     投资总金额是客户购买的各类资产(理财,保险,基金)投资金额的总和，总金额命名为total_amount。
 --     查询结果按总金额降序排序。
 -- 请用一条SQL语句实现该查询：
SELECT 
  client.c_name, 
  client.c_id_card, COALESCE(SUM(case
  when pro_type='1'then COALESCE(pro_quantity*p_amount,0)
  when pro_type='2'then COALESCE(pro_quantity*i_amount,0)
  when pro_type='3'then COALESCE(pro_quantity*f_amount,0)
END),0)   AS total_amount 
FROM 
  client 
  LEFT JOIN property ON client.c_id = property.pro_c_id 
  LEFT JOIN finances_product ON property.pro_pif_id = finances_product.p_id and pro_type='1'
  LEFT JOIN insurance ON property.pro_pif_id = insurance.i_id and pro_type='2'
  LEFT JOIN fund ON property.pro_pif_id = fund.f_id and pro_type='3'
GROUP BY
  client.c_id 
ORDER BY 
  total_amount DESC ;




/*  end  of  your code  */ 