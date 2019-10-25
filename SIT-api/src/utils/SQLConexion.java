package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLConexion {
	public static Connection getConexion() {
		Connection con = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://localhost:1433;databaseName=BD_PF_SIT"; 
			String usr = "sa";
			String psw = "sql";
			con = DriverManager.getConnection(url, usr, psw);
		} catch (ClassNotFoundException ex) {
			System.out.println("Error >> Driver no Instalado!!");
		} catch (SQLException ex) {
			System.out.println("Error >> de conexión con la BD");
			ex.printStackTrace();
		}
		return con;
	}
}
