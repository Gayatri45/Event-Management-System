package com.onestop.codeitsoft.eventBackend.daoImp;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.dao.CategoryDao;
import com.onestop.codeitsoft.eventBackend.entity.Category;

@Service
public class CategoryDaoImp {
	
	@Autowired
	CategoryDao categoryDao;
	
	public Category saveCategory(Category category) {
		return categoryDao.save(category);
	}

	public Optional<Category> getCategoryByCompanyIdBranchIdAndCategoryName(int companyId, int branchId, String categoryName) {
		return categoryDao.getCategoryByCompanyIdBranchIdAndCategoryName(companyId, branchId, categoryName);
	}

	public Category getCategoryById(int categoryId) {
		return categoryDao.getCategoryById(categoryId);
	}

	public List<Category> getCategoryListByCompanyIdAndBranchId(int companyId, int branchId) {
		return categoryDao.getCategoryListByCompanyIdAndBranchId(companyId, branchId);
	}

	public Optional<Category> getCategoryByCompanyIdBranchIdAndCategoryIdAndCategoryNameExpectThis(int companyId, int branchId,
			int categoryId, String categoryName) {
		return categoryDao.getCategoryByCompanyIdBranchIdAndCategoryIdAndCategoryNameExpectThis(companyId, branchId, categoryId, categoryName);
	}
	
	

}
