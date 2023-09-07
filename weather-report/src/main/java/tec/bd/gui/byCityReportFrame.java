package tec.bd.gui;

import javax.swing.JOptionPane;
import tec.bd.ApplicationContext;

public class byCityReportFrame extends javax.swing.JFrame {
    public byCityReportFrame() {
        initComponents();
    }
    private javax.swing.JTextField cityJTextField;
    private javax.swing.JButton reportButton;
    private javax.swing.JButton cancelReportButton;
    private javax.swing.JLabel cityJLabel;
    private javax.swing.JScrollPane ValuePanel;
    private javax.swing.JTextArea cityJTextArea;
    private static ApplicationContext APP_CONTEXT = ApplicationContext.init();
    private void initComponents() {
        cityJLabel = new javax.swing.JLabel();
        cityJTextField = new javax.swing.JTextField();
        reportButton = new javax.swing.JButton();
        cancelReportButton = new javax.swing.JButton();
        ValuePanel = new javax.swing.JScrollPane();
        cityJTextArea = new javax.swing.JTextArea();
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Report by City");
        cityJLabel.setText("City Name");
        reportButton.setText("Get Report");
        cancelReportButton.setText("Cancel Report");
        cityJTextField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cityJTextFieldActionPerformed(evt);
            }
        });
        reportButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                reportButtonActionPerformed(evt);
            }
        });
        cancelReportButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelReportButtonActionPerformed(evt);
            }
        });
        cityJTextArea.setColumns(20);
        cityJTextArea.setRows(5);
        ValuePanel.setViewportView(cityJTextArea);
        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(78, 78, 78)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(ValuePanel)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(4, 4, 4)
                                .addComponent(cityJLabel))
                            .addComponent(reportButton))
                        .addGap(22, 22, 22)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(cancelReportButton)
                            .addComponent(cityJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap(88, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(66, 66, 66)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cityJLabel)
                    .addComponent(cityJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(41, 41, 41)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(reportButton)
                    .addComponent(cancelReportButton))
                .addGap(18, 18, 18)
                .addComponent(ValuePanel, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(31, Short.MAX_VALUE))
        );
        pack();
    }
    private void cityJTextFieldActionPerformed(java.awt.event.ActionEvent evt) {
    }
    private void reportButtonActionPerformed(java.awt.event.ActionEvent evt) {
    try{    
    String cityName = this.cityJTextField.getText();
    var weatherService = APP_CONTEXT.getWeatherService();
    var report = weatherService.getByCity(cityName); 
    var humidity = Float.toString(report.getHumidity());
    var pressure = Float.toString(report.getPressure());
    var temperature = Float.toString(report.getTemperature());
    var maxTemperature = Float.toString(report.getMaxTemperature());
    var minTemperature = Float.toString(report.getMinTemperature());
    this.cityJTextArea.append("Temperature " + temperature + "\n");
    this.cityJTextArea.append("Humidity " + humidity + "\n");
    this.cityJTextArea.append("Pressure " + pressure + "\n");
    this.cityJTextArea.append("Max Temperature " + maxTemperature + "\n");
    this.cityJTextArea.append("Min Temperature " + minTemperature + "\n");
    }
    catch(Exception e){
           JOptionPane.showMessageDialog(null, e);
        }
    }
    private void cancelReportButtonActionPerformed(java.awt.event.ActionEvent evt){
        this.dispose();
    }
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new byCityReportFrame().setVisible(true);
            }
        });
    }
}