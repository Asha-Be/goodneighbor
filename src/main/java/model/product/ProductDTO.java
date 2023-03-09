package model.product;

import java.util.Date;

public class ProductDTO {

  // Local Variables
  private Integer product_id;
  private String product_name;
  private String product_detail;
  private String product_price;
  private String product_stock;
  private String product_company;
  private Date product_date;
  private byte[] product_image;
  private String product_imageName;

  // product_id
  public Integer getProduct_id() {
    return this.product_id;
  }

  public void setProduct_id(Integer product_id) {
    this.product_id = product_id;
  }

  // product_name
  public String getProduct_name() {
    return this.product_name;
  }

  public void setProduct_name(String product_name) {
    this.product_name = product_name;
  }

  // product_detail
  public String getProduct_detail() {
    return this.product_detail;
  }

  public void setProduct_detail(String product_detail) {
    this.product_detail = product_detail;
  }

  // product_price
  public String getProduct_price() {
    return this.product_price;
  }

  public void setProduct_price(String product_price) {
    this.product_price = product_price;
  }

  // product_stock
  public String getProduct_stock() {
    return this.product_stock;
  }

  public void setProduct_stock(String product_stock) {
    this.product_stock = product_stock;
  }

  // product_company
  public String getProduct_company() {
    return this.product_company;
  }

  public void setProduct_company(String product_company) {
    this.product_company = product_company;
  }

  // product_date
  public Date getProduct_date() {
    return this.product_date;
  }

  public void setProduct_date(Date product_date) {
    this.product_date = product_date;
  }

  // product_image
  public byte[] getProduct_image() {
    return this.product_image;
  }

  public void setProduct_image(byte[] product_image) {
    this.product_image = product_image;
  }

  // product_imageName
  public String getProduct_imageName() {
    return this.product_imageName;
  }

  public void setProduct_imageName(String product_imageName) {
    this.product_imageName = product_imageName;
  }

}