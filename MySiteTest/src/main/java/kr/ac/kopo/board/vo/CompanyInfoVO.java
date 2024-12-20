package kr.ac.kopo.board.vo;

public class CompanyInfoVO {
    private int infoId;         // 정보 ID
    private String title;       // 제목
    private String content;     // 내용

    // Getter and Setter
    public int getInfoId() {
        return infoId;
    }
    public void setInfoId(int infoId) {
        this.infoId = infoId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
}
