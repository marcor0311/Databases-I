package tec.bd.cli.ClientsCommand;

import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import tec.bd.entity.ClientEntity;
import java.util.concurrent.Callable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Command(name = "clic", description = "Create new client")
public class CreateClientCommand implements Callable<Integer> {
    // Logger for logging purposes
    private final static Logger LOGGER = LoggerFactory.getLogger(CreateClientCommand.class);    
    // Initialize the ApplicationContext
    private static ApplicationContext applicationContext = ApplicationContext.init();
    
    // Command parameters
    @Parameters(paramLabel = "<name>", description = "Name of client")
    private String clientName;
    
    @Parameters(paramLabel = "<lastname>", description = "Lastname of client")
    private String clientLastName;
    
    @Parameters(paramLabel = "<email>", description = "Email of client")
    private String clientEmail;
    
    @Parameters(paramLabel = "<PhoneNumber>", description = "Phone number of client")
    private String phoneNumber;
    /**
     * Executes the create client command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        // Create a new ClientEntity object with the provided information
        var clientEntity = new ClientEntity(this.clientName, this.clientLastName, this.clientEmail, this.phoneNumber);
        try {
            // Enable the feature flag for creating a client via stored procedure
            applicationContext.featureFlags.setCreateClientViaStoredProcedureEnabled(true);
            
            // Call the newClient method from the clientService to create the client
            applicationContext.clientService.newClient(clientEntity);
            
            // Print a success message
            System.out.println("Now there is a new client");
            
            return 0; // Return 0 for success
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e); // Log the exception with the error message
            return -1; // Return -1 for failure
        }
    }
}
