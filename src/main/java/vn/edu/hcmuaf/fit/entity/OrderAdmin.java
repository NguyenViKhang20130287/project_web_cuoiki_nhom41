package vn.edu.hcmuaf.fit.entity;

import java.util.List;

public class OrderAdmin {

    int id;
    String fullName;
    List<ProductAdmin> products;
    int totalMoney;

    int id_status;
    String status;

    String phone;

    public OrderAdmin(int id, String fullName, List<ProductAdmin> products, int totalMoney, int id_status, String status, String phone) {
        this.id = id;
        this.fullName = fullName;
        this.products = products;
        this.totalMoney = totalMoney;
        this.id_status = id_status;
        this.status = status;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public List<ProductAdmin> getProducts() {
        return products;
    }

    public void setProducts(List<ProductAdmin> products) {
        this.products = products;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId_status() {
        return id_status;
    }

    public void setId_status(int id_status) {
        this.id_status = id_status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "OrderAdmin{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", products=" + products +
                ", totalMoney=" + totalMoney +
                ", status='" + status + '\'' +
                '}' + '\n';
    }

    public OrderAdmin(int id, String fullName, int totalMoney, int id_status) {
        this.id = id;
        this.fullName = fullName;
        this.totalMoney = totalMoney;
        this.id_status = id_status;
    }
}
