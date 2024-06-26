package Controller;

import DAO.CauTrucCongTyDAO;
import JDBCUtils.CsrfTokenUtil;
import JDBCUtils.HandleException;
import Models.CayChiNhanh;
import Models.TaiKhoan;

import java.util.Arrays;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static JDBCUtils.CsrfTokenUtil.CSRF_TOKEN_ATTR;

@WebServlet(name = "CauTrucCongTyController", urlPatterns = {"/xemcautruc"})
public class CauTrucCongTyController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final List<String> WHITELIST_DOMAINS = Arrays.asList(
        "http://localhost:8080/FinalProject_war_exploded/views/quanli/QuanLiCauTruc.jsp",
            "http://localhost:8080/FinalProject_war_exploded/views/giamdoc/XemCauTruc.jsp",
            "http://localhost:8080/FinalProject_war_exploded/views/truongphong/XemCauTruc.jsp",
            "http://localhost:8080/FinalProject_war_exploded/views/nhanvien/NhanVienCauTruc.jsp",
        "http://localhost:8080/FinalProject_war_exploded/xemcautruc",
        "http://localhost:8080/FinalProject_war_exploded/infoEmployee",
        "http://localhost:8080/FinalProject_war_exploded/listChiNhanh",
        "http://localhost:8080/FinalProject_war_exploded/listphongban",
        "http://localhost:8080/FinalProject_war_exploded/listemployee",
        "http://localhost:8080/FinalProject_war_exploded/listSalary");
    private CauTrucCongTyDAO cauTrucCongTyDAO = null;

    public void init() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
        {
            LoadStructure(request,response);
        }
        catch (SQLException ex){
            HandleException.printSQLException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

    private void LoadStructure(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");
        String token = (String) session.getAttribute(CSRF_TOKEN_ATTR);
        System.out.println("Token: " + token);
        if(login == null || !CsrfTokenUtil.isCsrfTokenValid(session, token))
        {
            response.sendRedirect("views/system/login.jsp");
        }
        else {
            String url = request.getHeader("referer");
            System.out.println("URL: " + url);
            if (!isWhitelisted(url)) {
                response.getWriter().write("Access Denied");
                return;
            }
            cauTrucCongTyDAO = new CauTrucCongTyDAO();
            List <CayChiNhanh> structure = cauTrucCongTyDAO.LoadStructure();

            request.setAttribute("CauTrucCongTy",structure);

            if(login.getQuyen().equals("admin"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiCauTruc.jsp");
                dispatcher.forward(request,response);
            }
            else if(login.getQuyen().equals("giamdoc"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/XemCauTruc.jsp");
                dispatcher.forward(request,response);
            }
            else if(login.getQuyen().equals("truongphong"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/XemCauTruc.jsp");
                dispatcher.forward(request,response);
            }
            else
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/nhanvien/NhanVienCauTruc.jsp");
                dispatcher.forward(request,response);
            }
        }
    }
    private boolean isWhitelisted(String url) {
        try {
            return WHITELIST_DOMAINS.contains(url);
        } catch (Exception e) {
            return false;
        }
    }
}
