package vn.edu.hcmuaf.fit.entity;

public class CategoryAdmin {

    int idCat;
    int idParent;
    String name;

    public CategoryAdmin(int idCat, int idParent, String name) {
        this.idCat = idCat;
        this.idParent = idParent;
        this.name = name;
    }

    public int getIdCat() {
        return idCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public int getIdParent() {
        return idParent;
    }

    public void setIdParent(int idParent) {
        this.idParent = idParent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CatagoryAdmin{" +
                "idCat=" + idCat +
                ", idParent=" + idParent +
                ", name='" + name + '\'' +
                '}';
    }
}
