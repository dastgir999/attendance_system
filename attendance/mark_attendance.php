<?php
session_start();
require 'db_connect.php';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $date = $_POST['date'];
    $attendance = json_decode($_POST['attendance'], true); // Array of student_id => status

    $stmt = $pdo->prepare("INSERT INTO attendance (student_id, date, status) 
                           VALUES (?, ?, ?) 
                           ON DUPLICATE KEY UPDATE status = ?");

    foreach ($attendance as $student_id => $status) {
        $stmt->execute([$student_id, $date, $status, $status]);
    }

    echo json_encode(['status' => 'success', 'message' => 'Attendance updated']);
    exit;
}
?>