/*
 * Todo los derechos reservados, Alan Sanier, Analista de Sistemas.
 */

package entidades;

import java.io.Serializable;
import java.util.Collection;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author PC_Toshiba15
 */
@Entity
@Table(name = "materias")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Materias.findAll", query = "SELECT m FROM Materias m"),
    @NamedQuery(name = "Materias.findByIdmaterias", query = "SELECT m FROM Materias m WHERE m.idmaterias = :idmaterias"),
    @NamedQuery(name = "Materias.findByNombremateria", query = "SELECT m FROM Materias m WHERE m.nombremateria = :nombremateria")})
public class Materias implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmaterias")
    private Integer idmaterias;
    @Basic(optional = false)
    @Column(name = "nombremateria")
    private String nombremateria;
    @OneToMany(mappedBy = "idmateria")
    private Collection<MateriasAlumnos> materiasAlumnosCollection;
    @JoinColumn(name = "idcurso", referencedColumnName = "idcursos")
    @ManyToOne
    private Cursos idcurso;
    @JoinColumn(name = "idprofesor", referencedColumnName = "id_profesor")
    @ManyToOne
    private Profesores idprofesor;

    public Materias() {
    }

    public Materias(Integer idmaterias) {
        this.idmaterias = idmaterias;
    }

    public Materias(Integer idmaterias, String nombremateria) {
        this.idmaterias = idmaterias;
        this.nombremateria = nombremateria;
    }

    public Integer getIdmaterias() {
        return idmaterias;
    }

    public void setIdmaterias(Integer idmaterias) {
        this.idmaterias = idmaterias;
    }

    public String getNombremateria() {
        return nombremateria;
    }

    public void setNombremateria(String nombremateria) {
        this.nombremateria = nombremateria;
    }

    @XmlTransient
    public Collection<MateriasAlumnos> getMateriasAlumnosCollection() {
        return materiasAlumnosCollection;
    }

    public void setMateriasAlumnosCollection(Collection<MateriasAlumnos> materiasAlumnosCollection) {
        this.materiasAlumnosCollection = materiasAlumnosCollection;
    }

    public Cursos getIdcurso() {
        return idcurso;
    }

    public void setIdcurso(Cursos idcurso) {
        this.idcurso = idcurso;
    }

    public Profesores getIdprofesor() {
        return idprofesor;
    }

    public void setIdprofesor(Profesores idprofesor) {
        this.idprofesor = idprofesor;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmaterias != null ? idmaterias.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Materias)) {
            return false;
        }
        Materias other = (Materias) object;
        if ((this.idmaterias == null && other.idmaterias != null) || (this.idmaterias != null && !this.idmaterias.equals(other.idmaterias))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Materias[ idmaterias=" + idmaterias + " ]";
    }
    
}
