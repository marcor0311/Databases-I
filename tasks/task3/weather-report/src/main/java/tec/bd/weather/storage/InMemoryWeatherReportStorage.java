package tec.bd.weather.storage;

import tec.bd.weather.model.Report;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class InMemoryWeatherReportStorage implements WeatherReportStorage {

    private Map<String, Report> db;

    public InMemoryWeatherReportStorage() {
        this.db = new LinkedHashMap<>();
    }

    @Override
    public void save(Report report) {
        db.put(generateKeyFromReport(report), report);
    }

    @Override
    public void remove(String reportKey) {
        db.remove(reportKey);
    }

    @Override
    public Report update(Report oldReport) {
        Report newReport = new Report();
        db.put(generateKeyFromReport(oldReport), oldReport);
        return newReport;
    }

    @Override
    public Report find(String reportKey) {
        return db.get(reportKey);
    }

    @Override
    public List<Report> find() {
        List<Report> reportList = new ArrayList<Report>(db.values());
        return reportList;
    }

    String generateKeyFromReport(Report report) {
        var dateFormat = new SimpleDateFormat("dd-MM-YYYY");
        return (dateFormat.format(report.getDate()) + "-" + report.getReportType() + "-" + report.getLocation());
    }
}
