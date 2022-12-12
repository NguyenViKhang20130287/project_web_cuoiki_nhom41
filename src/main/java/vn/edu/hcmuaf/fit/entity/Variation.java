package vn.edu.hcmuaf.fit.entity;

public class Variation {
    private int id;
    private Category category;
    private String name;

    public Variation() {
    }

    public Variation(int id, Category category, String name) {
        this.id = id;
        this.category = category;
        this.name = name;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Variation{" + "id=" + id + ", category=" + category + ", name='" + name + '\'' + '}';
    }
}
