package model.entities.rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import model.dao.FactoryDAO;
import model.entities.Person;

@Path("/persons")
public class PersonRest {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Person> getPersons() {
		return FactoryDAO.getFactory().getPersonDAO().getAll();
		
	}

	@GET
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Person getPersonById(@PathParam("id") int id) {
		return FactoryDAO.getFactory().getPersonDAO().getById(id);
	}

	@POST
	@Path("/add")
	@Consumes(MediaType.APPLICATION_JSON)
	public void addPerson(Person person) {
		FactoryDAO.getFactory().getPersonDAO().create(person);
	}

	@PUT
	@Path("/update")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public void updatePerson(Person person) {
		FactoryDAO.getFactory().getPersonDAO().update(person);
	}

	@DELETE
	@Path("/delete/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public void deletePerson(@PathParam("id") int id) {
		FactoryDAO.getFactory().getPersonDAO().deleteById(id);
	}
}
