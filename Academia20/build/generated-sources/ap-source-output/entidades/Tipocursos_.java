package entidades;

import entidades.Cursos;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-09T19:04:27")
@StaticMetamodel(Tipocursos.class)
public class Tipocursos_ { 

    public static volatile SingularAttribute<Tipocursos, String> descripcion;
    public static volatile SingularAttribute<Tipocursos, Integer> idtipocursos;
    public static volatile CollectionAttribute<Tipocursos, Cursos> cursosCollection;

}