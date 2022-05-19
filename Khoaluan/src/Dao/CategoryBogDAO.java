package Dao;

import java.util.ArrayList;

import Model.CategoryBog;


public interface CategoryBogDAO {
	// load danh sach danh muc tin tức cha
	public ArrayList<CategoryBog> getListParentCategoryBog();
	
	//load danh sach danh muc tin tức con
	public ArrayList<CategoryBog> getListSubCategoryBog(String ID_Category_Bog);
	
	//lay danh sach danh muc theo list
	public ArrayList<CategoryBog> getList();
	
	public CategoryBog getIdCategoryBog(String ID_Category_Bog);
	
	public boolean checkCategoryBog(String ID_Category_Bog);
	
	public void insertCategoryBog(CategoryBog cate);
	
	public CategoryBog getCategoryBog(String ID_Category_Bog);
	public void updateNameCategoryBog(CategoryBog cate) ;
	public void deleteCategoryBog(String ID_Category_Bog);
	
	
}
