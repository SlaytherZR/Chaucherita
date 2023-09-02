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
import model.entities.Movement;

@Path("/movements")
public class MovementRest {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Movement> getMovements() {
		return FactoryDAO.getFactory().getMovementDAO().getAll();
	}

	@GET
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Movement getMovementById(@PathParam("id") int id) {
		return FactoryDAO.getFactory().getMovementDAO().getById(id);
	}

	@POST
	@Path("/add")
	@Consumes(MediaType.APPLICATION_JSON)
	public void addMovement(Movement movement) {
		FactoryDAO.getFactory().getMovementDAO().create(movement);
	}

	@PUT
	@Path("/update")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateMovement(Movement movement) {
		FactoryDAO.getFactory().getMovementDAO().update(movement);
	}

	@DELETE
	@Path("/delete/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public void deleteMovement(@PathParam("id") int id) {
		FactoryDAO.getFactory().getMovementDAO().deleteById(id);
	}
}
