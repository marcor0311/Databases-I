package tec.bd.cli.CategoriesCommand;

import tec.bd.ApplicationContext;
import java.util.concurrent.Callable;
import tec.bd.entity.CategoryEntity;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;

@Command(name = "catc", description = "Create new category")
public class CreateCategoryCommand implements Callable<Integer> {   
    @Parameters(paramLabel = "<name>", description = "Category Name")
    private String categoryName;
    @Parameters(paramLabel = "<Description>", description = "Category Description")
    private String categoryDescription;
    private static ApplicationContext applicationContext = ApplicationContext.init();   
    @Override
    public Integer call() throws Exception {
        // Create a new CategoryEntity object with the provided name and description
        var categoryEntity = new CategoryEntity(this.categoryName, this.categoryDescription);
        try {
            // Call the newCategory method of the CategoryService in the application context,
            // passing the created CategoryEntity object
            applicationContext.CategoryService.newCategory(categoryEntity);
            System.out.println("Now there is a new category");
            return 0; // Return 0 to indicate successful execution
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1; // Return -1 to indicate an error occurred
        }
    }
}
