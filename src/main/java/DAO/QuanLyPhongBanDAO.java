package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Models.*;
import JDBCUtils.HandleException;
import JDBCUtils.JDBCUtil;

public class QuanLyPhongBanDAO {

  private static final String SELECT_PHONGBAN_ALL = "SELECT * FROM thongtintruongphong;";
  private static final String SELECT_PHONGBAN_NHANH = "SELECT * FROM thongtintruongphong WHERE MaChiNhanh = ?;";

  public QuanLyPhongBanDAO() {
  }

  public List<ThongTinTruongPhong> selectAllPhongBan(String maChiNhanh, String maPhongBan,
      String role) {
    List<ThongTinTruongPhong> result = new ArrayList<>();
    String query = "";
    if (role.equals("admin")) {
      query = SELECT_PHONGBAN_ALL;
    } else if (role.equals("giamdoc")) {
      query = SELECT_PHONGBAN_NHANH;
    }
    try (Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(query);) {
      if (role.equals("giamdoc")) {
        preparedStatement.setString(1, maChiNhanh);
      }
      ResultSet rs = preparedStatement.executeQuery();
      while (rs.next()) {
        String MaChiNhanh = rs.getString("MaChiNhanh");
        String TenChiNhanh = rs.getString("TenChiNhanh");
        String MaPhongBan = rs.getString("MaPB");
        String TenPhongBan = rs.getString("TenPB");
        String NgayTao = rs.getString("Ngaytao");
        String Sdt = rs.getString("SDT");
        String Machucvu = rs.getString("MaChucVu");
        String MaTruongPhong = rs.getString("MaNhanVien");
        String TenTruongPhong = rs.getString("HoTen");

        ThongTinTruongPhong thongTinTruongPhong = new ThongTinTruongPhong(MaChiNhanh, TenChiNhanh,
            MaPhongBan, TenPhongBan, NgayTao, Sdt, Machucvu, MaTruongPhong, TenTruongPhong);
        result.add(thongTinTruongPhong);
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }

    return result;
  }

  public List<ThongTinTruongPhong> LoadInfoPhongBan() {
    List<ThongTinTruongPhong> result = new ArrayList<>();
    try (Connection connection = JDBCUtil.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(
            "SELECT * FROM project_web.thongtintruongphong");) {
      ResultSet rs = preparedStatement.executeQuery();
      while (rs.next()) {
        String MaChiNhanh = rs.getString("MaChiNhanh");
        String TenChiNhanh = rs.getString("TenChiNhanh");
        String MaPhongBan = rs.getString("MaPB");
        String TenPhongBan = rs.getString("TenPB");
        String NgayTao = rs.getString("Ngaytao");
        String Sdt = rs.getString("SDT");
        String Machucvu = rs.getString("MaChucVu");
        String MaTruongPhong = rs.getString("MaNhanVien");
        String TenTruongPhong = rs.getString("HoTen");

        ThongTinTruongPhong thongTinTruongPhong = new ThongTinTruongPhong(MaChiNhanh, TenChiNhanh,
            MaPhongBan, TenPhongBan, NgayTao, Sdt, Machucvu, MaTruongPhong, TenTruongPhong);
        result.add(thongTinTruongPhong);
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public String LayMaChiNhanh(String maTaiKhoan) {
    String result = "null";
    try (Connection connection = JDBCUtil.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(
            "select MaChiNhanh from congtac inner join chucvu on congtac.MaChucVu=chucvu.MaChucVu where MaNhanVien = ?");) {
      preparedStatement.setString(1, maTaiKhoan);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        result = rs.getString("MaChiNhanh");
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public String LayMaPhongBan(String mataikhoan) {
    String result = "null";
    try (Connection connection = JDBCUtil.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(
            "select MaPhongBan from congtac inner join chucvu on congtac.MaChucVu=chucvu.MaChucVu where MaNhanVien = ?");) {
      preparedStatement.setString(1, mataikhoan);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        result = rs.getString("MaPhongBan");
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public String LayTenChiNhanh(String maChiNhanh) {
    String result = "";
    try (Connection connection = JDBCUtil.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(
            "select TenChiNhanh from thongtincongtacnhanvien where MaChiNhanh = ?");) {
      preparedStatement.setString(1, maChiNhanh);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        result = rs.getString("TenChiNhanh");
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public String LayTenPhongBan(String maPhongBan) {
    String result = "";
    try (Connection connection = JDBCUtil.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(
            "select TenPB from thongtinphongban where MaPB = ?");) {
      preparedStatement.setString(1, maPhongBan);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        result = rs.getString("TenPB");
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public static void main(String[] args) {
    QuanLyPhongBanDAO quanLyPhongBanDAO = new QuanLyPhongBanDAO();
    String maChiNhanh = quanLyPhongBanDAO.LayMaChiNhanh("TK006");
    String maPhongBan = quanLyPhongBanDAO.LayMaPhongBan("TK006");
    List<ThongTinTruongPhong> result = quanLyPhongBanDAO.selectAllPhongBan(maChiNhanh, maPhongBan,
        "giamdoc");
    for (ThongTinTruongPhong thongTinPhongBan : result) {
      System.out.println(thongTinPhongBan.getMaChiNhanh());
      System.out.println(thongTinPhongBan.getTenChiNhanh());
      System.out.println(thongTinPhongBan.getMaPB());
      System.out.println(thongTinPhongBan.getTenPB());
      System.out.println(thongTinPhongBan.getNgayTao());
      System.out.println(thongTinPhongBan.getSdt());
      System.out.println(thongTinPhongBan.getMaChucVu());
      System.out.println(thongTinPhongBan.getMaNhanVien());
      System.out.println(thongTinPhongBan.getHoTen());
    }
  }
}
