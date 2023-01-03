package vn.edu.hcmuaf.fit.entity;

import java.util.Date;

public class Review {
    private int id;
    private Product product;
    private Account account;
    private String message;
    private double rating;
    private Date datePost;

    public Review() {
    }

    public Review(int id, Product product, Account account, String message, double rating, Date datePost) {
        this.id = id;
        this.product = product;
        this.account = account;
        this.message = message;
        this.rating = rating;
        this.datePost = datePost;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public Date getDatePost() {
        return datePost;
    }

    public void setDatePost(Date datePost) {
        this.datePost = datePost;
    }

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", product=" + product +
                ", account=" + account +
                ", message='" + message + '\'' +
                ", rating=" + rating +
                ", datePost=" + datePost +
                '}';
    }
}
