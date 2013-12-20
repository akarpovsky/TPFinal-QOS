package ar.edu.itba.it.proyectofinal.tix.domain.model;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "ISP")
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class ISP extends DBPersistentObject {
	
	@Column(nullable=false)
	private String name;
	
	ISP() {
		// required by hibernate 
	}
	
	public ISP(String name){
		this.name = name;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof Installation)) {
			return false;
		}
		Installation other = (Installation) obj;
		return id == other.id;
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
