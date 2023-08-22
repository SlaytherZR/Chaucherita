package model.dao;

import java.util.Date;
import java.util.List;

import model.entities.Account;
import model.entities.Category;
import model.entities.Movement;
import model.entities.Person;

public interface MovementDAO extends GenericDAO<Movement, Integer> {

	public void addIncome(Movement movement);

	public void addExpense(Movement movement);

	public void transfer(Movement movement, Account destination);

	public List<Movement> getByAccount(Account account);
	
	public List<Movement> getByPerson(Person person);

	public List<Movement> getByCategoryAndPerson(Category category, Person person);

	public List<Movement> getByDateAndPerson(Date date, Person person);
}
