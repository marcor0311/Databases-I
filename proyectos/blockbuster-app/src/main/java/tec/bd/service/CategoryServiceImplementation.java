package tec.bd.service;
import java.util.List;
import java.util.Optional;
import tec.bd.entity.CategoryEntity;
import static java.util.Objects.requireNonNull;
import tec.bd.repository.CategoryRepository;
public class CategoryServiceImplementation implements CategoryService {
    private final CategoryRepository categoryRepository;
    public CategoryServiceImplementation(CategoryRepository categoryRepository, DatabaseStoredProcedure featureFlags){
        requireNonNull(categoryRepository);
        requireNonNull(featureFlags);
        this.categoryRepository = categoryRepository;
    }
    @Override
    public List<CategoryEntity> getCategories() {
        return this.categoryRepository.findAll();
    }
    @Override
    public Optional<CategoryEntity> getCategoryById(int categoryId) {
         return this.categoryRepository.findById(categoryId);
    }
    @Override
    public CategoryEntity newCategory(CategoryEntity category) {
        requireNonNull(category);
        System.out.println("New category, loading...");
        var newCategoryID = this.categoryRepository.save(category);
        System.out.println("New category, id is "+newCategoryID);
        category.setId(newCategoryID);
        return category;
    }
    @Override
    public void removeCategory(int categoryId) {
        requireNonNull(categoryId);
        System.out.println("Category removed");
        this.categoryRepository.delete(categoryId);

    }
    @Override
    public CategoryEntity updateCategory(CategoryEntity category) {
        requireNonNull(category);
        this.categoryRepository.update(category);
        return category;
    }
    @Override
    public void printCategory(CategoryEntity category) {
        System.out.println("╔════════════════════════════════════════╗");
        System.out.println("║              Category Details            ");
        System.out.println("|───────────────┬─────────────────────────");
        System.out.printf("║   ID          │ %d\n", category.getId());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Name        │ %s\n", category.getName());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Description │ %s\n", category.getDescription());
        System.out.println("╚═══════════════-════════════════════════╝");
    }
}
