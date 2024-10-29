SELECT 
    sellers.name seller_name,
    buyers.name buyer_name,
    invoices.created_at purchase_date,
    invoices.updated_at updated_at,
    shipping_address_list.address shipping_address,
    
    GROUP_CONCAT(items.name) item_names,
    GROUP_CONCAT(items.price) item_prices,
    GROUP_CONCAT(invoice_item.quantity) item_quantities,
    
    SUM(items.price * invoice_item.quantity) total_item_price,
        
    invoices.services_fee,
    invoices.app_services_fee,
    invoices.shipping_fee,
    invoices.shipping_assurance_fee assurance_fee,
    
    SUM(items.price * invoice_item.quantity) 
    + invoices.services_fee 
    + invoices.app_services_fee 
    + invoices.shipping_fee 
    + invoices.shipping_assurance_fee total_bill,

    GROUP_CONCAT(promos.name) promos,
    courier_types.name courier_type,
    GROUP_CONCAT(payment_types.name) payment_methods
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
    promos ON invoices.id = promos.invoice_id
JOIN 
    courier_types ON invoices.courier_type_id = courier_types.id
JOIN 
    payment_types ON invoices.id = payment_types.invoice_id
GROUP BY 
    invoices.id, sellers.name, buyers.name, invoices.created_at, invoices.updated_at, 
    shipping_address_list.address, invoices.services_fee, invoices.app_services_fee, 
    invoices.shipping_fee, invoices.shipping_assurance_fee, promos.name, courier_types.name
ORDER BY 
    invoices.id;