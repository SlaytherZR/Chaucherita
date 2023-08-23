package model.jpa;

import model.dao.AccountDAO;
import model.dao.FactoryDAO;
import model.entities.Account;
import model.entities.Movement;

public class JPAAccountJPA extends JPAGenericDAO<Account, Integer> implements AccountDAO {

	public JPAAccountJPA() {
		super(Account.class);
	}

	@Override
	public void ajustarCuenta(double realAmount, Account account) {
		double amountMovement = Math.abs(account.getMoney() - realAmount);
		Movement movement = new Movement(amountMovement, account, "Ajustar Cuenta");
		if (realAmount < account.getMoney()) {
			FactoryDAO.getFactory().getMovementDAO().addExpense(movement);
		} else {
			FactoryDAO.getFactory().getMovementDAO().addIncome(movement);
		}
	}

}
