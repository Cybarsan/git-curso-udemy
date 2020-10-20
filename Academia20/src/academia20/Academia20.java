/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academia20;

import formularios.FrmLogin;

/**
 *
 * @author PC_Toshiba15
 */
public class Academia20 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(FrmLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        formularios.FrmLogin prin = new formularios.FrmLogin();
        prin.setLocationRelativeTo(null);
        prin.setVisible(true);

    }
}
