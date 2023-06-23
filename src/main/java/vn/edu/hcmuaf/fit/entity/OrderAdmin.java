package vn.edu.hcmuaf.fit.entity;

import java.util.List;

public class OrderAdmin {

    int id;
    String fullName;
    List<ProductAdmin> products;
    int totalMoney;
    int shippingCost;

    int id_status;
    String status;

    String phone;

    String address;

    public OrderAdmin(int id, String fullName, List<ProductAdmin> products, int totalMoney, int shippingCost,  int id_status, String status, String phone, String address) {
        this.id = id;
        this.fullName = fullName;
        this.products = products;
        this.totalMoney = totalMoney;
        this.shippingCost = shippingCost;
        this.id_status = id_status;
        this.status = status;
        this.phone = phone;
        this.address = address;
    }

    public OrderAdmin() {
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public OrderAdmin(int totalMoney) {
        this.totalMoney = totalMoney;
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

    public int getShippingCost() {
        return shippingCost;
    }

    public void setShippingCost(int shippingCost) {
        this.shippingCost = shippingCost;
    }

//    @Override
//    public String toString() {
//        return "OrderAdmin{" +
//                "id=" + id +
//                ", fullName='" + fullName + '\'' +
//                ", products=" + products +
//                ", totalMoney=" + totalMoney +
//                ", status='" + status + '\'' +
//                '}' + '\n';
//    }


    @Override
    public String toString() {
        return "OrderAdmin{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", products=" + products +
                ", totalMoney=" + totalMoney +
                ", shippingCost=" + shippingCost +
                ", id_status=" + id_status +
                ", status='" + status + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    public OrderAdmin(int id, String fullName, int totalMoney, int shippingCost, int id_status) {
        this.id = id;
        this.fullName = fullName;
        this.totalMoney = totalMoney;
        this.shippingCost = shippingCost;
        this.id_status = id_status;
    }

    public static void main(String[] args) {
    }
}
