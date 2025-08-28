# Universal Furniture Outlet (UFO) Database Project

## 📌 Objective
Design and implement a relational database for **Universal Furniture Outlet (UFO)** to manage customers, orders, shipments, employees, and inventory. The project demonstrates **end-to-end database lifecycle (DBLC)** — from conceptual modeling to implementation and querying in **Oracle SQL**.

---

## 🛠️ Approach

### 1. Entity & Relationship Design
- Identified key entities: **Customer, Orders, Furniture, Truck, Employee, Driver, Sales_Reps, Shipment, Order_Item**.
- Defined **business rules**:
  - Each Customer places one or more Orders.
  - Each Shipment is assigned to one Truck and one Driver.
  - Drivers and Sales_Reps are subtypes of Employee.
- Modeled **supertype–subtype relationships**:
  - **Driver ⊂ Employee**
  - **Sales_Rep ⊂ Employee**

### 2. ER Diagrams
- Created **Crow’s Foot ERD** (with M:N relationships).
- Converted to **associative entities** for 3NF compliance.

### 3. Relational Schema
- Designed schema in **Third Normal Form (3NF)**.
- Defined **primary keys (PK)**, **foreign keys (FK)**, and constraints.

### 4. Implementation in Oracle SQL
- Created tables using **DDL** statements with constraints.
- Inserted **sample data (5–8 rows per table)**.
- Applied **data dictionary** for consistent data types & sizes.
- Granted table access permissions to instructors.

### 5. Query Execution
Implemented queries to answer business questions:
1. Retrieve all customer details.  
2. Join **Orders, Customers, Order_Items, Furniture** to display order details.  
3. Retrieve employee phone numbers for a specific order.  
4. Track shipments and assigned drivers.  
5. Calculate **total inventory value** for furniture items priced above $25.  

---

## 📊 Results
- **Normalized Database** ensuring minimal redundancy & high data integrity.
- **Functional Oracle schema** with constraints and referential integrity.
- **SQL queries** successfully answered operational questions (orders, shipments, employee contacts, inventory value).
- Created a foundation for **BI dashboards** (e.g., inventory tracking, order fulfillment).

---

## 📂 Project Structure
Universal_Furniture_Outlet_Project.pdf → Project report with ERD, schema, dictionary
Universal_Furniture_Outlet_Project.sql → SQL scripts for DDL, DML, queries, permissions
README.md → Documentation (this file)

yaml
Copy code

---

## 🔧 Tech Stack
- **Database**: Oracle SQL  
- **Modeling**: ERD with Crow’s Foot notation  
- **Concepts**: DBLC, 3NF normalization, Supertype/Subtype, Referential Integrity  

---
