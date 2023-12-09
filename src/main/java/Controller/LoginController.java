package Controller;

import DAO.LoginDAO;
import Models.TaiKhoan;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    private LoginDAO loginDAO=null;
    public void init()
    {
        loginDAO = new LoginDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("views/system/login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        authenticate(request, response);
    }
    private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        TaiKhoan taikhoan = new TaiKhoan();
        taikhoan.setTenDangNhap(username);
        taikhoan.setMatKhau(password);

        try {
            TaiKhoan user = loginDAO.validate(taikhoan);
            if(user != null)
            {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                if (user.getQuyen().equals("admin")) {
                    response.sendRedirect("views/quanli/QuanLiCauTruc.jsp");
                } else if (user.getQuyen().equals("giamdoc")) {
                    response.sendRedirect("views/giamdoc/XemCauTruc.jsp");
                } else if (user.getQuyen().equals("truongphong")) {
                    response.sendRedirect("views/truongphong/XemCauTruc.jsp");
                } else if (user.getQuyen().equals("nhanvien")) {
                    response.sendRedirect("views/nhanvien/NhanVienCauTruc.jsp");
                }
            }
            else {
                request.setAttribute("errMsg", "Tài khoản không tồn tại");
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/system/login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
