package tec.bd.repository;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import tec.bd.entity.DataBaseLog;
import java.sql.*;
import static tec.bd.repository.Queries.*;
public class DatabaseLogRepoImplementation extends BaseRepository<DataBaseLog, Integer> implements DatabaseLogRepository {
    public DatabaseLogRepoImplementation(HikariDataSource hikariDataSource) {
        super(hikariDataSource);
    }
    @Override
    public List<DataBaseLog> findAll() {
        try {
            return this.query(FIND_ALL_FROM_LOG);
        } catch (SQLException e) {
            System.out.println("Error finding logs");
            throw new RuntimeException(e);
        }
    }
    @Override
    public List<DataBaseLog> findLastN(int n) {
        try {
            PreparedStatement stmt = this.connect().prepareStatement(FIND_N_FROM_LOG);
            stmt.setInt(1, n);
            return this.query(stmt);
        } catch (SQLException e) {
            System.out.println("Error finding log");
            throw new RuntimeException(e);
        }
    }
    @Override
    public int save(DataBaseLog entity) {
                throw new UnsupportedOperationException("No disponible");
    }
    @Override
    protected DataBaseLog toEntity(ResultSet resultSet) throws SQLException {
        return new DataBaseLog(
                resultSet.getInt("id"),
                resultSet.getString("table_name"),
                
                resultSet.getDate("created_on"),
                                resultSet.getString("entry_text")
                                );
                            }
                            @Override
                            public void delete(Integer entityID) {
                                throw new UnsupportedOperationException("No disponible"); 
                            }
                            @Override
                            public DataBaseLog update(DataBaseLog entity) {
                                throw new UnsupportedOperationException("No disponible"); 
                            }
                            @Override
                            public Optional<DataBaseLog> findById(Integer entityID) {
                                throw new UnsupportedOperationException("No disponible");   
                            }
                        }