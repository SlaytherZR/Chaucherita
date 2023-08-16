package model.jpa;

import model.dao.AccountDAO;
import model.entities.Account;

public class JPAAccountJPA extends JPAGenericDAO<Account, Integer> implements AccountDAO {

	public JPAAccountJPA() {
		super(Account.class);
	}

}
