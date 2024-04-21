package Models;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class XContentTypeOptionsFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Không cần thực hiện gì trong phương thức này
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // Chuyển đổi ServletResponse thành HttpServletResponse
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Đặt tiêu đề X-Content-Type-Options
        httpResponse.setHeader("X-Content-Type-Options", "nosniff");

        // Chuyển tiếp yêu cầu đến filter tiếp theo trong chuỗi
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Không cần thực hiện gì trong phương thức này
    }
}
