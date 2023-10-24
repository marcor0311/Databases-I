package tec.bd.cli.RentalsCommand;

import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.Date;
import java.util.concurrent.Callable;
import tec.bd.entity.RentalEntity;

@Command(name = "loanu", description = "Update rental")
public class UpdateRentalCommand implements Callable<Integer> {
    private static ApplicationContext applicationContext = ApplicationContext.init();
    @Parameters(paramLabel = "<id>", description = "id of rental")
    private int rentalID;
    @Parameters(paramLabel = "<movieID>", description = "id of movie to rent")
    private int movieID;
    @Parameters(paramLabel = "<clientID>", description = "id of client that rents")
    private int clientID;
    @Parameters(paramLabel = "<rentalDate>", description = "date of rental")
    private Date rentalDate;
    /**
     * Executes the update rental command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        var rentalEntity = new RentalEntity(this.rentalID, this.rentalDate, this.clientID, this.movieID);
        try {
            applicationContext.RentalService.updateRentals(rentalEntity);
            System.out.println("The rental has been updated");
            return 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1;
        }
    }
}
