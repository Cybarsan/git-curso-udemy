package entidades;

import entidades.Materias;
import entidades.Tipocursos;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-09T19:04:27")
@StaticMetamodel(Cursos.class)
public class Cursos_ { 

    public static volatile SingularAttribute<Cursos, Date> fechainicio;
    public static volatile SingularAttribute<Cursos, Integer> idcursos;
    public static volatile SingularAttribute<Cursos, Tipocursos> tipocurso;
    public static volatile CollectionAttribute<Cursos, Materias> materiasCollection;
    public static volatile SingularAttribute<Cursos, Date> fechafin;
    public static volatile SingularAttribute<Cursos, String> comentario;
    public static volatile SingularAttribute<Cursos, String> nombrecurso;

}