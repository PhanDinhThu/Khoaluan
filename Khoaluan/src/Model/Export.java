package Model;

import java.util.Date;

public class Export {
	
	public String productId;
	public String categoryId;
	public String productName;
	public String image;
	public int quantity;
	public Export() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Export(String productId, String categoryId, String productName, String image, int quantity) {
		super();
		this.productId = productId;
		this.categoryId = categoryId;
		this.productName = productName;
		this.image = image;
		this.quantity = quantity;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
