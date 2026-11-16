
USE library;

-- Insert Authors
INSERT INTO AUTHOR (name, country) VALUES
('Ahmed Khaled Tawfik', 'Egypt'),
('Naguib Mahfouz', 'Egypt'),
('George Orwell', 'United Kingdom'),
('J.K. Rowling', 'United Kingdom'),
('Leo Tolstoy', 'Russia'),
('Taha Hussein', 'Egypt');


-- Insert Publishers
INSERT INTO PUBLISHER (name, country) VALUES
('Dar El Shorouk', 'Egypt'),
('Penguin Books', 'United Kingdom'),
('Bloomsbury', 'United Kingdom');


-- Insert Categories
INSERT INTO CATEGORY (name) VALUES
('Science Fiction'),
('Mystery'),
('History'),
('Fantasy');


-- Insert Books
INSERT INTO BOOK
(title, price, publish_year, author_id, publisher_id, category_id)
VALUES
('Utopia', 18.50, 2008, 1, 1, 1),
('Palace of Desire', 25.00, 1957, 2, 1, 2),
('Animal Farm', 15.50, 1945, 3, 2, 1),
('1984', 22.00, 1949, 3, 2, 1),
('Harry Potter', 30.00, 1997, 4, 3, 4),
('Fantastic Beasts', 19.00, 2001, 4, 3, 4),
('War and Peace', 35.00, 1869, 5, 2, 3),
('The Trial', 17.00, 1925, 1, 1, 2),
('The Silent Patient', 28.00, 2019, 2, 2, 2),
('The Last Kingdom', 20.00, 2015, 5, 3, 3);


-- Insert Members
INSERT INTO MEMBER (name, email, join_date) VALUES
('Omar Ali', 'omar@gmail.com', '2025-01-10'),
('Sara Mohamed', 'sara@gmail.com', '2025-02-15'),
('Mariam Ahmed', 'mariam@gmail.com', '2025-03-20'),
('Youssef Hassan', 'youssef@gmail.com', '2025-04-05'),
('Nour Adel', 'nour@gmail.com', '2025-05-12'),
('Karim Samir', 'karim@gmail.com', '2025-06-01');


-- Insert Loans
INSERT INTO LOAN (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2025-01-15', '2025-01-25'),
(2, 2, '2025-02-01', '2025-02-10'),
(3, 1, '2025-02-15', NULL),
(4, 3, '2025-03-01', '2025-03-12'),
(5, 2, '2025-03-10', NULL),
(1, 3, '2025-04-01', '2025-04-15'),
(6, 4, '2025-04-20', '2025-05-01'),
(3, 5, '2025-05-05', NULL),
(7, 1, '2025-05-15', '2025-05-30'),
(2, 4, '2025-06-01', '2025-06-10'),
(5, 3, '2025-06-15', NULL),
(4, 2, '2025-07-01', '2025-07-12');
