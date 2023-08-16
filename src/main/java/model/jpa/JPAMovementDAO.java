package model.jpa;

import java.util.Date;
import java.util.List;

import javax.persistence.Query;

import model.dao.FactoryDAO;
import model.dao.MovementDAO;
import model.entities.Account;
import model.entities.Category;
import model.entities.Movement;
import model.entities.Category;

public class JPAMovementDAO extends JPAGenericDAO<Movement, Integer> implements MovementDAO {

	public JPAMovementDAO() {
		super(Movement.class);
	}

	@Override
	public void addIncome(Movement movement) {
		movement.setCategory(Category.INCOME);
		this.create(movement);
		Account accountToUpdate = movement.getAccount();
		double currentMoney = accountToUpdate.getMoney();
		accountToUpdate.setMoney(currentMoney + movement.getAmount());
		FactoryDAO.getFactory().getAccountDAO().update(accountToUpdate);
	}

	@Override
	public void addExpense(Movement movement) {
		movement.setCategory(Category.EXPENSE);
		Account accountToUpdate = movement.getAccount();
		double currentMoney = accountToUpdate.getMoney();

		if (currentMoney >= movement.getAmount()) {
			this.create(movement);
			accountToUpdate.setMoney(currentMoney - movement.getAmount());
			FactoryDAO.getFactory().getAccountDAO().update(accountToUpdate);
		}

	}

	@Override
	public void transfer(Movement movement, Account destination) {
		this.addExpense(movement);

		Movement movementIncome = movement;
		movementIncome.setAccount(destination);
		this.addIncome(movementIncome);
	}

	@Override
	public List<Movement> getByCategory(Category category) {
		String sentence = "SELECT m FROM Movement WHERE m.category = :category";
		Query query = entityManager.createQuery(sentence);
		query.setParameter("category", category);
		return query.getResultList();
	}

	@Override
	public List<Movement> getByAccount(Account account) {
		String sentence = "SELECT m FROM Movement WHERE m.account = :account";
		Query query = entityManager.createQuery(sentence);
		query.setParameter("account", account);
		return query.getResultList();
	}

	@Override
	public List<Movement> getByDate(Date date) {
		String sentence = "SELECT m FROM Movement WHERE m.date = :date";
		Query query = entityManager.createQuery(sentence);
		query.setParameter("date", date);
		return query.getResultList();
	}

}
