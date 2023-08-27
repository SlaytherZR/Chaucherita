package model.dao;

import java.util.List;

import model.entities.Account;
import model.entities.Person;

public interface AccountDAO extends GenericDAO<Account, Integer> {

	public List<Account> getByPerson(Person person);

	public void accountConfig(double realAmount, Account caccount);
}
