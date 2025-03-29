# Egyptian_Landmarks_Project
# Travel Library Database

## 📌 Overview
This project is part of a **travel booking system**, where users can book tours, hotels, and car rentals. The database is designed to store and manage all related data efficiently.

## 📊 Database Structure
The database consists of several tables, including:
- **users**: Stores user information.
- **orders**: Records all travel bookings.
- **tours**: Contains available tours.
- **hotels**: Lists available hotels.
- **car_rentals**: Provides car rental options.
- **payment_methods**: Defines available payment methods.
- **travel_classes**: Stores different travel classes.

### 🔗 Relationships
- Each `order` is linked to a `user`, `tour`, `hotel`, `car_rental`, `travel_class`, and `payment_method`.
- The `users` table is connected to `orders`, ensuring that all bookings are tied to a registered user.

## 🚀 Setup Instructions
1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```
2. Navigate to the project folder:
   ```bash
   cd travel-library-database
   ```
3. Open `SQL Server Management Studio (SSMS)`.
4. Execute the SQL schema file:
   ```sql
   USE travel_library;
   SOURCE travel_library_schema.sql;
   ```
5. Verify tables and relationships using:
   ```sql
   SELECT * FROM users;
   ```

## 💡 Notes
- Ensure **SQL Server** is installed and running.
- The database supports different **payment methods** and **travel classes** for better flexibility.
- The system prevents cascading delete conflicts using `ON DELETE NO ACTION`.

## 📞 Contact
For any issues or contributions, feel free to create a pull request or open an issue.

