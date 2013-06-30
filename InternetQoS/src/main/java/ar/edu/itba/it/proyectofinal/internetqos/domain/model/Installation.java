package ar.edu.itba.it.proyectofinal.internetqos.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "installation")
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Installation extends DBPersistentObject {
	
	@Column(nullable=false)
	private String name;
	
	@ManyToOne
	private User owner;
	
	Installation() {
		// required by hibernate 
	}
	
	public Installation(User owner, String name){
		this.owner = owner;
		this.name = name;
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

}
