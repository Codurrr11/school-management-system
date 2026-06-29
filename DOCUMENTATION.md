# SchoolERP - Technical Documentation

## Overview

SchoolERP is a modular, multi-tenant School Management System built with PHP, MySQL, and modern web technologies. The system follows a SaaS architecture with role-based access control, supporting multiple schools within a single platform instance.

## Architecture Overview

### 1. System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                        │
│  ┌─────────────┐  ┌─────────────┐  ┌───────────────────┐   │
│  │   HTML/CSS  │  │ JavaScript  │  │   Bootstrap UI    │   │
│  └─────────────┘  └─────────────┘  └───────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                    Application Layer                         │
│  ┌─────────────┐  ┌─────────────┐  ┌───────────────────┐   │
│  │   Modules   │  │ Controllers │  │   Business Logic  │   │
│  └─────────────┘  └─────────────┘  └───────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                     Data Access Layer                        │
│  ┌─────────────┐  ┌─────────────┐  ┌───────────────────┐   │
│  │   PDO       │  │   Models    │  │   Database Layer  │   │
│  └─────────────┘  └─────────────┘  └───────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                     Data Storage Layer                       │
│  ┌───────────────────────────────────────────────────────┐   │
│  │                   MySQL Database                      │   │
│  └───────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### 2. Directory Structure

```
schoolerp/
├── assets/                    # Frontend assets
│   ├── css/                  # Stylesheets
│   │   ├── main.css         # Core styles
│   │   └── responsive.css   # Responsive styles
│   └── js/                  # JavaScript files
│       └── app.js           # Main application JS
├── config/                   # Configuration files
│   ├── constants.php        # Application constants
│   ├── db.php              # Database connection
│   ├── helpers.php         # Utility functions
│   └── session.php         # Session management
├── database/                # Database scripts
│   ├── schoolerp.sql       # Main database schema
│   └── schoolerp.session.sql # Session-related schema
├── includes/                # Reusable layout components
│   ├── header.php          # Page header
│   ├── footer.php          # Page footer
│   ├── sidebar.php         # Navigation sidebar
│   └── topbar.php          # Top navigation bar
├── modules/                 # Feature modules
│   ├── admin/              # Platform administration
│   │   ├── schools.php     # School management
│   │   ├── schools-edit.php # School editing
│   │   └── schools-delete.php # School deletion
│   └── school/             # School-specific features
│       ├── admissions/     # Student admissions
│       ├── bank-accounts/  # Financial accounts
│       ├── classes/        # Class management
│       ├── dashboard/      # School dashboard
│       ├── expenses/       # Expense tracking
│       ├── fees/           # Fee management
│       ├── leads/          # Admission leads
│       ├── parents/        # Parent management
│       ├── profile/        # User profiles
│       ├── sections/       # Section management
│       ├── sessions/       # Academic sessions
│       ├── students/       # Student management
│       └── teachers/       # Teacher management
├── uploads/                 # User uploaded files
├── .gitignore              # Git ignore rules
├── README.md               # Project overview
├── index.php              # Main entry point
├── login.php              # Authentication
├── logout.php             # Session termination
├── register.php           # User registration
└── search_helper.php      # Search functionality
```

## Core Components

### 1. Authentication & Authorization System

**File:** `config/session.php`, `config/helpers.php`, `login.php`

**Workflow:**

1. **Session Initialization**: Secure session configuration with HTTP-only cookies
2. **Authentication**: User credentials validation against `users` table
3. **Authorization**: Role-based access control using `auth_check()` function
4. **Tenant Isolation**: School-level data segregation via `enforce_tenant()`

**Key Functions:**

- `auth_check($allowed_roles = [])`: Validates user role permissions
- `enforce_tenant()`: Ensures data access is restricted to user's school
- `sanitize($input)`: Input sanitization for security

### 2. Database Layer

**File:** `config/db.php`

**Configuration:**

- PDO-based connection with prepared statements
- UTF-8 character encoding support
- Error handling with exceptions
- Connection pooling optimization

**Security Features:**

- SQL injection prevention via parameterized queries
- Input validation before database operations
- Role-based query restrictions

### 3. Multi-Tenancy Architecture

**Concept:** Single application instance serving multiple schools

**Implementation:**

1. **Tenant Identification**: `school_id` column in all tenant-specific tables
2. **Data Isolation**: All queries include `WHERE school_id = :school_id`
3. **Session Management**: User sessions store tenant context
4. **Resource Separation**: Uploads organized by school ID

**Database Schema Pattern:**

```sql
CREATE TABLE tenant_table (
    id BIGINT UNSIGNED PRIMARY KEY,
    school_id BIGINT UNSIGNED NOT NULL,  -- Tenant identifier
    -- Other columns...
    FOREIGN KEY (school_id) REFERENCES schools(id)
);
```

## Module Architecture

### 1. Student Management Module

**Location:** `modules/school/students/`

**Components:**

- `index.php`: Student listing with search/filter
- `view.php`: Detailed student profile view
- `bulk-edit.php`: Batch student operations
- `check_duplicate.php`: Duplicate student detection
- `migrations.php`: Student transfer between classes

**Data Flow:**

```
Admission Form → Student Creation → Class Assignment → Fee Structure → Academic Records
```

### 2. Fee Management Module

**Location:** `modules/school/fees/`

**Components:**

- `index.php`: Fee collection interface
- `fees-structure.php`: Define fee categories
- `collected-log.php`: Payment history
- `defaulters.php`: Outstanding fee tracking
- `online-payments.php`: Integration with payment gateways

**Business Logic:**

- Dynamic fee structure based on class, category, and transport
- Installment-based payment tracking
- Late fee calculation and waiver management
- Receipt generation and printing

### 3. Academic Management Module

**Location:** `modules/school/classes/`, `modules/school/sections/`, `modules/school/sessions/`

**Components:**

- Class hierarchy management (Nursery → Class 12)
- Section creation and student distribution
- Academic session planning and switching
- Timetable scheduling

## Workflow Patterns

### 1. User Authentication Flow

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Login     │────▶│  Session    │────▶│  Role       │────▶│  Tenant     │
│   Page      │     │  Creation   │     │  Validation │     │  Context    │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
        │                  │                  │                  │
        ▼                  ▼                  ▼                  ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│ Credential  │     │ Secure      │     │ Access      │     │ Data        │
│ Validation  │     │ Cookie Set  │     │ Control     │     │ Isolation   │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
```

### 2. Student Admission Workflow

```
┌─────────────────────────────────────────────────────────────────────────┐
│                              Admission Process                           │
├─────────────────────────────────────────────────────────────────────────┤
│ 1. Lead Capture → 2. Form Submission → 3. Document Verification →       │
│ 4. Fee Payment → 5. Student Creation → 6. Class Assignment →            │
│ 7. Parent Association → 8. ID Card Generation → 9. Welcome Kit          │
└─────────────────────────────────────────────────────────────────────────┘
```

### 3. Fee Collection Workflow

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Student    │────▶│  Fee        │────▶│  Payment    │────▶│  Receipt    │
│  Selection  │     │  Calculation│     │  Processing │     │  Generation │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
        │                  │                  │                  │
        ▼                  ▼                  ▼                  ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│ Outstanding │     │ Installment │     │ Transaction │     │  Database   │
│  Balance    │     │  Options    │     │  Recording  │     │  Update     │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
```

## Database Schema Highlights

### Core Tables

1. **`schools`**: Platform tenant information
2. **`users`**: User accounts with role assignments
3. **`students`**: Student master records
4. **`teachers`**: Teacher master records
5. **`parents`**: Parent/guardian information
6. **`classes`**: Academic class definitions
7. **`sections`**: Class subdivisions
8. **`academic_sessions`**: Academic year management

### Financial Tables

1. **`fee_structures`**: Fee category definitions
2. **`fee_payments`**: Payment transaction records
3. **`expenses`**: School expenditure tracking
4. **`bank_accounts`**: Financial account management

### Relationship Tables

1. **`parent_students`**: Many-to-many parent-student relationships
2. **`student_classes`**: Student-class enrollment history
3. **`teacher_classes`**: Teacher-class assignments

## Security Implementation

### 1. Input Validation

- All user inputs sanitized using `sanitize()` function
- Parameterized queries for database operations
- File upload validation and type checking

### 2. Session Security

- HTTP-only session cookies
- Session regeneration on privilege changes
- Timeout-based session expiration
- Cross-site request forgery (CSRF) protection

### 3. Access Control

- Role-based permissions (super_admin, school_admin, teacher, parent, student)
- Tenant-level data isolation
- Function-level authorization checks

### 4. Data Protection

- Password hashing with bcrypt
- Sensitive data encryption
- Audit logging for critical operations

## API & Integration Points

### 1. Internal APIs

- **Search API**: `search_helper.php` - Unified search across entities
- **Data Validation**: Duplicate checking endpoints
- **Report Generation**: PDF/Excel export functionality

### 2. External Integrations

- **Payment Gateways**: Online fee payment processing
- **SMS Services**: Notification delivery
- **Email Services**: Communication with stakeholders

## Performance Considerations

### 1. Database Optimization

- Indexed foreign keys for tenant isolation
- Query optimization with EXPLAIN analysis
- Connection pooling for high concurrency

### 2. Caching Strategy

- Session-based caching for user data
- Configuration caching for frequently accessed settings
- Report data caching for complex queries

### 3. Asset Optimization

- Minified CSS and JavaScript
- Image optimization for uploads
- CDN integration for static assets

## Deployment Architecture

### 1. Development Environment

- XAMPP/WAMP stack
- Git version control
- Local database instances

### 2. Production Considerations

- Load balancing for multi-tenant access
- Database replication for high availability
- Backup and disaster recovery procedures
- Monitoring and alerting systems

## Development Guidelines

### 1. Code Standards

- PSR-12 coding standards
- Meaningful variable and function names
- Comprehensive code comments
- Error handling and logging

### 2. Module Development

- Follow existing directory structure
- Implement tenant isolation in all queries
- Use provided helper functions for security
- Maintain consistent UI patterns

### 3. Database Changes

- Use migrations for schema updates
- Maintain backward compatibility
- Test with sample data
- Update documentation accordingly

## Troubleshooting & Maintenance

### 1. Common Issues

- **Session Problems**: Check cookie settings and session storage
- **Database Connection**: Verify credentials and connection limits
- **Permission Errors**: Review role assignments and tenant context

### 2. Maintenance Tasks

- Regular database backups
- Log rotation and analysis
- Performance monitoring
- Security updates and patches

## Future Enhancements

### 1. Planned Features

- Mobile application integration
- Advanced analytics dashboard
- AI-powered insights and predictions
- API-first architecture for third-party integrations

### 2. Technical Improvements

- Microservices architecture migration
- Real-time notifications with WebSockets
- Advanced search with Elasticsearch
- Containerized deployment with Docker

---

_Documentation Version: 1.0_
_Last Updated: June 27, 2026_
_Maintained by: Development Team_
