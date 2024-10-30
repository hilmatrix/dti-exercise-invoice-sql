SELECT 
    sellers.name AS seller_name,
    buyers.name AS buyer_name,
    invoices.created_at AS purchase_date,
    invoices.updated_at AS updated_at,
    shipping_address_list.address AS shipping_address,
    
    GROUP_CONCAT(DISTINCT items.name) AS item_names,
    GROUP_CONCAT(DISTINCT item_snapshots.price) AS item_prices,
    GROUP_CONCAT(DISTINCT invoice_item.quantity) AS item_quantities,
    
    SUM(item_snapshots.price * invoice_item.quantity) AS total_item_price,
        
    invoices.services_fee,
    invoices.app_services_fee,
    invoices.shipping_fee,
    invoices.shipping_assurance_fee AS assurance_fee,
    
    SUM(items.price * invoice_item.quantity) 
    + invoices.services_fee 
    + invoices.app_services_fee 
    + invoices.shipping_fee 
    + invoices.shipping_assurance_fee AS total_bill,

    GROUP_CONCAT(DISTINCT promos.name) AS promos,
    courier_types.name AS courier_type,
    GROUP_CONCAT(DISTINCT payment_types.name) AS payment_methods
FROM 
    invoices
JOIN 
    sellers ON invoices.seller_id = sellers.id
JOIN 
    buyers ON invoices.buyer_id = buyers.id
JOIN 
    shipping_address_list ON invoices.shipping_address = shipping_address_list.id
JOIN 
    invoice_item ON invoices.id = invoice_item.invoice_id
JOIN 
    items ON invoice_item.items_id = items.id
JOIN 
    item_snapshots ON items.id = item_snapshots.item_id
LEFT JOIN 
    promos ON invoices.id = promos.invoice_id
JOIN 
    courier_types ON invoices.courier_type_id = courier_types.id
LEFT JOIN 
    payment_types ON payment_types.invoice_id = invoices.id
GROUP BY 
    invoices.id, sellers.name, buyers.name, invoices.created_at, invoices.updated_at, 
    shipping_address_list.address, invoices.services_fee, invoices.app_services_fee, 
    invoices.shipping_fee, invoices.shipping_assurance_fee, courier_types.name
ORDER BY 
    invoices.id;