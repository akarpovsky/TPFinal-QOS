package ar.edu.itba.it.proyectofinal.tix.domain.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.DateTimeUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import ar.edu.itba.it.proyectofinal.tix.domain.model.Record;

public class ChartUtils {

	
	public static List<double[]> generateBoxplot(List<Record> records) {
		
		Iterator<Record> it = records.iterator();	
		// [0] minimum
		// [1] lower quartile
		// [2] median
		// [3] higher quartile
		// [4] maximum
		
		double[] congestionup_vec = new double[5];
		double[] congestiondown_vec = new double[5];
		double[] utilizacionup_vec = new double[5];
		double[] utilizaciondown_vec = new double[5];
		
		List<double[]> values = new ArrayList<double[]>();
		
		//values
		List<Double> congestionup_values = new ArrayList<Double>();
		List<Double> congestiondown_values = new ArrayList<Double>();
		List<Double> utilizacionup_values = new ArrayList<Double>();
		List<Double> utilizaciondown_values = new ArrayList<Double>();
		
		int i=0;
		while (it.hasNext()){
			Record record = it.next();
			double congestionup = record.getCalidad_up() * 10;
			double congestiondown = record.getCalidad_down() * 10;
			double utilizacionup = record.getUtiliz_up() * 10;
			double utilizaciondown = record.getUtiliz_down() * 10;
			
			//minimums
			congestionup_vec[0] = (congestionup < congestionup_vec[0]) ? congestionup:congestionup_vec[0];
			congestiondown_vec[0] = (congestiondown < congestiondown_vec[0]) ? congestiondown:congestiondown_vec[0];
			utilizacionup_vec[0] = (utilizacionup < utilizacionup_vec[0]) ? utilizacionup:utilizacionup_vec[0];
			utilizaciondown_vec[0] = (utilizaciondown < utilizaciondown_vec[0]) ? utilizaciondown:utilizaciondown_vec[0];

			//maximums
			congestionup_vec[4] = (congestionup > congestionup_vec[4]) ? congestionup:congestionup_vec[4];
			congestiondown_vec[4] = (congestiondown > congestiondown_vec[4]) ? congestiondown:congestiondown_vec[4];
			utilizacionup_vec[4] = (utilizacionup > utilizacionup_vec[4]) ? utilizacionup:utilizacionup_vec[4];
			utilizaciondown_vec[4] = (utilizaciondown > utilizaciondown_vec[4]) ? utilizaciondown:utilizaciondown_vec[4];
			
			//values
			congestionup_values.add(congestionup);
			congestiondown_values.add(congestiondown);
			utilizacionup_values.add(utilizacionup);
			utilizaciondown_values.add(utilizaciondown);
			
			i++;
		}
		
		//sorting
		Collections.sort(congestionup_values);
		Collections.sort(congestiondown_values);
		Collections.sort(utilizacionup_values);
		Collections.sort(utilizaciondown_values);
		
		System.out.println("SORTED LIST: " + utilizacionup_values);
		
		boolean even = (i%2 == 0)? true:false;

		//medians
		congestionup_vec[2] = !even? congestionup_values.get(i/2):((congestionup_values.get((i/2)-1)+congestionup_values.get((i/2)+1)))/2 ;
		congestiondown_vec[2] = !even? congestiondown_values.get(i/2):((congestiondown_values.get((i/2)-1)+congestiondown_values.get((i/2)+1)))/2 ;
		utilizacionup_vec[2] = !even? utilizacionup_values.get(i/2):((utilizacionup_values.get((i/2)-1)+utilizacionup_values.get((i/2)+1)))/2 ;
		utilizaciondown_vec[2] = !even? utilizaciondown_values.get(i/2):((utilizaciondown_values.get((i/2)-1)+utilizaciondown_values.get((i/2)+1)))/2 ;
		System.out.println("utilizacionup_vec: "+ utilizacionup_vec[2] );
		
		// lower quartiles
		congestionup_vec[1] = even? congestionup_values.get(i/4):((congestionup_values.get((i/4)-1)+congestionup_values.get((i/4)+1)))/2 ;
		congestiondown_vec[1] = even? congestiondown_values.get(i/4):((congestiondown_values.get((i/4)-1)+congestiondown_values.get((i/4)+1)))/2 ;
		utilizacionup_vec[1] = even? utilizacionup_values.get(i/4):((utilizacionup_values.get((i/4)-1)+utilizacionup_values.get((i/4)+1)))/2 ;
		utilizaciondown_vec[1] = even? utilizaciondown_values.get(i/4):((utilizaciondown_values.get((i/4)-1)+utilizaciondown_values.get((i/4)-1)))/2 ;

		
		//  higher quartiles
		congestionup_vec[3] = even? congestionup_values.get(i/4 * 3):((congestionup_values.get(i/4 * 3)-1)+congestionup_values.get((i/4 * 3)+1))/2 ;
		congestiondown_vec[3] = even? congestiondown_values.get(i/4 * 3):((congestiondown_values.get(i/4 * 3)-1)+congestiondown_values.get((i/4 * 3)+1))/2 ;
		utilizacionup_vec[3] = even? utilizacionup_values.get(i/4 * 3):((utilizacionup_values.get(i/4 * 3)-1)+utilizacionup_values.get((i/4 * 3)+1))/2 ;
		utilizaciondown_vec[3] = even? utilizaciondown_values.get(i/4 * 3):((utilizaciondown_values.get(i/4 * 3)-1)+utilizaciondown_values.get((i/4 * 3)-1))/2 ;

		
		values.add(congestionup_vec);
		values.add(congestiondown_vec);
		values.add(utilizacionup_vec);
		values.add(utilizaciondown_vec);
		
		return values;
	}
		
	//	Histograms
	public static int[] generateHistogramCongestionUp(List<Record> records,
			String title) {
		Iterator<Record> it = records.iterator();
		int[] classes = new int[11];
		while (it.hasNext()) {
			Record record = it.next();
			double index = record.getCalidad_up() * 10;
			int cong = (int) index;
			classes[cong]++;
		}
		return classes;
	}

	public static int[] generateHistogramCongestionDown(List<Record> records,
			String title) {
		Iterator<Record> it = records.iterator();
		int[] classes = new int[11];
		while (it.hasNext()) {
			Record record = it.next();
			double index = record.getCalidad_down() * 10;
			int cong = (int) index;
			classes[cong]++;
		}
		return classes;
	}

	public static int[] generateHistogramUtilizacionUp(List<Record> records,
			String title) {
		Iterator<Record> it = records.iterator();
		int[] classes = new int[11];
		while (it.hasNext()) {
			Record record = it.next();
			double index = record.getUtiliz_up() * 10;
			int cong = (int) index;
			classes[cong]++;
		}
		return classes;
	}

	public static int[] generateHistogramUtilizacionDown(
			List<Record> records, String title) {
		Iterator<Record> it = records.iterator();
		int[] classes = new int[11];
		while (it.hasNext()) {
			Record record = it.next();
			double index = record.getUtiliz_down() * 10;
			int cong = (int) index;
			classes[cong]++;
		}
		return classes;
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
					downStream_json.put("marker", new JSONObject().put(
							"symbol",
							"url(http://www.highcharts.com/demo/gfx/sun.png)"));
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
					upStream_json.put("marker", new JSONObject().put("symbol",
							"url(http://www.highcharts.com/demo/gfx/sun.png)"));
					upStream_array.put(upStream_json);
				} else {
					upStream_json = new JSONObject();
					upStream_json.put("y", record.getCalidad_up());
					upStream_json.put("id", record.getId());
					upStream_json.put("type", "U");
					upStream_array.put(upStream_json);
					// upStream.add(record.getCalidad_up());
				}
				// System.out.println(upStream_array);
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
				// j.put("data", upStream);
				j.put("data", upStream_array);
				j.put("marker", lineMarkerOptions);
				// System.out.println(j.get("data"));
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
