package jdbc;

import com.mysql.jdbc.Driver;
import model.Emp;

import java.sql.*;

/**
 * Created by mingfei.net@gmail.com
 * 1/12/17 15:40
 */
public class SelectTest {
    private static final String URL = "jdbc:mysql:///scott?user=root&password=system";
    private static final String SQL = "SELECT * FROM scott.emp WHERE SAL > ?";

    public static void main(String[] args) {
        try {
            new Driver();
            try (Connection connection = DriverManager.getConnection(URL);
                 PreparedStatement preparedStatement = connection.prepareStatement(SQL)
            ) {
                preparedStatement.setDouble(1, 2000D);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Emp emp = new Emp(resultSet.getInt("empno"),
                                resultSet.getString("ename"),
                                resultSet.getString("job"));
                        System.out.println(emp);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
