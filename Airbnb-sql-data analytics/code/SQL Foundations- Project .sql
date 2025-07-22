-- 1. Πόσα καταλύματα υπάρχουν;
SELECT COUNT(1) AS total_listings
FROM listings;


-- 2. Πόσες αξιολογήσεις έχουν γίνει;
SELECT COUNT(1) AS total_reviews
FROM reviews;


-- 3. Πόσες κρατήσεις έχουν γίνει (available = 0);
SELECT COUNT(1) AS total_bookings
FROM bookings
WHERE available = 0;


-- 4. Πόσοι μοναδικοί οικοδεσπότες υπάρχουν;
SELECT COUNT(DISTINCT host_id) AS distinct_hosts_count
FROM listings;


-- 5. Ποιες είναι οι μοναδικές περιοχές που προσφέρονται τα καταλύματα;
SELECT DISTINCT neighbourhood_cleansed
FROM listings;


-- 6. Ποσοστό καταλυμάτων ανά περιοχή (με 2 δεκαδικά ψηφία):
SELECT 
  neighbourhood_cleansed,
  COUNT(*) AS listings_count,
  CAST(100.0 * COUNT(*) / (SELECT COUNT(*) FROM listings) AS DECIMAL(5,2)) AS percentage
FROM listings
GROUP BY neighbourhood_cleansed
ORDER BY listings_count DESC;


-- 7. Ποιος τύπος οικοδεσπότη έχει τα περισσότερα καταλύματα;
SELECT 
  host_is_superhost,
  COUNT(*) AS count
FROM listings
WHERE host_is_superhost IS NOT NULL
GROUP BY host_is_superhost
ORDER BY count DESC;


-- 8. Πόσα καταλύματα έχει ο κάθε οικοδεσπότης (με το όνομά του και το id του);
SELECT 
  host_id,
  host_name,
  COUNT(*) AS listings_count
FROM listings
GROUP BY host_id, host_name
ORDER BY listings_count DESC;


-- 9. Καταλύματα των οποίων η περιοχή ξεκινά από 'Π';
SELECT *
FROM listings
WHERE neighbourhood_cleansed LIKE N'Π%';  -- N για unicode ελληνικά


-- 10. Καταλύματα με τιμή μεταξύ 0 και 100;
SELECT *
FROM listings
WHERE price BETWEEN 0 AND 100;


-- 11. Καταλύματα χωρίς καμία αξιολόγηση;
SELECT *
FROM listings
WHERE listing_id NOT IN (SELECT DISTINCT listing_id FROM reviews);


-- 12. Πόσοι οικοδεσπότες έχουν φωτογραφία προφίλ;
SELECT COUNT(1) AS hosts_with_profile_pic
FROM listings
WHERE host_has_profile_pic = 1;


-- 13. Μέση τιμή ανά περιοχή;
SELECT 
  neighbourhood_cleansed,
  AVG(price) AS avg_price
FROM listings
GROUP BY neighbourhood_cleansed
ORDER BY avg_price DESC;


-- 14. Τύπος property με τη μεγαλύτερη μέση τιμή (μόνο το πρώτο);
SELECT TOP 1
  property_type,
  AVG(price) AS avg_price
FROM listings
GROUP BY property_type
ORDER BY avg_price DESC;


-- 15. Περιοχές με μέση τιμή > 200 ευρώ ανά βραδιά;
SELECT 
  neighbourhood_cleansed,
  AVG(price) AS avg_price
FROM listings
GROUP BY neighbourhood_cleansed
HAVING AVG(price) > 200
ORDER BY avg_price DESC;


-- 16. Πόσες κρατήσεις έχουν γίνει ανά τύπο property;
SELECT 
  l.property_type,
  COUNT(*) AS total_bookings
FROM bookings b
JOIN listings l ON b.listing_id = l.listing_id
WHERE b.available = 0
GROUP BY l.property_type
ORDER BY total_bookings DESC;


-- 17. Τύπος δωματίου με τις περισσότερες αξιολογήσεις;
SELECT TOP 1
  l.room_type,
  COUNT(r.review_id) AS total_reviews
FROM listings l
JOIN reviews r ON l.listing_id = r.listing_id
GROUP BY l.room_type
ORDER BY total_reviews DESC;