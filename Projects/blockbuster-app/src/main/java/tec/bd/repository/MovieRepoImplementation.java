package tec.bd.repository;
import com.zaxxer.hikari.HikariDataSource;
import tec.bd.entity.MovieEntity;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import static tec.bd.repository.Queries.*;
public class MovieRepoImplementation extends BaseRepository<MovieEntity, Integer> implements MovieRepository {
    private final static Logger LOGGER = LoggerFactory.getLogger(MovieRepoImplementation.class);
    public MovieRepoImplementation(HikariDataSource hikariDataSource) {
        super(hikariDataSource);
    }
    @Override
    public List<MovieEntity> findAll() {
        try {
            return this.query(MOVIES_FIND_ALL_QUERY);
        } catch (SQLException e) {
            LOGGER.error("Error finding movies", e);
            throw new RuntimeException(e);
        }
    }
    @Override
    public Optional<MovieEntity> findById(Integer entityId) {
        try {
            PreparedStatement stmt = this.connect().prepareStatement(MOVIES_FIND_BY_ID_QUERY);
            stmt.setInt(1, entityId);
            return this.query(stmt)
                    .stream()
                    .findFirst();
        } catch (SQLException e) {
            LOGGER.error("Error finding movie", e);
            throw new RuntimeException(e);
        }
    }
    @Override
    public int save(MovieEntity entity) {
        try (var conn = this.connect()) {
            conn.setAutoCommit(false);
            conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            Savepoint savepointOne = conn.setSavepoint("savepoint_one");
            try (PreparedStatement stmt = conn.prepareStatement(MOVIES_INSERT_QUERY, PreparedStatement.RETURN_GENERATED_KEYS)) {
                stmt.setString(1, entity.getTitle());
                stmt.setDate(2, new java.sql.Date(entity.getReleaseDate().getTime()));
                stmt.setInt(3, entity.getCategoryID());
                stmt.setInt(4, entity.getUnitsAvailable());
                int rowsAffected = stmt.executeUpdate();
                conn.commit();
                LOGGER.debug("Rows Affected: ", rowsAffected);
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int newMovieID = generatedKeys.getInt(1);
                    entity.setId(newMovieID);
                    System.out.println("Movie created. ID: " + newMovieID);
                    return newMovieID;
                }
            } catch (SQLException e) {
                try {
                    LOGGER.debug("Transaction is being rolled back");
                    conn.rollback(savepointOne);
                } catch (Exception rex) {
                    LOGGER.error("Can't rollback savepointOne operation", rex);
                    throw new RuntimeException(rex);
                }
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
            LOGGER.error("Error saving movie", e);
            throw new RuntimeException(e);
        }
        return 0; // Return 0 to indicate failure if the movie is not created
    }
    @Override
    public void delete(Integer entityId) {
        try (var conn = this.connect()) {
            conn.setAutoCommit(false);
            conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            Savepoint savepointOne = conn.setSavepoint("savepoint_one");
            try (PreparedStatement stmt = conn.prepareStatement(MOVIES_DELETE_MOVIE_ID, PreparedStatement.RETURN_GENERATED_KEYS)) {
                stmt.setInt(1, entityId);
                stmt.executeUpdate();
                conn.commit();
                stmt.getGeneratedKeys();
                System.out.println("Movie deleted");
            } catch (SQLException e) {
                try {
                    LOGGER.debug("Transaction is being rolled out");
                    conn.rollback(savepointOne);
                } catch (Exception rex) {
                    LOGGER.error("Can't rollback savepointOne operation", rex);
                    throw new RuntimeException(rex);
                }
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
            LOGGER.error("Error saving movie", e);
            throw new RuntimeException(e);
        }
    }
    @Override
    public MovieEntity update(MovieEntity entity) {
        try (var conn = this.connect()) {
            conn.setAutoCommit(false);
            conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            Savepoint savepointOne = conn.setSavepoint("savepoint_one");
            try (PreparedStatement stmt = conn.prepareStatement(MOVIES_UPDATE_MOVIE, PreparedStatement.RETURN_GENERATED_KEYS)) {
                stmt.setString(1, entity.getTitle());
                stmt.setDate(2, new java.sql.Date(entity.getReleaseDate().getTime()));
                stmt.setInt(3, entity.getCategoryID());
                stmt.setInt(4, entity.getUnitsAvailable());
                stmt.setInt(5, entity.getId());
                var rowsAffected = stmt.executeUpdate();
                conn.commit();
                LOGGER.debug("Rows Affected: ", rowsAffected);
                stmt.getGeneratedKeys();
                System.out.println("Movie updated");
                return entity;
            } catch (SQLException e) {
                try {
                    LOGGER.debug("Transaction is being rolled out");
                    conn.rollback(savepointOne);
                } catch (Exception rex) {
                    LOGGER.error("Can't rollback savepointOne operation", rex);
                    throw new RuntimeException(rex);
                }
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
            LOGGER.error("Error saving movie", e);
            throw new RuntimeException(e);
        }
        return entity;
    }
    @Override
    protected MovieEntity toEntity(ResultSet resultSet) throws SQLException {
        return new MovieEntity(
                resultSet.getInt("id"),
                resultSet.getString("title"),
                resultSet.getDate("release_date"),
                resultSet.getInt("category_id"),
                resultSet.getInt("units_available")
        );
    }
}
