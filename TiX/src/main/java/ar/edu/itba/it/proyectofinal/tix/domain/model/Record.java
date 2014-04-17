package ar.edu.itba.it.proyectofinal.tix.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Type;
import org.hibernate.validator.util.privilegedactions.GetConstructor;
import org.joda.time.DateTime;

@Entity
@Table(name = "records")
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Record extends DBPersistentObject {
	
	@ManyToOne
	private User user;
	
	@OneToOne
	private Installation installation;
	
	@OneToOne
	private ISP isp;
	
	@Column(nullable=false)
	@Type(type="org.joda.time.contrib.hibernate.PersistentDateTime")
	private DateTime timestamp;
	
	@Column(nullable=false)
	@Max(value=100)
	private float calidad_Up; 
	
	@Column(nullable=false)
	@Max(value=100)
	private float calidad_Down; 
	
	@Column(nullable=false)
	@Max(value=100)
	private float utiliz_Down; 
	
	@Column(nullable=false)
	@Max(value=100)
	private float utiliz_Up;
	
	@Column(nullable=false)
	@Max(value=100)
	private float H_RS_Up;
	
	@Column(nullable=false)
	@Max(value=100)
	private float H_Wave_Up;
	
	@Column(nullable=false)
	@Max(value=100)
	private float H_RS_Down;
	
	@Column(nullable=false)
	@Max(value=100)
	private float H_Wave_Down;
	
	public float getH_Wave_Up() {
		return H_Wave_Up*100;
	}

	public void setH_Wave_Up(float h_Wave_Up) {
		H_Wave_Up = h_Wave_Up;
	}

	public float getH_Wave_Down() {
		return H_Wave_Down*100;
	}

	public void setH_Wave_Down(float h_Wave_Down) {
		H_Wave_Down = h_Wave_Down;
	}

	public ISP getIsp() {
		return isp;
	}

	public void setIsp(ISP isp) {
		this.isp = isp;
	}

	public float getH_RS_Up() {
		return H_RS_Up*100;
	}

	public void setH_RS_Up(float h_RS_Up) {
		H_RS_Up = h_RS_Up;
	}

	public float getH_RS_Down() {
		return H_RS_Down*100;
	}

	public void setH_RS_Down(float h_RS_Down) {
		H_RS_Down = h_RS_Down;
	}

	@Column(nullable=false, columnDefinition="boolean default false")
	private boolean userDownCongestion;
	
	@Column(nullable=false, columnDefinition="boolean default false")
	private boolean userUpCongestion;
	
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
		return "Record for " + user.getNickname() + " calidad_Up=" + calidad_Up + " calidad_Down=" + calidad_Down + " utiliz_Up=" + utiliz_Up + " utiliz_Down=" + utiliz_Down;
	}
	
	public String toCSV(){
		return getId() +"," + getH_RS_Down() +"," +getH_RS_Up() +"," + getH_Wave_Down() +"," + getH_RS_Up() +","+getCalidadDown()+","+getCalidadUp()+","+getTimestamp()+","+isUserDownCongestion()+","+isUserUpCongestion()+","+getUtilizacionDownstream()+","+getUtilizacionUpstream()+","+getInstallation()+","+getIsp()+","+getUser();
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
		return calidad_Up*100;
	}
	
	public float getCalidadUp() {
		return calidad_Up*100;
	}

	public boolean isUserDownCongestion() {
		return userDownCongestion;
	}

	public void setUserDownCongestion(boolean userDownCongestion) {
		this.userDownCongestion = userDownCongestion;
	}

	public boolean isUserUpCongestion() {
		return userUpCongestion;
	}

	public void setUserUpCongestion(boolean userUpCongestion) {
		this.userUpCongestion = userUpCongestion;
	}
	
	public void changeCongestionStatus(String type) {
		//System.out.println("Antes: " + this.userDownCongestion);
		if( "U".equals(type)) {
			this.userUpCongestion = !this.userUpCongestion;
			return;
		}
		if ( "D".equals(type)) {
			this.userDownCongestion = !this.userDownCongestion;

		//	System.out.println("Despues: " + this.userDownCongestion);
			return;
		}
	}

	public void setUpstream(float upstream) {
		if(upstream <= 100){
			this.calidad_Up = upstream;
		}else{
			throw new IllegalArgumentException("Percentage must be between 0 and 100");
		}
	}

	public float getDownstream() {
		return calidad_Down*100;
	}
	
	public float getCalidadDown() {
		return calidad_Down*100;
	}

	public void setDownstream(float downstream) {
		if(downstream <= 100){
			this.calidad_Down = downstream;
		}else{
			throw new IllegalArgumentException("Percentage must be between 0 and 100");
		}
	}

	public float getUtilizacionDownstream() {
		return utiliz_Down*100;
	}

	public void setUtilizacionDownstream(float utilizacionDownstream) {
		if(utilizacionDownstream <= 100){
			this.utiliz_Down = utilizacionDownstream;
		}else{
			throw new IllegalArgumentException("Percentage must be between 0 and 100");
		}
	}

	public float getUtilizacionUpstream() {
		return utiliz_Up*100;
	}

	public void setUtilizacionUpstream(float utilizacionUpstream) {
		if(utilizacionUpstream <= 100){
			this.utiliz_Up = utilizacionUpstream;
		}else{
			throw new IllegalArgumentException("Percentage must be between 0 and 100");
		}
	}
	
	public Installation getInstallation() {
		return installation;
	}

	public void setInstallation(Installation installation) {
		this.installation = installation;
	}

	
}
