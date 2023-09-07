package tec.bd.cli.ClientsCommand;

import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import tec.bd.entity.ClientEntity;
import java.util.concurrent.Callable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Command(name = "cliu", description = "Update client")
public class UpdateClientCommand implements Callable<Integer> {
    private final static Logger LOGGER = LoggerFactory.getLogger(CreateClientCommand.class);
    private static ApplicationContext applicationContext = ApplicationContext.init();   
    // Command parameters
    @Parameters(paramLabel = "<id>", description = "id of client")
    private int clientID;   
    @Parameters(paramLabel = "<name>", description = "Name of client")
    private String clientName;   
    @Parameters(paramLabel = "<lastname>", description = "Lastname of client")
    private String clientLastName;    
    @Parameters(paramLabel = "<email>", description = "Email of client")
    private String clientEmail;   
    @Parameters(paramLabel = "<phoneNumber>", description = "Phone number of client")
    private String phoneNumber;
    /**
     * Executes the update client command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        var clientEntity = new ClientEntity(clientID, clientName, clientLastName, clientEmail, phoneNumber);
        try {
            applicationContext.featureFlags.setCreateClientViaStoredProcedureEnabled(true);
            applicationContext.clientService.updateClient(clientEntity);
            System.out.println("The client has been updated");
            return 0;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return -1;
        }
    }
}
