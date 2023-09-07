package tec.bd.service;
import java.util.List;
import java.util.Optional;
import tec.bd.entity.ClientEntity;
public interface ClientService {
    List<ClientEntity> getClients();
    Optional<ClientEntity> getClientById(int clientId);
    ClientEntity newClient(ClientEntity client);
    void removeClient(int clientId);
    ClientEntity updateClient(ClientEntity client);
    void printClient (ClientEntity client);
}