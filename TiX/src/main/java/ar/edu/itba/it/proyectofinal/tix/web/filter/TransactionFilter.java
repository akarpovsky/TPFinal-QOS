package ar.edu.itba.it.proyectofinal.tix.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
public class TransactionFilter extends OncePerRequestFilter {

	private static Logger logger = Logger.getLogger(TransactionFilter.class);

	private SessionFactory sessionFactory;

	public TransactionFilter() {
	}
	
	@Autowired
	public TransactionFilter(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		try {
			// Starting a database transaction
			sessionFactory.getCurrentSession().beginTransaction();

			// Call the next filter (continue request processing)
			filterChain.doFilter(request, response);

			// Commit the database transaction
			sessionFactory.getCurrentSession().getTransaction().commit();
		} catch (Throwable ex) {
			try {
				if (sessionFactory.getCurrentSession().getTransaction().isActive()) {
					sessionFactory.getCurrentSession().getTransaction().rollback();
				}
			} catch (Throwable rbEx) {
				rbEx.printStackTrace();
			}
			throw new ServletException(ex);
		}
	}
}