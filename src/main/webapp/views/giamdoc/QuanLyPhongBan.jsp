<%@ page import="Models.ThongTinNguoiDung" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="Models.ThongTinPhongBan" %>
<%@ page import="Models.ThongTinTruongPhong" %>
<%-- Created by IntelliJ IDEA. User: GIGABYTE Date: 11/25/2023 Time: 9:30 AM To change this template use File | Settings
    | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Architects+Daughter&family=Inter:wght@400;500;700&display=swap"
            rel="stylesheet"/>
    <!-- Link boostrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous"/>
    <!-- Link boostrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <!-- Link fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/quanli.css"/>
    <link href="${pageContext.request.contextPath}/img/logo.png" rel="icon"/>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/jszip.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/xlsx.js"></script>
    <title>Quản lí - Phòng ban</title>
</head>

<body>
<script src="https://use.fontawesome.com/f59bcd8580.js"></script>
<%
    List<ThongTinTruongPhong> listTruongPhongInfo = (List<ThongTinTruongPhong>) request.getAttribute(
            "thongTinTruongPhong");
    Gson gson = new Gson();
    String json = gson.toJson(listTruongPhongInfo);
%>
<script>
  window.onload = function () {
    let msg = "<%= request.getAttribute("Result")%>";
    if (msg != "null")
      alert(msg);
  }
</script>
<div id="wrapper">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand mb-5">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"
                 class="card-img-top logo-img"/>
        </div>
        <ul class="sidebar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/xemcautruc"><i class="fa fa-building-o"></i>Cấu
                    trúc công ty</a>
            </li>
            <li>
                <a class="mt-3"
                   href="<%=request.getContextPath()%>/infoEmployee"><i
                        class="fa fa-drivers-license"></i>Cập nhật
                    thông tin</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/views/giamdoc/GuiEmail.jsp"><i
                        class="fa fa-commenting-o"></i>Gửi mail</a>
            </li>

            <li class="active">
                <a class="mt-3"
                   href="<%=request.getContextPath()%>/listphongban"><i
                        class="fa fa-sitemap"></i>Quản lý phòng
                    ban</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listemployee"><i
                        class="fa fa-users"></i>Quản lý nhân viên</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listSalary"><i
                        class="fa fa-bar-chart"></i>Thống kê tiền lương</a>
            </li>
        </ul>
    </aside>

    <div id="navbar-wrapper">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header d-flex justify-content-between align-items-center">
                    <div>
                        <a href="#" class="navbar-brand" id="sidebar-toggle"><i
                                class="fa fa-bars"></i></a>
                    </div>
                    <div ng-app="myApp" ng-controller="myCtrl">
                        <p>
                            Current Time:
                            <b>{{TimeNow}}</b>
                        </p>
                    </div>
                    <div class="navbar-text">
                        <h3>Xin chào Giám đốc</h3>
                        <a href="#"><i class="fa fa-sign-out icon-size"></i></a>
                    </div>
                </div>
            </div>
        </nav>
    </div>

    <section id="content-wrapper">
        <div class="row mb-3">
            <div class="col-lg-12">
                <p class="page-header text-center">Quản lí phòng ban</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-7 d-flex flex-column">
                <div class="panel panel-default">
                    <div class="panel-heading">Danh sách phòng ban</div>
                    <div class="panel-body">
                        <div class="scroll-bar">
                            <div class="table-responsive" style="overflow-x: scroll;">
                                <table
                                        class="table table-striped table-bordered table-hover"
                                        id="BangTruongPhong"
                                        onclick="DisplayInfo(event)"
                                >
                                    <thead>
                                    <tr>
                                        <th style="min-width: 90px;">Mã chi nhánh</th>
                                        <th style="min-width: 160px;">Tên chi nhánh</th>
                                        <th style="min-width: 160px;">Mã phòng ban</th>
                                        <th style="min-width: 160px;">Tên phòng ban</th>
                                        <th style="min-width: 150px;">Ngày tạo</th>
                                        <th style="min-width: 150px;">Số điện thoại</th>
                                        <th style="min-width: 150px;">Trưởng phòng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!--   for (Todo todo: todos) {  -->
                                    <c:forEach var="info" items="${listTruongPhong}">
                                        <tr>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.maChiNhanh}"/>
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.tenChiNhanh}"/>
                                            </td>
                                            <td style="min-width: 90px;">
                                                <c:out value="${info.maPB}"/>
                                            </td>
                                            <td style="min-width: 100px;">
                                                <c:out value="${info.tenPB}"/>
                                            </td>
                                            <td style="min-width: 160px;">
                                                <c:out value="${info.ngayTao}"/>
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.sdt}"/>
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.hoTen}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <!-- } -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="panel-heading" style="font-weight: 600">Tìm kiếm</div>
                    <div class="d-flex justify-content-around align-items-around">
                        <select class="form-select w-25">
                            <option selected>Chọn phòng ban</option>
                            <option value="1">Nhân sự</option>
                            <option value="2">Kế toán</option>
                            <option value="3">Marketing</option>
                        </select>
                        <input class="form-control w-25" placeholder="Tìm kiếm" name="text_box_find"
                               id="text_box_find" onkeyup="Search()"/>

                        <button type="submit" class="btn w-25 font-weight-bold btn-submit">
                            Tìm
                        </button>
                    </div>
                </div>
                <div>
                    <div class="panel-heading" style="font-weight: 600">
                        Tùy chọn phòng ban
                    </div>
                    <div class="d-flex justify-content-around align-items-around">
                        <button type="submit" class="btn w-25 font-weight-bold btn-submit"
                                data-bs-toggle="modal" data-bs-target="#ThemPhongBan">
                            Thêm
                        </button>
                        <button type="submit" class="btn w-25 font-weight-bold btn-submit"
                                data-bs-toggle="modal" data-bs-target="#SuaPhongBan">
                            Sửa
                        </button>
                        <button type="submit" class="btn w-25 font-weight-bold btn-submit"
                                data-bs-toggle="modal" data-bs-target="#XoaPhongBan">
                            Xóa
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 d-flex flex-column">
                <div>
                    <div class="panel-heading" style="font-weight: 600">
                        Thông tin Trưởng phòng
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Tên phòng:</label>
                        <input class="form-control" placeholder="tên phòng" id="tenphongban"/>
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>ID trưởng phòng:</label>
                        <input class="form-control" placeholder="ID" id="idtruongphong"/>
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Họ và tên:</label>
                        <input class="form-control" placeholder="Họ và tên" id="tentruongphong"/>
                    </div>
                </div>
                <div>
                    <div class="panel-heading" style="font-weight: 600">
                        Tùy chọn Trưởng phòng
                    </div>
                    <div class="d-flex justify-content-around align-items-around">
                        <button type="submit" class="btn w-25 font-weight-bold btn-submit"
                                data-bs-toggle="modal" data-bs-target="#ThemTruongPhong">
                            Thêm
                        </button>
                        <button type="submit" class="btn w-25 font-weight-bold btn-submit"
                                data-bs-toggle="modal" data-bs-target="#SuaTruongPhong">
                            Sửa
                        </button>
                        <button type="submit" class="btn w-25 font-weight-bold btn-submit"
                                data-bs-toggle="modal" data-bs-target="#XoaTruongPhong">
                            Xóa
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- TODO: Edit Modal HTML -->
<!-- ? Trưởng phòng -->
<!-- Thêm trưởng phòng -->
<div class="modal fade" id="ThemTruongPhong" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    Thêm trưởng phòng
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="id-truong-phong" class="col-form-label">ID:</label>
                        <input type="text" class="form-control" id="id-giam-doc" placeholder="ID"
                               required/>
                    </div>
                    <div class="mb-3">
                        <label for="ten-truong-phong" class="col-form-label">Tên trưởng
                            phòng:</label>
                        <input type="text" class="form-control" id="ten-giam-doc"
                               placeholder="Tên trưởng phòng" required/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn w-25 font-weight-bold btn-warning"
                            data-bs-dismiss="modal">
                        Đóng
                    </button>
                    <button type="button submit" class="btn w-25 font-weight-bold btn-submit">
                        Thêm
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Sửa trưởng phòng -->
<div class="modal fade" id="SuaTruongPhong" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    Sửa trưởng phòng
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="id-truong-phong" class="col-form-label">ID:</label>
                        <input type="text" class="form-control" id="id-truong-phong" value="TP001"
                               placeholder="ID" required/>
                    </div>
                    <div class="mb-3">
                        <label for="ten-truong-phong" class="col-form-label">Tên trưởng
                            phòng:</label>
                        <input type="text" class="form-control" id="ten-truong-phong"
                               value="Lê Thành Vinh"
                               placeholder="Tên trưởng phòng" required/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn w-25 font-weight-bold btn-warning"
                            data-bs-dismiss="modal">
                        Đóng
                    </button>
                    <button type="button submit" class="btn w-25 font-weight-bold btn-submit">
                        Sửa
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Xóa trưởng phòng -->
<div class="modal fade" id="XoaTruongPhong" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    Xóa trưởng phòng này!?
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p style="font-size: 16px">
                    Bạn có chắc chắn muốn xóa trưởng phòng này không? Hành động này
                    không thể hoàn tác.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn w-25 font-weight-bold btn-warning"
                        data-bs-dismiss="modal">
                    Đóng
                </button>
                <button type="button" class="btn w-25 font-weight-bold btn-danger">
                    Xóa
                </button>
            </div>
        </div>
    </div>
</div>
<!-- ? Phòng ban -->
<!-- Thêm phòng ban -->
<div class="modal fade" id="ThemPhongBan" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm phòng ban</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="ten-chi-nhanh" class="col-form-label">Tên chi nhánh:
                        </label>
                        <input type="text" class="form-control"
                               placeholder="Tên chi nhánh" required/>
                    </div>
                    <div class="mb-3">
                        <label for="ten-phong-ban" class="col-form-label">Tên phòng ban:
                        </label>
                        <input type="text" class="form-control"
                               placeholder="Tên phòng ban" required/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn w-25 font-weight-bold btn-warning"
                            data-bs-dismiss="modal">
                        Đóng
                    </button>
                    <button type="button submit" class="btn w-25 font-weight-bold btn-submit">
                        Thêm
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Sửa phòng ban -->
<div class="modal fade" id="SuaPhongBan" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Sửa phòng ban</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form id="commonForm">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="ten-chi-nhanh" class="col-form-label">Tên chi nhánh:
                        </label>
                        <input type="text" class="form-control" id="ten-chi-nhanh"
                               placeholder="Tên chi nhánh" value="TP.HCM" required/>
                    </div>
                    <div class="mb-3">
                        <label for="ten-phong-ban" class="col-form-label">Tên phòng ban:
                        </label>
                        <input type="text" class="form-control" id="ten-phong-ban"
                               placeholder="Tên phòng ban" value="Marketing" required/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn w-25 font-weight-bold btn-warning"
                            data-bs-dismiss="modal">
                        Đóng
                    </button>
                    <button type="button submit" class="btn w-25 font-weight-bold btn-submit">
                        Thêm
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Xóa phòng ban -->
<div class="modal fade" id="XoaPhongBan" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">
                    Xóa phòng ban này!?
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p style="font-size: 16px">
                    Bạn có chắc chắn muốn xóa phòng ban này không? Hành động này không
                    thể hoàn tác.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn w-25 font-weight-bold btn-warning"
                        data-bs-dismiss="modal">
                    Đóng
                </button>
                <button type="button submit" class="btn w-25 font-weight-bold btn-danger">
                    Xóa
                </button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/quanli.js"></script>
<script>
  function Search() {
    var searchValue = document.getElementById('text_box_find').value;

    var searchTable = document.getElementById('BangTruongPhong');
    var searchColCount;

    for (var rowIndex = 0; rowIndex < searchTable.rows.length; rowIndex++) {
      var rowData = '';

      if (rowIndex == 0) {
        searchColCount = searchTable.rows.item(rowIndex).cells.length;
        continue;
      }

      for (var colIndex = 0; colIndex < searchColCount; colIndex++) {
        rowData += searchTable.rows.item(rowIndex).cells.item(colIndex).textContent;
      }

      if (rowData.indexOf(searchValue) == -1)
        searchTable.rows.item(rowIndex).style.display = 'none';
      else
        searchTable.rows.item(rowIndex).style.display = 'table-row';
    }
  }
  function DisplayInfo(e) {
    let list = <%= json%>;
    let row = e.target.parentNode;
    let maPB = row.cells[2].innerHTML;
    // clear space maPB
    maPB = maPB.replace(/\s/g, '');

    for (let i =0; i < list.length; i++) {
      let emp = list[i];
      if (emp.maPB == maPB) {
        document.getElementById('tenphongban').value = emp.tenPB;
        document.getElementById('idtruongphong').value = emp.maNhanVien;
        document.getElementById('tentruongphong').value = emp.hoTen;
        break;
      }

    }
  }
</script>
</body>

</html>