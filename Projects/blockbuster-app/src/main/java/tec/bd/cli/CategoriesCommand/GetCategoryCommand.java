package tec.bd.cli.CategoriesCommand;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import picocli.CommandLine;
import java.util.concurrent.Callable;
import tec.bd.entity.CategoryEntity;
@CommandLine.Command(name = "catr", description = "Find category")
public class GetCategoryCommand implements Callable<Integer> {
    // Initialize the ApplicationContext
    private static ApplicationContext applicationContext = ApplicationContext.init();   
    // Command parameters
    @Parameters(paramLabel = "<id>", defaultValue = "0", description = "ID of the category")
    private int categoryID;
    /**
     * Executes the get category command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        try {
            if (categoryID == 0) {
                // If categoryID is 0, it means all categories have been requested
                System.out.println("\n- All categories have been requested, LOADING ...\n");
                var categories = applicationContext.CategoryService.getCategories();
                if (categories.isEmpty()) {
                    System.out.println("No categories have been found");
                    return 0; // Return 0 for success
                }
                for (CategoryEntity category : categories) {
                    applicationContext.CategoryService.printCategory(category);
                }
                return 0; // Return 0 for success
            }
            var category = applicationContext.CategoryService.getCategoryById(categoryID);
            if (category.isEmpty()) {
                System.out.println("This category doesn't exist, try using 'catc' to create it");
                return -1; // Return -1 for failure
            }
            applicationContext.CategoryService.printCategory(category.get());
            return 0; // Return 0 for success
        } catch (Exception e) {
            System.out.println("Oops something went wrong");
            return -1; // Return -1 for failure
        }
    }
}


