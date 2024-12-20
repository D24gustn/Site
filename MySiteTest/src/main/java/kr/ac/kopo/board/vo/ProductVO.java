package kr.ac.kopo.board.vo;

public class ProductVO {
    private int productId;          // 제품 ID
    private String productName;     // 제품명
    private String description;     // 제품 설명
    private String productImage;    // 이미지 파일 경로

    // Getter and Setter
    public int getProductId() {
        return productId;
    }
    public void setProductId(int productId) {
        this.productId = productId;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getProductImage() {
        return productImage;
    }
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
}
