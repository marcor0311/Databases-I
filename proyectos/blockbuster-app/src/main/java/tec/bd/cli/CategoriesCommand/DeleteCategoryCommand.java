package tec.bd.cli.CategoriesCommand;

import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.concurrent.Callable;

@Command(name = "catd", description = "Delete category")
public class DeleteCategoryCommand implements Callable<Integer> {
    private static ApplicationContext applicationContext = ApplicationContext.init();
    @Parameters(paramLabel = "<id>", description = "ID of category")
    private int categoryID;
    @Override
    public Integer call() throws Exception {
        try {
            // Call the removeCategory method of the CategoryService in the application context,
            // passing the category ID to be deleted
            applicationContext.CategoryService.removeCategory(categoryID);
            return 0; // Return 0 to indicate successful execution
        } catch (Exception e) {
            System.out.println("Something went wrong");
            return -1; // Return -1 to indicate an error occurred
        }
    }
}

