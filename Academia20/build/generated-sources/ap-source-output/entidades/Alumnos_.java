package entidades;

import entidades.MateriasAlumnos;
import entidades.Parientes;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-09T19:04:26")
@StaticMetamodel(Alumnos.class)
public class Alumnos_ { 

    public static volatile SingularAttribute<Alumnos, String> mail;
    public static volatile SingularAttribute<Alumnos, Integer> idalumno;
    public static volatile SingularAttribute<Alumnos, String> celular1;
    public static volatile SingularAttribute<Alumnos, Date> fechanac;
    public static volatile SingularAttribute<Alumnos, String> nombreAlumno;
    public static volatile SingularAttribute<Alumnos, String> direccion;
    public static volatile SingularAttribute<Alumnos, String> celular2;
    public static volatile SingularAttribute<Alumnos, String> apellidoAlumno;
    public static volatile CollectionAttribute<Alumnos, MateriasAlumnos> materiasAlumnosCollection;
    public static volatile CollectionAttribute<Alumnos, Parientes> parientesCollection;
    public static volatile SingularAttribute<Alumnos, String> cedulaAlumno;
    public static volatile SingularAttribute<Alumnos, Integer> activo;

}