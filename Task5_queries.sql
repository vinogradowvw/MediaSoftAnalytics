-- 1. Вывести покупателей с количеством осуществленных покупок

SELECT 
	users.id, 
	users.name,
	users.surname,
	COUNT(orders.id)
FROM 
	users
LEFT JOIN 
	orders ON orders.user_id = users.id
GROUP BY
	users.id, users.name, users.surname;


-- 2. Общую стоимость товаров для каждого покупателя и отсортировать результат в порядке убывания

SELECT
	users.name,
	users.surname,
	users.id, 
	SUM(products.price) AS total_spent
FROM
	users
LEFT JOIN 
	orders ON orders.user_id = users.id
LEFT JOIN 
	products ON orders.product_id = products.id
GROUP BY
	users.name,
	users.surname,
	users.id, 
ORDER BY
	total_spent DESC;


-- 3. Получить покупателей, купивших только один товар
SELECT 
	users.id, 
	users.name,
	users.surname,
	COUNT(orders.id)
FROM 
	users
LEFT JOIN 
	orders ON orders.user_id = users.id
GROUP BY
	users.id, users.name, users.surname
HAVING
	COUNT(orders.id) = 1;

