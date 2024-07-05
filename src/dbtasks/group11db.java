package dbtasks;

import java.sql.SQLException;
import java.sql.*;

import java.util.Scanner;


public class group11db {
	
	private static Connection connect = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;
	
	
	final private static String host = "jdbc:postgresql://10.98.98.61:5432/group11";
	final private static String user = "group11";
	final private static String password = "dstL9xE#TBMG=4RK";
	

	public static void main(String[] args) throws SQLException {
		
		
		try {
			
			connect = DriverManager.getConnection(host, user, password);
			System.out.println("Java JDBC PostgreSQL Example");
			
			System.out.println("Connected to PostgreSQL database!");
			
			statement = connect.createStatement();
		}
		catch(SQLException e){
			System.out.println("Connection failure.");
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		
		
		Scanner scan = new Scanner(System.in);
		boolean cont = true;
		
		while(cont) {
			
			System.out.println("1) ");
			System.out.println("2) ");
			System.out.println("3) ");
			System.out.println("4) ");
			System.out.println("5) Quit");
			
			
			String input = scan.nextLine();
			
			switch(input) {
			
				case "1":
					break;
					
				case "2":
					break;
					
				case "3":
					break;
					
				case "4":
					System.out.println("Enter the department to list its doctors.");
					String dep = scan.next();
					resultSet = statement.executeQuery("SELECT doctor_name, department FROM DoctorsInfo "
							+ "WHERE department = '" + dep + "'");
					writeResultSet(resultSet);
					break;
					
				case "5":
					cont = false;
					break;
				
				default:
					System.out.println("Invalid command");
			}
		}

		
		
		
		

	}
	
	private static void close() {
		try {
			if(resultSet != null) {
				resultSet.close();
			}
			if(statement != null) {
				statement.close();
			}
			if(connect != null) {
				connect.close();
			}
		}
		catch (Exception e) {
			
		}
	}
	
	
	private static void writeResultSet(ResultSet resultSet) throws SQLException{
		ResultSetMetaData rsmd = resultSet.getMetaData();
		int columnsNumber = rsmd.getColumnCount();
		while(resultSet.next()) {
			for (int i = 1; i <= columnsNumber; i++)
				System.out.print(resultSet.getString(i) + " ");
			System.out.println();
		}
	}
	

}
