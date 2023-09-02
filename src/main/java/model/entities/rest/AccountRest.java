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
import model.entities.Account;

@Path("/accounts")
public class AccountRest {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Account> getAccounts() {
		return FactoryDAO.getFactory().getAccountDAO().getAll();
	}

	@GET
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Account getAccountById(@PathParam("id") int id) {
		return FactoryDAO.getFactory().getAccountDAO().getById(id);
	}

	@POST
	@Path("/add")
	@Consumes(MediaType.APPLICATION_JSON)
	public void addAccount(Account account) {
		FactoryDAO.getFactory().getAccountDAO().create(account);
	}

	@PUT
	@Path("/update")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateAccount(Account account) {
		FactoryDAO.getFactory().getAccountDAO().update(account);
	}

	@DELETE
	@Path("/delete/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public void deleteAccount(@PathParam("id") int id) {
		FactoryDAO.getFactory().getAccountDAO().deleteById(id);
	}
}
