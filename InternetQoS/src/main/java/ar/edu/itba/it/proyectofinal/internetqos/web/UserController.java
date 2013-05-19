package ar.edu.itba.it.proyectofinal.internetqos.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.ISP;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Record;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.UserType;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.RecordRepository;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.UserRepository;
import ar.edu.itba.it.proyectofinal.internetqos.domain.util.ChartType;
import ar.edu.itba.it.proyectofinal.internetqos.domain.util.ChartUtils;
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
	public ModelAndView adminpanel(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Integer userId = (Integer) session.getAttribute("userId");
		User me = userRepo.get(userId);

		if (!me.getType().equals(UserType.ADMIN)) {
			mav.addObject("errorDescription",
					"No tiene permisos para acceder aquí.");
			mav.setViewName("error");
			return mav;
		}
		List<? extends User> allUsersExceptAdmin = userRepo.getAll();
		allUsersExceptAdmin.remove(me);
		mav.addObject("userList", allUsersExceptAdmin);
		return mav;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Integer userId = (Integer) session.getAttribute("userId");

		if (userId == null) {
			mav.setView(ControllerUtil.redirectView("/login/login"));
			return mav;
		}

		User me = userRepo.get(userId);

		if (me.getType().equals(UserType.ADMIN)) {
			mav.setView(ControllerUtil.redirectView("/user/adminpanel"));
		} else {
			mav.setView(ControllerUtil.redirectView("/user/dashboard"));
		}
		return mav;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView dashboard(
			HttpSession session,
			@RequestParam(value = "nickname", defaultValue = "") String nickname,
			@RequestParam(value = "graphtype", defaultValue = "GENERAL_GRAPH") ChartType graphtype,
			@RequestParam(value = "ins", required = false) Installation requiredInstallation) {
		// @RequestParam(value = "isp", required=false) ISP requiredISP){

		ModelAndView mav = new ModelAndView();
		Integer userId = (Integer) session.getAttribute("userId");

		User reqProfile = userRepo.get(nickname);
		User me = userRepo.get(userId);

		if (reqProfile == null) {
			mav.setView(ControllerUtil.redirectView("/user/dashboard?nickname="
					+ me.getNickname() + "&graphtype=" + graphtype));
			return mav;
		} else if (!reqProfile.equals(me)
				&& !me.getType().equals(UserType.ADMIN)) {
			mav.addObject("errorDescription",
					"No tiene permisos para acceder aquí.");
			mav.setViewName("error");
			return mav;
		}

		List<Installation> userInstallations = reqProfile.getInstallations();

		if (userInstallations.isEmpty()) { // No installation or data to show
											// for current user
			mav.setViewName("newuser");
			return mav;
		}

		if (requiredInstallation == null) { // URL param "ins" not found, set
											// default installation
			requiredInstallation = userInstallations.get(0);
		}

		HighChart chart = null;

		if (graphtype == null) {
			graphtype = ChartType.GENERAL_GRAPH;
		}

		List<Record> records = (List<Record>) recordRepo.getAll(reqProfile,
				requiredInstallation);
		boolean noRecords = false;
		if (records.isEmpty()) {
			noRecords = true;
		} else {

			switch (graphtype) {
			case UPSTREAM_GRAPH:
				chart = ChartUtils
						.generateHighChart(
								records,
								"Porcentaje de Utilización de Ancho de Banda en "
										+ requiredInstallation.getName(),
								"Gráfico del Upstream para "
										+ reqProfile.getNickname(),
								ChartType.UPSTREAM_GRAPH);
				break;
			case DOWNSTREAM_GRAPH:
				chart = ChartUtils.generateHighChart(
						records,
						"Porcentaje de Utilización de Ancho de Banda en "
								+ requiredInstallation.getName(),
						"Gráfico del Downstream para "
								+ reqProfile.getNickname(),
						ChartType.DOWNSTREAM_GRAPH);
				break;
			default:
				chart = ChartUtils.generateHighChart(records,
						"Porcentaje de Utilización de Ancho de Banda en "
								+ requiredInstallation.getName(),
						"Gráfico General para " + reqProfile.getNickname(),
						ChartType.GENERAL_GRAPH);
				break;
			}
			mav.addObject("javaChart", chart);
		}
		mav.addObject("currentGraphType", graphtype.getTranslationKey());
		mav.addObject("currentInstallation", requiredInstallation);
		mav.addObject("noRecords", noRecords);
		// mav.addObject("currentISP", requiredISP);
		mav.addObject("user", reqProfile);
		return mav;
	}

	private String getDateString(DateTime timestamp) {
		String ans = timestamp.toString().substring(0, 10);
		System.out.println(ans);
		return ans;
	}

}
