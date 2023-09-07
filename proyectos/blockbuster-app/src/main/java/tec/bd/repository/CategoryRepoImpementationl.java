package tec.bd.repository;

import com.zaxxer.hikari.HikariDataSource;
import tec.bd.entity.CategoryEntity;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import static tec.bd.repository.Queries.*;
public class CategoryRepoImpementationl extends BaseRepository<CategoryEntity, Integer> implements CategoryRepository {
    public CategoryRepoImpementationl(HikariDataSource hikariDataSource) {
        super(hikariDataSource);
    }
    @Override
    public List<CategoryEntity> findAll() {
        try {
            return this.query(CATEGORY_FIND_ALL_QUERY);
        } catch (SQLException e) {
            System.out.println("Error when finding category");
            throw new RuntimeException(e);
        }
    }
    @Override
    public Optional<CategoryEntity> findById(Integer entityId) {
        try {
            PreparedStatement stmt = this.connect().prepareStatement(CATEGORY_FIND_BY_ID_QUERY);
            stmt.setInt(1, entityId);
            
            return this.query(stmt)
                    .stream()
                    .findFirst();
        } catch (SQLException e) {
            System.out.println("Error when finding category");
            throw new RuntimeException(e);           
        }
    }
    @Override
    public int save(CategoryEntity entity) {
        try {
            var cstmt = this.connect().prepareCall(CATEGORY_CREATE_CATEGORY_PROC_CALL);
            cstmt.setString("p_name", entity.getName());
            cstmt.setString("p_description", entity.getDescription());         
            cstmt.registerOutParameter("p_new_category_id", Types.INTEGER);
            cstmt.executeUpdate();
            var newcategoryId = cstmt.getInt("p_new_category_id");          
            cstmt.close();
            return newcategoryId;
        } catch (SQLException e) {
            System.out.println("Error with stored procedure");
            throw new RuntimeException(e);
        }
    }
    @Override
    public void delete(Integer entityId) {
        try {
            var cstmt = this.connect().prepareCall(CATEGORY_DELETE_CATEGORY_PROC_CALL);     
            cstmt.setInt("p_id", entityId);
            cstmt.registerOutParameter("procedure_completed", Types.INTEGER);
            int affectedRows= cstmt.executeUpdate();
            var procedure_completed = cstmt.getInt("procedure_completed");
            if(procedure_completed==-1){
                throw new RuntimeException();  
            }
            System.out.println("Delete category, rows that have been affected "+affectedRows);
        } catch (SQLException e) {
            System.out.println("Error deleting category \n "+e.getMessage());
            
            throw new RuntimeException(e);
        }
        catch (Exception a) {
            
            System.out.println("Procedure failed");
            throw new RuntimeException(a);
        }
    }
    @Override
    public CategoryEntity update(CategoryEntity entity) {
         try {
            var cstmt = this.connect().prepareCall(CATEGORY_UPDATE_CATEGORY_PROC_CALL);        
            cstmt.setInt("p_id", entity.getId());
            cstmt.setString("p_name", entity.getName());
            cstmt.setString("p_description", entity.getDescription());
            cstmt.registerOutParameter("process_status", Types.INTEGER);
            int affectedRows= cstmt.executeUpdate();
            var procedure_completed = cstmt.getInt("process_status");
            if(procedure_completed==-1){
                throw new RuntimeException();   
            }
            System.out.println("Updated Category, rows that have been affected "+ affectedRows);
            return entity;
        } catch (SQLException e) {
            System.out.println("Error when updating category by Id in the DB");
            throw new RuntimeException(e);
        }
        catch (Exception a) {
            System.out.println("The category does not exists");
            throw new RuntimeException(a);
        }
    }
    @Override
    protected CategoryEntity toEntity(ResultSet resultSet) throws SQLException {  
        return new CategoryEntity(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                resultSet.getString("description")        
        );
    }
}