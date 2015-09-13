package br.com.estrelacarnes.observer;

import javax.enterprise.context.Dependent;
import javax.enterprise.event.Observes;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import br.com.caelum.vraptor.events.VRaptorInitialized;
import br.com.estrelacarnes.model.User;


@Dependent
public class InitialDataObserver {
	
	private EntityManagerFactory factory;

	@Inject 
	public InitialDataObserver(EntityManagerFactory factory) {
		this.factory = factory;
	}

	public void insert(@Observes VRaptorInitialized event) {

		EntityManager manager = null;
		
		try {
			manager = factory.createEntityManager();
			manager.getTransaction().begin();
			
			User defaultUser = new User();
			/*defaultUser.setLogin("vraptor");
			defaultUser.setPassword("vraptor");
			defaultUser.setName("VRaptor's Default User");*/

			//manager.persist(defaultUser);
			//manager.getTransaction().commit();
			
		} finally {
			if (manager != null && manager.isOpen()) {
				manager.close();
			}
		} 
	}
}