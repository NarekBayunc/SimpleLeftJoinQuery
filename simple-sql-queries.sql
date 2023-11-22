CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

INSERT INTO Categories (CategoryID, CategoryName)
VALUES
    (1, 'Electronics'),
    (2, 'Clothes'),
    (3, 'Appliances');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255)
);

INSERT INTO Products (ProductID, ProductName)
VALUES
    (1, 'Smartphone'),
    (2, 'Notebook'),
    (3, 'T-Shirt'),
    (4, 'Fridge'),
    (5, 'TV'),
    (6,'Wardrobe');

CREATE TABLE ProductCategory (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
);

INSERT INTO ProductCategory (ProductID, CategoryID)
VALUES
    (1, 1),     
    (2, 1),
    (3, 2), 
    (4, 3), 
    (5, 1);

SELECT
    P.ProductName,
    ISNULL(C.CategoryName, 'Without Category') AS CategoryName
FROM
    Products P
LEFT JOIN
    ProductCategory PC ON P.ProductID = PC.ProductID
LEFT JOIN
    Categories C ON PC.CategoryID = C.CategoryID;