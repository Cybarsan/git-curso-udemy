/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formularios;

import entidades.Usuarios;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.KeyEvent;
import java.util.List;
import javax.persistence.*;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author PC_Toshiba15
 */
public class FrmLogin extends javax.swing.JFrame {

    public static EntityManagerFactory emf;
    public static EntityManager em;
    private Image imagajustada = null;
    private Icon icoescala = null;
    public static String usuario;
    public static String pass;
    public static Integer id;
    
     public void iniciar() {
        emf = Persistence.createEntityManagerFactory("Academia20PU");
        em = emf.createEntityManager();
    }

    /**
     * Creates new form FrmLogin
     */
    public FrmLogin() {
        initComponents();
        ajustaimagen();
        iniciar();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        LabelLogo = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jLUsuario = new javax.swing.JLabel();
        jLPassword = new javax.swing.JLabel();
        jTxboxUsuario = new javax.swing.JTextField();
        jPassBox = new javax.swing.JPasswordField();
        jPanel2 = new javax.swing.JPanel();
        jBtnAceptar = new javax.swing.JButton();
        jBtnCancelar = new javax.swing.JButton();

        jLabel1.setText("jLabel1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Academia de Danza Elizabeth Vinader");
        setIconImage(getIconImage());

        LabelLogo.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        LabelLogo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/Logo.png"))); // NOI18N
        LabelLogo.setToolTipText("Elizabeth Vinader");
        LabelLogo.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jLUsuario.setFont(new java.awt.Font("Dialog", 1, 14)); // NOI18N
        jLUsuario.setText("Usuario:");

        jLPassword.setFont(new java.awt.Font("Dialog", 1, 14)); // NOI18N
        jLPassword.setText("Contraseña:");

        jTxboxUsuario.setFont(new java.awt.Font("Dialog", 0, 13)); // NOI18N
        jTxboxUsuario.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                jTxboxUsuarioFocusGained(evt);
            }
        });
        jTxboxUsuario.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTxboxUsuarioKeyPressed(evt);
            }
        });

        jPassBox.setFont(new java.awt.Font("Dialog", 0, 10)); // NOI18N
        jPassBox.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                jPassBoxFocusGained(evt);
            }
        });
        jPassBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jPassBoxActionPerformed(evt);
            }
        });
        jPassBox.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jPassBoxKeyPressed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(37, 37, 37)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLPassword)
                    .addComponent(jLUsuario))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jTxboxUsuario)
                    .addComponent(jPassBox, javax.swing.GroupLayout.DEFAULT_SIZE, 152, Short.MAX_VALUE))
                .addContainerGap(102, Short.MAX_VALUE))
        );

        jPanel1Layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {jPassBox, jTxboxUsuario});

        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(28, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLUsuario)
                    .addComponent(jTxboxUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLPassword)
                    .addComponent(jPassBox, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(20, 20, 20))
        );

        jBtnAceptar.setText("Aceptar");
        jBtnAceptar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnAceptarActionPerformed(evt);
            }
        });

        jBtnCancelar.setText("Cancelar");
        jBtnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnCancelarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(40, 40, 40)
                .addComponent(jBtnAceptar, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jBtnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(57, 57, 57))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jBtnAceptar, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jBtnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(15, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(128, 128, 128)
                        .addComponent(LabelLogo, javax.swing.GroupLayout.PREFERRED_SIZE, 124, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(jPanel2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(LabelLogo, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jBtnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnCancelarActionPerformed
        this.dispose();
    }//GEN-LAST:event_jBtnCancelarActionPerformed

    private void jBtnAceptarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnAceptarActionPerformed
        if (controlUsuario() == true) {
            FrmPrincipal prin = new FrmPrincipal();
            prin.setVisible(true);
            prin.setExtendedState(prin.getExtendedState() | JFrame.MAXIMIZED_BOTH);
            this.dispose();
            usuario = jTxboxUsuario.getText().trim();
            pass = jPassBox.getText().trim();
            //prin.show();

        } else {
            JOptionPane.showMessageDialog(null, "Usuario o Contraseña incorrectos");
            jTxboxUsuario.requestFocus();
        }
    }//GEN-LAST:event_jBtnAceptarActionPerformed

    private void jPassBoxKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jPassBoxKeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            jBtnAceptar.requestFocus();
        }
    }//GEN-LAST:event_jPassBoxKeyPressed

    private void jTxboxUsuarioKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTxboxUsuarioKeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            jPassBox.requestFocus();
        }
    }//GEN-LAST:event_jTxboxUsuarioKeyPressed

    private void jPassBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jPassBoxActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jPassBoxActionPerformed

    private void jPassBoxFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_jPassBoxFocusGained
        jPassBox.selectAll();
    }//GEN-LAST:event_jPassBoxFocusGained

    private void jTxboxUsuarioFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_jTxboxUsuarioFocusGained
        jTxboxUsuario.selectAll();
    }//GEN-LAST:event_jTxboxUsuarioFocusGained

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FrmLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmLogin().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel LabelLogo;
    private javax.swing.JButton jBtnAceptar;
    private javax.swing.JButton jBtnCancelar;
    private javax.swing.JLabel jLPassword;
    private javax.swing.JLabel jLUsuario;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPasswordField jPassBox;
    private javax.swing.JTextField jTxboxUsuario;
    // End of variables declaration//GEN-END:variables

    private void ajustaimagen() {
        ImageIcon imgIcon = new ImageIcon(getClass().getResource("/imagenes/Logo.png"));
        Image imgEscalada = imgIcon.getImage().getScaledInstance(LabelLogo.getWidth(),
                LabelLogo.getHeight(), Image.SCALE_SMOOTH);
        Icon iconoEscalado = new ImageIcon(imgEscalada);
        icoescala = iconoEscalado;
        jLabel1.setIcon(iconoEscalado);
    }

    private boolean controlUsuario() {
        String vusuario = jTxboxUsuario.getText().trim();
        String vpass = jPassBox.getText().trim();
        List<Usuarios> listaUsu;
        em.getTransaction().begin();
        Query preg = em.createQuery("select u from Usuarios u where u.usuario = :Vusuario and u.contrasenia = :Vpass");
        preg.setParameter("Vusuario", vusuario);
        preg.setParameter("Vpass", vpass);
        //JOptionPane.showMessageDialog(null, "Usuario: " + vusuario + "\n\nPass: " + vpass);
        
        listaUsu = preg.getResultList();
        if (listaUsu.size() > 0) {

            id = listaUsu.get(0).getIdusuario();

            return true;
        }
        em.getTransaction().commit();
        return false;
    }
    
    @Override
    public Image getIconImage() {
        Image retValue = Toolkit.getDefaultToolkit().getImage(ClassLoader.getSystemResource("imagenes/Logo.png"));
        return retValue;
    }
    
}
