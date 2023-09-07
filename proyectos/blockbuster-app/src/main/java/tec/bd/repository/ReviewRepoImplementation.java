package tec.bd.repository;

import com.zaxxer.hikari.HikariDataSource;
import tec.bd.entity.ReviewEntity;

import java.sql.*;
import java.util.List;
import java.util.Optional;

import static tec.bd.repository.Queries.*;

public class ReviewRepoImplementation extends BaseRepository<ReviewEntity, Integer> implements ReviewRepository {

    public ReviewRepoImplementation(HikariDataSource hikariDataSource) {
        super(hikariDataSource);
    }

    @Override
    public List<ReviewEntity> findAll() {
        try {
            return this.query(REVIEW_FIND_ALL_QUERY);
        } catch (SQLException e) {
            System.out.println("Error finding review");
            throw new RuntimeException(e);
        }
    }

    @Override
    public Optional<ReviewEntity> findById(Integer entityId) {
        try {
            PreparedStatement stmt = this.connect().prepareStatement(REVIEW_FIND_BY_ID_QUERY);
            stmt.setInt(1, entityId);
            return this.query(stmt)
                    .stream()
                    .findFirst();
        } catch (SQLException e) {
            System.out.println("Error finding review");
            throw new RuntimeException(e);
        }
    }

    @Override
    public int save(ReviewEntity entity) {
        try {
            var cstmt = this.connect().prepareCall(REVIEW_CREATE_REVIEW_PROC_CALL);
            cstmt.setInt("p_client_id", entity.getClientID());
            cstmt.setInt("p_movie_id", entity.getMovieID());
            cstmt.setBigDecimal("p_rating", entity.getRating());
            cstmt.setString("p_review_text", entity.getReviewText());
            cstmt.setDate("p_created_on", new java.sql.Date(entity.getCreatedOn().getTime()));
            cstmt.registerOutParameter("p_new_review", Types.INTEGER);
            cstmt.executeUpdate();
            var newrentalId = cstmt.getInt("p_new_review");
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
            var cstmt = this.connect().prepareCall(REVIEW_DELETE_REVIEW_PROC_CALL);
            cstmt.setInt("p_id", entityId);
            cstmt.registerOutParameter("procedure_completed", Types.INTEGER);
            int affectedRows = cstmt.executeUpdate();
            var procedure_completed = cstmt.getInt("procedure_completed");
            if (procedure_completed == -1) {
                throw new RuntimeException();
            }
            System.out.println("Delete review, rows that have been affected " + affectedRows);

        } catch (SQLException e) {
            System.out.println("Error deleting review \n " + e.getMessage());
            throw new RuntimeException(e);
        } catch (Exception a) {
            System.out.println("Procedure not done");
            throw new RuntimeException(a);
        }
    }

    @Override
    public ReviewEntity update(ReviewEntity entity) {
        try {
            var cstmt = this.connect().prepareCall(REVIEW_UPDATE_REVIEW_PROC_CALL);
            cstmt.setInt("p_id", entity.getID());
            cstmt.setInt("p_client_id", entity.getClientID());
            cstmt.setInt("p_movie_id", entity.getMovieID());
            cstmt.setBigDecimal("p_rating", entity.getRating());
            cstmt.setString("p_review_text", entity.getReviewText());
            cstmt.setDate("p_created_on", new java.sql.Date(entity.getCreatedOn().getTime()));
            cstmt.registerOutParameter("p_procedure_status", Types.INTEGER);
            int affectedRows = cstmt.executeUpdate();
            var procedure_completed = cstmt.getInt("p_procedure_status");
            if (procedure_completed == -1) {
                throw new RuntimeException();
            }
            System.out.println("Updated Review, rows that have been affected " + affectedRows);
            return entity;
        } catch (SQLException e) {
            System.out.println("Error updating rental");
            throw new RuntimeException(e);
        } catch (Exception a) {
            System.out.println("Probably there is nothing");
            throw new RuntimeException(a);
        }
    }

    @Override
    protected ReviewEntity toEntity(ResultSet resultSet) throws SQLException {
        return new ReviewEntity(
                resultSet.getInt("id"),
                resultSet.getBigDecimal("rating"),
                resultSet.getString("review_text"),
                resultSet.getDate("created_on"),
                resultSet.getInt("client_id"),
                resultSet.getInt("movie_id")
        );
    }
}
