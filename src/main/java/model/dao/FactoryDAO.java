package model.dao;

import model.jpa.JPAFactoryDAO;

public abstract class FactoryDAO {

	protected static FactoryDAO factory = new JPAFactoryDAO();

	public static FactoryDAO getFactory() {
		return factory;
	}

	public abstract PersonDAO getPersonDAO();

	public abstract MovementDAO getMovementDAO();

	public abstract AccountDAO getAccountDAO();

}