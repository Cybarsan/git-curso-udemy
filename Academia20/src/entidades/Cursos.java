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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "cursos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cursos.findAll", query = "SELECT c FROM Cursos c"),
    @NamedQuery(name = "Cursos.findByIdcursos", query = "SELECT c FROM Cursos c WHERE c.idcursos = :idcursos"),
    @NamedQuery(name = "Cursos.findByNombrecurso", query = "SELECT c FROM Cursos c WHERE c.nombrecurso = :nombrecurso"),
    @NamedQuery(name = "Cursos.findByFechainicio", query = "SELECT c FROM Cursos c WHERE c.fechainicio = :fechainicio"),
    @NamedQuery(name = "Cursos.findByFechafin", query = "SELECT c FROM Cursos c WHERE c.fechafin = :fechafin"),
    @NamedQuery(name = "Cursos.findByComentario", query = "SELECT c FROM Cursos c WHERE c.comentario = :comentario")})
public class Cursos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcursos")
    private Integer idcursos;
    @Basic(optional = false)
    @Column(name = "nombrecurso")
    private String nombrecurso;
    @Column(name = "fechainicio")
    @Temporal(TemporalType.DATE)
    private Date fechainicio;
    @Column(name = "fechafin")
    @Temporal(TemporalType.DATE)
    private Date fechafin;
    @Column(name = "comentario")
    private String comentario;
    @JoinColumn(name = "tipocurso", referencedColumnName = "idtipocursos")
    @ManyToOne(optional = false)
    private Tipocursos tipocurso;
    @OneToMany(mappedBy = "idcurso")
    private Collection<Materias> materiasCollection;

    public Cursos() {
    }

    public Cursos(Integer idcursos) {
        this.idcursos = idcursos;
    }

    public Cursos(Integer idcursos, String nombrecurso) {
        this.idcursos = idcursos;
        this.nombrecurso = nombrecurso;
    }

    public Integer getIdcursos() {
        return idcursos;
    }

    public void setIdcursos(Integer idcursos) {
        this.idcursos = idcursos;
    }

    public String getNombrecurso() {
        return nombrecurso;
    }

    public void setNombrecurso(String nombrecurso) {
        this.nombrecurso = nombrecurso;
    }

    public Date getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(Date fechainicio) {
        this.fechainicio = fechainicio;
    }

    public Date getFechafin() {
        return fechafin;
    }

    public void setFechafin(Date fechafin) {
        this.fechafin = fechafin;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Tipocursos getTipocurso() {
        return tipocurso;
    }

    public void setTipocurso(Tipocursos tipocurso) {
        this.tipocurso = tipocurso;
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
        hash += (idcursos != null ? idcursos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cursos)) {
            return false;
        }
        Cursos other = (Cursos) object;
        if ((this.idcursos == null && other.idcursos != null) || (this.idcursos != null && !this.idcursos.equals(other.idcursos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Cursos[ idcursos=" + idcursos + " ]";
    }
    
}
