package model.jpa;

import model.dao.AccountDAO;
import model.dao.FactoryDAO;
import model.dao.MovementDAO;
import model.dao.PersonDAO;

public class JPAFactoryDAO extends FactoryDAO {

	@Override
	public PersonDAO getPersonDAO() {
		return new JPAPersonDAO();
	}

	@Override
	public MovementDAO getMovementDAO() {
		return new JPAMovementDAO();
	}

	@Override
	public AccountDAO getAccountDAO() {
		return new JPAAccountJPA();
	}

}
