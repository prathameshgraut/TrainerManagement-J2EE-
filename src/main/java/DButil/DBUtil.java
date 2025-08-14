package DButil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/your_database_name", "root", "Example@2024");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
