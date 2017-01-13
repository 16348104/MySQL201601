package ip;

import com.mysql.jdbc.Driver;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by mingfei.net@gmail.com
 * 1/13/17 15:57
 */
public class DumpData {

    private static final String FILE_NAME = "day7/new_ip.txt";
    private static final String URL = "jdbc:mysql:///db_ip?user=root&password=system";
    private static final String SQL = "INSERT INTO db_ip.ip VALUES(?, ?, ?)";
    private static int counter;

    public static void main(String[] args) throws SQLException {
        new Driver();
        Connection connection = DriverManager.getConnection(URL);
        connection.setAutoCommit(false);
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);

        long start = System.currentTimeMillis();
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(FILE_NAME))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String min = line.split("\\s+")[0];
                String max = line.split("\\s+")[1];
                String geo = line.replace(min, "").replace(max, "").trim();
                try {
                    preparedStatement.setString(1, min);
                    preparedStatement.setString(2, max);
                    preparedStatement.setString(3, geo);
                    preparedStatement.addBatch();
                    System.out.println(++counter); // 447303
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            preparedStatement.executeBatch();
            connection.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("total time: " + (System.currentTimeMillis() - start) / 1000 + " seconds.");
    }
}
