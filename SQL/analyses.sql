-- 1️ — Ventes totales par État (région du client)

SELECT 
    olist_customers_dataset.customer_state AS etat,
    ROUND(SUM(olist_order_items_dataset.price + olist_order_items_dataset.freight_value), 2) AS total_ventes
FROM olist_orders_dataset
JOIN olist_customers_dataset 
    ON olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
JOIN olist_order_items_dataset 
    ON olist_orders_dataset.order_id = olist_order_items_dataset.order_id
GROUP BY etat
ORDER BY total_ventes DESC;


-- 2️ — Top 10 des produits les plus vendus
SELECT 
    olist_products_dataset.product_category_name AS categorie,
    COUNT(olist_order_items_dataset.product_id) AS nombre_ventes
FROM olist_order_items_dataset
JOIN olist_products_dataset 
    ON olist_order_items_dataset.product_id = olist_products_dataset.product_id
GROUP BY categorie
ORDER BY nombre_ventes DESC
LIMIT 10;


-- 🔹 3️ — Délai moyen de livraison (global)
SELECT 
    ROUND(AVG(julianday(order_delivered_customer_date) - julianday(order_purchase_timestamp)), 2) AS delai_moyen_livraison
FROM olist_orders_dataset
WHERE order_delivered_customer_date IS NOT NULL;



-- 🔹 4️ — Délai moyen de livraison par État
SELECT 
    olist_customers_dataset.customer_state AS etat,
    ROUND(AVG(julianday(order_delivered_customer_date) - julianday(order_purchase_timestamp)), 2) AS delai_moyen
FROM olist_orders_dataset
JOIN olist_customers_dataset 
    ON olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY etat
ORDER BY delai_moyen;



-- 🔹 5️ — Taux de satisfaction moyen
SELECT 
    ROUND(AVG(review_score), 2) AS satisfaction_moyenne
FROM olist_order_reviews_dataset;



-- 🔹 6️ — Corrélation entre délai et satisfaction client
SELECT 
    ROUND(AVG(julianday(order_delivered_customer_date) - julianday(order_purchase_timestamp)), 0) AS delai_moyen_jours,
    ROUND(AVG(olist_order_reviews_dataset.review_score), 2) AS score_moyen
FROM olist_orders_dataset
JOIN olist_order_reviews_dataset 
    ON olist_orders_dataset.order_id = olist_order_reviews_dataset.order_id
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY delai_moyen_jours
ORDER BY delai_moyen_jours;



-- 🔹 7️ — Répartition des ventes par catégorie de produits
SELECT 
    olist_products_dataset.product_category_name AS categorie,
    ROUND(SUM(olist_order_items_dataset.price + olist_order_items_dataset.freight_value), 2) AS total_ventes
FROM olist_order_items_dataset
JOIN olist_products_dataset 
    ON olist_order_items_dataset.product_id = olist_products_dataset.product_id
GROUP BY categorie
ORDER BY total_ventes DESC;



-- 🔹 8️ — Analyse temporelle : ventes par mois
SELECT 
    strftime('%Y-%m', order_purchase_timestamp) AS mois,
    ROUND(SUM(olist_order_items_dataset.price + olist_order_items_dataset.freight_value), 2) AS total_ventes
FROM olist_orders_dataset
JOIN olist_order_items_dataset 
    ON olist_orders_dataset.order_id = olist_order_items_dataset.order_id
GROUP BY mois
ORDER BY mois;



-- 🔹 9️ — Analyse temporelle : ventes par année
SELECT 
    strftime('%Y', order_purchase_timestamp) AS annee,
    ROUND(SUM(olist_order_items_dataset.price + olist_order_items_dataset.freight_value), 2) AS total_ventes
FROM olist_orders_dataset
JOIN olist_order_items_dataset 
    ON olist_orders_dataset.order_id = olist_order_items_dataset.order_id
GROUP BY annee
ORDER BY annee;



-- 🔹 10 — Moyens de paiement les plus utilisés
SELECT 
    olist_order_payments_dataset.payment_type AS moyen_paiement,
    COUNT(*) AS nombre_transactions,
    ROUND(SUM(olist_order_payments_dataset.payment_value), 2) AS total_paye
FROM olist_order_payments_dataset
GROUP BY moyen_paiement
ORDER BY nombre_transactions DESC;


