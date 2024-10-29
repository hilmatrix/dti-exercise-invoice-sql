SELECT 
    s.name AS seller_name,
    b.name AS buyer_name,
    i.created_at AS purchase_date,
    i.updated_at AS updated_at,
    sa.address AS shipping_address,
    GROUP_CONCAT(
        CONCAT(it.name, ' (Qty: ', ii.quantity, ', Price: $', it.price, ', Weight: ', it.weight, 'g)') 
        SEPARATOR '; ') AS item_details,
    i.services_fee,
    i.app_services_fee,
    i.shipping_fee,
    i.shipping_assurance_fee AS assurance_fee,
    p.name AS promo_name,
    ct.name AS courier_type,
    pm.name AS payment_method
FROM 
    invoices AS i
JOIN 
    sellers AS s ON i.seller_id = s.id
JOIN 
    buyers AS b ON i.buyer_id = b.id
JOIN 
    shipping_address_list AS sa ON i.shipping_address = sa.id
JOIN 
    invoice_item AS ii ON i.id = ii.invoice_id
JOIN 
    items AS it ON ii.items_id = it.id
LEFT JOIN 
    promos AS p ON i.id = p.invoice_id
JOIN 
    courier_types AS ct ON i.courier_type_id = ct.id
JOIN 
    payment_types AS pm ON i.id = pm.invoice_id
GROUP BY 
    i.id, s.name, b.name, i.created_at, i.updated_at, sa.address, i.services_fee, 
    i.app_services_fee, i.shipping_fee, i.shipping_assurance_fee, p.name, ct.name, pm.name
ORDER BY 
    i.id;
