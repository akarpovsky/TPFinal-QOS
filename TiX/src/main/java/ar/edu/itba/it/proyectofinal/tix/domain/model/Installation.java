package ar.edu.itba.it.proyectofinal.tix.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.codehaus.jackson.annotate.JsonIgnore;

import ar.edu.itba.it.proyectofinal.tix.domain.util.LocationEnum;

@Entity
@Table(name = "installation")
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Installation extends DBPersistentObject {
	
	@Column(nullable=false)
	private String name;
	
	@ManyToOne
	private User owner;
	
	@Column(unique=true,nullable=true,columnDefinition="TEXT")
	private String encryptionKey;

	@Enumerated(EnumType.ORDINAL)
	private LocationEnum location;
	
	Installation() {
		// required by hibernate 
	}
	
	public Installation(User owner, String name){
		this.owner = owner;
		this.name = name;
	}
	
	public Installation(User owner, String name, LocationEnum location){
		this(owner,name);
		this.location = location;
	}
	
	public Installation(User owner, String name, String encryptionKey){
		this(owner,name);
		this.encryptionKey = encryptionKey;
	}
	
	public String getEncryptionKey() {
		return encryptionKey;
	}

	public void setEncryptionKey(String encryptionKey) {
		this.encryptionKey = encryptionKey;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof Installation)) {
			return false;
		}
		Installation other = (Installation) obj;
		if(!other.getOwner().equals(owner)){
			return false;
		}
		return id == other.id;
	}
	
	@JsonIgnore
	public User getOwner() {
		return this.owner;
	}
	
	public void setOwner(User u){
		this.owner = u;
	}

	@Override
	public String toString() {
		return "Installation: " + getName();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocationEnum getLocation() {
		if(this.location == null){
			return LocationEnum.NO_ASIGNADO;
		}
			
		return location;
	}

	public void setLocation(LocationEnum location) {
		this.location = location;
	}

}
