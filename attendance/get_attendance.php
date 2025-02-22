<?php
session_start();
require 'db_connect.php';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $date = isset($_GET['date']) ? $_GET['date'] : null;
    $student_id = isset($_GET['student_id']) ? $_GET['student_id'] : null;

    $query = "SELECT s.id, s.name, s.roll_no, s.class, a.date, a.status 
              FROM students s 
              LEFT JOIN attendance a ON s.id = a.student_id";
    $params = [];

    if ($date) {
        $query .= " WHERE a.date = ?";
        $params[] = $date;
    }
    if ($student_id) {
        $query .= $date ? " AND s.id = ?" : " WHERE s.id = ?";
        $params[] = $student_id;
    }

    $stmt = $pdo->prepare($query);
    $stmt->execute($params);
    $records = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['status' => 'success', 'records' => $records]);
    exit;
}
?>