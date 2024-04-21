package Models;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class XFrameOptionsFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Không cần thực hiện gì trong phương thức này
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.setHeader("X-Frame-Options", "SAMEORIGIN");
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Không cần thực hiện gì trong phương thức này
    }
}