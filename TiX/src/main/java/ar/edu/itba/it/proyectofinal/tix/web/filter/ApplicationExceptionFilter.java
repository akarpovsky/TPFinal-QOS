package ar.edu.itba.it.proyectofinal.tix.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
public class ApplicationExceptionFilter extends OncePerRequestFilter {

	private static Logger logger = Logger.getLogger(ApplicationExceptionFilter.class);

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
//		 try {
//		 	filterChain.doFilter(request, response);
//		 } catch (Exception e) {
//		 	logger.error("Unhandled exception catched!");
//		 	e.printStackTrace();
//		 	request.setAttribute("errorDescription", "Sitio temporalmente fuera de servicio.");
//		 	request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
//		 }
	 	filterChain.doFilter(request, response);

	}

}
