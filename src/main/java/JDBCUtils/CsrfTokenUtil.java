package JDBCUtils;
import javax.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.util.Base64;

public class CsrfTokenUtil {

    public static final String CSRF_TOKEN_ATTR = "csrfToken";

    public static String generateCsrfToken() {
        byte[] randomBytes = new byte[32];
        new SecureRandom().nextBytes(randomBytes);
        return Base64.getUrlEncoder().encodeToString(randomBytes);
    }

    public static void saveCsrfToken(HttpSession session) {
        String csrfToken = generateCsrfToken();
        System.out.println("CSRF Token: " + csrfToken);
        session.setAttribute(CSRF_TOKEN_ATTR, csrfToken);
    }

    public static boolean isCsrfTokenValid(HttpSession session, String token) {
        String sessionToken = (String) session.getAttribute(CSRF_TOKEN_ATTR);
        return sessionToken != null && sessionToken.equals(token);
    }
}

