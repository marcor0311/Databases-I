package tec.bd.gui;

import tec.bd.ApplicationContext;
import javax.swing.JOptionPane;
public class byZipReportFrame extends javax.swing.JFrame {
    public byZipReportFrame() {
        initComponents();
    }
    private javax.swing.JScrollPane zipJscroll;
    private javax.swing.JTextField findZipCode;
    private javax.swing.JTextArea VariblesJTextArea;
    private javax.swing.JButton getButton;
    private javax.swing.JButton cancelButton;
    private javax.swing.JScrollPane elementPanel;
    private javax.swing.JTextArea zipText;
    private javax.swing.JLabel zipLabel;
    private static ApplicationContext APP_CONTEXT = ApplicationContext.init();
    private void initComponents() {
        zipLabel = new javax.swing.JLabel();
        zipJscroll = new javax.swing.JScrollPane();
        zipText = new javax.swing.JTextArea();
        elementPanel = new javax.swing.JScrollPane();
        findZipCode = new javax.swing.JTextField();
        VariblesJTextArea = new javax.swing.JTextArea();
        cancelButton = new javax.swing.JButton();
        getButton = new javax.swing.JButton();
        zipText.setColumns(20);
        zipText.setRows(5);
        elementPanel.setViewportView(zipText);
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Report By Zip");
        getButton.setText("Get Report");
        zipLabel.setText("Zip Code");
        cancelButton.setText("Cancel Report");
        VariblesJTextArea.setColumns(20);
        VariblesJTextArea.setRows(5);
        zipJscroll.setViewportView(VariblesJTextArea);
        getButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                getButtonActionPerformed(evt);
            }
        });
        cancelButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelButtonActionPerformed(evt);
            }
        });
        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(74, 74, 74)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(getButton)
                        .addGap(83, 83, 83)
                        .addComponent(cancelButton))
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                        .addComponent(zipLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(findZipCode, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(zipJscroll, javax.swing.GroupLayout.Alignment.LEADING))
                .addContainerGap(95, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(62, 62, 62)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(zipLabel)
                    .addComponent(findZipCode, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(48, 48, 48)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(getButton)
                    .addComponent(cancelButton))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 32, Short.MAX_VALUE)
                .addComponent(zipJscroll, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(25, 25, 25))
        );
        pack();
    }
    private void getButtonActionPerformed(java.awt.event.ActionEvent evt) {
        try{
        String zipCode = this.findZipCode.getText();
        var weatherService = APP_CONTEXT.getWeatherService();
        var report = weatherService.getByZipCode(zipCode);
        var humidity = Float.toString(report.getHumidity());
        var pressure = Float.toString(report.getPressure());
        var temperature = Float.toString(report.getTemperature());
        var maxTemperature = Float.toString(report.getMaxTemperature());
        var minTemperature = Float.toString(report.getMinTemperature());
        this.VariblesJTextArea.append("Temperature " + temperature + "\n");
        this.VariblesJTextArea.append("Humidity " + humidity + "\n");
        this.VariblesJTextArea.append("Pressure " + pressure + "\n");
        this.VariblesJTextArea.append("Max Temperature " + maxTemperature + "\n");
        this.VariblesJTextArea.append("Min Temperature " + minTemperature + "\n");
        }
        catch(Exception e){
           JOptionPane.showMessageDialog(null, e);
        }
    }
    private void cancelButtonActionPerformed(java.awt.event.ActionEvent evt) {
       this.dispose();
    }
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new byZipReportFrame().setVisible(true);
            }
        });
    }
}