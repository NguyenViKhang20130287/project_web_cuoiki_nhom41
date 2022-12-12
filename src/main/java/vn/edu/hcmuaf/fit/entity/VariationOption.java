package vn.edu.hcmuaf.fit.entity;

public class VariationOption {
    private int id;
    private Variation variation;
    private String value;

    public VariationOption() {
    }

    public VariationOption(int id, Variation variation, String value) {
        this.id = id;
        this.variation = variation;
        this.value = value;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Variation getVariation() {
        return variation;
    }

    public void setVariation(Variation variation) {
        this.variation = variation;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "VariationOption{" +
                "id=" + id +
                ", variation=" + variation +
                ", value='" + value + '\'' +
                '}';
    }
}
