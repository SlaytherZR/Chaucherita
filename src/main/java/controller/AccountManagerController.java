package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.FactoryDAO;
import model.entities.Account;
import model.entities.Category;
import model.entities.Movement;
import model.entities.Person;

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

	private void router(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String rute = request.getParameter("rute");

		switch (rute) {
		case "dashboard":
			this.showDashboard(request, response);
			break;
		case "listMovements":
			this.listMovements(request, response);
			break;
		case "saveMovement":
			this.saveMovement(request, response);
			break;
		case "saveAccount":
			this.saveAccount(request, response);
			break;
		case "listByCategory":
			this.listByCategory(request, response);
			break;
		case "listByAccount":
			this.listByAccount(request, response);
			break;
		case "listByMonth":
			this.listByMonth(request, response);
			break;
		}
	}

	private void showDashboard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		List<Account> accounts = FactoryDAO.getFactory().getAccountDAO().getByPerson(authenticatedPerson);
		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.setAttribute("accounts", accounts);
		request.getRequestDispatcher("view/dashboard.jsp").forward(request, response);
	}

	private void listMovements(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		List<Movement> movements = FactoryDAO.getFactory().getMovementDAO().getByPerson(authenticatedPerson);
		List<Account> accounts = FactoryDAO.getFactory().getAccountDAO().getByPerson(authenticatedPerson);
		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.setAttribute("movements", movements);
		request.setAttribute("accounts", accounts);
		request.getRequestDispatcher("view/movements.jsp").forward(request, response);
	}

	private void saveMovement(HttpServletRequest request, HttpServletResponse response) throws IOException {
		double amount = Double.parseDouble(request.getParameter("amount"));
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		int idAccount = Integer.parseInt(request.getParameter("accountId"));
		Account account = FactoryDAO.getFactory().getAccountDAO().getById(idAccount);

		Movement movement = new Movement(amount, account, description);

		if (category.equals("Ingreso")) {
			FactoryDAO.getFactory().getMovementDAO().addIncome(movement);
		} else if (category.equals("Gasto")) {
			FactoryDAO.getFactory().getMovementDAO().addExpense(movement);
		} else if (category.equals("Transferencia")) {
			int idDestinationAccount = Integer.parseInt(request.getParameter("idDestinationAccount"));
			Account destinationAccount = FactoryDAO.getFactory().getAccountDAO().getById(idDestinationAccount);
			FactoryDAO.getFactory().getMovementDAO().transfer(movement, destinationAccount);
		}
		response.sendRedirect("AccountManagerController?rute=dashboard");
	}

	private void saveAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");

		String name = request.getParameter("name");
		String number = request.getParameter("number");
		double money = Double.parseDouble(request.getParameter("money"));

		Account account = new Account(name, number, money, authenticatedPerson);
		FactoryDAO.getFactory().getAccountDAO().create(account);
		response.sendRedirect("AccountManagerController?rute=dashboard");
	}

	private void listByCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		Category category = Category.valueOf(request.getParameter("category").toUpperCase());
		List<Movement> movements = FactoryDAO.getFactory().getMovementDAO().getByCategoryAndPerson(category,
				authenticatedPerson);
		List<Account> accounts = FactoryDAO.getFactory().getAccountDAO().getByPerson(authenticatedPerson);
		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.setAttribute("accounts", accounts);
		request.setAttribute("movements", movements);
		request.getRequestDispatcher("view/movements.jsp").forward(request, response);
	}

	private void listByAccount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		int idAccount = Integer.parseInt(request.getParameter("account"));
		Account account = FactoryDAO.getFactory().getAccountDAO().getById(idAccount);
		List<Movement> movements = FactoryDAO.getFactory().getMovementDAO().getByAccount(account);
		List<Account> accounts = FactoryDAO.getFactory().getAccountDAO().getByPerson(authenticatedPerson);
		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.setAttribute("accounts", accounts);
		request.setAttribute("movements", movements);
		request.getRequestDispatcher("view/movements.jsp").forward(request, response);
	}

	private void listByMonth(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");

		int month = Integer.parseInt(request.getParameter("month"));
		List<Movement> movements = FactoryDAO.getFactory().getMovementDAO().getByMonthAndPerson(month,
				authenticatedPerson);
		List<Account> accounts = FactoryDAO.getFactory().getAccountDAO().getByPerson(authenticatedPerson);
		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.setAttribute("accounts", accounts);
		request.setAttribute("movements", movements);
		request.getRequestDispatcher("view/movements.jsp").forward(request, response);
	}

}
