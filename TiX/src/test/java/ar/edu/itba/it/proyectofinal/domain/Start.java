package ar.edu.itba.it.proyectofinal.domain;
import org.apache.log4j.Logger;
import org.mortbay.jetty.Connector;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.bio.SocketConnector;
import org.mortbay.jetty.webapp.WebAppContext;

import ar.edu.itba.it.proyectofinal.tix.domain.util.Config;


public class Start {

	public static void main(String[] args) throws Exception {
		Config config = Config.getInstance();
		String contextPath = config.get("context_path");
		Server server = new Server();
		SocketConnector connector = new SocketConnector();
		connector.setMaxIdleTime(1000 * 60 * 60);
		connector.setSoLingerTime(-1);
		connector.setPort(8080);
		server.setConnectors(new Connector[] { connector });
		WebAppContext bb = new WebAppContext();
		bb.setServer(server);
		bb.setContextPath("/" + contextPath);
		bb.setWar("src/main/webapp");
		server.addHandler(bb);
		Logger logger = Logger.getLogger(Start.class);
		try {
			logger.trace("Entering application.");
			logger.trace(">>> STARTING EMBEDDED JETTY SERVER, PRESS ANY KEY TO STOP");
			server.start();
			while (System.in.available() == 0) {
				Thread.sleep(5000);
			}
			logger.trace("Exiting application.");
			server.stop();
			server.join();
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		System.exit(100);
	}

}
