package ar.edu.itba.it.proyectofinal.internetqos.domain.model;

import java.util.Collections;

import javax.mail.MessagingException;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;

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
	@Max(value=100)
	private float upstream;
	
	@Column(nullable=false)
	@Max(value=100)
	private float downstream;
	
	@Column(nullable=false)
	@Max(value=100)
	private float downstreamCongestion;
	
	@Column(nullable=false)
	@Max(value=100)
	private float upstreamCongestion;
	
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
		if(upstream <= 100){
			this.upstream = upstream;
		}else{
			throw new IllegalArgumentException("Percentage must be between 0 and 100");
		}
	}

	public float getDownstream() {
		return downstream;
	}

	public void setDownstream(float downstream) {
		if(downstream <= 100){
			this.downstream = downstream;
		}else{
			throw new IllegalArgumentException("Percentage must be between 0 and 100");
		}
	}

	public float getDownstreamCongestion() {
		return downstreamCongestion;
	}

	public void setDownstreamCongestion(float downstreamCongestion) {
		if(downstreamCongestion <= 100){
			this.downstreamCongestion = downstreamCongestion;
		}else{
			throw new IllegalArgumentException("Percentage must be between 0 and 100");
		}
	}

	public float getUpstreamCongestion() {
		return upstreamCongestion;
	}

	public void setUpstreamCongestion(float upstreamCongestion) {
		if(upstreamCongestion <= 100){
			this.upstreamCongestion = upstreamCongestion;
		}else{
			throw new IllegalArgumentException("Percentage must be between 0 and 100");
		}
	}
	
}
