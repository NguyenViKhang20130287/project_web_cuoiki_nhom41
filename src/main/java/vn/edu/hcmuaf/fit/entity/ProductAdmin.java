package vn.edu.hcmuaf.fit.entity;

public class ProductAdmin {

    int id;
    String name;
    String imageLink;
    int quantity;
    String status;
    int price;
    String category;

    public ProductAdmin() {
    }

    public ProductAdmin(int id, String name, String imageLink, int quantity, String status, int price, String category) {
        this.id = id;
        this.name = name;
        this.imageLink = imageLink;
        this.quantity = quantity;
        this.status = status;
        this.price = price;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "ProductAdmin{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", imageLink='" + imageLink + '\'' +
                ", quantity=" + quantity +
                ", status='" + status + '\'' +
                ", price=" + price +
                ", category='" + category + '\'' +
                '}';
    }

    public String checkStatus(int quantity) {
        if (quantity > 0) {
            status = "Còn hàng";
        } else {
            status = "Hết hàng";
        }
        return status;
    }





}
