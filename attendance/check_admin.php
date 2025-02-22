<?php
session_start();
require 'db_connect.php';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'Unauthorized: Please log in']);
    http_response_code(401); // Unauthorized
    exit;
}

if ($_SESSION['role'] !== 'admin') {
    echo json_encode(['status' => 'error', 'message' => 'Forbidden: Admin access required']);
    http_response_code(403); // Forbidden
    exit;
}

// If we reach here, the user is an admin
echo json_encode(['status' => 'success', 'message' => 'Authorized']);
exit;
?>