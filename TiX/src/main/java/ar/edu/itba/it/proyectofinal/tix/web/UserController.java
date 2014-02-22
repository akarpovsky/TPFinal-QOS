package ar.edu.itba.it.proyectofinal.tix.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.it.proyectofinal.tix.domain.model.ISP;
import ar.edu.itba.it.proyectofinal.tix.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.tix.domain.model.Record;
import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.model.UserType;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.RecordRepository;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.UserRepository;
import ar.edu.itba.it.proyectofinal.tix.domain.util.ChartType;
import ar.edu.itba.it.proyectofinal.tix.domain.util.ChartUtils;
import ar.edu.itba.it.proyectofinal.tix.domain.util.HighChart;
import ar.edu.itba.it.proyectofinal.tix.web.util.ControllerUtil;

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
		User me = getSessionUser(session);

		if (me == null) {
			mav.setView(ControllerUtil.redirectView("/login/login"));
			return mav;
		}

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
		User me = getSessionUser(session);

		if (me == null) {
			mav.setView(ControllerUtil.redirectView("/login/login"));
			return mav;
		}

		if (me.getType().equals(UserType.ADMIN)) {
			mav.setView(ControllerUtil.redirectView("/user/adminpanel"));
		} else {
			mav.setView(ControllerUtil.redirectView("/user/dashboard"));
		}
		return mav;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView isphistogram(
			HttpSession session,
			@RequestParam(value = "nickname", defaultValue = "") String nickname,
			@RequestParam(value = "graphtype", defaultValue = "GENERAL_GRAPH") ChartType graphtype,
			@RequestParam(value = "ins", required = false) Installation requiredInstallation,
			@RequestParam(value = "isp", required = false) ISP requiredISP,
			@RequestParam(value = "minDate", required = false) DateTime minDate,
			@RequestParam(value = "maxDate", required = false) DateTime maxDate,
			@RequestParam(value = "test", required = false) String test) {
		ModelAndView mav = new ModelAndView();

		List<Record> records;
		records = (List<Record>) recordRepo.getAllForIsp(requiredISP, minDate,maxDate);

		int[] congestionUpChart = null;
		List<Integer> congestionUpChartList = new ArrayList<Integer>();
		int[] congestionDownChart = null;
		int[] utilizacionUpChart = null;
		int[] utilizacionDownChart = null;

		congestionUpChart = ChartUtils.generateHistogramCongestionUp(records, "histograma congestion up");
		congestionDownChart = ChartUtils.generateHistogramCongestionDown(records, "histograma congestion down");
		utilizacionUpChart = ChartUtils.generateHistogramUtilizacionUp(records, "histograma utilizacion up");
		utilizacionDownChart = ChartUtils.generateHistogramUtilizacionDown(records, "histograma utilizacion down");
		
	    for (int index = 0; index < congestionUpChart.length; index++)
	    {
	    		congestionUpChartList.add( congestionUpChart[index] );
	    }
		mav.addObject("congestionUpChart", congestionUpChart);
		mav.addObject("congestionDownChart", congestionDownChart);
		mav.addObject("utilizacionUpChart", utilizacionUpChart);
		mav.addObject("utilizacionDownChart", utilizacionDownChart);

		return mav;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView dashboard(
			HttpSession session,
			@RequestParam(value = "nickname", defaultValue = "") String nickname,
			@RequestParam(value = "graphtype", defaultValue = "GENERAL_GRAPH") ChartType graphtype,
			@RequestParam(value = "ins", required = false) Installation requiredInstallation,
			@RequestParam(value = "isp", required = false) ISP requiredISP,
			@RequestParam(value = "minDate", required = false) DateTime minDate,
			@RequestParam(value = "maxDate", required = false) DateTime maxDate,
			@RequestParam(value = "test", required = false) String test) {
		ModelAndView mav = new ModelAndView();

		User reqProfile = userRepo.get(nickname);
		User me = getSessionUser(session);

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
			mav.setView(ControllerUtil.redirectView("/installation/downloadapp"));
			return mav;
		}
		Map<Installation, List<ISP>> installationISPMap = new HashMap<Installation, List<ISP>>();

		for (Installation i : userInstallations) {
			List<ISP> ispsForInstallation = recordRepo.getISPsForInstallation(
					reqProfile, i);
			Collections.sort(ispsForInstallation, new Comparator<ISP>() {
				public int compare(ISP o1, ISP o2) {
					return o1.getName().compareTo(o2.getName());
				}
			});
			installationISPMap.put(i, ispsForInstallation);
		}

		ValueComparator bvc = new ValueComparator(installationISPMap);
		TreeMap<Installation, List<ISP>> sorted_map = new TreeMap<Installation, List<ISP>>(
				bvc);
		sorted_map.putAll(installationISPMap);

		mav.addObject("installationISPMap", sorted_map);

		if (requiredInstallation == null) { // URL param "ins" not found, set
											// default installation
			requiredInstallation = userInstallations.get(0);
		}

		HighChart chart = null;

		if (graphtype == null) {
			graphtype = ChartType.GENERAL_GRAPH;
		}

		List<Record> records;

		if (requiredISP == null) { // No specified ISP, get all records
			records = (List<Record>) recordRepo.getAll(reqProfile,
					requiredInstallation, minDate, maxDate);
		} else {
			records = (List<Record>) recordRepo.getAllForISP(reqProfile,
					requiredInstallation, requiredISP, minDate,maxDate);
		}

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
										+ requiredInstallation.getName()
										+ ((requiredISP == null) ? "" : " ["
												+ requiredISP.getName() + "]"),
								"Gráfico del Upstream para "
										+ reqProfile.getNickname() +
						((minDate != null && maxDate != null) ? " (" + getFormattedDate(minDate) + " - " + getFormattedDate(maxDate) + ")":""),

								ChartType.UPSTREAM_GRAPH);
				break;
			case DOWNSTREAM_GRAPH:
				chart = ChartUtils.generateHighChart(
						records,
						"Porcentaje de Utilización de Ancho de Banda en "
								+ requiredInstallation.getName()
								+ ((requiredISP == null) ? "" : " ["
										+ requiredISP.getName() + "]"),
						"Gráfico del Downstream para "
								+ reqProfile.getNickname() +
						((minDate != null && maxDate != null) ? " (" + getFormattedDate(minDate) + " - " + getFormattedDate(maxDate) + ")":""),
						ChartType.DOWNSTREAM_GRAPH);
				break;
			default:
				chart = ChartUtils.generateHighChart(records,
						"Porcentaje de Utilización de Ancho de Banda en "
								+ requiredInstallation.getName()
								+ ((requiredISP == null) ? "" : " ["
										+ requiredISP.getName() + "]"),
						"Gráfico General para " + reqProfile.getNickname() +
						((minDate != null && maxDate != null) ? " (" + getFormattedDate(minDate) + " - " + getFormattedDate(maxDate) + ")":""),
						ChartType.GENERAL_GRAPH);
				break;
			}
			mav.addObject("javaChart", chart);
		}
		mav.addObject("minDate",getFormattedDate(minDate));
		mav.addObject("maxDate",getFormattedDate(maxDate));
		mav.addObject("currentGraphType", graphtype.getTranslationKey());
		mav.addObject("currentInstallation", requiredInstallation);
		mav.addObject("noRecords", noRecords);
		mav.addObject("requiredISP", requiredISP);
		mav.addObject("user", reqProfile);
		return mav;
	}



	private User getSessionUser(HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		return (userId == null) ? null : userRepo.get(userId);
	}

	class ValueComparator implements Comparator<Installation> {

		Map<Installation, List<ISP>> base;

		public ValueComparator(Map<Installation, List<ISP>> base) {
			this.base = base;
		}

		@Override
		public int compare(Installation o1, Installation o2) {
			return o1.getName().compareTo(o2.getName());
		}

	}

	public static String getFormattedDate(DateTime date){

		if(date != null)
			return date.getDayOfMonth() + "/" + date.getMonthOfYear() + "/" + date.getYear();

		return null;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView holaBien() {
		System.out.println("ENTRO");
		return null;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView changeCongestionStatus(HttpSession session, @RequestParam(value = "id",required=true) Record r,@RequestParam(value = "type",required=true) String type ) {

		ModelAndView mav = new ModelAndView();
		User me = getSessionUser(session);

		if (me == null) {
			mav.setView(ControllerUtil.redirectView("/login/login"));
			return mav;
		}

		if (me.getType().equals(UserType.ADMIN)) {
			mav.setView(ControllerUtil.redirectView("/user/adminpanel"));
		} else {
			mav.setView(ControllerUtil.redirectView("/user/dashboard"));
		}

		if (!r.getUser().equals(me)) {
			mav.addObject("errorDescription",
					"No tiene permisos borrar un record que no es suyo.");
			mav.setViewName("error");
			return mav;
		}

		r.changeCongestionStatus(type);
		mav.setView(ControllerUtil.redirectView("/user/dashboard?nickname=" + me.getNickname() + "&graphtype=GENERAL_GRAPH"));
		return mav;

	}
}
