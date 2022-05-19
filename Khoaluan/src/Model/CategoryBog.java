package Model;

public class CategoryBog {
	private String ID_Category_Bog;
	private String Name_Category_Bog;
	private String Parent_Category_Bog;
	
	public CategoryBog() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryBog(String iD_Category_Bog, String name_Category_Bog, String parent_Category_Bog) {
		super();
		ID_Category_Bog = iD_Category_Bog;
		Name_Category_Bog = name_Category_Bog;
		Parent_Category_Bog = parent_Category_Bog;
	}
	
	public String getID_Category_Bog() {
		return ID_Category_Bog;
	}
	public void setID_Category_Bog(String iD_Category_Bog) {
		ID_Category_Bog = iD_Category_Bog;
	}
	public String getName_Category_Bog() {
		return Name_Category_Bog;
	}
	public void setName_Category_Bog(String name_Category_Bog) {
		Name_Category_Bog = name_Category_Bog;
	}
	public String getParent_Category_Bog() {
		return Parent_Category_Bog;
	}
	public void setParent_Category_Bog(String parent_Category_Bog) {
		Parent_Category_Bog = parent_Category_Bog;
	}
	

}
