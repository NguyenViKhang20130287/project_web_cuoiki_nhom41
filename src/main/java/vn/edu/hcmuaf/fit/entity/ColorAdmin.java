package vn.edu.hcmuaf.fit.entity;

public class ColorAdmin {
    int idColor;
    String nameColor;

    public ColorAdmin(int idColor, String nameColor) {
        this.idColor = idColor;
        this.nameColor = nameColor;
    }
    public ColorAdmin() {
    }


    public int getIdColor() {
        return idColor;
    }

    public void setIdColor(int idColor) {
        this.idColor = idColor;
    }

    public String getNameColor() {
        return nameColor;
    }

    public void setNameColor(String nameColor) {
        this.nameColor = nameColor;
    }

    @Override
    public String toString() {
        return "ColorAdmin{" +
                "idColor=" + idColor +
                ", nameColor='" + nameColor + '\'' +
                '}';
    }
}
