package ar.edu.itba.it.proyectofinal.tix.domain.service;

import ar.edu.itba.it.proyectofinal.tix.domain.util.Config;


public class Mail {

	private String host, contents;
	private String from;
	private String to;
	private String subject;
	private String mimeType;
	
	public Mail(String from, String to) {
		this.host = Config.getInstance().get("mailserver");
		this.mimeType = "text/html";
		this.from = from;
		this.to = to;
	}
	
	public String getHost() {
		return host;
	}
	
	public String getFrom() {
		return from;
	}
	
	public String getTo() {
		return to;
	}
	
	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}
	
	public String getMimeType() {
		return mimeType;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getContents() {
		return contents;
	}
}

