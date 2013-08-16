package ar.edu.itba.it.proyectofinal.internetqos.web;

import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.UserType;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.InstallationRepository;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.UserRepository;

@Controller
public class ApiController {

	private UserRepository userRepo;
	private InstallationRepository installationRepo;

	@Autowired
	public ApiController(UserRepository userRepo,
			InstallationRepository installationRepo) {
		this.userRepo = userRepo;
		this.installationRepo = installationRepo;
	}
	
	
//	@RequestMapping(method = RequestMethod.GET)
//	public @ResponseBody List<Installation> authenticate(@RequestParam(value="name") String name, @RequestParam(value="password") String password) {
//		User user = userRepo.authenticate(name, password);
//		if (user != null) {
//			if(!user.getType().equals(UserType.ADMIN)){
//				return user.getInstallations();
//			}else{
//				return new ArrayList<Installation>();
//			}
//		}
//		return new ArrayList<Installation>();
//	}
	
	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody String authenticate(@RequestParam(value="name") String name, @RequestParam(value="password") String password) {
		User user = userRepo.authenticate(name, password);
		JSONObject o = new JSONObject();
		if (user != null) {
			if(!user.getType().equals(UserType.ADMIN)){
				try {
					o.put("id", user.getId());
					o.put("name", user.getNickname());
					o.put("installations", user.getInstallations());
				} catch (JSONException e) {
				}
				return o.toString();
			}
		}
		return o.toString();
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody String newInstallation(@RequestParam(value="user_id") int id, @RequestParam(value="password") String password,@RequestParam(value="installation_name") String installationName, @RequestParam(value="encryption_key") String encryptionKey) {
		JSONObject o = new JSONObject();
		User user = userRepo.get(id);
		if (user != null && user.getPassword().equals(password)) {
			if(!user.getType().equals(UserType.ADMIN)){
				try {
					o.put("id", user.getId());
					o.put("name", user.getNickname());
					Installation i = new Installation(user, installationName,encryptionKey);
					installationRepo.add(i);
					user.addInstallation(i);
					o.put("installations", user.getInstallation(i));
				} catch (JSONException e) {
				}
				return o.toString();
			}
		}
		return o.toString();
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String newInstallationPost(	@RequestBody Map<String,String> body) {
		System.out.println(body.entrySet());
		
		int id = Integer.valueOf(body.get("user_id"));
		String password = body.get("password");
		String installationName = body.get("installation_name");
		String encryptionKey = body.get("encryption_key");
		
		JSONObject o = new JSONObject();
		User user = userRepo.get(id);
		System.out.println(user);
		if (user != null && user.getPassword().equals(password)) {
			if(!user.getType().equals(UserType.ADMIN)){
				try {
					o.put("id", user.getId());
					o.put("name", user.getNickname());
					Installation i = new Installation(user, installationName,encryptionKey);
					installationRepo.add(i);
					user.addInstallation(i);
					o.put("installations", user.getInstallation(i));
				} catch (JSONException e) {
				}
				return o.toString();
			}
		}
		return o.toString();
	}
	
	
}
