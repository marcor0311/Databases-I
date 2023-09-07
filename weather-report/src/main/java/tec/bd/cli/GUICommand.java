
package tec.bd.cli;

import picocli.CommandLine;
import tec.bd.ApplicationContext;
import tec.bd.gui.MainFrame;
import javax.swing.*;


@CommandLine.Command(name = "-gui", description = "Open App in GUI mode")
public class GUICommand implements Runnable {

    

    private static ApplicationContext APP_CONTEXT = ApplicationContext.init();

    //x
    
    @Override
    public void run() {
        System.out.println("GUI");
        JFrame frame = new MainFrame();
        frame.setSize(400, 400);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}