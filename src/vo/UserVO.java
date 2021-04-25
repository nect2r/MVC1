package vo;

public class UserVO {
	
	//유저 시퀀스
	private int userNo;
	
	//유저 아이디
	private String userId;
	
	//유저 비밀번호
	private String userPw;
	
	//유저 이메일
	private String userEmail;
	
	//유저 회원가입 날짜
	private String userDate;
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
}