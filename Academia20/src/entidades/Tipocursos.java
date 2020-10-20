/*
 * Todo los derechos reservados, Alan Sanier, Analista de Sistemas.
 */

package entidades;

import java.io.Serializable;
import java.util.Collection;
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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author PC_Toshiba15
 */
@Entity
@Table(name = "tipocursos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipocursos.findAll", query = "SELECT t FROM Tipocursos t"),
    @NamedQuery(name = "Tipocursos.findByIdtipocursos", query = "SELECT t FROM Tipocursos t WHERE t.idtipocursos = :idtipocursos"),
    @NamedQuery(name = "Tipocursos.findByDescripcion", query = "SELECT t FROM Tipocursos t WHERE t.descripcion = :descripcion")})
public class Tipocursos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipocursos")
    private Integer idtipocursos;
    @Column(name = "descripcion")
    private String descripcion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipocurso")
    private Collection<Cursos> cursosCollection;

    public Tipocursos() {
    }

    public Tipocursos(Integer idtipocursos) {
        this.idtipocursos = idtipocursos;
    }

    public Integer getIdtipocursos() {
        return idtipocursos;
    }

    public void setIdtipocursos(Integer idtipocursos) {
        this.idtipocursos = idtipocursos;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @XmlTransient
    public Collection<Cursos> getCursosCollection() {
        return cursosCollection;
    }

    public void setCursosCollection(Collection<Cursos> cursosCollection) {
        this.cursosCollection = cursosCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipocursos != null ? idtipocursos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipocursos)) {
            return false;
        }
        Tipocursos other = (Tipocursos) object;
        if ((this.idtipocursos == null && other.idtipocursos != null) || (this.idtipocursos != null && !this.idtipocursos.equals(other.idtipocursos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Tipocursos[ idtipocursos=" + idtipocursos + " ]";
    }
    
}
