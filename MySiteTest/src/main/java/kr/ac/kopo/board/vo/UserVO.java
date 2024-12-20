package kr.ac.kopo.board.vo;

public class UserVO {
    private int userId;          // 사용자 ID
    private String username;     // 사용자 이름
    private String email;        // 이메일
    private String password;     // 비밀번호
    private String role;         // 역할 (USER 또는 ADMIN)

    // Getter and Setter
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "UserVO [userId=" + userId + ", username=" + username + ", email=" + email + ", role=" + role + "]";
    }
}
