# Coffee Shop Database

---

## Project Overview

This group project models a coffee shop’s operations using SQL Server. It demonstrates database design, normalization, and relational integrity while supporting use cases such as employee scheduling, inventory tracking, and recipe management.

**Goals:**
- Practice SQL schema design and normalization.
- Support employee scheduling and shift assignments.
- Track menu items and the recipes that define them.
- Link recipes to ingredients for inventory management.

## Database Schema

### **Database Name**
- JKGPDatabase

### **Employees**
- Stores employee details (name, position, role).
- Each employee can be assigned to multiple shifts.

### **ShiftTypes**
- Defines categories of shifts (e.g., Morning, Afternoon, Evening).

### **Shifts**
- Represents scheduled shifts with a date and shift type.

### **ShiftAssignments**
- Junction table linking employees to shifts.
- Ensures every shift has exactly three employees, including a manager or shift lead.

### **Ingredients**
- Represents inventory items (e.g., coffee beans, milk, sugar).

### **MenuItems**
- Stores the products sold at the coffee shop (e.g., Latte, Cappuccino, Muffin).

### **Recipes**
- Defines how menu items are made.
- Each recipe links to one menu item.

### **RecipeIngredients**
- Junction table linking recipes to ingredients.
- Specifies the quantity of each ingredient required.

---

## How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/Josiah4191/coffee-shop-database.git
