package tec.bd.gui;

import javax.swing.JFrame;

public class MainFrame extends javax.swing.JFrame {
    public MainFrame() {
        initComponents();
        this.setExtendedState(this.getExtendedState() | JFrame.MAXIMIZED_BOTH);
    }
    private javax.swing.JMenu menuSecundario;
    private javax.swing.JMenuItem itemPrincipal;
    private javax.swing.JPopupMenu.Separator separador;
    private javax.swing.JToolBar toolBar;
    private javax.swing.JMenuBar menuBar;
    private javax.swing.JMenuItem cityItem;
    private javax.swing.JMenu reportWeather;
    private javax.swing.JMenuItem zipItem;
    private void initComponents() {
        separador = new javax.swing.JPopupMenu.Separator();
        cityItem = new javax.swing.JMenuItem();
        menuSecundario = new javax.swing.JMenu();
        toolBar = new javax.swing.JToolBar();
        menuBar = new javax.swing.JMenuBar();
        reportWeather = new javax.swing.JMenu();
        zipItem = new javax.swing.JMenuItem();
        itemPrincipal = new javax.swing.JMenuItem();
        toolBar.setRollover(true);
        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Weather Report");
        reportWeather.setText("Reports");
        zipItem.setText("By Zip Code");
        cityItem.setText("By City Name");
        zipItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                zipItemActionPerformed(evt);
            }
        });
        reportWeather.add(zipItem);
        reportWeather.add(separador);
        cityItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cityItemActionPerformed(evt);
            }
        });
        reportWeather.add(cityItem);
        menuBar.add(reportWeather);
        menuSecundario.setText("Help");
        itemPrincipal.setText("About Weather Report");
        itemPrincipal.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                itemPrincipalActionPerformed(evt);
            }
        });
        menuSecundario.add(itemPrincipal);
        menuBar.add(menuSecundario);
        setJMenuBar(menuBar);
        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 277, Short.MAX_VALUE)
        );
        pack();
    }
    private void zipItemActionPerformed(java.awt.event.ActionEvent evt) {
       JFrame frame = new byZipReportFrame();
       frame.setSize(400, 400);
       frame.setLocationRelativeTo(null);
       frame.setVisible(true);
    }
    private void cityItemActionPerformed(java.awt.event.ActionEvent evt) {
        JFrame frame = new byCityReportFrame(); 
        frame.setSize(400, 400);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);  
    }
    private void itemPrincipalActionPerformed(java.awt.event.ActionEvent evt) {
        JFrame frame = new aboutInfoJFrame();
        frame.setSize(400, 400);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainFrame().setVisible(true);
            }
        });
    }
}
