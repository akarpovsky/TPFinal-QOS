package ar.edu.itba.it.proyectofinal.internetqos.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "installation")
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Installation extends DBPersistentObject {
	
	@Column(nullable=false)
	private String name;
	
	Installation() {
		// required by hibernate 
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
