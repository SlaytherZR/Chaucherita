package model.jpa;

import java.util.List;

import javax.persistence.Query;

import model.dao.AccountDAO;
import model.dao.FactoryDAO;
import model.entities.Account;
import model.entities.Movement;
import model.entities.Person;

public class JPAAccountJPA extends JPAGenericDAO<Account, Integer> implements AccountDAO {

	public JPAAccountJPA() {
		super(Account.class);
	}

	@Override
	public void accountConfig(double realAmount, Account account) {
		double amountMovement = Math.abs(account.getMoney() - realAmount);
		Movement movement = new Movement(amountMovement, account, "Ajustar Cuenta");
		if (realAmount < account.getMoney()) {
			FactoryDAO.getFactory().getMovementDAO().addExpense(movement);
		} else {
			FactoryDAO.getFactory().getMovementDAO().addIncome(movement);
		}
	}

	@Override
	public List<Account> getByPerson(Person person) {
		String sentence = "SELECT a FROM Account a WHERE a.owner = :person";
		Query query = entityManager.createQuery(sentence);
		query.setParameter("person", person);
		return query.getResultList();
	}

}
