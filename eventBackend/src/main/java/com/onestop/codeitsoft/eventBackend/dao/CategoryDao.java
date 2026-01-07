package com.onestop.codeitsoft.eventBackend.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.onestop.codeitsoft.eventBackend.entity.Category;

@Repository
public interface CategoryDao extends JpaRepository<Category, Integer>{

	@Query(nativeQuery = true, value="SELECT * FROM category WHERE company_id =:companyId AND branch_id =:branchId AND category_name =:categoryName")
	public Optional<Category> getCategoryByCompanyIdBranchIdAndCategoryName(int companyId, int branchId, String categoryName);

	@Query(nativeQuery = true, value = "SELECT * FROM category WHERE category_id =:categoryId")
	public Category getCategoryById(@Param("categoryId")int categoryId);

	@Query(nativeQuery = true, value = "SELECT * FROM category WHERE company_id =:companyId AND branch_id =:branchId ORDER BY category_name ASC")
	public List<Category> getCategoryListByCompanyIdAndBranchId(@Param("companyId")int companyId, @Param("branchId")int branchId);

	@Query(nativeQuery = true, value="SELECT * FROM category WHERE company_id =:companyId AND branch_id =:branchId AND category_id <>:categoryId AND category_name =:categoryName")
	public Optional<Category> getCategoryByCompanyIdBranchIdAndCategoryIdAndCategoryNameExpectThis(int companyId, int branchId,
			int categoryId, String categoryName);

}
