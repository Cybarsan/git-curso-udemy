/*
 * Todo los derechos reservados, Alan Sanier, Analista de Sistemas.
 */

package entidades;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
@Table(name = "alumnos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Alumnos.findAll", query = "SELECT a FROM Alumnos a"),
    @NamedQuery(name = "Alumnos.findByIdalumno", query = "SELECT a FROM Alumnos a WHERE a.idalumno = :idalumno"),
    @NamedQuery(name = "Alumnos.findByApellidoAlumno", query = "SELECT a FROM Alumnos a WHERE a.apellidoAlumno = :apellidoAlumno"),
    @NamedQuery(name = "Alumnos.findByCedulaAlumno", query = "SELECT a FROM Alumnos a WHERE a.cedulaAlumno = :cedulaAlumno"),
    @NamedQuery(name = "Alumnos.findByCelular1", query = "SELECT a FROM Alumnos a WHERE a.celular1 = :celular1"),
    @NamedQuery(name = "Alumnos.findByCelular2", query = "SELECT a FROM Alumnos a WHERE a.celular2 = :celular2"),
    @NamedQuery(name = "Alumnos.findByMail", query = "SELECT a FROM Alumnos a WHERE a.mail = :mail"),
    @NamedQuery(name = "Alumnos.findByNombreAlumno", query = "SELECT a FROM Alumnos a WHERE a.nombreAlumno = :nombreAlumno"),
    @NamedQuery(name = "Alumnos.findByDireccion", query = "SELECT a FROM Alumnos a WHERE a.direccion = :direccion"),
    @NamedQuery(name = "Alumnos.findByFechanac", query = "SELECT a FROM Alumnos a WHERE a.fechanac = :fechanac"),
    @NamedQuery(name = "Alumnos.findByActivo", query = "SELECT a FROM Alumnos a WHERE a.activo = :activo")})
public class Alumnos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idalumno")
    private Integer idalumno;
    @Column(name = "apellido_alumno")
    private String apellidoAlumno;
    @Column(name = "cedula_alumno")
    private String cedulaAlumno;
    @Column(name = "celular1")
    private String celular1;
    @Column(name = "celular2")
    private String celular2;
    @Column(name = "mail")
    private String mail;
    @Column(name = "nombre_alumno")
    private String nombreAlumno;
    @Column(name = "direccion")
    private String direccion;
    @Column(name = "fechanac")
    @Temporal(TemporalType.DATE)
    private Date fechanac;
    @Column(name = "activo")
    private Integer activo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idalumnos")
    private Collection<Parientes> parientesCollection;
    @OneToMany(mappedBy = "idalumno")
    private Collection<MateriasAlumnos> materiasAlumnosCollection;

    public Alumnos() {
    }

    public Alumnos(Integer idalumno) {
        this.idalumno = idalumno;
    }

    public Integer getIdalumno() {
        return idalumno;
    }

    public void setIdalumno(Integer idalumno) {
        this.idalumno = idalumno;
    }

    public String getApellidoAlumno() {
        return apellidoAlumno;
    }

    public void setApellidoAlumno(String apellidoAlumno) {
        this.apellidoAlumno = apellidoAlumno;
    }

    public String getCedulaAlumno() {
        return cedulaAlumno;
    }

    public void setCedulaAlumno(String cedulaAlumno) {
        this.cedulaAlumno = cedulaAlumno;
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

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getNombreAlumno() {
        return nombreAlumno;
    }

    public void setNombreAlumno(String nombreAlumno) {
        this.nombreAlumno = nombreAlumno;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Date getFechanac() {
        return fechanac;
    }

    public void setFechanac(Date fechanac) {
        this.fechanac = fechanac;
    }

    public Integer getActivo() {
        return activo;
    }

    public void setActivo(Integer activo) {
        this.activo = activo;
    }

    @XmlTransient
    public Collection<Parientes> getParientesCollection() {
        return parientesCollection;
    }

    public void setParientesCollection(Collection<Parientes> parientesCollection) {
        this.parientesCollection = parientesCollection;
    }

    @XmlTransient
    public Collection<MateriasAlumnos> getMateriasAlumnosCollection() {
        return materiasAlumnosCollection;
    }

    public void setMateriasAlumnosCollection(Collection<MateriasAlumnos> materiasAlumnosCollection) {
        this.materiasAlumnosCollection = materiasAlumnosCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idalumno != null ? idalumno.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Alumnos)) {
            return false;
        }
        Alumnos other = (Alumnos) object;
        if ((this.idalumno == null && other.idalumno != null) || (this.idalumno != null && !this.idalumno.equals(other.idalumno))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Alumnos[ idalumno=" + idalumno + " ]";
    }
    
}
