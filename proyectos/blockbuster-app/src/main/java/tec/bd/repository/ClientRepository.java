package tec.bd.repository;
import tec.bd.entity.ClientEntity;
public interface ClientRepository extends CRUDRepository<ClientEntity, Integer> {
    int callCreateClientProcedure(ClientEntity client);
}
