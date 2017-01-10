package jdbc;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by mingfei.net@gmail.com
 * 1/10/17 17:03
 */
public class DeleteTest {
    private static final String URL = "jdbc:mysql:///db_student?user=root&password=system";
    private static final String SQL = "DELETE FROM db_student.student WHERE id = ?";

    public static void main(String[] args) {
        try {
            new Driver();
            try (
                    Connection connection = DriverManager.getConnection(URL);
                    PreparedStatement preparedStatement = connection.prepareStatement(SQL)
            ) {
                preparedStatement.setInt(1, 4);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
// 9, 15, 16
