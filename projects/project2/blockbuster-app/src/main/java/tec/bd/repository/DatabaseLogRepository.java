package tec.bd.repository;
import java.util.List;
import tec.bd.entity.DataBaseLog;
public interface DatabaseLogRepository extends CRUDRepository<DataBaseLog, Integer> {
    List<DataBaseLog> findLastN(int n);
}