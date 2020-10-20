package entidades;

import entidades.Alumnos;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-09T19:04:26")
@StaticMetamodel(Parientes.class)
public class Parientes_ { 

    public static volatile SingularAttribute<Parientes, Integer> idparientes;
    public static volatile SingularAttribute<Parientes, String> apellidos;
    public static volatile SingularAttribute<Parientes, String> mail;
    public static volatile SingularAttribute<Parientes, Alumnos> idalumnos;
    public static volatile SingularAttribute<Parientes, String> celular;
    public static volatile SingularAttribute<Parientes, String> nrocedula;
    public static volatile SingularAttribute<Parientes, String> telefono;
    public static volatile SingularAttribute<Parientes, String> nombres;

}