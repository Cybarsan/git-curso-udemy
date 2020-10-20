package entidades;

import entidades.Alumnos;
import entidades.Materias;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-09T19:04:26")
@StaticMetamodel(MateriasAlumnos.class)
public class MateriasAlumnos_ { 

    public static volatile SingularAttribute<MateriasAlumnos, Integer> idmateriaAlumno;
    public static volatile SingularAttribute<MateriasAlumnos, Alumnos> idalumno;
    public static volatile SingularAttribute<MateriasAlumnos, Materias> idmateria;

}