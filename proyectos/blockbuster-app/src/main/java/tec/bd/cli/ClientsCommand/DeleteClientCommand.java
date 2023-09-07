package tec.bd.cli.ClientsCommand;

import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.concurrent.Callable;

@Command(name = "clid", description = "Delete category")
public class DeleteClientCommand implements Callable<Integer> {
    private static ApplicationContext applicationContext = ApplicationContext.init();
    
    // Command parameters
    @Parameters(paramLabel = "<id>", description = "ID of the client")
    private int clientID;
    
    /**
     * Executes the delete client command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        try {
            // Call the removeClient method from the clientService to delete the client
            applicationContext.clientService.removeClient(clientID);
            
            return 0; // Return 0 for success
        } catch (Exception e) {
            System.out.println("An error occurred"); // Print an error message
            return -1; // Return -1 for failure
        }       
    }
}
