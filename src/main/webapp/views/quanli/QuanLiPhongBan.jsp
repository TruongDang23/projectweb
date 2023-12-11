<%-- Created by IntelliJ IDEA. User: GIGABYTE Date: 11/25/2023 Time: 9:30 AM To change this template use File | Settings
| File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Quản lí - Phòng ban</title>
</head>

<body>
<script src="https://use.fontawesome.com/f59bcd8580.js"></script>
<div id="wrapper">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand mb-5">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"
                 class="card-img-top logo-img"/>
        </div>
        <ul class="sidebar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/xemcautruc"><i class="fa fa-building-o"></i>Cấu trúc công ty</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/views/quanli/QuanLiCapNhatThongTin.jsp"><i
                        class="fa fa-drivers-license"></i>Cập nhật thông tin</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/views/quanli/QuanLiGuiMail.jsp"><i class="fa fa-commenting-o"></i>Gửi
                    mail</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listChiNhanh"><i class="fa fa-location-arrow"></i>Quản
                    lý chi
                    nhánh</a>
            </li>

            <li class="active">
                <a class="mt-3" href="<%=request.getContextPath()%>/views/quanli/QuanLiPhongBan.jsp"><i class="fa fa-sitemap"></i>Quản lý
                    phòng
                    ban</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listemployee"><i class="fa fa-users"></i>Quản lý nhân
                    viên</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listSalary"><i class="fa fa-bar-chart"></i>Thống
                    kê tiền lương</a>
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
                        <h3>Xin chào Quản trị viên</h3>
                        <a href="<%=request.getContextPath()%>/logout"><i class="fa fa-sign-out icon-size"></i></a>
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
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover"
                                       id="dtVerticalScrollExample">
                                    <thead>
                                    <tr>
                                        <th>Rendering engine</th>
                                        <th>Browser</th>
                                        <th>Platform(s)</th>
                                        <th>Engine version</th>
                                        <th>CSS grade</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX">
                                        <td>Trident</td>
                                        <td>Internet Explorer 4.0</td>
                                        <td>Win 95+</td>
                                        <td class="center">4</td>
                                        <td class="center">X</td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>Trident</td>
                                        <td>Internet Explorer 5.0</td>
                                        <td>Win 95+</td>
                                        <td class="center">5</td>
                                        <td class="center">C</td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>Trident</td>
                                        <td>Internet Explorer 5.5</td>
                                        <td>Win 95+</td>
                                        <td class="center">5.5</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="even gradeA">
                                        <td>Trident</td>
                                        <td>Internet Explorer 6</td>
                                        <td>Win 98+</td>
                                        <td class="center">6</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>Trident</td>
                                        <td>Internet Explorer 7</td>
                                        <td>Win XP SP2+</td>
                                        <td class="center">7</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="even gradeA">
                                        <td>Trident</td>
                                        <td>AOL browser (AOL desktop)</td>
                                        <td>Win XP</td>
                                        <td class="center">6</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Firefox 1.0</td>
                                        <td>Win 98+ / OSX.2+</td>
                                        <td class="center">1.7</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Firefox 1.5</td>
                                        <td>Win 98+ / OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Firefox 2.0</td>
                                        <td>Win 98+ / OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Firefox 3.0</td>
                                        <td>Win 2k+ / OSX.3+</td>
                                        <td class="center">1.9</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Camino 1.0</td>
                                        <td>OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Camino 1.5</td>
                                        <td>OSX.3+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Netscape 7.2</td>
                                        <td>Win 95+ / Mac OS 8.6-9.2</td>
                                        <td class="center">1.7</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Netscape Browser 8</td>
                                        <td>Win 98SE+</td>
                                        <td class="center">1.7</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Netscape Navigator 9</td>
                                        <td>Win 98+ / OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Mozilla 1.0</td>
                                        <td>Win 95+ / OSX.1+</td>
                                        <td class="center">1</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Mozilla 1.1</td>
                                        <td>Win 95+ / OSX.1+</td>
                                        <td class="center">1.1</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Mozilla 1.2</td>
                                        <td>Win 95+ / OSX.1+</td>
                                        <td class="center">1.2</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Mozilla 1.3</td>
                                        <td>Win 95+ / OSX.1+</td>
                                        <td class="center">1.3</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Mozilla 1.4</td>
                                        <td>Win 95+ / OSX.1+</td>
                                        <td class="center">1.4</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Mozilla 1.5</td>
                                        <td>Win 95+ / OSX.1+</td>
                                        <td class="center">1.5</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Mozilla 1.6</td>
                                        <td>Win 95+ / OSX.1+</td>
                                        <td class="center">1.6</td>
                                        <td class="center">A</td>
                                    </tr>
                                    <tr class="gradeA">
                                        <td>Gecko</td>
                                        <td>Mozilla 1.7</td>
                                        <td>Win 98+ / OSX.1+</td>
                                        <td class="center">1.7</td>
                                        <td class="center">A</td>
                                    </tr>
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
                            <option selected>Chọn chi nhánh</option>
                            <option value="1">Hà Nội</option>
                            <option value="2">TP.HCM</option>
                            <option value="3">Nha Trang</option>
                        </select>
                        <select class="form-select w-25">
                            <option selected>Chọn phòng ban</option>
                            <option value="1">Nhân sự</option>
                            <option value="2">Kế toán</option>
                            <option value="3">Marketing</option>
                        </select>
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
                        <label>ID:</label>
                        <input class="form-control" placeholder="ID" value="GD001"/>
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Họ và tên:</label>
                        <input class="form-control" placeholder="Họ và tên" value="Lê Thành Vinh"/>
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
                <h5 class="modal-title" id="staticBackdropLabel">
                    Thêm trưởng phòng
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form id="commonForm">
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
                <h5 class="modal-title" id="staticBackdropLabel">
                    Sửa trưởng phòng
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form id="commonForm">
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
                <h5 class="modal-title" id="staticBackdropLabel">
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
                <h5 class="modal-title" id="staticBackdropLabel">Thêm phòng ban</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form id="commonForm">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="ten-chi-nhanh" class="col-form-label">Tên chi nhánh:
                        </label>
                        <input type="text" class="form-control" id="ten-chi-nhanh"
                               placeholder="Tên chi nhánh" required/>
                    </div>
                    <div class="mb-3">
                        <label for="ten-phong-ban" class="col-form-label">Tên phòng ban:
                        </label>
                        <input type="text" class="form-control" id="ten-phong-ban"
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
                <h5 class="modal-title" id="staticBackdropLabel">Sửa phòng ban</h5>
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
</body>

</html>