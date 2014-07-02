package ar.edu.itba.it.proyectofinal.tix.domain.model;

import java.util.Arrays;

public class IspHistogramDisplayer {

	private String isp_name;
	private int isp_id;
	private int[] congestionUpChart = null;
	private int[] congestionDownChart = null;
	private int[] utilizacionUpChart = null;
	private int[] utilizacionDownChart = null;
	
	public IspHistogramDisplayer() {
		super();
	}

	public String getIsp_name() {
		return isp_name;
	}


	public void setIsp_name(String isp_name) {
		this.isp_name = isp_name;
	}


	public int getIsp_id() {
		return isp_id;
	}


	public void setIsp_id(int isp_id) {
		this.isp_id = isp_id;
	}


	public int[] getCongestionUpChart() {
		return congestionUpChart;
	}


	public void setCongestionUpChart(int[] congestionUpChart) {
		this.congestionUpChart = congestionUpChart;
	}


	public int[] getCongestionDownChart() {
		return congestionDownChart;
	}


	public void setCongestionDownChart(int[] congestionDownChart) {
		this.congestionDownChart = congestionDownChart;
	}


	public int[] getUtilizacionUpChart() {
		return utilizacionUpChart;
	}


	public void setUtilizacionUpChart(int[] utilizacionUpChart) {
		this.utilizacionUpChart = utilizacionUpChart;
	}


	public int[] getUtilizacionDownChart() {
		return utilizacionDownChart;
	}

	public void setUtilizacionDownChart(int[] utilizacionDownChart) {
		this.utilizacionDownChart = utilizacionDownChart;
	}

	@Override
	public String toString() {
		return "IspHistogramDisplayer [isp_name=" + isp_name + ", isp_id="
				+ isp_id + ", congestionUpChart="
				+ Arrays.toString(congestionUpChart) + ", congestionDownChart="
				+ Arrays.toString(congestionDownChart)
				+ ", utilizacionUpChart=" + Arrays.toString(utilizacionUpChart)
				+ ", utilizacionDownChart="
				+ Arrays.toString(utilizacionDownChart) + "]";
	}

}
