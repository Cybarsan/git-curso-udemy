/*
 * Todo los derechos reservados, Alan Sanier, Analista de Sistemas.
 */

package entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author PC_Toshiba15
 */
@Entity
@Table(name = "parientes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Parientes.findAll", query = "SELECT p FROM Parientes p"),
    @NamedQuery(name = "Parientes.findByIdparientes", query = "SELECT p FROM Parientes p WHERE p.idparientes = :idparientes"),
    @NamedQuery(name = "Parientes.findByNrocedula", query = "SELECT p FROM Parientes p WHERE p.nrocedula = :nrocedula"),
    @NamedQuery(name = "Parientes.findByNombres", query = "SELECT p FROM Parientes p WHERE p.nombres = :nombres"),
    @NamedQuery(name = "Parientes.findByApellidos", query = "SELECT p FROM Parientes p WHERE p.apellidos = :apellidos"),
    @NamedQuery(name = "Parientes.findByCelular", query = "SELECT p FROM Parientes p WHERE p.celular = :celular"),
    @NamedQuery(name = "Parientes.findByTelefono", query = "SELECT p FROM Parientes p WHERE p.telefono = :telefono"),
    @NamedQuery(name = "Parientes.findByMail", query = "SELECT p FROM Parientes p WHERE p.mail = :mail")})
public class Parientes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idparientes")
    private Integer idparientes;
    @Column(name = "nrocedula")
    private String nrocedula;
    @Column(name = "nombres")
    private String nombres;
    @Column(name = "apellidos")
    private String apellidos;
    @Column(name = "celular")
    private String celular;
    @Column(name = "telefono")
    private String telefono;
    @Column(name = "mail")
    private String mail;
    @JoinColumn(name = "idalumnos", referencedColumnName = "idalumno")
    @ManyToOne(optional = false)
    private Alumnos idalumnos;

    public Parientes() {
    }

    public Parientes(Integer idparientes) {
        this.idparientes = idparientes;
    }

    public Integer getIdparientes() {
        return idparientes;
    }

    public void setIdparientes(Integer idparientes) {
        this.idparientes = idparientes;
    }

    public String getNrocedula() {
        return nrocedula;
    }

    public void setNrocedula(String nrocedula) {
        this.nrocedula = nrocedula;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Alumnos getIdalumnos() {
        return idalumnos;
    }

    public void setIdalumnos(Alumnos idalumnos) {
        this.idalumnos = idalumnos;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idparientes != null ? idparientes.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Parientes)) {
            return false;
        }
        Parientes other = (Parientes) object;
        if ((this.idparientes == null && other.idparientes != null) || (this.idparientes != null && !this.idparientes.equals(other.idparientes))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Parientes[ idparientes=" + idparientes + " ]";
    }
    
}
