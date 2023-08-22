package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
		case "listAccounts":
			this.listAccounts(request, response);
			break;
		case "listMovements":
			this.listMovements(request, response);
			break;
		case "newMovement":
			this.newMovement(request, response);
			break;
		case "saveMovement":
			this.saveAccount(request, response);
			break;
		case "newAccount":
			this.newAccount(request, response);
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
		case "listByDate":
			this.listByDate(request, response);
			break;
		}
	}

	private void listAccounts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		ArrayList<Account> accounts = (ArrayList<Account>) authenticatedPerson.getAccounts();
		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.setAttribute("accounts", accounts);
		request.getRequestDispatcher("jsp/listaccounts.jsp").forward(request, response);
	}

	private void listMovements(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		ArrayList<Movement> movements = (ArrayList<Movement>) FactoryDAO.getFactory().getMovementDAO()
				.getByPerson(authenticatedPerson);
		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.setAttribute("movements", movements);
		request.getRequestDispatcher("jsp/listmovements.jsp").forward(request, response);
	}

	private void newMovement(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.getRequestDispatcher("jsp/newmovement.jsp").forward(request, response);
	}

	private void saveMovement(HttpServletRequest request, HttpServletResponse response) throws IOException {
		double amount = Double.parseDouble(request.getParameter("amount"));
		String category = request.getParameter("category");
		int idAccount = Integer.parseInt(request.getParameter("idAccount"));
		Account account = FactoryDAO.getFactory().getAccountDAO().getById(idAccount);

		Movement movement = new Movement(amount, account);

		if (category.equals("Ingreso")) {
			FactoryDAO.getFactory().getMovementDAO().addIncome(movement);
		} else if (category.equals("Gasto")) {
			FactoryDAO.getFactory().getMovementDAO().addExpense(movement);
		} else if (category.equals("Transferencia")) {
			int idDestinationAccount = Integer.parseInt(request.getParameter("idDestinationAccount"));
			Account destinationAccount = FactoryDAO.getFactory().getAccountDAO().getById(idDestinationAccount);
			FactoryDAO.getFactory().getMovementDAO().transfer(movement, destinationAccount);
		}

		response.sendRedirect("AccountManagerController?rute=listAccounts");
	}

	private void newAccount(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.getRequestDispatcher("jsp/createAccount.jsp").forward(request, response);
	}

	private void saveAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		String name = request.getParameter("name");
		String nummber = request.getParameter("number");
		double money = Double.parseDouble(request.getParameter("money"));

		Account account = new Account(name, nummber, money, authenticatedPerson);

		FactoryDAO.getFactory().getAccountDAO().create(account);

		response.sendRedirect("AccountManagerController?rute=listAccounts");
	}

	private void listByCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		Category category = Category.valueOf(request.getParameter("category").toUpperCase());
		ArrayList<Movement> movements = (ArrayList<Movement>) FactoryDAO.getFactory().getMovementDAO()
				.getByCategoryAndPerson(category, authenticatedPerson);

		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.setAttribute("movements", movements);

		request.getRequestDispatcher("jsp/listmovements.jsp").forward(request, response);
	}

	private void listByAccount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		int idAccount = Integer.parseInt(request.getParameter("idAccount"));
		Account account = FactoryDAO.getFactory().getAccountDAO().getById(idAccount);
		ArrayList<Movement> movements = (ArrayList<Movement>) FactoryDAO.getFactory().getMovementDAO()
				.getByAccount(account);

		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.setAttribute("movements", movements);

		request.getRequestDispatcher("jsp/listmovements.jsp").forward(request, response);
	}

	private void listByDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person authenticatedPerson = (Person) session.getAttribute("userLoggedIn");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(request.getParameter("date"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Movement> movements = (ArrayList<Movement>) FactoryDAO.getFactory().getMovementDAO()
				.getByDateAndPerson(date, authenticatedPerson);

		request.setAttribute("userLoggedIn", authenticatedPerson);
		request.setAttribute("movements", movements);

		request.getRequestDispatcher("jsp/listmovements.jsp").forward(request, response);
	}

}
