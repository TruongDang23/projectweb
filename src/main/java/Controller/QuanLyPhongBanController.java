package Controller;

import DAO.QuanLyPhongBanDAO;
import JDBCUtils.HandleException;
import Models.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@WebServlet(name = "QuanLyPhongBanController", urlPatterns = {"/listphongban", "/findphongban"})
public class QuanLyPhongBanController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private QuanLyPhongBanDAO quanLyPhongBanDAO = null;
  private List <ThongTinTruongPhong> listPhongBanInfo;
  public void init() {
    quanLyPhongBanDAO = new QuanLyPhongBanDAO();
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getServletPath();
    try {
      switch (action) {
        case "/listphongban":
          listPhongBan(request, response);
          break;
        case "/findphongban":
          findEmployee(request, response);
          break;
        default:
          break;
      }
    } catch (SQLException | ParseException ex) {
      throw new ServletException(ex);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

  private void listPhongBan(HttpServletRequest request, HttpServletResponse response)
      throws SQLException, IOException, ServletException {
    HttpSession session = request.getSession();
    TaiKhoan login = new TaiKhoan();
    login = (TaiKhoan) session.getAttribute("user");

    if(login == null)
      response.sendRedirect("views/system/login.jsp");
    else {
      String maChiNhanh = quanLyPhongBanDAO.LayMaChiNhanh(login.getMaTaiKhoan());
      String maPhongBan = quanLyPhongBanDAO.LayMaPhongBan(login.getMaTaiKhoan());

      List<ThongTinTruongPhong> listTruongPhong = quanLyPhongBanDAO.selectAllPhongBan(maChiNhanh,
          maPhongBan, login.getQuyen());
      listPhongBanInfo = quanLyPhongBanDAO.LoadInfoPhongBan();
      request.setAttribute("thongTinTruongPhong", listPhongBanInfo);

      if (login.getQuyen().equals("admin"))
      {
        request.setAttribute("listTruongPhong", listTruongPhong);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiPhongBan.jsp");
        dispatcher.forward(request, response);
      }
      else if (login.getQuyen().equals("giamdoc")) {
        request.setAttribute("listTruongPhong", listTruongPhong);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/QuanLyPhongBan.jsp");
        dispatcher.forward(request, response);
      }
    }
  }
  private void findEmployee(HttpServletRequest request, HttpServletResponse response)
      throws SQLException, IOException, ServletException, ParseException {
//    String maChiNhanh = request.getParameter("maChiNhanh");
//    String maPhongBan = request.getParameter("maPhongBan");
//    String role = request.getParameter("role");
//    String tenNhanVien = request.getParameter("tenNhanVien");
//    List<ThongTinPhongBan> listPhongBan = quanLyPhongBanDAO.selectAllPhongBan(maChiNhanh,
//        maPhongBan, role);
//    List<ThongTinNguoiDung> listNhanVien = quanLyPhongBanDAO.findEmployee(tenNhanVien);
//    request.setAttribute("listPhongBan", listPhongBan);
//    request.setAttribute("listNhanVien", listNhanVien);
//    RequestDispatcher dispatcher = request.getRequestDispatcher("listphongban.jsp");
//    dispatcher.forward(request, response);
  }

}
