package vn.edu.hcmuaf.fit.entity;

public class CartItem {
    private Product product;
    private int quantity;
    private Account account;

    public CartItem() {
    }

    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }
    public CartItem(Product product, int quantity, Account account) {
        this.product = product;
        this.quantity = quantity;
        this.account = account;
    }


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "CartItem{" + "product=" + product + ", quantity=" + quantity + '}';
    }

    public void incrementQuantity() {
        this.quantity++;
    }

    public void incrementQuantityWithQuantity(int quantity) {
        this.quantity += quantity;
    }

}
