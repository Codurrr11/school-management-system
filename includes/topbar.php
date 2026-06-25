<!-- App Top Header Bar -->
<header class="app-topbar">

    <!-- Left Section: Mobile Toggle & Brand Logo & Session Selector -->
    <div class="d-flex align-items-center">
        <!-- Sidebar Toggle Button -->
        <button type="button" id="sidebarToggleBtn" class="circle-btn-util me-3" aria-label="Toggle Sidebar Navigation">
            <i class="ti ti-menu-2 fs-5"></i>
        </button>

        <a href="<?php echo BASE_URL; ?>index.php" class="topbar-brand me-4">
            SaasPanel
        </a>

        <!-- Academic Session Selector -->
        <?php if (!empty($_SESSION['school_id'])): ?>
            <?php
            $sessions_list = get_academic_sessions($_SESSION['school_id']);
            $current_sess_id = $_SESSION['academic_session_id'] ?? null;
            $current_sess_name = $_SESSION['academic_session_name'] ?? 'No Session';
            ?>
            <div class="dropdown">
                <button class="btn btn-session-selector dropdown-toggle" type="button" id="sessionDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="ti ti-calendar-check text-primary"></i>
                    <span>Session: <?php echo sanitize($current_sess_name); ?></span>
                </button>
                <ul class="dropdown-menu shadow-md border-0 mt-2" aria-labelledby="sessionDropdown">
                    <?php if (empty($sessions_list)): ?>
                        <li><a class="dropdown-item text-xs py-2 disabled" href="#">No Sessions Found</a></li>
                    <?php else: ?>
                        <?php foreach ($sessions_list as $s): ?>
                            <?php
                            $isActive = ($s['id'] == $current_sess_id);
                            // Rebuild URL with new query parameter
                            $url = strtok($_SERVER["REQUEST_URI"], '?');
                            $queryParams = $_GET;
                            $queryParams['change_session_id'] = $s['id'];
                            $targetUrl = $url . '?' . http_build_query($queryParams);
                            ?>
                            <li>
                                <a class="dropdown-item text-xs py-2 <?php echo $isActive ? 'active' : ''; ?>" href="<?php echo sanitize($targetUrl); ?>">
                                    Session: <?php echo sanitize($s['name']); ?> <?php echo $s['is_current'] ? '(Active)' : ''; ?>
                                </a>
                            </li>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </ul>
            </div>
        <?php else: ?>
            <!-- Static placeholder for Platform Admin -->
            <div class="d-none d-md-block">
                <span class="badge bg-secondary text-xs py-2 px-3">Platform Admin</span>
            </div>
        <?php endif; ?>
    </div>

    <!-- Center Section: Light / Dark Mode Toggle Pill Switch -->
    <div class="theme-pill-toggle">
        <button type="button" class="theme-pill-btn active" id="themeSunBtn" title="Light Mode">
            <i class="ti ti-sun"></i>
        </button>
        <button type="button" class="theme-pill-btn" id="themeMoonBtn" title="Dark Mode">
            <i class="ti ti-moon"></i>
        </button>
    </div>

    <!-- Right Section: Circular Utilities & User Profile -->
    <div class="topbar-actions-custom">
        <!-- Search Button -->
        <button type="button" class="circle-btn-util" id="mobileSearchToggleBtn" aria-label="Search Records" title="Search">
            <i class="ti ti-search fs-5"></i>
        </button>

        <!-- Profile Avatar Widget -->
        <div class="dropdown">
            <?php
            if (is_logged_in() && !isset($_SESSION['avatar'])) {
                global $pdo;
                if ($pdo) {
                    $stmt_av = $pdo->prepare("SELECT avatar FROM users WHERE id = :id LIMIT 1");
                    $stmt_av->execute([':id' => $_SESSION['user_id']]);
                    $_SESSION['avatar'] = $stmt_av->fetchColumn() ?: '';
                }
            }
            $user_avatar_url = "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=100";
            if (!empty($_SESSION['avatar'])) {
                $avatar_path = ROOT_PATH . "uploads/profile/" . $_SESSION['avatar'];
                if (file_exists($avatar_path)) {
                    $user_avatar_url = BASE_URL . "uploads/profile/" . $_SESSION['avatar'];
                }
            }
            ?>
            <img src="<?php echo $user_avatar_url; ?>" alt="User Avatar" class="circle-avatar-profile dropdown-toggle" id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
            <ul class="dropdown-menu dropdown-menu-end shadow-md border-0 mt-2 py-2" aria-labelledby="profileDropdown">
                <li><a class="dropdown-item text-xs py-2 d-flex align-items-center gap-2" href="<?php echo BASE_URL; ?>modules/school/profile/index.php"><i class="ph-light ph-user fs-5"></i> My Profile</a></li>
                <li><a class="dropdown-item text-xs py-2 d-flex align-items-center gap-2" href="#"><i class="ph-light ph-gear fs-5"></i> Account Settings</a></li>
                <li>
                    <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item text-xs py-2 d-flex align-items-center gap-2 text-danger" href="<?php echo BASE_URL; ?>logout.php"><i class="ph-light ph-sign-out fs-5"></i> Sign Out</a></li>
            </ul>
        </div>
    </div>
</header>
