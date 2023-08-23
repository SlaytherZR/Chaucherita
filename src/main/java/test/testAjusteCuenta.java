package test;

import model.dao.FactoryDAO;
import model.entities.Account;

public class testAjusteCuenta {

	public static void main(String[] args) {
		// Crear una cuenta de ejemplo
		Account cuentaEjemplo = new Account("123456", "Cuenta de Ejemplo", 1000.0, null);

		// Imprimir el estado inicial de la cuenta
		System.out.println("Estado inicial de la cuenta:");
		System.out.println(cuentaEjemplo);

		// Ajustar la cuenta
		double nuevoSaldo = 1500.0; // Cambia este valor al saldo deseado
		FactoryDAO.getFactory().getAccountDAO().ajustarCuenta(nuevoSaldo, cuentaEjemplo);

		// Imprimir el estado de la cuenta después del ajuste
		System.out.println("Estado de la cuenta después del ajuste:");
		System.out.println(cuentaEjemplo);
	}

}
