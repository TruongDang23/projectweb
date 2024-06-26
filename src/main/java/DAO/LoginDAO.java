package DAO;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import Models.TaiKhoan;
import JDBCUtils.HandleException;
import JDBCUtils.JDBCUtil;
import org.json.JSONObject;

public class LoginDAO {
    private static final String CAPTCHA_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";
    private static final String SECRET_KEY = "6LdlwMIpAAAAAAA1xUFKud7kHzFQ7IPArbN8DT0g";

    public TaiKhoan validate(TaiKhoan login,String captchaResponse) throws ClassNotFoundException {

        TaiKhoan taikhoan = null;

        boolean isCaptchaValid = verifyCaptcha(captchaResponse);
        if (!isCaptchaValid) {
            System.out.println("Invalid CAPTCHA");
            return null;
        }
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = JDBCUtil.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection
                     .prepareStatement("select * from taikhoan where TenDangNhap = ? and MatKhau = ? ")) {
            String hashPass = hash(login.getMatKhau());
            preparedStatement.setString(1, login.getTenDangNhap());
            preparedStatement.setString(2, login.getMatKhau());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String tendangnhap = rs.getString("TenDangNhap");
                String matkhau = rs.getString("MatKhau");
                String mataikhoan = rs.getString("MaTaiKhoan");
                String quyen = rs.getString("Quyen");
                taikhoan = new TaiKhoan(tendangnhap, matkhau, mataikhoan, quyen);
            }

        } catch (SQLException e) {
            // process sql exception
            HandleException.printSQLException(e);
        }
        return taikhoan;
    }

    public static void sendEmail(String host, String port,
                                 final String userName, final String password, String toAddress,
                                 String tendangnhap) throws AddressException, ClassNotFoundException,
            MessagingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(tendangnhap);
        msg.setSentDate(new Date());
        msg.setText("Your password : " + LayMatKhau(tendangnhap, toAddress));

        // sends the e-mail
        Transport.send(msg);

    }

    public static String LayMatKhau(String tenDangNhap, String email) {
        String result = "";
        try (Connection connection = JDBCUtil.getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement(
                     "select MatKhau from thongtinnguoidung join taikhoan on thongtinnguoidung.MaTaiKhoan=taikhoan.MaTaiKhoan where TenDangnhap = ? and Email = ?");) {
            preparedStatement.setString(1, tenDangNhap);
            preparedStatement.setString(2, email);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                result = rs.getString("MatKhau");
            }
        } catch (SQLException e) {
            HandleException.printSQLException(e);
        }
        return result;
    }

    private String hash(String pass) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(pass.getBytes());

            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            return "";
        }
    }

    // LoginDAO.java
    private boolean verifyCaptcha(String captchaResponse) {
        try {
            // Gửi yêu cầu đến Google reCAPTCHA API để xác thực CAPTCHA
            URL url = new URL(CAPTCHA_VERIFY_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            String postParams = "secret=" + SECRET_KEY + "&response=" + captchaResponse;

            DataOutputStream outputStream = new DataOutputStream(conn.getOutputStream());
            outputStream.writeBytes(postParams);
            outputStream.flush();
            outputStream.close();

            int responseCode = conn.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            JSONObject jsonResponse = new JSONObject(response.toString());
            boolean success = jsonResponse.getBoolean("success");

            return success;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
