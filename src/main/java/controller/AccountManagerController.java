package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.FactoryDAO;
import model.entities.Account;
import model.entities.Category;
import model.entities.Movement;
import model.entities.Category;

@WebServlet("/AccountManagerController")
public class AccountManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.router(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.router(request, response);
	}

	private void router(HttpServletRequest request, HttpServletResponse response) {
		String rute = request.getParameter("rute");

		switch (rute) {
		case "listAccounts":
			this.listAccounts(request, response);
			break;
		case "listMovements":
			this.listMovements(request, response);
			break;
		case "newIncome":
			this.newIncome(request, response);
			break;
		case "newExpense":
			this.newExpense(request, response);
			break;
		case "newTransfer":
			this.newTransfer(request, response);
			break;
		case "listByCategory":
			this.listByCategory(request, response);
			break;
		case "listByAccount":
			this.listByAccount(request, response);
			break;
		case "listByDate":
			this.listByDate(request, response);
			break;
		}
	}
	
	private void listAccounts(HttpServletRequest request, HttpServletResponse response) {
		FactoryDAO.getFactory().getAccountDAO().getAll();
	}

	private void listMovements(HttpServletRequest request, HttpServletResponse response) {
		FactoryDAO.getFactory().getMovementDAO().getAll();

		// Show the view
	}

	private void newIncome(HttpServletRequest request, HttpServletResponse response) {

		double amount = Double.parseDouble(request.getParameter("amount"));
		int idAccount = Integer.parseInt(request.getParameter("idAccount"));
		Account account = FactoryDAO.getFactory().getAccountDAO().getById(idAccount);

		Movement movement = new Movement(amount, account);
		FactoryDAO.getFactory().getMovementDAO().addIncome(movement);

		// Show the view
	}

	private void newExpense(HttpServletRequest request, HttpServletResponse response) {

		double amount = Double.parseDouble(request.getParameter("amount"));
		int idAccount = Integer.parseInt(request.getParameter("idAccount"));
		Account account = FactoryDAO.getFactory().getAccountDAO().getById(idAccount);

		Movement movement = new Movement(amount, account);
		FactoryDAO.getFactory().getMovementDAO().addExpense(movement);

		// Show the view
	}

	private void newTransfer(HttpServletRequest request, HttpServletResponse response) {
		double amount = Double.parseDouble(request.getParameter("amount"));
		int idAccount = Integer.parseInt(request.getParameter("idAccount"));
		Account account = FactoryDAO.getFactory().getAccountDAO().getById(idAccount);
		int idDestinationAccount = Integer.parseInt(request.getParameter("idDestinationAccount"));
		Account destinationAccount = FactoryDAO.getFactory().getAccountDAO().getById(idDestinationAccount);

		Movement movement = new Movement(amount, account);
		FactoryDAO.getFactory().getMovementDAO().transfer(movement, destinationAccount);

		// Show the view
	}

	private void listByCategory(HttpServletRequest request, HttpServletResponse response) {

		Category category = Category.valueOf(request.getParameter("category").toUpperCase());
		FactoryDAO.getFactory().getMovementDAO().getByCategory(category);

		// Show the view
	}

	private void listByAccount(HttpServletRequest request, HttpServletResponse response) {
		int idAccount = Integer.parseInt(request.getParameter("idAccount"));
		Account account = FactoryDAO.getFactory().getAccountDAO().getById(idAccount);
		FactoryDAO.getFactory().getMovementDAO().getByAccount(account);

		// Show the view
	}

	private void listByDate(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(request.getParameter("date"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		FactoryDAO.getFactory().getMovementDAO().getByDate(date);

		// Show the view
	}

}
