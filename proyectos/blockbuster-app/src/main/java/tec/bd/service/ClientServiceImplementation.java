package tec.bd.service;
import java.util.List;
import java.util.Optional;
import static java.util.Objects.requireNonNull;
import tec.bd.entity.ClientEntity;
import tec.bd.repository.ClientRepository;
public class ClientServiceImplementation implements ClientService {
    private final ClientRepository ClientRepository;
    public ClientServiceImplementation(ClientRepository ClientRepository, DatabaseStoredProcedure featureFlags){
        requireNonNull(ClientRepository);
        requireNonNull(featureFlags);
        this.ClientRepository = ClientRepository;
    }
    @Override
    public List<ClientEntity> getClients() {
        return this.ClientRepository.findAll();
    }
    @Override
    public Optional<ClientEntity> getClientById(int clientId) {
         return this.ClientRepository.findById(clientId); 
    }
    @Override
    public ClientEntity newClient(ClientEntity client) {
        requireNonNull(client);
        System.out.println("New client, loading...");
        var newClientID = this.ClientRepository.callCreateClientProcedure(client);
        System.out.println("New client, id is "+newClientID+ "\n");
        return new ClientEntity();
    }
    @Override
    public void removeClient(int clientId) {
        requireNonNull(clientId);
        System.out.println("removed client");
        this.ClientRepository.delete(clientId);

    }
    @Override
    public ClientEntity updateClient(ClientEntity client) {
        requireNonNull(client);
        this.ClientRepository.update(client);
        return client;
    }
    @Override
    public void printClient(ClientEntity client) {
        System.out.println("╔════════════════════════════════════════╗");
        System.out.println("║              Client Details              ");
        System.out.println("|───────────────┬─────────────────────────");
        System.out.printf("║   Name        │ %s\n", client.getName());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   ID          │ %d\n", client.getId());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Last Name   │ %s\n", client.getLastname());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Phone Number│ %s\n", client.getPhone_number());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Email       │ %s\n", client.getEmail());
        System.out.println("╚═══════════════-════════════════════════╝");
    }
}
