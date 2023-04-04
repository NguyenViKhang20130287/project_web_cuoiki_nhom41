package vn.edu.hcmuaf.fit.entity;

public class Address {
    int id;
    String hnum_sname, ward_commune, county_district, province_city;

    public Address(int id, String hnum_sname, String ward_commune, String county_district, String province_city) {
        this.id = id;
        this.hnum_sname = hnum_sname;
        this.ward_commune = ward_commune;
        this.county_district = county_district;
        this.province_city = province_city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHnum_sname() {
        return hnum_sname;
    }

    public void setHnum_sname(String hnum_sname) {
        this.hnum_sname = hnum_sname;
    }

    public String getWard_commune() {
        return ward_commune;
    }

    public void setWard_commune(String ward_commune) {
        this.ward_commune = ward_commune;
    }

    public String getCounty_district() {
        return county_district;
    }

    public void setCounty_district(String county_district) {
        this.county_district = county_district;
    }

    public String getProvince_city() {
        return province_city;
    }

    public void setProvince_city(String province_city) {
        this.province_city = province_city;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", hnum_sname='" + hnum_sname + '\'' +
                ", ward_commune='" + ward_commune + '\'' +
                ", county_district='" + county_district + '\'' +
                ", province_city='" + province_city + '\'' +
                '}';
    }
}
