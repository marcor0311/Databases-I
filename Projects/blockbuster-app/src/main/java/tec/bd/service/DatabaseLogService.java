package tec.bd.service;
import java.util.List;
import tec.bd.entity.DataBaseLog;
public interface DatabaseLogService {
    List<DataBaseLog> getLogs();
    List<DataBaseLog> getTheLogs(int n);
    void printLog (DataBaseLog log);
}
