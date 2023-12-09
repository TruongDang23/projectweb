package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Models.TaiKhoan;
import JDBCUtils.HandleException;
import JDBCUtils.JDBCUtil;

public class LoginDAO
{
    public TaiKhoan validate(TaiKhoan login) throws ClassNotFoundException {
        TaiKhoan taikhoan = null;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = JDBCUtil.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection
                     .prepareStatement("select * from taikhoan where TenDangNhap = ? and MatKhau = ? ")) {
            preparedStatement.setString(1, login.getTenDangNhap());
            preparedStatement.setString(2, login.getMatKhau());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next())
            {
                String tendangnhap = rs.getString("TenDangNhap");
                String matkhau = rs.getString("MatKhau");
                String mataikhoan = rs.getString("MaTaiKhoan");
                String quyen = rs.getString("Quyen");
                taikhoan = new TaiKhoan(tendangnhap,matkhau,mataikhoan,quyen);
            }

        } catch (SQLException e) {
            // process sql exception
            HandleException.printSQLException(e);
        }
        return taikhoan;
    }
}
