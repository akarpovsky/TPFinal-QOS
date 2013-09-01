package ar.edu.itba.it.proyectofinal.tix.domain.util;


public enum ChartType {
	GENERAL_GRAPH("GENERAL_GRAPH"), UPSTREAM_GRAPH("UPSTREAM_GRAPH"), DOWNSTREAM_GRAPH(
			"DOWNSTREAM_GRAPH");
	public final String translationKey;

	private ChartType(String translationKey) {
		this.translationKey = translationKey;
	}

	public String getTranslationKey() {
		return translationKey;
	}

	public static ChartType createFromString(String graphType) {
		if (graphType.equals("GENERAL_GRAPH"))
			return GENERAL_GRAPH;
		else if (graphType.equals("UPSTREAM_GRAPH"))
			return UPSTREAM_GRAPH;
		else if (graphType.equals("DOWNSTREAM_GRAPH"))
			return DOWNSTREAM_GRAPH;
		else
			return GENERAL_GRAPH;
	}
}