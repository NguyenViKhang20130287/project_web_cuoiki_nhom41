package vn.edu.hcmuaf.fit.entity;

public class Product implements Comparable<Product>{
    private int id;
    private Category category;
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

    public Product(int id, Category category, String title, String keyword, int price, int discount, String design, String thumbnail, String description, int quantity) {
        this.id = id;
        this.category = category;
        this.title = title;
        this.keyword = keyword;
        this.price = price;
        this.discount = discount;
        this.design = design;
        this.thumbnail = thumbnail;
        this.description = description;
        this.quantity = quantity;
    }

    public Product(int id, String title, int price, int discount, String thumbnail, int quantity) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.discount = discount;
        this.thumbnail = thumbnail;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
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
                ", category=" + category +
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

    @Override
    public int compareTo(Product o) {
        if (this.getDiscount() > o.getDiscount()) {
            return 1;
        } else if (this.getDiscount() < o.getDiscount()) {
            return -1;
        }
        return 0;
    }

    public Product(int id, String title, String description,String thumbnail,int price, int discount) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.thumbnail = thumbnail;
        this.price = price;
        this.discount = discount;
    }
}

