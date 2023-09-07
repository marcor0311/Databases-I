package tec.bd.cli.RentalsCommand;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.concurrent.Callable;
@Command(name = "loand", description = "Delete rental")
public class DeleteRentalCommand implements Callable<Integer> {
    private static ApplicationContext applicationContext = ApplicationContext.init();
    @Parameters(paramLabel = "<id>", description = "ID rental to delete")
    private int rentalID;
    /**
     * Executes the delete rental command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        try {
            // Call the removeRental() method of the RentalService to delete the rental
            applicationContext.RentalService.removeRental(rentalID);
            return 0; // Return 0 for success
        } catch (Exception e) {
            System.out.println("Something went wrong");
            return -1; // Return -1 for failure
        }
    }
}
