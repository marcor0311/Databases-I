package tec.bd.repository;
import com.zaxxer.hikari.HikariDataSource;
import tec.bd.entity.RentalEntity;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import static tec.bd.repository.Queries.*;
public class RentalRepoImplementation extends BaseRepository<RentalEntity, Integer> implements RentalRepository {
    public RentalRepoImplementation(HikariDataSource hikariDataSource) {
        super(hikariDataSource);
    }
    @Override
    public List<RentalEntity> findAll() {
        try {
            return this.query(RENTAL_FIND_ALL_QUERY);
        } catch (SQLException e) {
            System.out.println("Error finding rental");
            throw new RuntimeException(e);
        }
    }
    @Override
    public Optional<RentalEntity> findById(Integer entityId) {
        try {
            PreparedStatement stmt = this.connect().prepareStatement(RENTAL_FIND_BY_ID_QUERY);
            stmt.setInt(1, entityId);
            return this.query(stmt)
                    .stream()
                    .findFirst();
        } catch (SQLException e) {
            System.out.println("Error finding rental");
            throw new RuntimeException(e);
        }
    }
    @Override
    public int save(RentalEntity entity) {
        try {
            var cstmt = this.connect().prepareCall(RENTAL_CREATE_RENTAL_PROC_CALL);
            cstmt.setInt("p_client_id", entity.getClientID());
            cstmt.setInt("p_movie_id", entity.getMovieID());
            cstmt.setDate("p_rental_date", new java.sql.Date(entity.getRentalDate().getTime()));
            cstmt.registerOutParameter("p_new_rental", Types.INTEGER);
            cstmt.executeUpdate();
            var newrentalId = cstmt.getInt("p_new_rental");
            cstmt.close();
            return newrentalId;
        } catch (SQLException e) {
            System.out.println("Error stored procedure");
            throw new RuntimeException(e);
        }
    }
    @Override
    public void delete(Integer entityId) {
        try {
            var cstmt = this.connect().prepareCall(RENTAL_DELETE_RENTAL_PROC_CALL);
            cstmt.setInt("p_id", entityId);
            cstmt.registerOutParameter("procedure_completed", Types.INTEGER);
            int affectedRows= cstmt.executeUpdate();
            var procedure_completed = cstmt.getInt("procedure_completed");
            if(procedure_completed==-1){
                throw new RuntimeException();   
            }
            System.out.println("Delete rental, rows that have been affected "+affectedRows); 
        } catch (SQLException e) {
            System.out.println("Error deleting category \n "+e.getMessage());
            throw new RuntimeException(e);
        }
        catch (Exception a) {
            System.out.println("Procedure not done");
            throw new RuntimeException(a);
        }
    }
    @Override
    public RentalEntity update(RentalEntity entity) {
         try {
            var cstmt = this.connect().prepareCall(RENTAL_UPDATE_RENTAL_PROC_CALL);      
            cstmt.setInt("p_id", entity.getID());      
            cstmt.setDate("p_rental_date", new java.sql.Date(entity.getRentalDate().getTime()));
            cstmt.setInt("p_client_id", entity.getClientID());
            cstmt.setInt("p_movie_id", entity.getMovieID());
            cstmt.registerOutParameter("p_procedure_status", Types.INTEGER);
            int affectedRows= cstmt.executeUpdate();
            var procedure_completed = cstmt.getInt("p_procedure_status");
            if(procedure_completed==-1){
                throw new RuntimeException();  
            }
            System.out.println("Updated Rental, rows that have been affected "+ affectedRows);
            return entity;
        } catch (SQLException e) {
            System.out.println("Error updating rental");
            throw new RuntimeException(e);
        }
        catch (Exception a) {
            System.out.println("Non existing");
            throw new RuntimeException(a);
        }
    }
    @Override
    protected RentalEntity toEntity(ResultSet resultSet) throws SQLException {
        return new RentalEntity(
                resultSet.getInt("id"),resultSet.getDate("rental_date"),resultSet.getInt("client_id"),resultSet.getInt("movie_id")
        );
    }
}