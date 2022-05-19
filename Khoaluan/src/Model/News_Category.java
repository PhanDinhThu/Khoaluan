package Model;

public class News_Category {
	private String ID_News_Category;
	private String Name_News_Category;
	private String Parent_News;
	
	public News_Category() {
		super();
    }

	public News_Category(String iD_News_Category, String name_News_Category, String parent_News) {
		super();
		ID_News_Category = iD_News_Category;
		Name_News_Category = name_News_Category;
		Parent_News = parent_News;
	}

	public String getID_News_Category() {
		return ID_News_Category;
	}

	public void setID_News_Category(String iD_News_Category) {
		ID_News_Category = iD_News_Category;
	}

	public String getName_News_Category() {
		return Name_News_Category;
	}

	public void setName_News_Category(String name_News_Category) {
		Name_News_Category = name_News_Category;
	}

	public String getParent_News() {
		return Parent_News;
	}

	public void setParent_News(String parent_News) {
		Parent_News = parent_News;
	}


}
