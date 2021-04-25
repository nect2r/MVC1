package vo;

public class BoardVO {
	
	//게시글 시퀀스
	private int boardNo;
	
	//게시글 작성자의 시퀀스
	private int userNo;
	
	//게시글 작성자의 아이디
	private String userId;
	
	//게시글 제목
	private String boardTitle;
	
	//게시글 내용
	private String boardContent;
	
	//게시글 날짜
	private String boardDate;
	
	//2021-04-24 이준수 수정 사항
	//게시글 조회수
	private String boardView;
	
	public String getBoardView() {
		return boardView;
	}
	public void setBoardView(String boardView) {
		this.boardView = boardView;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
}