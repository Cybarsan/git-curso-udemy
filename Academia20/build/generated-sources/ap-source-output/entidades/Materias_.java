package entidades;

import entidades.Cursos;
import entidades.MateriasAlumnos;
import entidades.Profesores;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-09T19:04:26")
@StaticMetamodel(Materias.class)
public class Materias_ { 

    public static volatile SingularAttribute<Materias, Integer> idmaterias;
    public static volatile SingularAttribute<Materias, String> nombremateria;
    public static volatile CollectionAttribute<Materias, MateriasAlumnos> materiasAlumnosCollection;
    public static volatile SingularAttribute<Materias, Cursos> idcurso;
    public static volatile SingularAttribute<Materias, Profesores> idprofesor;

}