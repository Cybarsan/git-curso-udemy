package entidades;

import entidades.Materias;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-09T19:04:27")
@StaticMetamodel(Profesores.class)
public class Profesores_ { 

    public static volatile SingularAttribute<Profesores, String> nrocuenta;
    public static volatile SingularAttribute<Profesores, String> mailProfesor;
    public static volatile SingularAttribute<Profesores, String> celular1;
    public static volatile SingularAttribute<Profesores, String> nombreProfesor;
    public static volatile SingularAttribute<Profesores, String> apellidoProfesor;
    public static volatile SingularAttribute<Profesores, Integer> subcta;
    public static volatile SingularAttribute<Profesores, String> rucProfesor;
    public static volatile SingularAttribute<Profesores, Date> fechaNac;
    public static volatile SingularAttribute<Profesores, Integer> idProfesor;
    public static volatile CollectionAttribute<Profesores, Materias> materiasCollection;
    public static volatile SingularAttribute<Profesores, String> cedulaProfesor;
    public static volatile SingularAttribute<Profesores, String> celular2;
    public static volatile SingularAttribute<Profesores, Integer> activo;

}