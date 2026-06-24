<?php
// modules/school/students/check_duplicate.php
require_once '../../../config/helpers.php';
auth_check(['school_admin']);
$school_id = enforce_tenant();
require_once '../../../config/db.php';

header('Content-Type: application/json');

$first_name = trim($_GET['first_name'] ?? '');
$last_name = trim($_GET['last_name'] ?? '');
$dob = trim($_GET['dob'] ?? '');

if (empty($first_name) || empty($dob)) {
    echo json_encode(['duplicate' => false]);
    exit;
}

try {
    $stmt = $pdo->prepare("
        SELECT COUNT(*) 
        FROM students 
        WHERE school_id = :school_id 
          AND LOWER(first_name) = LOWER(:first_name) 
          AND LOWER(last_name) = LOWER(:last_name) 
          AND dob = :dob 
          AND deleted_at IS NULL
    ");
    $stmt->execute([
        ':school_id' => $school_id,
        ':first_name' => $first_name,
        ':last_name' => $last_name,
        ':dob' => $dob
    ]);
    $count = (int)$stmt->fetchColumn();
    echo json_encode(['duplicate' => $count > 0]);
} catch (Exception $e) {
    echo json_encode(['duplicate' => false, 'error' => $e->getMessage()]);
}
exit;
