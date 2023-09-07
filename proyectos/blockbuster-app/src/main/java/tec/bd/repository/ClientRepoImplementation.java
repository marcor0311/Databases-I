package tec.bd.repository;

import com.zaxxer.hikari.HikariDataSource;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import tec.bd.entity.ClientEntity;
import static tec.bd.repository.Queries.*;
public class ClientRepoImplementation extends BaseRepository<ClientEntity, Integer> implements ClientRepository {
    public ClientRepoImplementation(HikariDataSource hikariDataSource) {
        super(hikariDataSource);
    }
    @Override
    public List<ClientEntity> findAll() {
        try {
            return this.query(CLIENT_FIND_ALL_QUERY);
        } catch (SQLException e) {
            System.out.println("Error finding clients\n");
            throw new RuntimeException(e);
        }
    }
    @Override
    public Optional<ClientEntity> findById(Integer entityId) {
        try {
            PreparedStatement stmt = this.connect().prepareStatement(CLIENT_FIND_BY_ID_QUERY);
            stmt.setInt(1, entityId);
            return this.query(stmt)
                    .stream()
                    .findFirst();
        } catch (SQLException e) {
            System.out.println("Error finding client\n");
            throw new RuntimeException(e);  
        }
    }
    @Override
    public int save(ClientEntity client) {
         try {
            var cstmt = this.connect().prepareCall(CLIENT_CREATE_CLIENT_PROC_CALL);
            cstmt.setString("p_name", client.getName());
            cstmt.setString("p_lastname", client.getLastname());
            cstmt.setString("p_email", client.getEmail());
            cstmt.setString("p_phone_number", client.getPhone_number());
            cstmt.registerOutParameter("p_new_client_id", Types.INTEGER);
            cstmt.executeUpdate();
            var newclientId = cstmt.getInt("p_new_client_id");
            cstmt.close();
            return newclientId;
        } catch (SQLException e) {
            System.out.println("Error with stored procedure");
            throw new RuntimeException(e);
        }
    }
    @Override
    public int callCreateClientProcedure(ClientEntity client) {
        try {
            var cstmt = this.connect().prepareCall(CLIENT_CREATE_CLIENT_PROC_CALL);
            cstmt.setString("p_name", client.getName());
            cstmt.setString("p_lastname", client.getLastname());
            cstmt.setString("p_email", client.getEmail());
            cstmt.setString("p_phone_number", client.getPhone_number());
            cstmt.registerOutParameter("p_new_client_id", Types.INTEGER);
            cstmt.executeUpdate();
            var newclientId = cstmt.getInt("p_new_client_id");
            if(newclientId ==-1){
                System.out.println("Error deleting client");
                 cstmt.close();
                 cstmt.close();
            return newclientId;
            }
            System.out.println("Client with Id " + newclientId +" now exists");
            
            cstmt.close();
            return newclientId;
        } catch (SQLException e) {
            System.out.println("Error with stored procedure");
            throw new RuntimeException(e);
        }
    }
    @Override
    public void delete(Integer entityId) {
        try {
            var cstmt = this.connect().prepareCall(CLIENT_DELETE_CLIENT_PROC_CALL);
            cstmt.setInt("p_id", entityId);
            cstmt.registerOutParameter("procedure_completed", Types.INTEGER);
            int affectedRows= cstmt.executeUpdate();
            var procedure_completed = cstmt.getInt("procedure_completed");     
            if(procedure_completed==-1){
                throw new RuntimeException();
            }
            System.out.println("Delete client, rows that have been affected "+affectedRows);
            
        } catch (SQLException e) {
            System.out.println("Error \n "+e.getMessage());
            
            throw new RuntimeException(e);
        }
        catch (Exception a) {
            
            System.out.println("Procedure error");
            throw new RuntimeException(a);
        }
    }
    @Override
    public ClientEntity update(ClientEntity entity) {
         try {
            var cstmt = this.connect().prepareCall(CLIENT_UPDATE_CLIENT_PROC_CALL);
            cstmt.setInt("p_id", entity.getId());
            cstmt.setString("p_name", entity.getName());
            cstmt.setString("p_lastname", entity.getLastname());
            cstmt.setString("p_email", entity.getEmail());            
            cstmt.setString("p_phone_number", entity.getPhone_number());

            cstmt.registerOutParameter("p_procedure_status", Types.INTEGER);
            int affectedRows= cstmt.executeUpdate();
            var procedure_completed = cstmt.getInt("p_procedure_status");
            if(procedure_completed==-1){
                throw new RuntimeException();
            }
            System.out.println("Updated Movie, rows that have been affected "+ affectedRows);
            return entity;
        } catch (SQLException e) {
            System.out.println("Error when updating client");
            throw new RuntimeException(e);
        }
        catch (Exception a) {
            System.out.println("The client does not exist");
            throw new RuntimeException(a);
        }
    }
    @Override
    protected ClientEntity toEntity(ResultSet resultSet) throws SQLException { 
        return new ClientEntity(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                resultSet.getString("lastname"),
                resultSet.getString("email"),
                resultSet.getString("phone_number")
                
        );
    }
}