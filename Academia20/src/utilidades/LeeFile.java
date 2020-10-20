/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilidades;

import java.io.File;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;



/**
 *
 * @author PC_Toshiba15
 */
public class LeeFile {
    
   public static String ipserver = "";
   public static String username = "";
   public static String passw = "";
    
    public static void main(String args[]) {
        try {
            
            File in = new File("");
            String x = in.getAbsolutePath();
            x = x + in.toString() + "\\src\\utilidades\\ConfAcademic.xml";
            
            File archivo = new File("/ruta/datos.xml");
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder documentBuilder = dbf.newDocumentBuilder();
            Document document = documentBuilder.parse(x);
            document.getDocumentElement().normalize();
            System.out.println("Elemento raiz:" + document.getDocumentElement().getNodeName());
            NodeList listaEmpleados = document.getElementsByTagName("configuracion");
            for (int temp = 0; temp < listaEmpleados.getLength(); temp++) {
                Node nodo = listaEmpleados.item(temp);
                System.out.println("Elemento:" + nodo.getNodeName());
                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) nodo;
                    ipserver = element.getElementsByTagName("ipserver").item(0).getTextContent();
                    System.out.println("ip: " + ipserver);
                    username = element.getElementsByTagName("username").item(0).getTextContent();
                    System.out.println("username: " + username);
                    passw = element.getElementsByTagName("password").item(0).getTextContent();
                    System.out.println("password: " + passw);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
}

    public String getIpserver() {
        return ipserver;
    }

    public void setIpserver(String ipserver) {
        this.ipserver = ipserver;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassw() {
        return passw;
    }

    public void setPassw(String passw) {
        this.passw = passw;
    }
    }
