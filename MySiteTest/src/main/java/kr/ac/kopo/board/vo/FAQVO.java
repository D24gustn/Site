package kr.ac.kopo.board.vo;

public class FAQVO {
    private int faqId;          // FAQ ID
    private String question;    // 질문
    private String answer;      // 답변
    private String author;      // 작성자
    private String createdAt;   // 생성일

    // Getter and Setter
    public int getFaqId() {
        return faqId;
    }
    public void setFaqId(int faqId) {
        this.faqId = faqId;
    }
    public String getQuestion() {
        return question;
    }
    public void setQuestion(String question) {
        this.question = question;
    }
    public String getAnswer() {
        return answer;
    }
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
