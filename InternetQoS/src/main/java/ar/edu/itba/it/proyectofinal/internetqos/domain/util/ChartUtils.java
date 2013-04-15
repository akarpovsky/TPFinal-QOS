package ar.edu.itba.it.proyectofinal.internetqos.domain.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Record;

public class ChartUtils {

	public static HighChart generateHighChart(List<Record> records,
			String title, String subtitle, ChartType graphType) {
		String json = null;
		List<Long> timestamps = new ArrayList<Long>();
		HighChart chart = null;
		try {
			JSONArray js = new JSONArray();
			ArrayList<String> metricas;
			metricas = new ArrayList<String>();
			switch (graphType) {
			case UPSTREAM_GRAPH:
				metricas.add("Upstream");
				metricas.add("CongesitónUp");
				break;
			case DOWNSTREAM_GRAPH:
				metricas.add("Downstream");
				metricas.add("CongestiónDown");
				break;
			default:
				metricas.add("Upstream");
				metricas.add("CongesitónUp");
				metricas.add("Downstream");
				metricas.add("CongestiónDown");
				break;
			}

			List<Float> downStream = new ArrayList<Float>();
			List<Float> congestionDown = new ArrayList<Float>();
			List<Float> upStream = new ArrayList<Float>();
			List<Float> congestionUp = new ArrayList<Float>();
			Iterator<Record> it = records.iterator();
			JSONObject j;

			while (it.hasNext()) {
				Record record = it.next();
				downStream.add(record.getDownstream());
				upStream.add(record.getUpstream());
				congestionDown.add(record.getDownstreamCongestion());
				congestionUp.add(record.getUpstreamCongestion());
				timestamps.add(record.getTimestamp().getMillis());
			}

			JSONObject lineMarkerOptions = new JSONObject();
			lineMarkerOptions.put("symbol", "circle");
			JSONObject congestionMarkerOptions = new JSONObject();
			// congestionMarkerOptions.put("radius", 7);
			congestionMarkerOptions.put("symbol", "diamond");

			switch (graphType) {
			case UPSTREAM_GRAPH:
				j = new JSONObject();
				j.put("name", metricas.get(0));
				j.put("data", upStream);
				j.put("marker", lineMarkerOptions);
				js.put(j);
				j = new JSONObject();
				j.put("name", metricas.get(1));
				j.put("data", congestionUp);
				// j.put("type", "scatter");
				j.put("marker", congestionMarkerOptions);
				js.put(j);
				break;
			case DOWNSTREAM_GRAPH:
				j = new JSONObject();
				j.put("name", metricas.get(0));
				j.put("data", downStream);
				j.put("marker", lineMarkerOptions);
				js.put(j);
				j = new JSONObject();
				j.put("name", metricas.get(1));
				j.put("data", congestionDown);
				// j.put("type", "scatter");
				j.put("marker", congestionMarkerOptions);
				js.put(j);
				break;
			default:
				j = new JSONObject();
				j.put("name", metricas.get(0));
				j.put("data", upStream);
				j.put("marker", lineMarkerOptions);
				js.put(j);
				j = new JSONObject();
				j.put("name", metricas.get(1));
				j.put("data", congestionUp);
				// j.put("type", "scatter");
				j.put("marker", congestionMarkerOptions);
				js.put(j);
				j = new JSONObject();
				j.put("name", metricas.get(2));
				j.put("data", downStream);
				j.put("marker", lineMarkerOptions);
				js.put(j);
				j = new JSONObject();
				j.put("name", metricas.get(3));
				j.put("data", congestionDown);
				// j.put("type", "scatter");
				j.put("marker", congestionMarkerOptions);
				js.put(j);
				break;
			}

			chart = new HighChart(timestamps, js, title, subtitle);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return chart;
	}

}
