package ar.edu.itba.it.proyectofinal.tix.domain.util;

import java.util.List;

import org.json.JSONArray;

public class HighChart {
	
	private List<Long> timestamps;
	private JSONArray json;
	private JSONArray redmarker;
	private String title;
	private String subtitle;


	public HighChart(List<Long> timestamps, JSONArray js, String title, String subtitle, JSONArray congestion_js) {
		this.timestamps = timestamps;
		this.json = js;
		this.title = title;
		this.subtitle = subtitle;
		this.redmarker = congestion_js;
	}

	public String getredmarker() {
		return redmarker.toString();
	}
	
	public JSONArray getMarker() {
		return redmarker;
	}

	public String getJSONString() {
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


	public List<Long> getTimestamps() {
		return timestamps;
	}
	

}
