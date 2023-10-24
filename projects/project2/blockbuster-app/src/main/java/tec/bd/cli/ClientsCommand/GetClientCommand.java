package tec.bd.cli.ClientsCommand;

import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import tec.bd.entity.ClientEntity;
import java.util.concurrent.Callable;
import picocli.CommandLine;

@CommandLine.Command(name = "clir", description = "Find client")
public class GetClientCommand implements Callable<Integer> {
    private static ApplicationContext applicationContext = ApplicationContext.init();
    
    // Command parameters
    @Parameters(paramLabel = "<id>", defaultValue = "0", description = "ID of the client")
    private int clientID;
    
    /**
     * Executes the find client command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        try {
            if (clientID == 0) {
                // If clientID is 0, it means all clients have been requested
                System.out.println("\n- All clients have been requested, LOADING ...\n");
                
                // Retrieve all clients from the service
                var clients = applicationContext.clientService.getClients();
                
                if (clients.isEmpty()) {
                    System.out.println("Oops, there are no clients. Try again after adding some new clients");
                    return 0;
                }
                
                // Print details of each client
                for (ClientEntity client : clients) {
                    applicationContext.clientService.printClient(client);
                }
                
                return 0;
            }
            
            // Retrieve client by ID
            var client = applicationContext.clientService.getClientById(clientID);

            if (client.isEmpty()) {
                System.out.println("Invalid Client");
                return -1;
            }
            
            // Print details of the client
            applicationContext.clientService.printClient(client.get());

            return 0;
        } catch (Exception e) {
            System.out.println("Oops Error");
            return -1;
        }      
    }   
}

