# AshInventory

AshInventory is an inventory management system built with Flutter. It provides dashboards, department-level management, item tracking, and purchase/issuance recording for an institutional environment.

## Project Structure

- **lib/**: Main application source code.

  - **main.dart**  
    *Entry point of the Flutter application.*  
    - Initializes Flutter bindings and generates mock data.
    - Runs the app by calling `runApp()`.
    - Sets up the root widget, localization, and theme.
    - Sets the home page to the login screen.

  - **post.dart**  
    *Central location for data models and repository logic.*  
    - Defines classes and repositories for inventory items, purchases, issuances, etc.
    - Handles in-memory storage and retrieval of inventory data.

  - **components/**  
    *Reusable UI widgets and custom controls.*  
    - `button.dart`: Custom button widget for consistent styling.
    - `card.dart`: Card widget for displaying summarized information.
    - `collapsible.dart`: Widget for collapsible/expandable UI sections.
    - `dialog.dart`: Custom dialog widgets for confirmations and prompts.
    - `empty_screen.dart`: Widget to display when there is no data.
    - `loading.dart`: Loading indicator widget.
    - `month_selector.dart`: Widget for selecting months (used in dashboards).
    - `progress_indicator.dart`: Custom progress indicator.
    - `side_nav.dart`: Side navigation bar widget.
    - `splash.dart`: Splash screen widget.
    - `text_field.dart`: Custom text field widget for forms.
    - `timer.dart`: Timer/countdown widget.

  - **pages/**  
    *Main screens and navigation structure.*

    - **auth/**
      - [`login.dart`](lib/pages/auth/login.dart):  
        - Login screen for user authentication.
        - Contains a form for password entry, handles login logic, and navigates to the home page on success.

    - **dashboard/**
      - [`dash_home.dart`](lib/pages/dashboard/dash_home.dart):  
        - Main dashboard page for admins.
        - Contains a tab bar for switching between Items, Issuances, Opening Stock, and Purchases.
        - Integrates search and summary widgets.
      - [`dash_items.dart`](lib/pages/dashboard/dash_items.dart):  
        - Displays a paginated table of all inventory items.
        - Allows adding new items, viewing details, issuing items, and recording purchases.
      - [`dash_issuance.dart`](lib/pages/dashboard/dash_issuance.dart):  
        - Displays a paginated table of all item issuances.
        - Allows issuing new items and viewing issuance details.
      - [`dash_op_stock.dart`](lib/pages/dashboard/dash_op_stock.dart):  
        - Shows the opening stock for items.
        - Displays item name, unit price, quantity, total cost, and notes in a paginated table.
      - [`dash_purchases.dart`](lib/pages/dashboard/dash_purchases.dart):  
        - Displays a paginated table of all purchases.
        - Allows adding new purchases and viewing purchase details.

    - **dept/**
      - [`dept_home.dart`](lib/pages/dept/dept_home.dart):  
        - Department dashboard page.
        - Contains tabs for Items, Issuances, Opening Stock, and Purchases specific to the department.
        - Displays department info, search, and summary.
      - [`dept_items.dart`](lib/pages/dept/dept_items.dart):  
        - Shows a paginated table of items for the department.
        - Allows adding new items, viewing details, and issuing items.
      - [`dept_issuance.dart`](lib/pages/dept/dept_issuance.dart):  
        - Shows a paginated table of item issuances for the department.
        - Allows adding new issuances and viewing issuance details.
      - [`dept_op_stock.dart`](lib/pages/dept/dept_op_stock.dartdept_issuance.dart):  
        - (Assumed similar to dashboard's opening stock, but scoped to the department.)
      - [`dept_purchases.dart`](lib/pages/dept/dept_purchases.dart):  
        - Shows a paginated table of purchases for the department.
        - Allows adding new purchases and viewing purchase details.

    - **details/**
      - [`issuances.dart`](lib/pages/details/issuances.dart):  
        - Displays detailed information about a specific issuance, including item, quantity, department, recipient, issuer, storage location, date, and notes.
      - [`items.dart`](lib/pages/details/items.dart):  
        - Displays detailed information about a specific inventory item, including department, stock, storage location, last updated date, and notes.

  - **services/**  
    *App-wide services and utilities.*

    - [`callback.dart`](lib/services/callback.dart):  
      - Provides utility functions for UI callbacks and dialog handling.
      - `getProgressColor`: Returns a color based on a progress value, useful for progress indicators.
      - `callBottomSheet`: Shows a customizable modal bottom sheet with a draggable scrollable sheet, using a custom widget for content and actions.
      - `callDialog`: Shows a popup dialog with customizable content, title, confirm/cancel actions, and optional auto-close timer.

    - [`flags.dart`](lib/services/flags.dart):  
      - (Currently commented out) Intended for managing device flags such as preventing screenshots and keeping the screen on.
      - Contains template functions (`disableFlags`, `enableFlags`) for toggling secure and keep-screen-on flags using `FlutterWindowManagerPlus`.

    - [`notification_service.dart`](lib/services/notification_service.dart):  
      - (Empty file as of now.)  
      - Intended to handle showing snackbars, alerts, and notifications throughout the app.

    - [`transitions.dart`](lib/services/transitions.dart):  
      - Provides a variety of custom page transition animations for navigation.
      - Includes functions for:
        - `slideScaleTransition`: Slide in from bottom while scaling.
        - `logoutTransition`: Slide up and scale out (used for logout).
        - `slideUpTransition`: Slide in from bottom.
        - `scaleFadeTransition`: Scale and fade in.
        - `fadeThroughTransition`: Simple fade in.
        - `slideLeftTransition`: Slide in from right to left.
        - `slideRightTransition`: Slide in from left to right.
        - `rotateTransition`: Rotate in.
        - `slideDownTransition`: Slide down from top.
        - `zoomInTransition`: Zoom in from center.
        - `zoomOutTransition`: Zoom out.
        - `fadeInTransition`: Fade in.
        - `blurTransition`: Fade in with blur effect.
        - `slideInDiagonalTransition`: Slide in diagonally from bottom-right.
      - Each function returns a `Route` with a custom transition for use in `Navigator`.


---


## Key Features

- **Dashboard**: Overview of inventory, recent activity, and navigation.
- **Department Management**: Each department can manage its own items, purchases, and issuances.
- **Item Tracking**: Add, update, and view inventory items with details like stock number, storage location, and last updated date.
- **Purchases & Issuance**: Record and track item purchases and issuances, including supplier and recipient details.
- **Authentication**: Login page for user access control.
- **Responsive UI**: Adapts to different screen sizes.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart SDK (comes with Flutter)
- (Optional) Android Studio, Xcode, or Visual Studio Code for development

### Installation

1. Clone the repository:
   ```sh
   git clone <repo-url>
   cd ashinventory
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```

## Usage

- Log in using the credentials provided by your administrator.
- Navigate the dashboard to access different sections of the inventory system.
- Use the department-specific pages to manage items, purchases, and issuances relevant to your department.
- Access the admin dashboard (if applicable) for a comprehensive overview and management options.


## Packages Used

The following packages are used in this project as specified in [`pubspec.yaml`](pubspec.yaml):

### Main Dependencies

- **flutter**: The core Flutter SDK for building cross-platform apps.
- **cupertino_icons** (`^1.0.8`): iOS-style icons for use with the Cupertino widgets.
- **paged_datatable** (`^2.1.1`): Provides paginated data tables for displaying large data sets efficiently.
- **darq** (`^2.0.0`): Adds LINQ-style query extensions for Dart collections.
- **intl** (`^0.19.0`): Internationalization and localization utilities, including date and number formatting.

### Dev Dependencies

- **flutter_test**: The Flutter testing framework for writing unit and widget tests.
- **flutter_lints** (`^4.0.0`): Recommended lints and coding standards for Flutter projects.
