package ar.edu.itba.it.proyectofinal.internetqos.domain.util;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

public class HighChart {
	
	private List<Long> timestamps;
	private JSONArray json;
	private String title;
	private String subtitle;


	public HighChart(List<Long> timestamps, JSONArray js, String title, String subtitle) {
		this.timestamps = new ArrayList<Long>();
		this.json = js;
		this.title = title;
		this.subtitle = subtitle;
	}


	public Object getJSONString() {
		return json.toString();
	}


	public JSONArray getJson() {
		return json;
	}


	public String getTitle() {
		return title;
	}


	public String getSubtitle() {
		return subtitle;
	}


	public Object getTimestamps() {
		return timestamps;
	}
	
	
	
	


}
