/*
 * Todo los derechos reservados, Alan Sanier, Analista de Sistemas.
 */

package entidades;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author PC_Toshiba15
 */
@Entity
@Table(name = "profesores")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Profesores.findAll", query = "SELECT p FROM Profesores p"),
    @NamedQuery(name = "Profesores.findByIdProfesor", query = "SELECT p FROM Profesores p WHERE p.idProfesor = :idProfesor"),
    @NamedQuery(name = "Profesores.findByApellidoProfesor", query = "SELECT p FROM Profesores p WHERE p.apellidoProfesor = :apellidoProfesor"),
    @NamedQuery(name = "Profesores.findByCedulaProfesor", query = "SELECT p FROM Profesores p WHERE p.cedulaProfesor = :cedulaProfesor"),
    @NamedQuery(name = "Profesores.findByCelular1", query = "SELECT p FROM Profesores p WHERE p.celular1 = :celular1"),
    @NamedQuery(name = "Profesores.findByCelular2", query = "SELECT p FROM Profesores p WHERE p.celular2 = :celular2"),
    @NamedQuery(name = "Profesores.findByMailProfesor", query = "SELECT p FROM Profesores p WHERE p.mailProfesor = :mailProfesor"),
    @NamedQuery(name = "Profesores.findByNombreProfesor", query = "SELECT p FROM Profesores p WHERE p.nombreProfesor = :nombreProfesor"),
    @NamedQuery(name = "Profesores.findByRucProfesor", query = "SELECT p FROM Profesores p WHERE p.rucProfesor = :rucProfesor"),
    @NamedQuery(name = "Profesores.findByNrocuenta", query = "SELECT p FROM Profesores p WHERE p.nrocuenta = :nrocuenta"),
    @NamedQuery(name = "Profesores.findBySubcta", query = "SELECT p FROM Profesores p WHERE p.subcta = :subcta"),
    @NamedQuery(name = "Profesores.findByFechaNac", query = "SELECT p FROM Profesores p WHERE p.fechaNac = :fechaNac"),
    @NamedQuery(name = "Profesores.findByActivo", query = "SELECT p FROM Profesores p WHERE p.activo = :activo")})
public class Profesores implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_profesor")
    private Integer idProfesor;
    @Column(name = "apellido_profesor")
    private String apellidoProfesor;
    @Column(name = "cedula_profesor")
    private String cedulaProfesor;
    @Column(name = "celular1")
    private String celular1;
    @Column(name = "celular2")
    private String celular2;
    @Column(name = "mail_profesor")
    private String mailProfesor;
    @Column(name = "nombre_profesor")
    private String nombreProfesor;
    @Column(name = "ruc_profesor")
    private String rucProfesor;
    @Column(name = "nrocuenta")
    private String nrocuenta;
    @Column(name = "subcta")
    private Integer subcta;
    @Column(name = "fecha_nac")
    @Temporal(TemporalType.DATE)
    private Date fechaNac;
    @Column(name = "activo")
    private Integer activo;
    @OneToMany(mappedBy = "idprofesor")
    private Collection<Materias> materiasCollection;

    public Profesores() {
    }

    public Profesores(Integer idProfesor) {
        this.idProfesor = idProfesor;
    }

    public Integer getIdProfesor() {
        return idProfesor;
    }

    public void setIdProfesor(Integer idProfesor) {
        this.idProfesor = idProfesor;
    }

    public String getApellidoProfesor() {
        return apellidoProfesor;
    }

    public void setApellidoProfesor(String apellidoProfesor) {
        this.apellidoProfesor = apellidoProfesor;
    }

    public String getCedulaProfesor() {
        return cedulaProfesor;
    }

    public void setCedulaProfesor(String cedulaProfesor) {
        this.cedulaProfesor = cedulaProfesor;
    }

    public String getCelular1() {
        return celular1;
    }

    public void setCelular1(String celular1) {
        this.celular1 = celular1;
    }

    public String getCelular2() {
        return celular2;
    }

    public void setCelular2(String celular2) {
        this.celular2 = celular2;
    }

    public String getMailProfesor() {
        return mailProfesor;
    }

    public void setMailProfesor(String mailProfesor) {
        this.mailProfesor = mailProfesor;
    }

    public String getNombreProfesor() {
        return nombreProfesor;
    }

    public void setNombreProfesor(String nombreProfesor) {
        this.nombreProfesor = nombreProfesor;
    }

    public String getRucProfesor() {
        return rucProfesor;
    }

    public void setRucProfesor(String rucProfesor) {
        this.rucProfesor = rucProfesor;
    }

    public String getNrocuenta() {
        return nrocuenta;
    }

    public void setNrocuenta(String nrocuenta) {
        this.nrocuenta = nrocuenta;
    }

    public Integer getSubcta() {
        return subcta;
    }

    public void setSubcta(Integer subcta) {
        this.subcta = subcta;
    }

    public Date getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }

    public Integer getActivo() {
        return activo;
    }

    public void setActivo(Integer activo) {
        this.activo = activo;
    }

    @XmlTransient
    public Collection<Materias> getMateriasCollection() {
        return materiasCollection;
    }

    public void setMateriasCollection(Collection<Materias> materiasCollection) {
        this.materiasCollection = materiasCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProfesor != null ? idProfesor.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Profesores)) {
            return false;
        }
        Profesores other = (Profesores) object;
        if ((this.idProfesor == null && other.idProfesor != null) || (this.idProfesor != null && !this.idProfesor.equals(other.idProfesor))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Profesores[ idProfesor=" + idProfesor + " ]";
    }
    
}
