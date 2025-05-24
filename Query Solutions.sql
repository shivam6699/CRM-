-- 1. Retrieve the full name and email of all customers who joined after January 1, 2023. 
SELECT firstname || ' ' || lastname AS fullname, email FROM customers
WHERE joindate > '2023-01-01';

-- 2. Find the total amount of completed orders for each customer. 
SELECT c.CustomerID, c.FirstName || ' ' || c.LastName AS FullName, SUM(o.OrderAmount) AS TotalCompletedAmount
FROM  Customers c
JOIN  Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderStatus = 'Completed'
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalCompletedAmount DESC;

-- 3. List all unresolved support tickets (Status = 'Open' or 'In Progress') along with the customer's name.
SELECT s.TicketID, s.IssueDescription, s.Status, c.FirstName || ' ' || c.LastName AS CustomerName
FROM SupportTickets s
JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE s.Status IN ('Open', 'In Progress');

-- 4. Retrieve the most recent interaction for each customer. 
SELECT i.InteractionID, c.CustomerID, c.FirstName || ' ' || c.LastName AS CustomerName, i.InteractionType, i.InteractionDate
FROM Interactions i
JOIN Customers c ON i.CustomerID = c.CustomerID
WHERE i.InteractionDate = (
        SELECT MAX(i2.InteractionDate)
        FROM Interactions i2
        WHERE i2.CustomerID = i.CustomerID
    );

-- 5. Count the number of customers in each country. 
SELECT country, COUNT(customerid) AS totalcustomers
FROM customers
GROUP BY Country
ORDER BY totalcustomers DESC;

-- 6. List customers who have placed no orders.
SELECT firstname || ' ' || lastname AS fullname, email FROM customers c
left join orders o on c.customerid = o.customerid
where o.orderid is null;

-- 7. Identify customers who have both unresolved support tickets and pending orders.
SELECT firstname || ' ' || lastname AS fullname, email FROM customers c
JOIN supporttickets s OR c.customerid = s.customerid
JOIN orders o on c.customerid = o.customerid
WHERE s.status IN ('Open', 'In Progress') AND o.OrderStatus = ('Pending');

-- 8. Calculate the average order amount for each order status.
SELECT OrderStatus, AVG(OrderAmount) AS AverageAmount
FROM Orders
GROUP BY OrderStatus
ORDER BY AverageAmount DESC;

-- 9. List all customers who have interacted with the company via email in the past month. 
SELECT DISTINCT c.CustomerID, c.FirstName || ' ' || c.LastName AS FullName, c.Email
FROM Customers c
JOIN Interactions i ON c.CustomerID = i.CustomerID
WHERE i.InteractionType = 'Email' AND i.InteractionDate >= CURRENT_DATE - INTERVAL '30 days';

 
-- 10. Show the top 5 customers with the highest total order amount.
SELECT c.CustomerID, c.FirstName || ' ' || c.LastName AS FullName, SUM(o.OrderAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC
LIMIT 5;
