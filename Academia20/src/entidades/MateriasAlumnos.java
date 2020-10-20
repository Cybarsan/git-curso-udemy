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
@Table(name = "materias_alumnos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MateriasAlumnos.findAll", query = "SELECT m FROM MateriasAlumnos m"),
    @NamedQuery(name = "MateriasAlumnos.findByIdmateriaAlumno", query = "SELECT m FROM MateriasAlumnos m WHERE m.idmateriaAlumno = :idmateriaAlumno")})
public class MateriasAlumnos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmateria_alumno")
    private Integer idmateriaAlumno;
    @JoinColumn(name = "idalumno", referencedColumnName = "idalumno")
    @ManyToOne
    private Alumnos idalumno;
    @JoinColumn(name = "idmateria", referencedColumnName = "idmaterias")
    @ManyToOne
    private Materias idmateria;

    public MateriasAlumnos() {
    }

    public MateriasAlumnos(Integer idmateriaAlumno) {
        this.idmateriaAlumno = idmateriaAlumno;
    }

    public Integer getIdmateriaAlumno() {
        return idmateriaAlumno;
    }

    public void setIdmateriaAlumno(Integer idmateriaAlumno) {
        this.idmateriaAlumno = idmateriaAlumno;
    }

    public Alumnos getIdalumno() {
        return idalumno;
    }

    public void setIdalumno(Alumnos idalumno) {
        this.idalumno = idalumno;
    }

    public Materias getIdmateria() {
        return idmateria;
    }

    public void setIdmateria(Materias idmateria) {
        this.idmateria = idmateria;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmateriaAlumno != null ? idmateriaAlumno.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MateriasAlumnos)) {
            return false;
        }
        MateriasAlumnos other = (MateriasAlumnos) object;
        if ((this.idmateriaAlumno == null && other.idmateriaAlumno != null) || (this.idmateriaAlumno != null && !this.idmateriaAlumno.equals(other.idmateriaAlumno))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.MateriasAlumnos[ idmateriaAlumno=" + idmateriaAlumno + " ]";
    }
    
}
