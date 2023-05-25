package vn.edu.hcmuaf.fit.entity;

public class Color {
    int idColor;
    String nameColor;

    public Color(int idColor, String nameColor) {
        this.idColor = idColor;
        this.nameColor = nameColor;
    }
    public Color() {
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
        return "Color{" +
                "idColor=" + idColor +
                ", nameColor='" + nameColor + '\'' +
                '}';
    }
}
