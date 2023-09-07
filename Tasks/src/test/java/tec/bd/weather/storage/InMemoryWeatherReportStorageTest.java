package tec.bd.weather.storage;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;

import static org.junit.Assert.assertTrue;

import tec.bd.weather.model.Report;
import tec.bd.weather.model.ReportType;
import tec.bd.weather.storage.InMemoryWeatherReportStorage;

public class InMemoryWeatherReportStorageTest {

    /*
    Este test case se tiene que implementar
     */

    @Test
    public void findReport() {
        InMemoryWeatherReportStorage storage = new InMemoryWeatherReportStorage();
        Report report = new Report();
        report.setDate(new Date());
        report.setLocation("Alajuela");
        report.setReportType(ReportType.BY_CITY);
        storage.save(report);
        assertNotNull(storage.find(storage.generateKeyFromReport(report)));
    }

    @Test
    public void findAllReports() {
        InMemoryWeatherReportStorage storage = new InMemoryWeatherReportStorage();
        Report report = new Report();
        report.setDate(new Date());
        report.setLocation("Alajuela");
        report.setReportType(ReportType.BY_CITY);
        storage.save(report);

        report.setDate(new Date());
        report.setLocation("Heredia");
        report.setReportType(ReportType.BY_CITY);
        storage.save(report);

        report.setDate(new Date());
        report.setLocation("Cartago");
        report.setReportType(ReportType.BY_CITY);
        storage.save(report);

        assertNotNull(storage.find());
    }

    @Test
    public void saveReport() {
        InMemoryWeatherReportStorage storage = new InMemoryWeatherReportStorage();
        Report report = new Report();
        report.setDate(new Date());
        report.setLocation("Alajuela");
        report.setReportType(ReportType.BY_CITY);
        storage.save(report);

        assertNotNull(storage);
    }

    @Test
    public void updateReport() {
        InMemoryWeatherReportStorage storage = new InMemoryWeatherReportStorage();
        Report report = new Report();
        report.setDate(new Date());
        report.setLocation("Alajuela");
        report.setReportType(ReportType.BY_CITY);
        storage.save(report);
        storage.update(report);
        assertNotNull(storage);
    }

    @Test
    public void deleteReport() {
        InMemoryWeatherReportStorage storage = new InMemoryWeatherReportStorage();
        Report report = new Report();
        report.setDate(new Date());
        report.setLocation("Alajuela");
        report.setReportType(ReportType.BY_CITY);

        storage.save(report);
        storage.remove(storage.generateKeyFromReport(report));

        assertNull(storage.find(storage.generateKeyFromReport(report)));
    }
}