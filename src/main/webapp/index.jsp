<%--
  Created by IntelliJ IDEA.
  User: GIGABYTE
  Date: 11/23/2023
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body {
        font-family: 'Arial', sans-serif;
        text-align: center;
        padding: 20px;
        }

        a {
        display: inline-block;
        margin: 10px;
        padding: 10px 20px;
        text-decoration: none;
        color: #fff;
        background-color: #3498db;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        }

        a:hover {
        background-color: #2980b9;
        }
    </style>
    <title>Title</title>
</head>
<body>
    <a href="./views/system/login.jsp">Đăng nhập</a>
    <br>
    <a href="views/nhanvien/NhanVienCapNhatThongTin.jsp">Nhân Viên</a>
    <br>
    <a href="views/quanli/QuanLiCauTruc.jsp">Quan li</a>
    <br>
    <a href="./views/giamdoc/XemCauTruc.jsp">Giám đốc</a>
    <br>
    <a href="./views/truongphong/XemCauTruc.jsp">Trưởng phòng</a>
</body>
</html>
