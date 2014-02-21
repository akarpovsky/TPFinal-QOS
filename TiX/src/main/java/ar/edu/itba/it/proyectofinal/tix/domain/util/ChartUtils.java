package ar.edu.itba.it.proyectofinal.tix.domain.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.DateTimeUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import ar.edu.itba.it.proyectofinal.tix.domain.model.Record;

public class ChartUtils {


	public static int[] generateHistogramCongestionUp(List<Record> records,
			String title, String subtitle){
		String json = null;
		List<Long> timestamps = new ArrayList<Long>();
		HighChart chart = null;
		try {
			JSONArray js = new JSONArray();
			JSONArray congestiondown_js = new JSONArray();
			JSONArray congestion_js = new JSONArray();
			JSONArray congestion_final = new JSONArray();
			ArrayList<String> metricas;
			metricas = new ArrayList<String>();
		}catch(Exception e){
		}
		
		Iterator<Record> it = records.iterator();
		JSONObject upStream_json = new JSONObject();
		JSONArray upStream_array = new JSONArray();
		
		int[] classes = new int[11];
		
		while (it.hasNext()) {
			Record record = it.next();
			if (record.isUserDownCongestion()) {
				int cong = (int) record.getCalidad_up() * 10;
				classes[cong]++;
			}
		}
		
		return classes;
	}

	public static HighChart generateHistogramCongestionDown(List<Record> records,
			String title, String subtitle){
		return null;
	}

	public static HighChart generateHistogramUtilizacionUp(List<Record> records,
			String title, String subtitle){
		return null;
	}

	public static HighChart generateHistogramUtilizacionDown(List<Record> records,
			String title, String subtitle){
		return null;
	}

	public static HighChart generateHighChart(List<Record> records,
			String title, String subtitle, ChartType graphType) {

		float CONGESTION_VALUE = (float) 0.8;
		String json = null;
		List<Long> timestamps = new ArrayList<Long>();
		HighChart chart = null;
		try {
			JSONArray js = new JSONArray();
			JSONArray congestionup_js = new JSONArray();
			JSONArray congestiondown_js = new JSONArray();
			JSONArray congestion_js = new JSONArray();
			JSONArray congestion_final = new JSONArray();
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
			List<Object> upStream = new ArrayList<Object>();
			List<Float> congestionUp = new ArrayList<Float>();
			List<HighchartPoint> highchartPoints = new ArrayList<HighchartPoint>();
			List<List<Long>> points = new ArrayList<List<Long>>();
			Iterator<Record> it = records.iterator();
			JSONObject j;
			JSONObject upStream_json = new JSONObject();
			JSONArray upStream_array = new JSONArray();
			JSONObject downStream_json = new JSONObject();
			JSONArray downStream_array = new JSONArray();

			while (it.hasNext()) {
				Record record = it.next();
				if (record.isUserDownCongestion()) {
					downStream_json = new JSONObject();
					downStream_json.put("y", record.getCalidad_down());
					downStream_json.put("id", record.getId());
					downStream_json.put("type", "D");
					downStream_json.put("marker", new JSONObject().put("symbol", "url(http://www.highcharts.com/demo/gfx/sun.png)"));
					downStream_array.put(downStream_json);
				} else {
					downStream_json = new JSONObject();
					downStream_json.put("y", record.getCalidad_down());
					downStream_json.put("id", record.getId());
					downStream_json.put("type", "D");
					downStream_array.put(downStream_json);
				}

				if (record.isUserUpCongestion()) {
					upStream_json = new JSONObject();
					upStream_json.put("y", record.getCalidad_up());
					upStream_json.put("id", record.getId());
					upStream_json.put("type", "U");
					upStream_json.put("marker", new JSONObject().put("symbol", "url(http://www.highcharts.com/demo/gfx/sun.png)"));
					upStream_array.put(upStream_json);
				} else {
					upStream_json = new JSONObject();
					upStream_json.put("y", record.getCalidad_up());
					upStream_json.put("id", record.getId());
					upStream_json.put("type", "U");
					upStream_array.put(upStream_json);
				//	upStream.add(record.getCalidad_up());
				}
//				System.out.println(upStream_array);
				congestionDown.add(record.getUtiliz_down());
				congestionUp.add(record.getUtiliz_up());
				DateTime dt = new DateTime(record.getTimestamp());
				timestamps.add(dt.getMillis());
				List<Long> point = new ArrayList<Long>();
				point.add((DateTimeUtils.getInstantMillis(dt)));
				point.add((long) record.getUtiliz_up());
				points.add(point);
			}
			int i = 0;
			for (Float valor : congestionUp) {
				if (valor > CONGESTION_VALUE && i > 0) {
					JSONObject a;
					a = new JSONObject();
					a.put("from", i - 1);
					a.put("to", i);
					a.put("color", "rgba(255, 0, 0, .25)");
					congestionup_js.put(a);
					congestion_js.put(a);
				}
				i++;
			}
			i = 0;

			for (Float valor : congestionDown) {
				if (valor > CONGESTION_VALUE && i > 0) {
					JSONObject a;
					a = new JSONObject();
					a.put("from", i - 1);
					a.put("to", i);
					a.put("color", "rgba(0, 125, 125, .25)");
					congestiondown_js.put(a);
					congestion_js.put(a);
				}
				i++;
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
				//j.put("data", upStream);
				j.put("data", upStream_array);
				j.put("marker", lineMarkerOptions);
//				System.out.println(j.get("data"));
				js.put(j);
				 j = new JSONObject();
				 j.put("name", metricas.get(1));
				 j.put("data", congestionUp);
				 j.put("marker", congestionMarkerOptions);
				 js.put(j);
				congestion_final = congestionup_js;
				break;
			case DOWNSTREAM_GRAPH:
				j = new JSONObject();
				j.put("name", metricas.get(0));
				j.put("data", downStream_array);
				j.put("marker", lineMarkerOptions);
				js.put(j);
				 j = new JSONObject();
				 j.put("name", metricas.get(1));
				 j.put("data", congestionDown);
				 j.put("marker", congestionMarkerOptions);
				 js.put(j);
				congestion_final = congestiondown_js;
				break;
			default:
				j = new JSONObject();
				j.put("name", metricas.get(0));
				j.put("data", upStream_array);
				j.put("marker", lineMarkerOptions);
				js.put(j);
				 j = new JSONObject();
				 j.put("name", metricas.get(1));
				 j.put("data", congestionUp);
				 j.put("marker", congestionMarkerOptions);
				 js.put(j);
				j = new JSONObject();
				j.put("name", metricas.get(2));
				j.put("data", downStream_array);
				j.put("marker", lineMarkerOptions);
				js.put(j);
				 j = new JSONObject();
				 j.put("name", metricas.get(3));
				 j.put("data", congestionDown);
				 j.put("marker", congestionMarkerOptions);
				 js.put(j);
				congestion_final = congestion_js;

			}

			chart = new HighChart(timestamps, js, title, subtitle,
					congestion_final);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return chart;
	}

}
