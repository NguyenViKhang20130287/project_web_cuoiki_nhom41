package vn.edu.hcmuaf.fit.entity;

public class Product {
    private int id;
    private int category_id;
    private String title;
    private String keyword;
    private int price;
    private int discount;
    private String design;
    private String thumbnail;
    private String description;
    private int quantity;

    public Product() {
    }

    public Product(int id, int category_id, String title, String keyword, int price, int discount, String design, String thumbnail, String description, int quantity) {
        this.id = id;
        this.category_id = category_id;
        this.title = title;
        this.keyword = keyword;
        this.price = price;
        this.discount = discount;
        this.design = design;
        this.thumbnail = thumbnail;
        this.description = description;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getDesign() {
        return design;
    }

    public void setDesign(String design) {
        this.design = design;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", category_id=" + category_id +
                ", title='" + title + '\'' +
                ", keyword='" + keyword + '\'' +
                ", price=" + price +
                ", discount=" + discount +
                ", design='" + design + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", description='" + description + '\'' +
                ", quantity=" + quantity +
                '}';
    }
}
