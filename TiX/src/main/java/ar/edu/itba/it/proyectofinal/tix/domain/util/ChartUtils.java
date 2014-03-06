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

	public static HighChart generateHighChart(List<Record> records,
			String title, String subtitle, ChartType graphType) {

		float UTIlIZACION_VALUE = (float) 80;
		String json = null;
		List<Long> timestamps = new ArrayList<Long>();
		HighChart chart = null;
		try {
			JSONArray js = new JSONArray();
			JSONArray utilizacionup_js = new JSONArray();
			JSONArray utilizaciondown_js = new JSONArray();
			JSONArray utilizacion_js = new JSONArray();
			JSONArray utilizacion_final = new JSONArray();
			ArrayList<String> metricas;
			metricas = new ArrayList<String>();
			switch (graphType) {
			case UPSTREAM_GRAPH:
				metricas.add("CalidadUp");
				 metricas.add("UtilizacionUp");
				break;
			case DOWNSTREAM_GRAPH:
				metricas.add("CalidadDown");
				 metricas.add("UtilizacionDown");
				break;
			default:
				metricas.add("CalidadUp");
				 metricas.add("UtilizacionUp");
				metricas.add("CalidadDown");
				 metricas.add("UtilizacionDown");
				break;
			}

			List<Float> downStream = new ArrayList<Float>();
			List<Float> utilizacionDown = new ArrayList<Float>();
			List<Object> upStream = new ArrayList<Object>();
			List<Float> utilizacionUp = new ArrayList<Float>();
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
					downStream_json.put("y", record.getDownstream());
					downStream_json.put("id", record.getId());
					downStream_json.put("type", "D");
					downStream_json.put("marker", new JSONObject().put("symbol", "url(http://www.highcharts.com/demo/gfx/sun.png)"));
					downStream_array.put(downStream_json);
				} else {
					downStream_json = new JSONObject();
					downStream_json.put("y", record.getDownstream());
					downStream_json.put("id", record.getId());
					downStream_json.put("type", "D");
					downStream_array.put(downStream_json);
				}
				
				if (record.isUserUpCongestion()) {
					upStream_json = new JSONObject();
					upStream_json.put("y", record.getUpstream());
					upStream_json.put("id", record.getId());
					upStream_json.put("type", "U");
					upStream_json.put("marker", new JSONObject().put("symbol", "url(http://www.highcharts.com/demo/gfx/sun.png)"));
					upStream_array.put(upStream_json);
				} else {
					upStream_json = new JSONObject();
					upStream_json.put("y", record.getUpstream());
					upStream_json.put("id", record.getId());
					upStream_json.put("type", "U");
					upStream_array.put(upStream_json);
				//	upStream.add(record.getUpstream());
				}
//				System.out.println(upStream_array);
				utilizacionDown.add(record.getUtilizacionDownstream());
				utilizacionUp.add(record.getUtilizacionUpstream());
				DateTime dt = new DateTime(record.getTimestamp());
				timestamps.add(dt.getMillis());
				List<Long> point = new ArrayList<Long>();
				point.add((DateTimeUtils.getInstantMillis(dt)));
				point.add((long) record.getUtilizacionUpstream());
				points.add(point);
			}
			int i = 0;
			for (Float valor : utilizacionUp) {
				if (valor > UTIlIZACION_VALUE && i > 0) {
					JSONObject a;
					a = new JSONObject();
					a.put("from", i - 1);
					a.put("to", i);
					a.put("color", "rgba(255, 0, 0, .25)");
					utilizacionup_js.put(a);
					utilizacion_js.put(a);
				}
				i++;
			}
			i = 0;

			for (Float valor : utilizacionDown) {
				if (valor > UTIlIZACION_VALUE && i > 0) {
					JSONObject a;
					a = new JSONObject();
					a.put("from", i - 1);
					a.put("to", i);
					a.put("color", "rgba(0, 125, 125, .25)");
					utilizaciondown_js.put(a);
					utilizacion_js.put(a);
				}
				i++;
			}

			JSONObject lineMarkerOptions = new JSONObject();
			lineMarkerOptions.put("symbol", "circle");
			JSONObject utilizacionMarkerOptions = new JSONObject();
			// congestionMarkerOptions.put("radius", 7);
			utilizacionMarkerOptions.put("symbol", "diamond");

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
				 j.put("data", utilizacionUp);
				 j.put("marker", utilizacionMarkerOptions);
				 js.put(j);
				utilizacion_final = utilizacionup_js;
				break;
			case DOWNSTREAM_GRAPH:
				j = new JSONObject();
				j.put("name", metricas.get(0));
				j.put("data", downStream_array);
				j.put("marker", lineMarkerOptions);
				js.put(j);
				 j = new JSONObject();
				 j.put("name", metricas.get(1));
				 j.put("data", utilizacionDown);
				 j.put("marker", utilizacionMarkerOptions);
				 js.put(j);
				utilizacion_final = utilizaciondown_js;
				break;
			default:
				j = new JSONObject();
				j.put("name", metricas.get(0));
				j.put("data", upStream_array);
				j.put("marker", lineMarkerOptions);
				js.put(j);
				 j = new JSONObject();
				 j.put("name", metricas.get(1));
				 j.put("data", utilizacionUp);
				 j.put("marker", utilizacionMarkerOptions);
				 js.put(j);
				j = new JSONObject();
				j.put("name", metricas.get(2));
				j.put("data", downStream_array);
				j.put("marker", lineMarkerOptions);
				js.put(j);
				 j = new JSONObject();
				 j.put("name", metricas.get(3));
				 j.put("data", utilizacionDown);
				 j.put("marker", utilizacionMarkerOptions);
				 js.put(j);
				utilizacion_final = utilizacion_js;

			}

			chart = new HighChart(timestamps, js, title, subtitle,
					utilizacion_final);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return chart;
	}

}
