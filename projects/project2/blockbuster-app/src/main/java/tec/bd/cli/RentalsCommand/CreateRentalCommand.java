package tec.bd.cli.RentalsCommand;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import tec.bd.entity.RentalEntity;
import java.util.concurrent.Callable;
import java.util.Date;
@Command(name = "loanc", description = "Create a new rental in Database")
public class CreateRentalCommand implements Callable<Integer> {
    private static ApplicationContext applicationContext = ApplicationContext.init();
    @Parameters(paramLabel = "<movieID>", description = "ID of the movie rented")
    private int movieID;
    @Parameters(paramLabel = "<clientID>", description = "ID of the client renting movie")
    private int clientID;
    @Parameters(paramLabel = "<rentalDate>", description = "Date of rental")
    private Date rentalDate;
    /**
     * Executes the create rental command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        var rentalEntity = new RentalEntity(rentalDate, clientID, movieID);
        try {
            // Call the newRental() method of the RentalService to create a new rental
            applicationContext.RentalService.newRental(rentalEntity);
            System.out.println("Now there is a new rental");
            return 0; // Return 0 for success
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1; // Return -1 for failure
        }
    }
}

