package tec.bd.weather;

import static org.junit.Assert.assertTrue;

import org.junit.jupiter.api.Test;

import tec.bd.weather.service.IMNProvider;

public class IMNProviderTest {
    @Test
    public void Pruebas() {
        IMNProvider imn = new IMNProvider();
        Report report = imn.byCity("x");
        assertTrue(report.getTemperature() ==0);
        assertTrue(report.getPressure()==0);

    }
}
