package model.dao;

import model.entities.Person;

public interface PersonDAO extends GenericDAO<Person, Integer> {

	public Person allow(String username, String password);
}
