package ar.edu.itba.it.proyectofinal.internetqos.web;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

import org.joda.time.DateTime;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Record;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.RecordRepository;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.UserRepository;
import ar.edu.itba.it.proyectofinal.internetqos.domain.util.ChartUtils;
import ar.edu.itba.it.proyectofinal.internetqos.domain.util.ChartType;
import ar.edu.itba.it.proyectofinal.internetqos.domain.util.HighChart;
import ar.edu.itba.it.proyectofinal.internetqos.web.util.ControllerUtil;

@Controller
public class UserController {

	private UserRepository userRepo;
	private RecordRepository recordRepo;

	@Autowired
	public UserController(UserRepository userRepo, RecordRepository recordRepo) {
		this.userRepo = userRepo;
		this.recordRepo = recordRepo;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView dashboard(HttpSession session,
			@RequestParam(value = "nickname", defaultValue = "") String nickname, 
			@RequestParam(value = "graphtype", defaultValue = "GENERAL_GRAPH") ChartType graphtype) {
		ModelAndView mav = new ModelAndView();
		Integer userId = (Integer) session.getAttribute("userId");

		boolean isLoggedIn = userId != null;
		User reqProfile = userRepo.get(nickname);
		if (!isLoggedIn) {
			if (nickname.isEmpty()) {
				mav.setView(ControllerUtil.redirectView("/login/login"));
				return mav;
			}
			if (reqProfile == null) {
				mav.addObject("errorDescription", "Usuario no encontrado");
				mav.setViewName("error");
				return mav;
			}
		} else {
			if (reqProfile == null) {
				User me = userRepo.get(userId);
				mav.setView(ControllerUtil
						.redirectView("/user/dashboard?nickname="
								+ me.getNickname() + "&graphtype=" + graphtype ));
				return mav;
			}
		}

		List<Record> records = (List<Record>) recordRepo.getAll(reqProfile);
		HighChart chart = null;
		
		if(graphtype == null){
			graphtype = ChartType.GENERAL_GRAPH;
		}
		switch (graphtype) {
		case UPSTREAM_GRAPH:
			chart =	ChartUtils.generateHighChart(records, "Porcentaje de Utilización de Ancho de Banda", "Gráfico del Upstream", ChartType.UPSTREAM_GRAPH);
			break;
		case DOWNSTREAM_GRAPH:
			chart = ChartUtils.generateHighChart(records, "Porcentaje de Utilización de Ancho de Banda", "Gráfico del Downstream", ChartType.DOWNSTREAM_GRAPH);
			break;
		default:
			chart = ChartUtils.generateHighChart(records, "Porcentaje de Utilización de Ancho de Banda", "Gráfico General", ChartType.GENERAL_GRAPH);
			break;
		}
		mav.addObject("javaChart", chart);
		mav.addObject("user", reqProfile);
		return mav;
	}

	private String getDateString(DateTime timestamp) {
		String ans = timestamp.toString().substring(0, 10);
		System.out.println(ans);
		return ans;
	}
	
}
