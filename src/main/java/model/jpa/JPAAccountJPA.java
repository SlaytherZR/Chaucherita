package model.jpa;

import java.util.Date;
import java.util.List;

import javax.persistence.Query;

import model.dao.AccountDAO;
import model.entities.Account;
import model.entities.Category;
import model.entities.Movement;

public class JPAAccountJPA extends JPAGenericDAO<Account, Integer> implements AccountDAO {

	public JPAAccountJPA() {
		super(Account.class);
	}

}
