<div align="center">

  <img src="assets/images/app_logo.png" alt="2S Homewear Logo" width="130" />

# 2S Homewear — Sales Mobile App

  <p align="center">
    A Flutter mobile application integrated with <strong>Odoo ERP</strong>, built using <strong>Clean Architecture</strong> and <strong>BLoC (Cubit)</strong>.
  </p>

  <p align="center">
    <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=flat-square&logo=flutter&logoColor=white" alt="Flutter" /></a>
    <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=flat-square&logo=dart&logoColor=white" alt="Dart" /></a>
    <a href="https://bloclibrary.dev"><img src="https://img.shields.io/badge/State_Management-BLoC_/_Cubit-blueviolet?style=flat-square&logo=bloc&logoColor=white" alt="BLoC" /></a>
    <a href="https://pub.dev/packages/get_it"><img src="https://img.shields.io/badge/Architecture-Clean_Architecture-success?style=flat-square" alt="Clean Architecture" /></a>
    <a href="https://www.odoo.com"><img src="https://img.shields.io/badge/Backend-Odoo_JSON--RPC-714B67?style=flat-square&logo=odoo&logoColor=white" alt="Odoo ERP" /></a>
  </p>

</div>

---

## 📌 Overview

**2S Homewear** is a sales application connected directly to Odoo ERP. It allows sales representatives to manage customers, validate phone numbers, and process sales orders in real time with role-based access control.

---

## 📱 Visual Showcase (Screenshots)

### 1. Onboarding & Authentication
<table>
  <tr>
    <td width="33.3%" align="center"><strong>Splash Screen</strong></td>
    <td width="33.3%" align="center"><strong>Login Screen</strong></td>
    <td width="33.3%" align="center"><strong>Login Error Dialog</strong></td>
  </tr>
  <tr>
    <td align="center"><img src="screenshots/01_splash_screen.png" width="100%" /></td>
    <td align="center"><img src="screenshots/02_login_screen.png" width="100%" /></td>
    <td align="center"><img src="screenshots/03_login_failed_dialog.png" width="100%" /></td>
  </tr>
  <tr>
    <td align="center"><sub>Native Splash with App Logo</sub></td>
    <td align="center"><sub>Odoo Credentials Entry</sub></td>
    <td align="center"><sub>Clear Error Alert</sub></td>
  </tr>
</table>

### 2. Customers Management & Validation
<table>
  <tr>
    <td width="33.3%" align="center"><strong>Customer List</strong></td>
    <td width="33.3%" align="center"><strong>Instant Search</strong></td>
    <td width="33.3%" align="center"><strong>Customer Details</strong></td>
  </tr>
  <tr>
    <td align="center"><img src="screenshots/04_customers_list.png" width="100%" /></td>
    <td align="center"><img src="screenshots/05_customers_search.png" width="100%" /></td>
    <td align="center"><img src="screenshots/06_customer_details.png" width="100%" /></td>
  </tr>
  <tr>
    <td align="center"><sub>Fetches customer_rank > 0</sub></td>
    <td align="center"><sub>Real-time Search by Name</sub></td>
    <td align="center"><sub>Address, Email & Phone</sub></td>
  </tr>
</table>

<br />

<table>
  <tr>
    <td width="33.3%" align="center"><strong>Edit Phone</strong></td>
    <td width="33.3%" align="center"><strong>Validation Error</strong></td>
    <td width="33.3%" align="center"><strong>Update Success</strong></td>
  </tr>
  <tr>
    <td align="center"><img src="screenshots/07_customer_phone_edit.png" width="100%" /></td>
    <td align="center"><img src="screenshots/08_customer_phone_validation_error.png" width="100%" /></td>
    <td align="center"><img src="screenshots/09_customer_phone_update_success.png" width="100%" /></td>
  </tr>
  <tr>
    <td align="center"><sub>In-place Editing</sub></td>
    <td align="center"><sub>Egyptian Regex Check</sub></td>
    <td align="center"><sub>Synced directly to Odoo</sub></td>
  </tr>
</table>

### 3. Sales Orders Workflow & RBAC
<table>
  <tr>
    <td width="33.3%" align="center"><strong>Access Restricted</strong></td>
    <td width="33.3%" align="center"><strong>Orders (All)</strong></td>
    <td width="33.3%" align="center"><strong>Orders (Draft)</strong></td>
  </tr>
  <tr>
    <td align="center"><img src="screenshots/10_sales_orders_access_restricted.png" width="100%" /></td>
    <td align="center"><img src="screenshots/11_sales_orders_list_all.png" width="100%" /></td>
    <td align="center"><img src="screenshots/12_sales_orders_list_draft.png" width="100%" /></td>
  </tr>
  <tr>
    <td align="center"><sub>Non-internal restricted</sub></td>
    <td align="center"><sub>All commercial orders</sub></td>
    <td align="center"><sub>Quotations awaiting action</sub></td>
  </tr>
</table>

<br />

<table>
  <tr>
    <td width="33.3%" align="center"><strong>Orders (Confirmed)</strong></td>
    <td width="33.3%" align="center"><strong>Order Details</strong></td>
    <td width="33.3%" align="center"><strong>Confirm Dialog</strong></td>
  </tr>
  <tr>
    <td align="center"><img src="screenshots/13_sales_orders_list_confirmed.png" width="100%" /></td>
    <td align="center"><img src="screenshots/14_order_details_draft.png" width="100%" /></td>
    <td align="center"><img src="screenshots/15_order_confirm_success_dialog.png" width="100%" /></td>
  </tr>
  <tr>
    <td align="center"><sub>Confirmed sales orders</sub></td>
    <td align="center"><sub>Items, pricing & VAT</sub></td>
    <td align="center"><sub>action_confirm trigger</sub></td>
  </tr>
</table>

<br />

<table>
  <tr>
    <td width="50%" align="center"><strong>Confirmed Order View</strong></td>
  </tr>
  <tr>
    <td align="center"><img src="screenshots/16_order_details_confirmed.png" width="50%" /></td>
  </tr>
  <tr>
    <td align="center"><sub>Order status updated to 'sale' in Odoo</sub></td>
  </tr>
</table>

---

## 🏛️ Architecture & Project Structure

The project follows **Clean Architecture** with a **Feature-First** structure:

```
lib/
├── core/              # Shared logic (API, DI, errors, theme, widgets)
│   ├── api/           # Dio setup, Endpoints & Cookie management
│   ├── cache/         # Local key-value storage (SharedPreferences)
│   ├── di/            # Dependency Injection (GetIt & Injectable)
│   ├── errors/        # Failures & Error Handling
│   └── widgets/       # Shared custom UI widgets & dialogs
│
└── features/          # Feature modules
    ├── login/         # Auth, session & credentials handling
    ├── customers_tab/ # Customer list, search, details & phone update
    ├── sales_tab/     # Sales orders list, filters, details & confirm action
    └── home/          # Navigation bar & Role-Based Access gating
```

### Architectural Principles

* **Separation of Concerns:**
  * **Presentation:** Screens, Widgets & Cubits for state management.
  * **Domain:** Pure Dart Entities, UseCases & Repository interfaces.
  * **Data:** Models, Remote Data Sources (Dio) & Repository implementations.
* **Dependency Injection:** Handled automatically via `get_it` and `injectable`.
* **Safe Error Handling:** Uses `dartz` (`Either<Failures, T>`) for reliable failure branching.

---

## ⚙️ Key Features

* **Authentication & Role-Based Access (RBAC):**
  * Authenticates users via Odoo `/web/session/authenticate`.
  * Distinguishes between internal sales employees and external portal users (`base.group_user`).
  * Restricts access to Sales Orders for unauthorized accounts.

* **Customer Directory & Phone Updates:**
  * Displays customers with their name, phone, and city.
  * Live search filtering by name.
  * In-place phone editing with validation for Egyptian mobile numbers (`010`, `011`, `012`, `015`).
  * Direct update to Odoo using the `write` RPC method.

* **Sales Orders Management:**
  * Lists sales orders with status badges (`draft` / `sale`).
  * Filter orders easily: **All**, **Draft**, or **Confirmed**.
  * Detailed view of order line items (`sale.order.line`): products, quantities, unit prices, VAT, and totals.
  * Ability to confirm draft orders directly to Odoo via `action_confirm`.

---

## 🔌 Odoo Integration Details

Communication with Odoo is done via **JSON-RPC 2.0**:

| Odoo Model | Operation | Description |
| :--- | :--- | :--- |
| `res.partner` | `search_read` | Fetches customer list where `customer_rank > 0`. |
| `res.partner` | `write` | Updates the customer's phone number. |
| `sale.order` | `search_read` | Retrieves sales orders and quotations. |
| `sale.order` | `action_confirm` | Confirms draft orders into confirmed sales orders. |
| `sale.order.line` | `search_read` | Fetches products and pricing for a specific order. |

---

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (`>= 3.13.4`)
* Dart SDK (`>= 3.13.4`)

### Setup Steps

1. **Clone the repository:**

   ```bash
   git clone https://github.com/FakhrElddin/2s_sales_app.git
   cd 2s_sales_app
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Generate DI code:**

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app:**

   ```bash
   flutter run
   ```

---

## 🛣️ Roadmap

* [ ] **Offline Handling & Local Sync:** Local caching using `Hive` and background sync when connection is restored.

---

<div align="center">
  <sub>Built for the 2S Homewear Technical Assessment</sub>
</div>
