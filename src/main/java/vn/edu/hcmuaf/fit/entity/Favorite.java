package vn.edu.hcmuaf.fit.entity;

public class Favorite {
    private Product product;
    private Account account;

    public Favorite() {
    }

    public Favorite(Product product, Account account) {
        this.product = product;
        this.account = account;
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

    @Override
    public String toString() {
        return "Favorite{" +
                "product=" + product +
                ", account=" + account +
                '}';
    }
}
