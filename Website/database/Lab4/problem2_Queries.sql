
USE library;

-- F2.1: Search Books by title and price
SELECT b.title, b.price, c.name AS category
FROM BOOK b
JOIN CATEGORY c ON b.category_id = c.category_id
WHERE b.title LIKE '%Utopia%'
  AND b.price BETWEEN 15 AND 20
ORDER BY b.price ASC;


-- F2.2: Catalogue with author, publisher and category names
SELECT b.book_id, b.title, b.price, a.name AS author,
       p.name AS publisher, c.name AS category
FROM BOOK b
JOIN AUTHOR a ON b.author_id = a.author_id
JOIN PUBLISHER p ON b.publisher_id = p.publisher_id
JOIN CATEGORY c ON b.category_id = c.category_id
ORDER BY b.title;


-- F2.3 (a): Number of books and average price per category
SELECT c.name, COUNT(b.book_id) AS book_count,
       AVG(b.price) AS average_price
FROM CATEGORY c
LEFT JOIN BOOK b ON c.category_id = b.category_id
GROUP BY c.category_id, c.name;


-- F2.3 (b): Authors with at least two books
SELECT a.name, COUNT(b.book_id) AS total_books
FROM AUTHOR a
JOIN BOOK b ON a.author_id = b.author_id
GROUP BY a.author_id, a.name
HAVING COUNT(b.book_id) >= 2;


-- F2.3 (c): Total, minimum and maximum book prices
SELECT COUNT(*) AS total_books,
       MIN(price) AS min_price,
       MAX(price) AS max_price
FROM BOOK;


-- F2.4 (a): Unreturned loans
SELECT l.loan_id, b.title, m.name AS member_name, l.loan_date
FROM LOAN l
JOIN BOOK b ON l.book_id = b.book_id
JOIN MEMBER m ON l.member_id = m.member_id
WHERE l.return_date IS NULL;


-- F2.4 (b): Members who never borrowed
SELECT m.member_id, m.name
FROM MEMBER m
LEFT JOIN LOAN l ON m.member_id = l.member_id
WHERE l.loan_id IS NULL;


-- F2.4 (c): Books never borrowed
SELECT b.book_id, b.title
FROM BOOK b
LEFT JOIN LOAN l ON b.book_id = l.book_id
WHERE l.loan_id IS NULL;


-- F2.5 (a): Top 3 most borrowed books
SELECT b.title, COUNT(l.loan_id) AS loan_count
FROM BOOK b
JOIN LOAN l ON b.book_id = l.book_id
GROUP BY b.book_id, b.title
ORDER BY loan_count DESC
LIMIT 3;


-- F2.5 (b): Member with the most loans
SELECT m.name, COUNT(l.loan_id) AS total_loans
FROM MEMBER m
JOIN LOAN l ON m.member_id = l.member_id
GROUP BY m.member_id, m.name
ORDER BY total_loans DESC
LIMIT 1;


-- F2.6 (a): Every author and their book count, including zero
SELECT a.name, COUNT(b.book_id) AS book_count
FROM AUTHOR a
LEFT JOIN BOOK b ON a.author_id = b.author_id
GROUP BY a.author_id, a.name;


-- F2.6 (b): Books where author and publisher share the same country
SELECT b.title, a.name AS author,
       p.name AS publisher, a.country
FROM BOOK b
JOIN AUTHOR a ON b.author_id = a.author_id
JOIN PUBLISHER p ON b.publisher_id = p.publisher_id
WHERE a.country = p.country;
