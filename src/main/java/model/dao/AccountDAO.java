package model.dao;

import model.entities.Account;

public interface AccountDAO extends GenericDAO<Account, Integer> {

	public void ajustarCuenta(double valorReal, Account cuentaAjustar);
}
