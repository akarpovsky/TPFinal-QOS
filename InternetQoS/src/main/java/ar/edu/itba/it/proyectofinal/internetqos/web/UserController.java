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
			@RequestParam(value = "nickname", defaultValue = "") String nickname) {
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
				mav.setView(ControllerUtil.redirectView("/user/dashboard?nickname=" + me.getNickname()));
				return mav;
			}
		}
		
		List<Record> records = (List<Record>) recordRepo.getAll(reqProfile);
		 String json = null;       
		 ArrayList<Long> timestamps = new ArrayList<Long>();
	        try {
	            JSONArray js = new JSONArray();
	            ArrayList<String> metricas;
	            metricas = new ArrayList<String>();
	            metricas.add("Upstream");
	            metricas.add("CongesitonUp");
	            metricas.add("Downstream");
	            metricas.add("CongestionDown");
	              //  ArrayList<Integer> temp;
	                JSONObject j;
	             //   String query = "select temperatura from temperaturas where ciudad='" + metricas.get(x) + "'";&nbsp;              
	              //  Statement s = (Statement) conexion.createStatement();
	               // ResultSet rs = (ResultSet) s.executeQuery(query);
	               // temp = new ArrayList<Integer>();
	                Iterator<Record> it = records.iterator();
	                ArrayList<Float> downStream = new ArrayList<Float>();
	                ArrayList<Float> congestionDown = new ArrayList<Float>();
	                ArrayList<Float> upStream = new ArrayList<Float>();
	                ArrayList<Float> congestionUp = new ArrayList<Float>();
	                
	                
	                
	                while (it.hasNext()) {
	                	Record record = it.next();
	                    downStream.add(record.getDownstream());
	                    upStream.add(record.getUpstream());
	                    congestionDown.add(record.getDownstreamCongestion());
	                    congestionUp.add(record.getUpstreamCongestion());
	                    timestamps.add(record.getTimestamp().getMillis());
	                }
	                
	                j = new JSONObject();
	                j.put("name", metricas.get(0));
	                j.put("data", upStream);
	                js.put(j);
	                j = new JSONObject();
	                j.put("name", metricas.get(1));
	                j.put("data", congestionUp);
	                js.put(j);
	                j = new JSONObject();
	                j.put("name", metricas.get(2));
	                j.put("data", downStream);
	                js.put(j);
	                j = new JSONObject();
	                j.put("name", metricas.get(3));
	                j.put("data", congestionDown);
	                js.put(j);
	                json = js.toString();
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
	    mav.addObject("timestamps", timestamps);
		mav.addObject("json",json);
		mav.addObject("user", reqProfile);
		return mav;
	}

	
	private String getDateString(DateTime timestamp) {
		String ans=  timestamp.toString().substring(0, 10); 
		System.out.println(ans);
		return ans;
	}

	private int[] getDaysAheadList(){
		return new int[] {0,1, 2, 3, 5, 15, 30, 60, 90, 120, 365};
	}
}
