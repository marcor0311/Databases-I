package tec.bd.cli.CategoriesCommand;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import tec.bd.entity.CategoryEntity;
import java.util.concurrent.Callable;
/**
 * Command to update a category in the Database.
 */
@Command(name = "catu", description = "Update category")
public class UpdateCategoryCommand implements Callable<Integer> {
    // Initialize the ApplicationContext
    private static ApplicationContext applicationContext = ApplicationContext.init();
    // Command parameters
    @Parameters(index = "0", paramLabel = "<id>", description = "ID of category")
    private int categoryId;
    @Parameters(index = "1", paramLabel = "<name>", description = "Name of category")
    private String categoryName;
    @Parameters(index = "2", paramLabel = "<description>", description = "Description of category", arity = "0..1")
    private String categoryDescription;
    /**
     * Executes the update category command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        // Create a new CategoryEntity object with the provided parameters
        var categoryEntity = new CategoryEntity(categoryId, categoryName, categoryDescription);
        try {
            // Call the updateCategory method on the CategoryService to update the category in the database
            applicationContext.CategoryService.updateCategory(categoryEntity);
            System.out.println("The category has been updated");
            return 0; // Return 0 for success
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1; // Return -1 for failure
        }
    }
}
