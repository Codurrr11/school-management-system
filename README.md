# SchoolERP

A modular PHP-based School Management System designed for managing students, teachers, academic records, profiles, and administrative operations.

## Features

* Student Management
* Teacher Management
* Profile Management
* Authentication System
* Modular Architecture
* Role-Based Access Structure
* MySQL Database Integration

## Technology Stack

* PHP
* MySQL
* HTML
* CSS
* JavaScript

## Project Structure

```text
assets/      Frontend assets
config/      Configuration files
includes/    Shared layouts and utilities
modules/     Feature modules
uploads/     User uploaded files
database/    Database export
```

## Local Setup

### Requirements

* PHP 8+
* MySQL
* XAMPP / WAMP

### Installation

1. Clone the repository
2. Import `database/schoolerp.sql`
3. Configure database credentials in `config`
4. Start Apache and MySQL
5. Open the project in your browser

## Git Workflow

```bash
git status
git add .
git commit -m "Describe changes"
git push
```

## Database

The latest database schema is available in:

```text
database/schoolerp.sql
```

## Notes

* User uploaded files are excluded from Git.
* Environment files are ignored.
* Development-specific folders are excluded through `.gitignore`.

## License

Private Project
