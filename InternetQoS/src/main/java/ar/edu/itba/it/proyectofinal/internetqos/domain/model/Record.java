package ar.edu.itba.it.proyectofinal.internetqos.domain.model;

import java.util.Collections;

import javax.mail.MessagingException;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.postgresql.util.Base64;

import ar.edu.itba.it.proyectofinal.internetqos.domain.service.MailBuilder;
import ar.edu.itba.it.proyectofinal.internetqos.domain.service.MailService;
import ar.edu.itba.it.proyectofinal.internetqos.domain.util.AppError;

@Entity
@Table(name = "records")
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Record extends DBPersistentObject {
	
	@ManyToOne
	private User user;
	
	@Column(nullable=false)
	@Type(type="org.joda.time.contrib.hibernate.PersistentDateTime")
	private DateTime timestamp;
	
	@Column(nullable=false)
	private float upstream;
	
	@Column(nullable=false)
	private float downstream;
	
	@Column(nullable=false)
	private boolean downstreamCongestion;
	
	@Column(nullable=false)
	private boolean upstreamCongestion;
	
	Record() {
		// required by hibernate 
	}
	
	@Override
	public int hashCode() {
		return user.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof Record)) {
			return false;
		}
		Record other = (Record) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Record for " + user.getNickname() + " upstream=" + upstream + " downstream=" + downstream + " upstreamCongestion=" + upstreamCongestion + " downstreamCongestion=" + downstreamCongestion;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public DateTime getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(DateTime timestamp) {
		this.timestamp = timestamp;
	}

	public float getUpstream() {
		return upstream;
	}

	public void setUpstream(float upstream) {
		this.upstream = upstream;
	}

	public float getDownstream() {
		return downstream;
	}

	public void setDownstream(float downstream) {
		this.downstream = downstream;
	}

	public boolean getDownstreamCongestion() {
		return downstreamCongestion;
	}

	public void setDownstreamCongestion(boolean downstreamCongestion) {
		this.downstreamCongestion = downstreamCongestion;
	}

	public boolean getUpstreamCongestion() {
		return upstreamCongestion;
	}

	public void setUpstreamCongestion(boolean upstreamCongestion) {
		this.upstreamCongestion = upstreamCongestion;
	}
	
}
