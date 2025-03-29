-- إنشاء قاعدة البيانات واستخدامها
--CREATE DATABASE travel_library;
USE travel_library;

-- جدول المستخدمين
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at DATETIME DEFAULT GETDATE()
);

-- جدول الكتب
CREATE TABLE books (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    available BIT DEFAULT 1
);

-- جدول الرحلات السياحية
CREATE TABLE tours (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- جدول درجات السفر
CREATE TABLE travel_classes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    class_name VARCHAR(50) UNIQUE NOT NULL
);

-- جدول الفنادق
CREATE TABLE hotels (
    id INT IDENTITY(1,1) PRIMARY KEY,
    hotel_name VARCHAR(255) UNIQUE NOT NULL
);

-- جدول تأجير السيارات
CREATE TABLE car_rentals (
    id INT IDENTITY(1,1) PRIMARY KEY,
    rental_option VARCHAR(255) UNIQUE NOT NULL
);

-- جدول طرق الدفع
CREATE TABLE payment_methods (
    id INT IDENTITY(1,1) PRIMARY KEY,
    method_name VARCHAR(50) UNIQUE NOT NULL
);

-- جدول الطلبات
CREATE TABLE orders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    tour_id INT NOT NULL,
    travel_class_id INT NOT NULL,
    hotel_id INT NOT NULL,
    car_rental_id INT NOT NULL,
    payment_method_id INT NOT NULL,
    order_date DATETIME DEFAULT GETDATE(),
    status VARCHAR(50) DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (tour_id) REFERENCES tours(id) ON DELETE CASCADE,
    FOREIGN KEY (travel_class_id) REFERENCES travel_classes(id) ON DELETE CASCADE,
    FOREIGN KEY (hotel_id) REFERENCES hotels(id) ON DELETE CASCADE,
    FOREIGN KEY (car_rental_id) REFERENCES car_rentals(id) ON DELETE CASCADE,
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id) ON DELETE NO ACTION
);

-- جدول لربط الطلبات بالكتب
CREATE TABLE order_books (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);

-- جدول الدفع
CREATE TABLE payments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    payment_method_id INT NOT NULL,
    card_number VARCHAR(20),
    expiry_date DATE,
    cvv VARCHAR(4),
    payment_status VARCHAR(50) DEFAULT 'pending',
    payment_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE NO ACTION,
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id) ON DELETE NO ACTION
);

-- جدول تفاصيل الحوالات البنكية
CREATE TABLE bank_transfers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    payment_id INT,
    transaction_number VARCHAR(50) NOT NULL,
    bank_name VARCHAR(255) NOT NULL,
    transfer_date DATE NOT NULL,
    FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE CASCADE
);

-- جدول المراجعات والتقييمات
CREATE TABLE reviews (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    book_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);

-- جدول الدعم الفني
CREATE TABLE support_tickets (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    submitted_at DATETIME DEFAULT GETDATE()
);
