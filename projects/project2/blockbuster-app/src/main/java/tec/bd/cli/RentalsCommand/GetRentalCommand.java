package tec.bd.cli.RentalsCommand;
import tec.bd.ApplicationContext;
import java.util.concurrent.Callable;
import picocli.CommandLine;
import picocli.CommandLine.Parameters;
import tec.bd.entity.RentalEntity;
@CommandLine.Command(name = "loanr", description = "Find rental")
public class GetRentalCommand implements Callable<Integer> {
    private static ApplicationContext applicationContext = ApplicationContext.init();
    @Parameters(paramLabel = "<id>", defaultValue = "0", description = "id of rental")
    private int rentalID;
    /**
     * Executes the get rental command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        try {
            if (rentalID == 0) {
                // Get all rentals if no specific rental ID is provided
                var rentals = applicationContext.RentalService.getRentals();
                if (rentals.isEmpty()) {
                    System.out.println("No rentals found");
                    return 0;
                }
                for (RentalEntity rental : rentals) {
                    applicationContext.RentalService.printRental(rental);
                }
                return 0;
            }
            // Get the rental by ID
            var rental = applicationContext.RentalService.getRentalById(rentalID);
            if (rental.isEmpty()) {
                System.out.println("There is no rental for this id");
                return -1;
            }
            applicationContext.RentalService.printRental(rental.get());
            return 0;
        } catch (Exception e) {
            System.out.println("Something went wrong");
            return -1;
        }
    }
}
