package ar.edu.itba.it.proyectofinal.tix.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.UserRepository;

@Component
public class CommonUIVariablesFilter extends OncePerRequestFilter {
	
	private UserRepository userRepo;
	
	@Autowired
	public CommonUIVariablesFilter(UserRepository userRepo) {
		this.userRepo = userRepo;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws ServletException, IOException {
		Integer userId = (Integer) req.getSession().getAttribute("userId");
		if (userId != null) { 
			User currUser = userRepo.get(userId);			
			req.setAttribute("currUser", currUser);
		}
		chain.doFilter(req, resp);
	}
}
