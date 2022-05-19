package Model;

public class Product implements Comparable<Product> {
	private String ID_Product;
	private Category Danh_Muc;
	private String Name_Product;
	private String Image;
	private int Quantity;
	private String Describe;
	private String Size;
	private String Material;
	private int Price;
	private int Sale;
    private Season Mua;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
    




	public Product(String iD_Product, Category danh_Muc, String name_Product, String image, int quantity,
			String describe, String size, String material, int price, int sale) {
		super();
		ID_Product = iD_Product;
		Danh_Muc = danh_Muc;
		Name_Product = name_Product;
		Image = image;
		Quantity = quantity;
		Describe = describe;
		Size = size;
		Material = material;
		Price = price;
		Sale = sale;
	}





	public Product(String iD_Product, Category danh_Muc, String name_Product, String image, int quantity,
			String describe, String size, String material, int price, int sale, Season mua) {
		super();
		ID_Product = iD_Product;
		Danh_Muc = danh_Muc;
		Name_Product = name_Product;
		Image = image;
		Quantity = quantity;
		Describe = describe;
		Size = size;
		Material = material;
		Price = price;
		Sale = sale;
		Mua = mua;
	}








	public String getID_Product() {
		return ID_Product;
	}





	public void setID_Product(String iD_Product) {
		ID_Product = iD_Product;
	}





	public Category getDanh_Muc() {
		return Danh_Muc;
	}





	public void setDanh_Muc(Category danh_Muc) {
		Danh_Muc = danh_Muc;
	}





	public String getName_Product() {
		return Name_Product;
	}





	public void setName_Product(String name_Product) {
		Name_Product = name_Product;
	}





	public String getImage() {
		return Image;
	}





	public void setImage(String image) {
		Image = image;
	}





	public int getQuantity() {
		return Quantity;
	}





	public void setQuantity(int quantity) {
		Quantity = quantity;
	}





	public String getDescribe() {
		return Describe;
	}





	public void setDescribe(String describe) {
		Describe = describe;
	}





	public String getSize() {
		return Size;
	}





	public void setSize(String size) {
		Size = size;
	}





	public String getMaterial() {
		return Material;
	}





	public void setMaterial(String material) {
		Material = material;
	}





	public int getPrice() {
		return Price;
	}





	public void setPrice(int price) {
		Price = price;
	}





	public int getSale() {
		return Sale;
	}





	public void setSale(int sale) {
		Sale = sale;
	}





	public Season getMua() {
		return Mua;
	}





	public void setMua(Season mua) {
		Mua = mua;
	}





	@Override
	public int compareTo(Product pr) {
		return Integer.parseInt(this.ID_Product) - Integer.parseInt(pr.ID_Product);
	}

}
