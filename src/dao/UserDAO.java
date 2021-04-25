package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import vo.UserVO;

public class UserDAO {
	
	//Mysql 8이상은 드라이버 경로가 cj가붙음
	private final String driverClassName = "com.mysql.cj.jdbc.Driver";
    private final String url = "jdbc:mysql://127.0.0.1:3306/mvc1?characterEncoding=UTF-8&serverTimezone=UTC";
    private final String username = "root";
    private final String password = "wnstn12";
    
    // 테이블 : user , 기능 : 데이터 입력하기
    public int insertUser(UserVO user) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "INSERT INTO user(user_id, user_pw, user_email, user_date) VALUES (?, ?, ?, now())";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1,user.getUserId());
            statement.setString(2,user.getUserPw());
            statement.setString(3,user.getUserEmail());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : user , 기능 : id중복확인하기
    public int selectUserId(UserVO user) {
        ResultSet resultSet = null;
        Connection connection = null;
        PreparedStatement statement = null;
        int rowCount = 0;
        String sql = "SELECT COUNT(*) FROM user WHERE user_id = ?;";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1,user.getUserId());
            resultSet = statement.executeQuery();
            
            if(resultSet.next()) {
            	rowCount = resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : user , 기능 : login
    public UserVO login(UserVO userVO) {
        ResultSet resultSet = null;
        Connection connection = null;
        PreparedStatement statement = null;
        UserVO user = null;
        String sql = "SELECT * FROM user WHERE user_id = ? AND user_pw = ?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1,userVO.getUserId());
            statement.setString(2,userVO.getUserPw());
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
            	user = new UserVO();
            	user.setUserNo(resultSet.getInt("user_no"));
            	user.setUserId(resultSet.getString("user_id"));
            	user.setUserPw(resultSet.getString("user_pw"));
            	user.setUserEmail(resultSet.getString("user_email"));
            	user.setUserDate(resultSet.getString("user_date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return user;
    }
    
    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName(this.driverClassName);
            connection = DriverManager.getConnection(this.url, this.username, this.password);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    private void close(Connection connection, Statement statement, ResultSet resultset) {
        if(resultset != null) {
            try {
                resultset.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
