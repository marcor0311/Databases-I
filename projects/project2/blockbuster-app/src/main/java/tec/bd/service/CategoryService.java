package tec.bd.service;
import java.util.List;
import java.util.Optional;
import tec.bd.entity.CategoryEntity;
public interface CategoryService {
    List<CategoryEntity> getCategories();
    Optional<CategoryEntity> getCategoryById(int categoryId);
    CategoryEntity newCategory(CategoryEntity category);
    void removeCategory(int categoryId);
    CategoryEntity updateCategory(CategoryEntity category);
    void printCategory (CategoryEntity category);
}