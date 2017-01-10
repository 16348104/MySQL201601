package jdbc;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by mingfei.net@gmail.com
 * 1/9/17 16:04
 */
// JDBC Java Database Connectivity - Java 语言数据库连接
public class InsertTest {

    public static void main(String[] args) throws SQLException {
        // 1. 加载数据库驱动
        new Driver();
        // 2. 获取一个数据库连接
        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/db_student", "root", "system");
        // 3. 定义预编译语句
        String sql = "INSERT INTO db_student.student(name) VALUES ('jdbc...')";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        // 4. 执行 SQL 语句
        preparedStatement.executeUpdate(); // update 更新 DML insert update delete

        preparedStatement.close();
        connection.close();
    }
}

/*
maven.org
mysql java
5.1.40
gradle/grails
compile 'mysql:mysql-connector-java:5.1.40'
build.gradle

view - tools windows - gradle
refresh
 */
