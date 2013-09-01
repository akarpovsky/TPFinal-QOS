package ar.edu.itba.it.proyectofinal.tix.domain.util;

public class HighchartPoint {

	private long timestamp;
	float data;
	
	public HighchartPoint(long timestamp, float data) {
		this.timestamp = timestamp;
		this.data = data;
	}
	
	
	@Override
	public String toString() {
		return "[" + timestamp + "," + data + "]";
	}

}
