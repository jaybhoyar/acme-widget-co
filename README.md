# 🛒 Acme Widget Co — Shopping Basket
This is a command-line Ruby application that simulates a shopping basket for Acme Widget Co, applying pricing offers and delivery rules to calculate the final total.

### 📦 Features
 - Add products to your basket via command-line input
 - Buy One Get One Half Price offer on Red Widgets (R01)
 - Delivery charges based on basket subtotal
 - Accurate pricing using BigDecimal
 - Output total price
 - Fully tested with RSpec

### 🚀 How to Run
  - Clone the repo:
    ```
    git clone https://github.com/jaybhoyar/acme-widget-co.git

    cd acme-widget-co
    ```
  - Run the application:
    ```
    ruby main.rb
    ```
  - Follow the prompt to enter product codes, e.g.:
    ```
    Enter product codes separated by commas: R01, G01, R01
    ```

### ✅ Sample Output
  ```
    Welcome to Acme Widget Co!
    ========================================
    Available Products:
    R01: Red Widget - $32.95
    G01: Green Widget - $24.95
    B01: Blue Widget - $7.95
    Enter product codes separated by commas: R01, R01

    Final Total: $54.37
  ```

### 🧠 Assumptions
  - The only offer implemented is Buy One Get One Half Price on R01 (Red Widget).
  - Delivery charges:
    - Orders below $50: $4.95
    - Orders $50–$90: $2.95
    - Orders above $90: Free

  - Product pricing and delivery rules are fixed in the code.
  - No product quantities are tracked; each entry represents one item.

### 🧪 Running Tests
To run specs:
  ```
    bundle install
    rspec
  ```


### 🛠 Tech Stack
  - Ruby (standard library)
  - RSpec for unit testing
  - BigDecimal for money precision

### 📁 File Structure

  ```css
  ├── lib/
  │   ├── basket.rb
  │   ├── delivery_rule.rb
  │   ├── offer.rb
  │   └── product.rb
  ├── spec/
  |   ├── spec_helper.rb
  │   └── basket_spec.rb
  ├── main.rb
  ├── problem_statement.rb
  └── README.md
  ```