package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.BoardVO;


//github 테스트
public class BoardDAO {
	//Mysql 8이상은 드라이버 경로가 cj가붙음
	private final String driverClassName = "com.mysql.cj.jdbc.Driver";
    private final String url = "jdbc:mysql://127.0.0.1:3306/mvc1?characterEncoding=UTF-8&serverTimezone=UTC";
    private final String username = "root";
    private final String password = "wnstn12";
    
    // 테이블 : board , 기능 : 데이터 수정 
    public int updateBoard(BoardVO board) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "UPDATE board SET board_title=?, board_content=? WHERE board_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1,board.getBoardTitle());
            statement.setString(2,board.getBoardContent());
            statement.setInt(3,board.getBoardNo());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 데이터 삭제 
    public int deleteBoard(BoardVO board) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "DELETE FROM board WHERE board_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1,board.getBoardNo());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 하나의 데이터 가져오기
    public BoardVO selectBoardByKey(int boardNo) {
    	BoardVO board = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT board.board_title, board.board_content, board.board_date, user.user_id FROM board,user WHERE board.user_no = user.user_no AND board_no = ?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, boardNo);
            resultset = statement.executeQuery();
            if(resultset.next()) {
                board = new BoardVO();
                board.setBoardNo(boardNo);
                board.setBoardTitle(resultset.getString("board_title"));
                board.setBoardContent(resultset.getString("board_content"));
                board.setBoardDate(resultset.getString("board_date"));
                board.setUserId(resultset.getString("user_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return board;
    }
    
	  //2021-04-24 조회수 기능 추가 이준수
	  // 테이블 : board , 기능 : 한 페이지 클릭시 조회수 증가
	  public int updateBoardByViewUp(int boardNo) {
		  int rowCount = 0;
	      Connection connection = null;
	      PreparedStatement statement = null;
	      String sql = "UPDATE board SET board_view = IFNULL(board_view,0) + 1 WHERE board_no = ?";
	      try {
	          connection = this.getConnection();
	          statement = connection.prepareStatement(sql);
			  statement.setInt(1, boardNo); 
	          rowCount = statement.executeUpdate();
	      } catch (Exception e) {
	          e.printStackTrace();
	      } finally {
	          this.close(connection, statement, null);
	      }
	      return rowCount;
	  }
    
    // 테이블 : board , 기능 : 한 페이지의 데이터 가져오기 
    public List<BoardVO> selectBoardListPerPage(int beginRow, int pagePerRow) {
        List<BoardVO> list = new ArrayList<BoardVO>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT board.board_no, board.board_title, board.board_date, user.user_id, board.board_view FROM board,user WHERE board.user_no = user.user_no ORDER BY board.board_date DESC LIMIT ?, ?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, beginRow);
            statement.setInt(2, pagePerRow);
            resultset = statement.executeQuery();
            while(resultset.next()) {
            	BoardVO board = new BoardVO();
                board.setBoardNo(resultset.getInt("board_no"));
                board.setBoardTitle(resultset.getString("board_title"));
                board.setBoardDate(resultset.getString("board_date"));
                board.setUserId(resultset.getString("user_id"));
                board.setBoardView(resultset.getString("board_view"));
                list.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return list;
    }
    
    // 테이블 : board , 기능 : 전체 로우 카운터 가져오기
    public int selectTotalBoardCount() {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT COUNT(*) FROM board";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            resultset = statement.executeQuery();
            if(resultset.next()) {
                rowCount = resultset.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 데이터 입력하기
    public int insertBoard(BoardVO board) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "INSERT INTO board(user_no, board_title, board_content, board_date) values(?,?,?,now())";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1,board.getUserNo());
            statement.setString(2,board.getBoardTitle());
            statement.setString(3,board.getBoardContent());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
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
