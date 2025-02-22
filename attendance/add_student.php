<?php
session_start();
require 'db_connect.php';

// Admin check
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    echo json_encode(['status' => 'error', 'message' => 'Admin access required']);
    http_response_code(403);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = trim($_POST['name']);
    $roll_no = trim($_POST['roll_no']);
    $class = trim($_POST['class']);

    // Check if roll number already exists
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM students WHERE roll_no = ?");
    $stmt->execute([$roll_no]);
    if ($stmt->fetchColumn() > 0) {
        echo json_encode(['status' => 'error', 'message' => 'Roll number already exists']);
        exit;
    }

    // Insert new student
    $stmt = $pdo->prepare("INSERT INTO students (name, roll_no, class) VALUES (?, ?, ?)");
    try {
        $stmt->execute([$name, $roll_no, $class]);
        echo json_encode(['status' => 'success', 'message' => 'Student added successfully']);
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Failed to add student: ' . $e->getMessage()]);
    }
    exit;
}
?>