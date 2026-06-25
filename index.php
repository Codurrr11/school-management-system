<?php
require_once 'config/helpers.php';
auth_check(); // Protect page

require_once 'config/db.php'; // Include database connection

// Include the page layout header and style components
require_once 'includes/header.php';

$role_name = $_SESSION['role_name'] ?? '';
?>

<?php if ($role_name === 'super_admin'): ?>
<!-- Welcome Banner Section -->
<div class="row align-items-center mb-4 g-3 welcome-header">
    <div class="col-12">
        <h2 class="mb-1 font-heading fw-extrabold">
            Platform Administration
        </h2>
        <p class="text-xs text-muted mb-0">
            Good morning, <?php echo sanitize($_SESSION['first_name'] ?? 'Admin'); ?>.
            Welcome to the SaaS management portal. You can manage registered schools, plans, and check platform performance.
        </p>
    </div>
</div>
    <?php
    // Fetch Super Admin Stats
    $school_count_stmt = $pdo->query("SELECT COUNT(*) FROM schools WHERE deleted_at IS NULL");
    $total_schools = $school_count_stmt->fetchColumn();

    $user_count_stmt = $pdo->query("SELECT COUNT(*) FROM users");
    $total_users = $user_count_stmt->fetchColumn();

    $active_schools_stmt = $pdo->query("SELECT COUNT(*) FROM schools WHERE status = 'active' AND deleted_at IS NULL");
    $active_schools = $active_schools_stmt->fetchColumn();
    ?>
    <!-- Super Admin Dashboard Content -->
    <div class="row g-4 mb-4">
        <!-- Card 1: Total Schools -->
        <div class="col-lg-4 col-md-6">
            <div class="card-premium">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-xs fw-semibold text-uppercase text-muted">Total Schools</span>
                        <div class="activity-icon-wrapper activity-icon-blue" style="width: 38px; height: 38px;">
                            <i class="ti ti-building fs-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bold mb-1 font-heading"><?php echo $total_schools; ?></h2>
                    <span class="text-xxs text-muted">registered in platform</span>
                </div>
            </div>
        </div>

        <!-- Card 2: Active Schools -->
        <div class="col-lg-4 col-md-6">
            <div class="card-premium">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-xs fw-semibold text-uppercase text-muted">Active Schools</span>
                        <div class="activity-icon-wrapper activity-icon-indigo" style="width: 38px; height: 38px;">
                            <i class="ti ti-shield-check fs-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bold mb-1 font-heading"><?php echo $active_schools; ?></h2>
                    <span class="text-xxs text-muted">actively running tenants</span>
                </div>
            </div>
        </div>

        <!-- Card 3: Platform Users -->
        <div class="col-lg-4 col-md-6">
            <div class="card-premium">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-xs fw-semibold text-uppercase text-muted">System Users</span>
                        <div class="activity-icon-wrapper activity-icon-amber" style="width: 38px; height: 38px;">
                            <i class="ti ti-users fs-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bold mb-1 font-heading"><?php echo $total_users; ?></h2>
                    <span class="text-xxs text-muted">admins, teachers, & parents</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Shortcuts Card -->
    <div class="row g-4">
        <div class="col-12">
            <div class="card-premium">
                <div class="card-header">
                    <h6>Quick Platform Operations</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-sm-6 col-md-4">
                            <a href="<?php echo BASE_URL; ?>modules/admin/schools-edit.php" class="btn btn-outline-secondary w-100 py-3 d-flex flex-column align-items-center gap-2 text-decoration-none">
                                <i class="ti ti-circle-plus fs-3 text-primary"></i>
                                <span class="fw-semibold text-xs text-uppercase text-muted">Register School</span>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <a href="<?php echo BASE_URL; ?>modules/admin/schools.php" class="btn btn-outline-secondary w-100 py-3 d-flex flex-column align-items-center gap-2 text-decoration-none">
                                <i class="ti ti-list fs-3 text-primary"></i>
                                <span class="fw-semibold text-xs text-uppercase text-muted">View School List</span>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <a href="<?php echo BASE_URL; ?>logout.php" class="btn btn-outline-secondary w-100 py-3 d-flex flex-column align-items-center gap-2 text-decoration-none">
                                <i class="ti ti-logout fs-3 text-danger"></i>
                                <span class="fw-semibold text-xs text-uppercase text-muted">Log Out System</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php else: 
    // Fetch School Admin Stats
    $school_id = $_SESSION['school_id'] ?? 1;

    // 1. Total Students
    $stmt_stud = $pdo->prepare("SELECT COUNT(*) FROM students WHERE school_id = :sid AND deleted_at IS NULL");
    $stmt_stud->execute([':sid' => $school_id]);
    $total_students = (int)$stmt_stud->fetchColumn();

    // 2. Active Teachers
    $stmt_teach = $pdo->prepare("SELECT COUNT(*) FROM teachers WHERE school_id = :sid AND deleted_at IS NULL");
    $stmt_teach->execute([':sid' => $school_id]);
    $total_teachers = (int)$stmt_teach->fetchColumn();

    // 2b. Total Parents
    $stmt_parents = $pdo->prepare("SELECT COUNT(*) FROM parents WHERE school_id = :sid AND deleted_at IS NULL");
    $stmt_parents->execute([':sid' => $school_id]);
    $total_parents = (int)$stmt_parents->fetchColumn();

    // 2c. Total Leads / Inquiries
    $stmt_leads = $pdo->prepare("SELECT COUNT(*) FROM leads WHERE school_id = :sid AND deleted_at IS NULL");
    $stmt_leads->execute([':sid' => $school_id]);
    $total_leads = (int)$stmt_leads->fetchColumn();

    // 3. Fees totals
    // Total Fee Assigned (Revenue)
    $stmt_assigned = $pdo->prepare("
        SELECT COALESCE(SUM(sfi.amount), 0) 
        FROM student_fee_items sfi 
        JOIN students s ON sfi.student_id = s.id 
        WHERE s.school_id = :sid AND sfi.is_active = 1 AND s.deleted_at IS NULL
    ");
    $stmt_assigned->execute([':sid' => $school_id]);
    $total_fees_assigned = (float)$stmt_assigned->fetchColumn();

    // Total Fee Collected
    $stmt_collected = $pdo->prepare("
        SELECT COALESCE(SUM(sfi.paid_amount), 0) 
        FROM student_fee_items sfi 
        JOIN students s ON sfi.student_id = s.id 
        WHERE s.school_id = :sid AND sfi.is_active = 1 AND s.deleted_at IS NULL
    ");
    $stmt_collected->execute([':sid' => $school_id]);
    $total_fees_collected = (float)$stmt_collected->fetchColumn();

    // Total Outstanding Dues
    $total_fees_outstanding = max(0.0, $total_fees_assigned - $total_fees_collected);

    // Fee Collection Progress Percentage
    $fee_target_percent = $total_fees_assigned > 0 ? round(($total_fees_collected / $total_fees_assigned) * 100, 1) : 0;

    // 4. Fee heads (Tuition, Transport, Hostel)
    $stmt_head = $pdo->prepare("
        SELECT sfi.fee_type, COALESCE(SUM(sfi.paid_amount), 0) AS collected
        FROM student_fee_items sfi
        JOIN students s ON sfi.student_id = s.id
        WHERE s.school_id = :sid AND sfi.is_active = 1 AND s.deleted_at IS NULL
        GROUP BY sfi.fee_type
    ");
    $stmt_head->execute([':sid' => $school_id]);
    $fee_heads = [];
    while ($row = $stmt_head->fetch()) {
        $fee_heads[$row['fee_type']] = (float)$row['collected'];
    }
    $tuition_collected = $fee_heads['Tuition Fee'] ?? 0.0;
    $transport_collected = $fee_heads['Transport Fee'] ?? 0.0;
    $hostel_collected = $fee_heads['Hostel Fee'] ?? 0.0;

    // 5. Administrative Expenses Spent
    $stmt_exp = $pdo->prepare("
        SELECT COALESCE(SUM(amount), 0) 
        FROM expenses 
        WHERE school_id = :sid AND deleted_at IS NULL
    ");
    $stmt_exp->execute([':sid' => $school_id]);
    $expenses_spent = (float)$stmt_exp->fetchColumn();
    $expenses_limit = 550000.00; // static limit
    $expense_percentage = $expenses_limit > 0 ? min(100.0, ($expenses_spent / $expenses_limit) * 100) : 0;

    // 6. Recent Fee Transactions
    $stmt_recent = $pdo->prepare("
        SELECT fp.*, s.first_name, s.last_name 
        FROM fee_payments fp 
        JOIN students s ON fp.student_id = s.id 
        WHERE fp.school_id = :sid 
        ORDER BY fp.id DESC 
        LIMIT 5
    ");
    $stmt_recent->execute([':sid' => $school_id]);
    $recent_payments = $stmt_recent->fetchAll();

    // 6b. Recent Leads / Inquiries (latest 5 leads)
    $stmt_recent_leads = $pdo->prepare("
        SELECT l.*, c.name AS class_name 
        FROM leads l 
        LEFT JOIN classes c ON l.class_id = c.id 
        WHERE l.school_id = :sid AND l.deleted_at IS NULL 
        ORDER BY l.id DESC 
        LIMIT 5
    ");
    $stmt_recent_leads->execute([':sid' => $school_id]);
    $recent_leads = $stmt_recent_leads->fetchAll();

    // 6c. Recent Expenses (latest 5 expenses)
    $stmt_recent_expenses = $pdo->prepare("
        SELECT * 
        FROM expenses 
        WHERE school_id = :sid AND deleted_at IS NULL 
        ORDER BY id DESC 
        LIMIT 5
    ");
    $stmt_recent_expenses->execute([':sid' => $school_id]);
    $recent_expenses = $stmt_recent_expenses->fetchAll();

    // 6d. Leads Status Breakdown (for Leads Pipeline Chart)
    $stmt_lead_status = $pdo->prepare("
        SELECT status, COUNT(*) AS count 
        FROM leads 
        WHERE school_id = :sid AND deleted_at IS NULL 
        GROUP BY status
    ");
    $stmt_lead_status->execute([':sid' => $school_id]);
    $lead_statuses_data = [];
    while ($row = $stmt_lead_status->fetch()) {
        $status_name = $row['status'] ?: 'Interested';
        $lead_statuses_data[$status_name] = (int)$row['count'];
    }
    $lead_pipeline_labels = array_keys($lead_statuses_data);
    $lead_pipeline_counts = array_values($lead_statuses_data);

    // 6e. Lead Sources Breakdown (for lead sources list)
    $stmt_lead_source = $pdo->prepare("
        SELECT COALESCE(source, 'Direct') AS source_name, COUNT(*) AS count
        FROM leads
        WHERE school_id = :sid AND deleted_at IS NULL
        GROUP BY source
    ");
    $stmt_lead_source->execute([':sid' => $school_id]);
    $lead_sources_data = [];
    while ($row = $stmt_lead_source->fetch()) {
        $lead_sources_data[$row['source_name']] = (int)$row['count'];
    }

    // 6f. Student Status Breakdown (active, suspended, passed, dropped)
    $stmt_stud_status = $pdo->prepare("
        SELECT status, COUNT(*) AS count
        FROM students
        WHERE school_id = :sid AND deleted_at IS NULL
        GROUP BY status
    ");
    $stmt_stud_status->execute([':sid' => $school_id]);
    $student_statuses = ['active' => 0, 'suspended' => 0, 'passed' => 0, 'dropped' => 0, 'inactive' => 0];
    while ($row = $stmt_stud_status->fetch()) {
        $student_statuses[$row['status']] = (int)$row['count'];
    }

    // 6g. RTE vs Non-RTE student counts
    $stmt_rte = $pdo->prepare("
        SELECT is_rte, COUNT(*) AS count
        FROM students
        WHERE school_id = :sid AND deleted_at IS NULL
        GROUP BY is_rte
    ");
    $stmt_rte->execute([':sid' => $school_id]);
    $rte_count = 0;
    $non_rte_count = 0;
    while ($row = $stmt_rte->fetch()) {
        if ($row['is_rte'] === 'yes') {
            $rte_count = (int)$row['count'];
        } else {
            $non_rte_count = (int)$row['count'];
        }
    }

    // 7. Dynamic Monthly chart data

    $stmt_chart_coll = $pdo->prepare("
        SELECT MONTH(payment_date) AS m, SUM(amount_paid) AS total 
        FROM fee_payments 
        WHERE school_id = :sid AND YEAR(payment_date) = YEAR(CURDATE())
        GROUP BY MONTH(payment_date)
    ");
    $stmt_chart_coll->execute([':sid' => $school_id]);
    $coll_by_month = array_fill(1, 12, 0.0);
    while ($row = $stmt_chart_coll->fetch()) {
        $coll_by_month[(int)$row['m']] = (float)$row['total'];
    }

    $stmt_chart_out = $pdo->prepare("
        SELECT MONTH(sfi.created_at) AS m, SUM(sfi.amount - sfi.paid_amount) AS total 
        FROM student_fee_items sfi
        JOIN students s ON sfi.student_id = s.id
        WHERE s.school_id = :sid AND sfi.is_active = 1 AND s.deleted_at IS NULL AND YEAR(sfi.created_at) = YEAR(CURDATE())
        GROUP BY MONTH(sfi.created_at)
    ");
    $stmt_chart_out->execute([':sid' => $school_id]);
    $out_by_month = array_fill(1, 12, 0.0);
    while ($row = $stmt_chart_out->fetch()) {
        $out_by_month[(int)$row['m']] = (float)$row['total'];
    }

    $months_names = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    $current_month_num = (int)date('m');
    $display_months_count = max(6, $current_month_num);
    
    $chart_months = array_slice($months_names, 0, $display_months_count);
    $chart_collected = array_slice(array_values($coll_by_month), 0, $display_months_count);
    $chart_outstanding = array_slice(array_values($out_by_month), 0, $display_months_count);
    ?>
    <div id="dashboard-data"
         data-chart-months='<?php echo json_encode($chart_months); ?>'
         data-chart-collected='<?php echo json_encode($chart_collected); ?>'
         data-chart-outstanding='<?php echo json_encode($chart_outstanding); ?>'
         data-expense-percentage="<?php echo $expense_percentage; ?>"
         data-lead-labels='<?php echo json_encode($lead_pipeline_labels); ?>'
         data-lead-counts='<?php echo json_encode($lead_pipeline_counts); ?>'
         style="display: none;">
    </div>
    <!-- Main Dashboard Glassmorphism Container with Background Blobs -->
    <div class="glass-bg-blob blob-primary"></div>
    <div class="glass-bg-blob blob-success"></div>

    <div class="dashboard-glass-container">
        <!-- Dashboard Sub-Header Greeting & Quick Actions -->
        <div class="dashboard-sub-header">
            <div class="welcome-msg-block d-flex align-items-center gap-3">
                <?php
                $user_avatar_url = "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=100";
                if (!empty($_SESSION['avatar'])) {
                    $avatar_path = ROOT_PATH . "uploads/profile/" . $_SESSION['avatar'];
                    if (file_exists($avatar_path)) {
                        $user_avatar_url = BASE_URL . "uploads/profile/" . $_SESSION['avatar'];
                    }
                }
                ?>
                <img src="<?php echo $user_avatar_url; ?>" alt="User Avatar" class="rounded-circle border border-2 border-white shadow-sm" style="width: 50px; height: 50px; object-fit: cover;">
                <div>
                    <h1 class="mb-0">Good morning, <?php echo htmlspecialchars($_SESSION['first_name'] ?? 'Admin'); ?>!</h1>
                    <p class="mb-0">Let's make this day productive at <?php echo htmlspecialchars($_SESSION['school_name'] ?? 'Brighton School Kota'); ?>.</p>
                </div>
            </div>
            <div class="welcome-stats-block">
                <div class="stat-pill-item">
                    <span class="stat-pill-label">Tasks done</span>
                    <span class="stat-pill-value">
                        <?php echo number_format($total_students); ?>
                        <i class="ti ti-arrow-up-right"></i>
                    </span>
                </div>
                <div class="stat-pill-item">
                    <span class="stat-pill-label">Hours saved</span>
                    <span class="stat-pill-value">
                        <?php echo $fee_target_percent; ?>%
                        <i class="ti ti-arrow-up-right"></i>
                    </span>
                </div>
                <a href="<?php echo BASE_URL; ?>modules/school/students/index.php" class="btn-primary-pill">
                    <i class="ti ti-plus"></i> Add Student
                </a>
            </div>
        </div>

        <!-- Main Content Grid -->
        <div class="container-fluid px-3">
            <div class="row g-4 mb-4">
                <!-- Col 1: Virtual Assistant Card -->
                <div class="col-xl-5 col-lg-6">
                    <!-- Outer Tabs Switcher -->
                    <div class="assistant-tabs" id="assistantTabs" role="tablist">
                        <button class="assistant-tab-btn" id="help-tab" type="button" title="Help">
                            <i class="ti ti-help-circle fs-5"></i>
                        </button>
                        <button class="assistant-tab-btn active" id="chat-tab" type="button" title="Virtual Assistant">
                            <i class="ti ti-message-2 fs-5"></i>
                        </button>
                        <button class="assistant-tab-btn" id="settings-tab" type="button" title="Settings">
                            <i class="ti ti-settings fs-5"></i>
                        </button>
                    </div>

                    <!-- Main Glassmorphic Assistant Card -->
                    <div class="glass-panel" style="min-height: 350px;">
                        <!-- Virtual assistant avatar in the top right corner -->
                        <div class="chat-avatar-wrapper">
                            <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&q=80&w=100" alt="Assistant Avatar" style="width: 100%; height: 100%; object-fit: cover;">
                        </div>

                        <div class="chat-body mt-4">
                            <div class="chat-bubble">
                                Namaste! Welcome to Brighton School Kota dashboard. How can I assist you with CBSE classes, fee payments, or session settings today?
                                <span class="time">9:32 AM</span>
                            </div>
                        </div>

                        <!-- Input line at the bottom -->
                        <div class="chat-input-wrapper">
                            <input type="text" placeholder="Write a message...">
                            <div class="chat-input-actions">
                                <i class="ti ti-paperclip" title="Attach file"></i>
                                <i class="ti ti-mood-smile" title="Emojis"></i>
                                <i class="ti ti-microphone" title="Voice message"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Col 2: My Activity Timeline Card -->
                <div class="col-xl-7 col-lg-6">
                    <div class="glass-panel" style="min-height: 350px;">
                        <div class="timeline-header">
                            <div>
                                <h5 class="fw-bold mb-0" style="font-family: var(--font-heading); color: #2D2D35;">My activity</h5>
                                <span class="text-xs text-muted">What is waiting for you today</span>
                            </div>
                            <button class="circle-btn-util" title="Calendar">
                                <i class="ti ti-calendar fs-5"></i>
                            </button>
                        </div>

                        <!-- Dotted Vertical Grid Lines Timeline Slider -->
                        <div class="timeline-grid">
                            <!-- Hour Column 07:00 -->
                            <div class="timeline-hour-col">
                                <span class="timeline-hour-label">07:00</span>
                                <div class="timeline-dotted-line"></div>
                            </div>
                            <!-- Hour Column 08:00 -->
                            <div class="timeline-hour-col">
                                <span class="timeline-hour-label">08:00</span>
                                <div class="timeline-dotted-line"></div>
                            </div>
                            <!-- Hour Column 09:00 -->
                            <div class="timeline-hour-col">
                                <span class="timeline-hour-label">09:00</span>
                                <div class="timeline-dotted-line"></div>
                            </div>
                            <!-- Hour Column 10:00 -->
                            <div class="timeline-hour-col">
                                <span class="timeline-hour-label">10:00</span>
                                <div class="timeline-dotted-line"></div>
                            </div>
                            <!-- Hour Column 11:00 -->
                            <div class="timeline-hour-col">
                                <span class="timeline-hour-label">11:00</span>
                                <div class="timeline-dotted-line"></div>
                            </div>
                            <!-- Hour Column 12:00 -->
                            <div class="timeline-hour-col" style="font-weight: bold; color: #2D2D35;">
                                <span class="timeline-hour-label" style="color: #2D2D35;">12:00</span>
                                <div class="timeline-dotted-line"></div>
                            </div>
                            <!-- Hour Column 01:00 -->
                            <div class="timeline-hour-col">
                                <span class="timeline-hour-label">01:00</span>
                                <div class="timeline-dotted-line"></div>
                            </div>
                            <!-- Hour Column 02:00 -->
                            <div class="timeline-hour-col">
                                <span class="timeline-hour-label">02:00</span>
                                <div class="timeline-dotted-line"></div>
                            </div>

                            <!-- Pill Event Blocks -->
                            <!-- Lime green: Staff Meeting -->
                            <div class="timeline-event-block event-lime">
                                <div class="event-info">
                                    <span class="event-title">Staff Meeting</span>
                                    <span class="event-subtitle">Brighton School Staff Room</span>
                                </div>
                                <div class="event-avatars">
                                    <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&q=80&w=60" alt="Avatar" class="event-avatar-img">
                                    <span class="event-avatar-more">+4</span>
                                </div>
                            </div>

                            <!-- Blue-grey: CBSE Syllabus review -->
                            <div class="timeline-event-block event-blue-grey">
                                <div class="event-info">
                                    <span class="event-title">CBSE syllabus review</span>
                                    <span class="event-subtitle">Conference Room</span>
                                </div>
                                <div class="event-avatars">
                                    <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=60" alt="Avatar" class="event-avatar-img">
                                    <span class="event-avatar-more">+8</span>
                                </div>
                            </div>

                            <!-- Lavender: Chai & Samosa break -->
                            <div class="timeline-event-block event-lavender">
                                <div class="event-info">
                                    <span class="event-title">Chai & Samosa break</span>
                                    <span class="event-subtitle">Canteen</span>
                                </div>
                            </div>

                            <!-- Current time tracker indicator vertical black line -->
                            <div class="timeline-current-indicator">
                                <div class="timeline-indicator-dot"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4">
                <!-- Col 3: To-Do List Card -->
                <div class="col-xl-5 col-lg-6">
                    <div class="glass-panel" style="min-height: 380px;">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                                <h5 class="fw-bold mb-0" style="font-family: var(--font-heading); color: #2D2D35;">To-do list</h5>
                                <span class="text-xs text-muted"><?php echo date('l, d M Y'); ?></span>
                            </div>
                            <button class="circle-btn-util" title="More Actions">
                                <i class="ti ti-arrow-up-right fs-5"></i>
                            </button>
                        </div>

                        <div class="todo-list-wrapper">
                            <!-- Item 1: Submit CBSE Affiliation Report (completed) -->
                            <div class="todo-item">
                                <div class="todo-left">
                                    <div class="todo-check-btn completed">
                                        <i class="ti ti-check"></i>
                                    </div>
                                    <div class="todo-text-block">
                                        <span class="todo-title-txt completed">Submit CBSE Affiliation Report</span>
                                        <span class="todo-meta-txt">Brighton School Kota</span>
                                    </div>
                                </div>
                                <div class="todo-right d-flex align-items-center gap-2">
                                    <span class="todo-meta-txt">Today 10:00 PM</span>
                                    <div class="event-avatars">
                                        <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&q=80&w=60" alt="Avatar" class="event-avatar-img">
                                        <img src="https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&q=80&w=60" alt="Avatar" class="event-avatar-img">
                                    </div>
                                </div>
                            </div>

                            <!-- Item 2: Setup new CBSE academic sessions -->
                            <div class="todo-item">
                                <div class="todo-left">
                                    <div class="todo-check-btn" onclick="this.classList.toggle('completed'); this.nextElementSibling.querySelector('.todo-title-txt').classList.toggle('completed')">
                                        <i class="ti ti-check"></i>
                                    </div>
                                    <div class="todo-text-block">
                                        <span class="todo-title-txt">Setup new CBSE academic sessions</span>
                                        <span class="todo-meta-txt">Under Academic Setup</span>
                                    </div>
                                </div>
                                <div class="todo-right">
                                    <span class="todo-meta-txt">Due tomorrow</span>
                                </div>
                            </div>

                            <!-- Item 3: Check fee defaulters & trigger SMS alerts -->
                            <div class="todo-item">
                                <div class="todo-left">
                                    <div class="todo-check-btn" onclick="this.classList.toggle('completed'); this.nextElementSibling.querySelector('.todo-title-txt').classList.toggle('completed')">
                                        <i class="ti ti-check"></i>
                                    </div>
                                    <div class="todo-text-block">
                                        <span class="todo-title-txt">Check fee defaulters & trigger SMS alerts</span>
                                        <span class="todo-meta-txt">Fees management module</span>
                                    </div>
                                </div>
                                <div class="todo-right">
                                    <span class="todo-meta-txt">Due in 2 days</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Col 4: Summary Curve Chart Card -->
                <div class="col-xl-7 col-lg-6">
                    <div class="glass-panel" style="min-height: 380px;">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                                <h5 class="fw-bold mb-0" style="font-family: var(--font-heading); color: #2D2D35;">Summary</h5>
                                <span class="text-xs text-muted">Track school financial collection</span>
                            </div>
                            <div class="d-flex gap-2">
                                <button class="circle-btn-util" title="Chart Options">
                                    <i class="ti ti-adjustments-horizontal fs-5"></i>
                                </button>
                                <button class="circle-btn-util" title="Expanded View">
                                    <i class="ti ti-arrow-up-right fs-5"></i>
                                </button>
                            </div>
                        </div>

                        <div class="summary-chart-container">
                            <!-- Bezier curve chart using Chart.js -->
                            <canvas id="summaryChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php endif; ?>

<?php
// Include the page layout footer tag
require_once 'includes/footer.php';
?>
