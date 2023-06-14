package vn.edu.hcmuaf.fit.entity;

import java.util.Date;
import java.util.List;

public class OrderUser {
    int id;
    List<Product> listItem;
    int total;
    int shippingCost;
    String status;
    Date orderDate;
    Address address;
    Account user;
    double promotion;

    public OrderUser() {
    }

    public OrderUser(int id, List<Product> listItem, int total, int shippinp_cost, String status, Date orderDate, Address address, Account user, double promotion) {
        this.id = id;
        this.listItem = listItem;
        this.total = total;
        this.shippingCost = shippinp_cost;
        this.status = status;
        this.orderDate = orderDate;
        this.address = address;
        this.user = user;
        this.promotion = promotion;
    }

    public OrderUser(int id, List<Product> listItem, int total, int shipping_cost, String status) {
        this.id = id;
        this.listItem = listItem;
        this.total = total;
        this.shippingCost = shipping_cost;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Product> getListItem() {
        return listItem;
    }

    public void setListItem(List<Product> listItem) {
        this.listItem = listItem;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }

    public double getPromotion() {
        return promotion;
    }

    public void setPromotion(double promotion) {
        this.promotion = promotion;
    }

    public int getShippingCost() {
        return shippingCost;
    }

    public void setShippingCost(int shippingCost) {
        this.shippingCost = shippingCost;
    }

    public OrderUser(int id, int total, String status) {
        this.id = id;
        this.total = total;
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderUser{" +
                "id=" + id +
                ", listItem=" + listItem +
                ", total=" + total +
                ", status='" + status + '\'' +
                ", orderDate=" + orderDate +
                ", address=" + address +
                ", user=" + user +
                ", promotion=" + promotion +
                "}\n";
    }
}
