PGDMP         -            	    x           academic    10.14    12.2 R    F           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            I           1262    16393    academic    DATABASE     �   CREATE DATABASE academic WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE academic;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            J           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    16394    alumnos    TABLE     �  CREATE TABLE public.alumnos (
    idalumno integer NOT NULL,
    apellido_alumno character varying(55),
    cedula_alumno character varying(25),
    celular1 character varying(30),
    celular2 character varying(30),
    mail character varying(80),
    nombre_alumno character varying(55),
    direccion character varying(180) DEFAULT ''::character varying,
    fechanac date,
    activo integer DEFAULT 1
);
    DROP TABLE public.alumnos;
       public            postgres    false    3            K           0    0    COLUMN alumnos.activo    COMMENT     W   COMMENT ON COLUMN public.alumnos.activo IS 'Campo para activar o inactivar un alumno';
          public          postgres    false    196            �            1259    16399    alumnos_idalumno_seq    SEQUENCE     �   CREATE SEQUENCE public.alumnos_idalumno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.alumnos_idalumno_seq;
       public          postgres    false    196    3            L           0    0    alumnos_idalumno_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.alumnos_idalumno_seq OWNED BY public.alumnos.idalumno;
          public          postgres    false    197            �            1259    16401    cursos    TABLE     �   CREATE TABLE public.cursos (
    idcursos integer NOT NULL,
    nombrecurso character varying(50) NOT NULL,
    tipocurso integer NOT NULL,
    fechainicio date,
    fechafin date,
    comentario character varying(150)
);
    DROP TABLE public.cursos;
       public            postgres    false    3            M           0    0    TABLE cursos    COMMENT     ;   COMMENT ON TABLE public.cursos IS 'Cursos de la Academia';
          public          postgres    false    198            �            1259    16404    cursos_idcursos_seq    SEQUENCE     �   CREATE SEQUENCE public.cursos_idcursos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cursos_idcursos_seq;
       public          postgres    false    3    198            N           0    0    cursos_idcursos_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.cursos_idcursos_seq OWNED BY public.cursos.idcursos;
          public          postgres    false    199            �            1259    16406    materias_alumnos    TABLE     }   CREATE TABLE public.materias_alumnos (
    idmateria_alumno integer NOT NULL,
    idalumno integer,
    idmateria integer
);
 $   DROP TABLE public.materias_alumnos;
       public            postgres    false    3            O           0    0    TABLE materias_alumnos    COMMENT     D   COMMENT ON TABLE public.materias_alumnos IS 'Alumnos por materias';
          public          postgres    false    200            P           0    0     COLUMN materias_alumnos.idalumno    COMMENT     V   COMMENT ON COLUMN public.materias_alumnos.idalumno IS 'Alumno que asiste a la clase';
          public          postgres    false    200            Q           0    0 !   COLUMN materias_alumnos.idmateria    COMMENT     X   COMMENT ON COLUMN public.materias_alumnos.idmateria IS 'RelaciÃ³n con tabla materia';
          public          postgres    false    200            �            1259    16409 "   cursos_materias_idmateriacurso_seq    SEQUENCE     �   CREATE SEQUENCE public.cursos_materias_idmateriacurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.cursos_materias_idmateriacurso_seq;
       public          postgres    false    3    200            R           0    0 "   cursos_materias_idmateriacurso_seq    SEQUENCE OWNED BY     l   ALTER SEQUENCE public.cursos_materias_idmateriacurso_seq OWNED BY public.materias_alumnos.idmateria_alumno;
          public          postgres    false    201            �            1259    16411    materias    TABLE     �   CREATE TABLE public.materias (
    idmaterias integer NOT NULL,
    nombremateria character varying(60) NOT NULL,
    idcurso integer,
    idprofesor integer
);
    DROP TABLE public.materias;
       public            postgres    false    3            S           0    0    TABLE materias    COMMENT     >   COMMENT ON TABLE public.materias IS 'Materias de los cursos';
          public          postgres    false    202            T           0    0    COLUMN materias.nombremateria    COMMENT     N   COMMENT ON COLUMN public.materias.nombremateria IS 'Descripcion de Materias';
          public          postgres    false    202            U           0    0    COLUMN materias.idcurso    COMMENT     P   COMMENT ON COLUMN public.materias.idcurso IS 'RelaciÃ³n con la tabla cursos';
          public          postgres    false    202            V           0    0    COLUMN materias.idprofesor    COMMENT     U   COMMENT ON COLUMN public.materias.idprofesor IS 'profesor que enseÃ±a la materia';
          public          postgres    false    202            �            1259    16414    materias_idmaterias_seq    SEQUENCE     �   CREATE SEQUENCE public.materias_idmaterias_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.materias_idmaterias_seq;
       public          postgres    false    3    202            W           0    0    materias_idmaterias_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.materias_idmaterias_seq OWNED BY public.materias.idmaterias;
          public          postgres    false    203            �            1259    16416 	   parientes    TABLE     9  CREATE TABLE public.parientes (
    idparientes integer NOT NULL,
    idalumnos integer NOT NULL,
    nrocedula character varying(25),
    nombres character varying(70),
    apellidos character varying(70),
    celular character varying(25),
    telefono character varying(25),
    mail character varying(150)
);
    DROP TABLE public.parientes;
       public            postgres    false    3            X           0    0    TABLE parientes    COMMENT     I   COMMENT ON TABLE public.parientes IS 'Datos de los padres o encargados';
          public          postgres    false    204            �            1259    16419    parientes_idparientes_seq    SEQUENCE     �   CREATE SEQUENCE public.parientes_idparientes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.parientes_idparientes_seq;
       public          postgres    false    204    3            Y           0    0    parientes_idparientes_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.parientes_idparientes_seq OWNED BY public.parientes.idparientes;
          public          postgres    false    205            �            1259    16421 
   profesores    TABLE     �  CREATE TABLE public.profesores (
    id_profesor integer NOT NULL,
    apellido_profesor character varying(255),
    cedula_profesor character varying(255),
    celular1 character varying(255),
    celular2 character varying(255),
    mail_profesor character varying(255),
    nombre_profesor character varying(255),
    ruc_profesor character varying(15),
    nrocuenta character varying(35),
    subcta integer,
    fecha_nac date,
    activo integer DEFAULT 1
);
    DROP TABLE public.profesores;
       public            postgres    false    3            Z           0    0    COLUMN profesores.ruc_profesor    COMMENT     H   COMMENT ON COLUMN public.profesores.ruc_profesor IS 'Ruc del profesor';
          public          postgres    false    206            �            1259    16428    profesores_id_profesor_seq    SEQUENCE     �   CREATE SEQUENCE public.profesores_id_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.profesores_id_profesor_seq;
       public          postgres    false    206    3            [           0    0    profesores_id_profesor_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.profesores_id_profesor_seq OWNED BY public.profesores.id_profesor;
          public          postgres    false    207            �            1259    16430 
   tipocursos    TABLE     n   CREATE TABLE public.tipocursos (
    idtipocursos integer NOT NULL,
    descripcion character varying(150)
);
    DROP TABLE public.tipocursos;
       public            postgres    false    3            \           0    0    TABLE tipocursos    COMMENT     K   COMMENT ON TABLE public.tipocursos IS 'Tipo de los cursos de la Academia';
          public          postgres    false    208            �            1259    16433    tipocursos_idtipocursos_seq    SEQUENCE     �   CREATE SEQUENCE public.tipocursos_idtipocursos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tipocursos_idtipocursos_seq;
       public          postgres    false    208    3            ]           0    0    tipocursos_idtipocursos_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tipocursos_idtipocursos_seq OWNED BY public.tipocursos.idtipocursos;
          public          postgres    false    209            �            1259    16435    usuarios    TABLE       CREATE TABLE public.usuarios (
    idusuario integer NOT NULL,
    apellido_usuario character varying(255),
    cedusu character varying(255),
    contrasenia character varying(255),
    nombre_usuario character varying(255),
    usuario character varying(255)
);
    DROP TABLE public.usuarios;
       public            postgres    false    3            �            1259    16441    usuarios_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuarios_idusuario_seq;
       public          postgres    false    3    210            ^           0    0    usuarios_idusuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuarios_idusuario_seq OWNED BY public.usuarios.idusuario;
          public          postgres    false    211            �
           2604    16443    alumnos idalumno    DEFAULT     t   ALTER TABLE ONLY public.alumnos ALTER COLUMN idalumno SET DEFAULT nextval('public.alumnos_idalumno_seq'::regclass);
 ?   ALTER TABLE public.alumnos ALTER COLUMN idalumno DROP DEFAULT;
       public          postgres    false    197    196            �
           2604    16444    cursos idcursos    DEFAULT     r   ALTER TABLE ONLY public.cursos ALTER COLUMN idcursos SET DEFAULT nextval('public.cursos_idcursos_seq'::regclass);
 >   ALTER TABLE public.cursos ALTER COLUMN idcursos DROP DEFAULT;
       public          postgres    false    199    198            �
           2604    16445    materias idmaterias    DEFAULT     z   ALTER TABLE ONLY public.materias ALTER COLUMN idmaterias SET DEFAULT nextval('public.materias_idmaterias_seq'::regclass);
 B   ALTER TABLE public.materias ALTER COLUMN idmaterias DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    16446 !   materias_alumnos idmateria_alumno    DEFAULT     �   ALTER TABLE ONLY public.materias_alumnos ALTER COLUMN idmateria_alumno SET DEFAULT nextval('public.cursos_materias_idmateriacurso_seq'::regclass);
 P   ALTER TABLE public.materias_alumnos ALTER COLUMN idmateria_alumno DROP DEFAULT;
       public          postgres    false    201    200            �
           2604    16447    parientes idparientes    DEFAULT     ~   ALTER TABLE ONLY public.parientes ALTER COLUMN idparientes SET DEFAULT nextval('public.parientes_idparientes_seq'::regclass);
 D   ALTER TABLE public.parientes ALTER COLUMN idparientes DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    16448    profesores id_profesor    DEFAULT     �   ALTER TABLE ONLY public.profesores ALTER COLUMN id_profesor SET DEFAULT nextval('public.profesores_id_profesor_seq'::regclass);
 E   ALTER TABLE public.profesores ALTER COLUMN id_profesor DROP DEFAULT;
       public          postgres    false    207    206            �
           2604    16449    tipocursos idtipocursos    DEFAULT     �   ALTER TABLE ONLY public.tipocursos ALTER COLUMN idtipocursos SET DEFAULT nextval('public.tipocursos_idtipocursos_seq'::regclass);
 F   ALTER TABLE public.tipocursos ALTER COLUMN idtipocursos DROP DEFAULT;
       public          postgres    false    209    208            �
           2604    16450    usuarios idusuario    DEFAULT     x   ALTER TABLE ONLY public.usuarios ALTER COLUMN idusuario SET DEFAULT nextval('public.usuarios_idusuario_seq'::regclass);
 A   ALTER TABLE public.usuarios ALTER COLUMN idusuario DROP DEFAULT;
       public          postgres    false    211    210            4          0    16394    alumnos 
   TABLE DATA           �   COPY public.alumnos (idalumno, apellido_alumno, cedula_alumno, celular1, celular2, mail, nombre_alumno, direccion, fechanac, activo) FROM stdin;
    public          postgres    false    196            6          0    16401    cursos 
   TABLE DATA           e   COPY public.cursos (idcursos, nombrecurso, tipocurso, fechainicio, fechafin, comentario) FROM stdin;
    public          postgres    false    198            :          0    16411    materias 
   TABLE DATA           R   COPY public.materias (idmaterias, nombremateria, idcurso, idprofesor) FROM stdin;
    public          postgres    false    202            8          0    16406    materias_alumnos 
   TABLE DATA           Q   COPY public.materias_alumnos (idmateria_alumno, idalumno, idmateria) FROM stdin;
    public          postgres    false    200            <          0    16416 	   parientes 
   TABLE DATA           s   COPY public.parientes (idparientes, idalumnos, nrocedula, nombres, apellidos, celular, telefono, mail) FROM stdin;
    public          postgres    false    204            >          0    16421 
   profesores 
   TABLE DATA           �   COPY public.profesores (id_profesor, apellido_profesor, cedula_profesor, celular1, celular2, mail_profesor, nombre_profesor, ruc_profesor, nrocuenta, subcta, fecha_nac, activo) FROM stdin;
    public          postgres    false    206            @          0    16430 
   tipocursos 
   TABLE DATA           ?   COPY public.tipocursos (idtipocursos, descripcion) FROM stdin;
    public          postgres    false    208            B          0    16435    usuarios 
   TABLE DATA           m   COPY public.usuarios (idusuario, apellido_usuario, cedusu, contrasenia, nombre_usuario, usuario) FROM stdin;
    public          postgres    false    210            _           0    0    alumnos_idalumno_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.alumnos_idalumno_seq', 204, true);
          public          postgres    false    197            `           0    0    cursos_idcursos_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.cursos_idcursos_seq', 1, false);
          public          postgres    false    199            a           0    0 "   cursos_materias_idmateriacurso_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.cursos_materias_idmateriacurso_seq', 1, false);
          public          postgres    false    201            b           0    0    materias_idmaterias_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.materias_idmaterias_seq', 4, true);
          public          postgres    false    203            c           0    0    parientes_idparientes_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.parientes_idparientes_seq', 3, true);
          public          postgres    false    205            d           0    0    profesores_id_profesor_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.profesores_id_profesor_seq', 31, true);
          public          postgres    false    207            e           0    0    tipocursos_idtipocursos_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tipocursos_idtipocursos_seq', 4, true);
          public          postgres    false    209            f           0    0    usuarios_idusuario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuarios_idusuario_seq', 4, true);
          public          postgres    false    211            �
           2606    16452    alumnos alumnos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (idalumno);
 >   ALTER TABLE ONLY public.alumnos DROP CONSTRAINT alumnos_pkey;
       public            postgres    false    196            �
           2606    16454    cursos cursos_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pk PRIMARY KEY (idcursos);
 :   ALTER TABLE ONLY public.cursos DROP CONSTRAINT cursos_pk;
       public            postgres    false    198            �
           2606    16456    parientes parientes_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.parientes
    ADD CONSTRAINT parientes_pk PRIMARY KEY (idparientes);
 @   ALTER TABLE ONLY public.parientes DROP CONSTRAINT parientes_pk;
       public            postgres    false    204            �
           2606    16458 4   materias_alumnos pk_cursos_materias_idmateria_alumno 
   CONSTRAINT     �   ALTER TABLE ONLY public.materias_alumnos
    ADD CONSTRAINT pk_cursos_materias_idmateria_alumno PRIMARY KEY (idmateria_alumno);
 ^   ALTER TABLE ONLY public.materias_alumnos DROP CONSTRAINT pk_cursos_materias_idmateria_alumno;
       public            postgres    false    200            �
           2606    16460    materias pk_materias_idmaterias 
   CONSTRAINT     e   ALTER TABLE ONLY public.materias
    ADD CONSTRAINT pk_materias_idmaterias PRIMARY KEY (idmaterias);
 I   ALTER TABLE ONLY public.materias DROP CONSTRAINT pk_materias_idmaterias;
       public            postgres    false    202            �
           2606    16462    profesores profesores_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id_profesor);
 D   ALTER TABLE ONLY public.profesores DROP CONSTRAINT profesores_pkey;
       public            postgres    false    206            �
           2606    16464    tipocursos tipocursos_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipocursos
    ADD CONSTRAINT tipocursos_pk PRIMARY KEY (idtipocursos);
 B   ALTER TABLE ONLY public.tipocursos DROP CONSTRAINT tipocursos_pk;
       public            postgres    false    208            �
           2606    16466    usuarios usuarios_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    210            �
           2606    16467    cursos cursos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_fk FOREIGN KEY (tipocurso) REFERENCES public.tipocursos(idtipocursos) ON DELETE RESTRICT;
 :   ALTER TABLE ONLY public.cursos DROP CONSTRAINT cursos_fk;
       public          postgres    false    198    208    2738            �
           2606    16472 +   materias_alumnos fk_cursos_materias_alumnos    FK CONSTRAINT     �   ALTER TABLE ONLY public.materias_alumnos
    ADD CONSTRAINT fk_cursos_materias_alumnos FOREIGN KEY (idalumno) REFERENCES public.alumnos(idalumno) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.materias_alumnos DROP CONSTRAINT fk_cursos_materias_alumnos;
       public          postgres    false    2726    200    196            �
           2606    16477 ,   materias_alumnos fk_cursos_materias_materias    FK CONSTRAINT     �   ALTER TABLE ONLY public.materias_alumnos
    ADD CONSTRAINT fk_cursos_materias_materias FOREIGN KEY (idmateria) REFERENCES public.materias(idmaterias) ON UPDATE RESTRICT ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.materias_alumnos DROP CONSTRAINT fk_cursos_materias_materias;
       public          postgres    false    200    2732    202            �
           2606    16482    materias fk_materias_cursos    FK CONSTRAINT     �   ALTER TABLE ONLY public.materias
    ADD CONSTRAINT fk_materias_cursos FOREIGN KEY (idcurso) REFERENCES public.cursos(idcursos) ON UPDATE RESTRICT ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public.materias DROP CONSTRAINT fk_materias_cursos;
       public          postgres    false    202    2728    198            g           0    0 )   CONSTRAINT fk_materias_cursos ON materias    COMMENT     L   COMMENT ON CONSTRAINT fk_materias_cursos ON public.materias IS 'FK cursos';
          public          postgres    false    2744            �
           2606    16487    materias fk_materias_profesores    FK CONSTRAINT     �   ALTER TABLE ONLY public.materias
    ADD CONSTRAINT fk_materias_profesores FOREIGN KEY (idprofesor) REFERENCES public.profesores(id_profesor);
 I   ALTER TABLE ONLY public.materias DROP CONSTRAINT fk_materias_profesores;
       public          postgres    false    2736    206    202            h           0    0 -   CONSTRAINT fk_materias_profesores ON materias    COMMENT     a   COMMENT ON CONSTRAINT fk_materias_profesores ON public.materias IS 'RelaciÃ³n con profesores';
          public          postgres    false    2745            �
           2606    16492    parientes parientes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.parientes
    ADD CONSTRAINT parientes_fk FOREIGN KEY (idalumnos) REFERENCES public.alumnos(idalumno) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.parientes DROP CONSTRAINT parientes_fk;
       public          postgres    false    2726    196    204            4      x��Z˒ܶ]C_���$@b���&R��(�(����&ev�T�W��'���Wŕ]���Kr.@�d�(�F�+��q�8��s/(�fG�v��W��.��%�k*�ەq���fE���je�kS5+��o��|�&��M�l��2+d�{C�5ѥ`�2u?6g�{�������G�g�L���@��&s!�\,~Ӽ����l��~��/[sk�E����Ø�;����x&$�0�m?2mk7�?�Ͷ
'�����8��i�>��_:�O�ƭ�Ђ]l?���oL���޸=�]�yS�~\ɮ�M�?��M�{g���������]�{��'�8�S7x����	�n�[n���X)�U��1?N�Y�~�,�+r��"�>mk��Qa /���/�a�^��]8��U��/qb�����ݰ���h�U�^7�ȶ��X�ʬ�5z��������[,���4C���
��@.��@EZ <�?9���P4L�P2.~L��-�@��<K��6G�4{����9n���}�=�]-�%�� BVM��[�����n�;������o&���~������zc�#�������л����V$e*��Dh_���\�*��������[G�-r��S/\�Z\���*����S�YF�Y[��� T��Zˬs��l,�'9:#K���a�]��8��I�eM����Fef1�)Q4Aʂ�xv8,/Ҭ$S>;�`��q�D�f`�vn�k`K���D�݊��3nݟ0{�2�:>�GM��y�={lV�.�I.g6��|�aE�I�o���ؼ̄��<ߚz�����h�*�n+�kZl�,�\�!7�a�g�zC���F���@��\����"<�3���'O�`��#8O�0��[D�ެB@]��j�3Y�\�)�����y�y���!�s�[-q��͛���	r� �����=�b'_@y�^�Ŵ�l�"�	L-Zk�	�5����{��i�f2M�dZ� ���M������@Sv�AL0��=ۚ���-�Q�����)%w���~6�����7^��?������)3\5-Zٿ�����e��S2��y����}K��3�����xm��l��$B� �Y��2	�J����Z���u�t�����=@�tFa��GR�)��&H��՛�D�m;�ý8~��$tuX	�L�ɇ��I(;ͮ>��8{4����{�w#U�n���U� jֹJ���~�/̭k��S�<ʏ[�X� c���:r+ ��'NV�O:�_��������#��S6H�����R+��'��{�%�v;^D��츺�2/*�V�#�~���QG+C�D��Z�z��]@���l�(��Q���F$
�@!Rk�*���+��U@��wǍq�]��N�82n���UKa�t����c;w������v>m��^�Y��y�}�l�����~�7��؇Q�G=К�]��J�f����s�߃;�I���N�	:�\ݑ�|>�V$������vj��*����@��5�>��S�\� �����,ˇdH���&�Ns�g3���,���	JW� ��E`�3�m?�#�Sv��R�����׹{[�.P$١�¯���G�W��2�<���ܹ��J�*��[��`TyQ���.���
��b��������*r�p�/��f_v����;?�\AGÉ�Wb��ƭ���Y���h	*B&i�@[����j������~���N�=��nZ«�@�o��V��XP�A�oo��bJ��E�:�t����؏w#�Q(֧�#S�n)�i��pI��`э��Ѫ�du4M��D&A{��9�7,�g�3p_����h��n�ս%���,:�#9�ۦnz���ߙխ��k�H@�e����,�~n��!�p��p����
E�|���=r��.�̇jg��h��!���iC�����v�i~��cǔ2M�$z�,�/x@�����[�X�f!���|�uC��K�huc��=��.�4��k���¶�DP�R(�z�җU��X��ITWؒ�O~l�o-Q7���n��2����	�·�t�������-�������߭]�n��������<ì�����5�{Z���Zj���n�=%_�KuoL`����2�ZtR���տ��! O<��_�HO`�>��L��䁏8\��8�;+�n	��>��6��L�H��{��<m�j��B�?:y�M4	���;��$��LH���}wT��莋�7����+*�6��VD�m�	] �H"�ğ �]}��6������ U*ɽ�˵[�3/�� �����I�eI�vſ ����o�E%��}ו�2Q ~I�B��;�z-����
�}qv�"�����UT��dA��^�o��B`~��4Ĉ�nM�d4�F"֪|�Z�����M�Tcg:A�s���,D�<�����]�, ��-I���8@��� h��
H��c5{�P�M���������B�U4�믶� �rj��:���B�҃$���(�qi����)�(��/�d�{�~@ٰ����  H5�������r?�?�9 ����-?��Q :�iȶK�c��k�D��s��r��l�����m��HEџ��r�ph����4�(� )dHw��l��v�Bd����������l�_Z��΋p}��}<����	��tz�S�tX�����L�L���6���Hi�U��)�wM��l� Y@���GGc'��u�}�nD��I�ݘ	6r�DlJ%T���.
���&���
CTe�DU�sU�^B|K�eSSb�Ҽ$���zc����gr+_���웦���h&�%��'،�����2��ѿjRU�?�P�����i=w���m-���-|�X/@����j��(Q}�`Vo(�G�G�rl���R娤�I����4��SQ���;���f���#�r�b�!�z��,��C����]]a��[*��&���	���W����z�N`T�ՔҪ���Q4���4n�1�-�����b����Q�x���K��ՒKD�ی[jJ������|��hF�;�u$�?|�	,AQ#���N�{7@?/����'4�1Њ�@��{Uˇg:���`��w��;y��A^h��<)Tx��诬��(E�Ū���}�:ڲ�|x0{��Q5��
;�3"��3�Z9Z��p
(�:*�eO:SN��B�_:Ѐ.e�SkwQ?r����:�7Dv�J��E���z�LN�򨍰Js�%��V"W��!4��L������|��$p�s�(���e�J�ipI=�j���٠4�KF,+1�0*�]ľԣ^��v� ���X�4)R$��z�CC�����[�S���U����.J��D���l��!BZ��"Ă,ʃb~R��w&��J���-5��M���0�d�Ї�OZ�O|���� ;�9X"�����:�����ud�4 �OG����ԑ]�����/U%Ԕ����}��� ����u���Z00⧛)�1��S���u��}k:�Ү��4�o��{�#Ԅ�0��E��q�u��2Bz�ǭ�۶19����A�U@�<�D��B�"�.����������#?��������烰@�%8	���)�s��^�o�cտ��f�Dx T{Y���A%C�.r�XO����jo߱6�n��`wc���E
 �!w��w��*����	��Py`di�<$��V�P��V� �$lY���?4I�]B�H�A,�]}�)�k����6�^?y6�VCjVr,���Jj�d�N'�}�SB)vm��5=Z����I�(�5�_!���?zb{LI}�k��*�8�'i/Sz�ގ
��F����tWL�	6E��W�h�.I�$
)_�C�3�o���g�QR�t���LË�;�^[_ȏd����;��4M9]������P�U3B�$���p����j�e��Ŀ�#���:���Q���f�F*�>��
>�"4ֺ/R�#��n}Z�iX���� 	  �p�E�u+zQO�by��'A��u�x���C��O�T�����k6�^�H*4諡�b����DL�U��:�0�@��@�3o�{z �:E?[CK-���*'A�
-�Bd�k�����Ph��IZ�(��zލ�����~N*.v�IҦ��F����'�R���GPN�H
��_5%�N�#��<���d�رT�g*�#!��.G����
�~I_]!"C��*tP��~�Kv�1uew�/��#
�H�_x�O��2���g����k      6      x������ � �      :   ?   x�3�t�9�|haqfr>g�qq$%��&V�D�9]���6��@�L8�����=... �}�      8      x������ � �      <   M   x�-��	�0г<L�I�[��Rp�\���
�@ ��a[�#�NO�8��S-��/�
���y�9a��|틈|�?      >   �  x��V[n�F�����yqf�2��2>��(4F�����,��*�Mt3E?��n�[�J���?����=��s�=cJ����򲘻���P�ƈ�L�ZrI��Z���ט�+�`��5�J��+�ӲZ�h�f�����)(㒣V��h�P�[���f�-f�FcI�v�B��t^�ˬ$�&�&�P+����FS���	)�.�>��s�jX(P���9!�/�����ٽzxl���j�DL�\��Uu�C�Dh)�X��+����?�6*��'�b'�Ÿ6F#�if����ގ�i2��_�ȗ�-�屑L�bi(S�T�i�N���l>s\��v�0;72IdBLB�X���(���,��<N��>��x�AV6,�PЛ�Ǯ�u��:��+�<?��'Q"%������ی�8fL�0�	׽4>�ש-�����e����M�a-���7�Ը24lO`L�(!�v��yxi������" �73��1Trh�ɍ��2x�by0���:�����s�|jگ����2�Lk9@sN%����w��u�p)��o�T������t�f�~jחc�sh�Qag�?q7��\9_������-�,Ji��{�}hw������@>޳7q����m���9W��i�e8��:�8�(�7l�l_����UQ�fK�k�s\��:A}B�]�n7?=n���X��p#�+N�4ɀ���s���p����_��N&���i#�O�٫�(���������6��,-���z_.g o�`��`�u�k���vӮ����}"���Q�X�E �&�`+9)'X\h>G���[�()�D�Z�7wۻ�wJ�[���<�z��X"N{�[?���@Z�p`o��ڼ|��3v|H���4K���^�Ai$�$�>�H�{��#�W���{�/�������T2����D �<�ZQ*��(B&B� 7�,�سwA�7uZ�±p>�r<#xD�c�[5w�v�h1������!Ȧe1u7Ӵ<Y
?CI����g~i3��i-B�j*V���Ywͮy�>�7�U{6xaRFH�jdy��y^�I��E8���W8���	�}n��]��E���8��4�*�ɦKw��"��f),]�+^�=}�����fs�k�k���u?\�n���c^��x|=� �7a&$�Daw���q��H�Kő��f�,>��mf;�o#&�,��yIBj�Dy8��~L?:��?����^�������]^\\�S#:      @   L   x�3�����,.I-�L��2�(J-H,J,�/���2�t-.HM�dV%&gn>�9�˄�3����4�$�,�+F��� Z�A      B   u   x�e��
�@E�;_�/�Jj!] �6#;�`�����*ڤ��S��0�wEY����9t�dd�%�i�/��z]��|��f����B>�]�c�
��"wǛ��z����@�52xS�D��X.      R    F           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            I           1262    16393    academic    DATABASE     �   CREATE DATABASE academic WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE academic;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            J           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    16394    alumnos    TABLE     �  CREATE TABLE public.alumnos (
    idalumno integer NOT NULL,
    apellido_alumno character varying(55),
    cedula_alumno character varying(25),
    celular1 character varying(30),
    celular2 character varying(30),
    mail character varying(80),
    nombre_alumno character varying(55),
    direccion character varying(180) DEFAULT ''::character varying,
    fechanac date,
    activo integer DEFAULT 1
);
    DROP TABLE public.alumnos;
       public            postgres    false    3            K           0    0    COLUMN alumnos.activo    COMMENT     W   COMMENT ON COLUMN public.alumnos.activo IS 'Campo para activar o inactivar un alumno';
          public          postgres    false    196            �            1259    16399    alumnos_idalumno_seq    SEQUENCE     �   CREATE SEQUENCE public.alumnos_idalumno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.alumnos_idalumno_seq;
       public          postgres    false    196    3            L           0    0    alumnos_idalumno_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.alumnos_idalumno_seq OWNED BY public.alumnos.idalumno;
          public          postgres    false    197            �            1259    16401    cursos    TABLE     �   CREATE TABLE public.cursos (
    idcursos integer NOT NULL,
    nombrecurso character varying(50) NOT NULL,
    tipocurso integer NOT NULL,
    fechainicio date,
    fechafin date,
    comentario character varying(150)
);
    DROP TABLE public.cursos;
       public            postgres    false    3            M           0    0    TABLE cursos    COMMENT     ;   COMMENT ON TABLE public.cursos IS 'Cursos de la Academia';
          public          postgres    false    198            �            1259    16404    cursos_idcursos_seq    SEQUENCE     �   CREATE SEQUENCE public.cursos_idcursos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cursos_idcursos_seq;
       public          postgres    false    3    198            N           0    0    cursos_idcursos_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.cursos_idcursos_seq OWNED BY public.cursos.idcursos;
          public          postgres    false    199            �            1259    16406    materias_alumnos    TABLE     }   CREATE TABLE public.materias_alumnos (
    idmateria_alumno integer NOT NULL,
    idalumno integer,
    idmateria integer
);
 $   DROP TABLE public.materias_alumnos;
       public            postgres    false    3            O           0    0    TABLE materias_alumnos    COMMENT     D   COMMENT ON TABLE public.materias_alumnos IS 'Alumnos por materias';
          public          postgres    false    200            P           0    0     COLUMN materias_alumnos.idalumno    COMMENT     V   COMMENT ON COLUMN public.materias_alumnos.idalumno IS 'Alumno que asiste a la clase';
          public          postgres    false    200            Q           0    0 !   COLUMN materias_alumnos.idmateria    COMMENT     X   COMMENT ON COLUMN public.materias_alumnos.idmateria IS 'RelaciÃ³n con tabla materia';
          public          postgres    false    200            �            1259    16409 "   cursos_materias_idmateriacurso_seq    SEQUENCE     �   CREATE SEQUENCE public.cursos_materias_idmateriacurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.cursos_materias_idmateriacurso_seq;
       public          postgres    false    3    200            R           0    0 "   cursos_materias_idmateriacurso_seq    SEQUENCE OWNED BY     l   ALTER SEQUENCE public.cursos_materias_idmateriacurso_seq OWNED BY public.materias_alumnos.idmateria_alumno;
          public          postgres    false    201            �            1259    16411    materias    TABLE     �   CREATE TABLE public.materias (
    idmaterias integer NOT NULL,
    nombremateria character varying(60) NOT NULL,
    idcurso integer,
    idprofesor integer
);
    DROP TABLE public.materias;
       public            postgres    false    3            S           0    0    TABLE materias    COMMENT     >   COMMENT ON TABLE public.materias IS 'Materias de los cursos';
          public          postgres    false    202            T           0    0    COLUMN materias.nombremateria    COMMENT     N   COMMENT ON COLUMN public.materias.nombremateria IS 'Descripcion de Materias';
          public          postgres    false    202            U           0    0    COLUMN materias.idcurso    COMMENT     P   COMMENT ON COLUMN public.materias.idcurso IS 'RelaciÃ³n con la tabla cursos';
          public          postgres    false    202            V           0    0    COLUMN materias.idprofesor    COMMENT     U   COMMENT ON COLUMN public.materias.idprofesor IS 'profesor que enseÃ±a la materia';
          public          postgres    false    202            �            1259    16414    materias_idmaterias_seq    SEQUENCE     �   CREATE SEQUENCE public.materias_idmaterias_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.materias_idmaterias_seq;
       public          postgres    false    3    202            W           0    0    materias_idmaterias_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.materias_idmaterias_seq OWNED BY public.materias.idmaterias;
          public          postgres    false    203            �            1259    16416 	   parientes    TABLE     9  CREATE TABLE public.parientes (
    idparientes integer NOT NULL,
    idalumnos integer NOT NULL,
    nrocedula character varying(25),
    nombres character varying(70),
    apellidos character varying(70),
    celular character varying(25),
    telefono character varying(25),
    mail character varying(150)
);
    DROP TABLE public.parientes;
       public            postgres    false    3            X           0    0    TABLE parientes    COMMENT     I   COMMENT ON TABLE public.parientes IS 'Datos de los padres o encargados';
          public          postgres    false    204            �            1259    16419    parientes_idparientes_seq    SEQUENCE     �   CREATE SEQUENCE public.parientes_idparientes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.parientes_idparientes_seq;
       public          postgres    false    204    3            Y           0    0    parientes_idparientes_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.parientes_idparientes_seq OWNED BY public.parientes.idparientes;
          public          postgres    false    205            �            1259    16421 
   profesores    TABLE     �  CREATE TABLE public.profesores (
    id_profesor integer NOT NULL,
    apellido_profesor character varying(255),
    cedula_profesor character varying(255),
    celular1 character varying(255),
    celular2 character varying(255),
    mail_profesor character varying(255),
    nombre_profesor character varying(255),
    ruc_profesor character varying(15),
    nrocuenta character varying(35),
    subcta integer,
    fecha_nac date,
    activo integer DEFAULT 1
);
    DROP TABLE public.profesores;
       public            postgres    false    3            Z           0    0    COLUMN profesores.ruc_profesor    COMMENT     H   COMMENT ON COLUMN public.profesores.ruc_profesor IS 'Ruc del profesor';
          public          postgres    false    206            �            1259    16428    profesores_id_profesor_seq    SEQUENCE     �   CREATE SEQUENCE public.profesores_id_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.profesores_id_profesor_seq;
       public          postgres    false    206    3            [           0    0    profesores_id_profesor_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.profesores_id_profesor_seq OWNED BY public.profesores.id_profesor;
          public          postgres    false    207            �            1259    16430 
   tipocursos    TABLE     n   CREATE TABLE public.tipocursos (
    idtipocursos integer NOT NULL,
    descripcion character varying(150)
);
    DROP TABLE public.tipocursos;
       public            postgres    false    3            \           0    0    TABLE tipocursos    COMMENT     K   COMMENT ON TABLE public.tipocursos IS 'Tipo de los cursos de la Academia';
          public          postgres    false    208            �            1259    16433    tipocursos_idtipocursos_seq    SEQUENCE     �   CREATE SEQUENCE public.tipocursos_idtipocursos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tipocursos_idtipocursos_seq;
       public          postgres    false    208    3            ]           0    0    tipocursos_idtipocursos_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tipocursos_idtipocursos_seq OWNED BY public.tipocursos.idtipocursos;
          public          postgres    false    209            �            1259    16435    usuarios    TABLE       CREATE TABLE public.usuarios (
    idusuario integer NOT NULL,
    apellido_usuario character varying(255),
    cedusu character varying(255),
    contrasenia character varying(255),
    nombre_usuario character varying(255),
    usuario character varying(255)
);
    DROP TABLE public.usuarios;
       public            postgres    false    3            �            1259    16441    usuarios_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuarios_idusuario_seq;
       public          postgres    false    3    210            ^           0    0    usuarios_idusuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuarios_idusuario_seq OWNED BY public.usuarios.idusuario;
          public          postgres    false    211            �
           2604    16443    alumnos idalumno    DEFAULT     t   ALTER TABLE ONLY public.alumnos ALTER COLUMN idalumno SET DEFAULT nextval('public.alumnos_idalumno_seq'::regclass);
 ?   ALTER TABLE public.alumnos ALTER COLUMN idalumno DROP DEFAULT;
       public          postgres    false    197    196            �
           2604    16444    cursos idcursos    DEFAULT     r   ALTER TABLE ONLY public.cursos ALTER COLUMN idcursos SET DEFAULT nextval('public.cursos_idcursos_seq'::regclass);
 >   ALTER TABLE public.cursos ALTER COLUMN idcursos DROP DEFAULT;
       public          postgres    false    199    198            �
           2604    16445    materias idmaterias    DEFAULT     z   ALTER TABLE ONLY public.materias ALTER COLUMN idmaterias SET DEFAULT nextval('public.materias_idmaterias_seq'::regclass);
 B   ALTER TABLE public.materias ALTER COLUMN idmaterias DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    16446 !   materias_alumnos idmateria_alumno    DEFAULT     �   ALTER TABLE ONLY public.materias_alumnos ALTER COLUMN idmateria_alumno SET DEFAULT nextval('public.cursos_materias_idmateriacurso_seq'::regclass);
 P   ALTER TABLE public.materias_alumnos ALTER COLUMN idmateria_alumno DROP DEFAULT;
       public          postgres    false    201    200            �
           2604    16447    parientes idparientes    DEFAULT     ~   ALTER TABLE ONLY public.parientes ALTER COLUMN idparientes SET DEFAULT nextval('public.parientes_idparientes_seq'::regclass);
 D   ALTER TABLE public.parientes ALTER COLUMN idparientes DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    16448    profesores id_profesor    DEFAULT     �   ALTER TABLE ONLY public.profesores ALTER COLUMN id_profesor SET DEFAULT nextval('public.profesores_id_profesor_seq'::regclass);
 E   ALTER TABLE public.profesores ALTER COLUMN id_profesor DROP DEFAULT;
       public          postgres    false    207    206            �
           2604    16449    tipocursos idtipocursos    DEFAULT     �   ALTER TABLE ONLY public.tipocursos ALTER COLUMN idtipocursos SET DEFAULT nextval('public.tipocursos_idtipocursos_seq'::regclass);
 F   ALTER TABLE public.tipocursos ALTER COLUMN idtipocursos DROP DEFAULT;
       public          postgres    false    209    208            �
           2604    16450    usuarios idusuario    DEFAULT     x   ALTER TABLE ONLY public.usuarios ALTER COLUMN idusuario SET DEFAULT nextval('public.usuarios_idusuario_seq'::regclass);
 A   ALTER TABLE public.usuarios ALTER COLUMN idusuario DROP DEFAULT;
       public          postgres    false    211    210            4          0    16394    alumnos 
   TABLE DATA           �   COPY public.alumnos (idalumno, apellido_alumno, cedula_alumno, celular1, celular2, mail, nombre_alumno, direccion, fechanac, activo) FROM stdin;
    public          postgres    false    196            6          0    16401    cursos 
   TABLE DATA           e   COPY public.cursos (idcursos, nombrecurso, tipocurso, fechainicio, fechafin, comentario) FROM stdin;
    public          postgres    false    198          :          0    16411    materias 
   TABLE DATA           R   COPY public.materias (idmaterias, nombremateria, idcurso, idprofesor) FROM stdin;
    public          postgres    false    202           8          0    16406    materias_alumnos 
   TABLE DATA           Q   COPY public.materias_alumnos (idmateria_alumno, idalumno, idmateria) FROM stdin;
    public          postgres    false    200   I        <          0    16416 	   parientes 
   TABLE DATA           s   COPY public.parientes (idparientes, idalumnos, nrocedula, nombres, apellidos, celular, telefono, mail) FROM stdin;
    public          postgres    false    204           >          0    16421 
   profesores 
   TABLE DATA           �   COPY public.profesores (id_profesor, apellido_profesor, cedula_profesor, celular1, celular2, mail_profesor, nombre_profesor, ruc_profesor, nrocuenta, subcta, fecha_nac, activo) FROM stdin;
    public          postgres    false    206   W        @          0    16430 
   tipocursos 
   TABLE DATA           ?   COPY public.tipocursos (idtipocursos, descripcion) FROM stdin;
    public          postgres    false    208   �       B          0    16435    usuarios 
   TABLE DATA           m   COPY public.usuarios (idusuario, apellido_usuario, cedusu, contrasenia, nombre_usuario, usuario) FROM stdin;
    public          postgres    false    210   V        _           0    0    alumnos_idalumno_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.alumnos_idalumno_seq', 204, true);
          public          postgres    false    197            `           0    0    cursos_idcursos_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.cursos_idcursos_seq', 1, false);
          public          postgres    false    199            a           0    0 "   cursos_materias_idmateriacurso_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.cursos_materias_idmateriacurso_seq', 1, false);
          public          postgres    false    201            b           0    0    materias_idmaterias_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.materias_idmaterias_seq', 4, true);
          public          postgres    false    203            c           0    0    parientes_idparientes_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.parientes_idparientes_seq', 3, true);
          public          postgres    false    205            d           0    0    profesores_id_profesor_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.profesores_id_profesor_seq', 31, true);
          public          postgres    false    207            e           0    0    tipocursos_idtipocursos_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tipocursos_idtipocursos_seq', 4, true);
          public          postgres    false    209            f           0    0    usuarios_idusuario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuarios_idusuario_seq', 4, true);
          public          postgres    false    211            �
           2606    16452    alumnos alumnos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (idalumno);
 >   ALTER TABLE ONLY public.alumnos DROP CONSTRAINT alumnos_pkey;
       public            postgres    false    196            �
           2606    16454    cursos cursos_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pk PRIMARY KEY (idcursos);
 :   ALTER TABLE ONLY public.cursos DROP CONSTRAINT cursos_pk;
       public            postgres    false    198            �
           2606    16456    parientes parientes_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.parientes
    ADD CONSTRAINT parientes_pk PRIMARY KEY (idparientes);
 @   ALTER TABLE ONLY public.parientes DROP CONSTRAINT parientes_pk;
       public            postgres    false    204            �
           2606    16458 4   materias_alumnos pk_cursos_materias_idmateria_alumno 
   CONSTRAINT     �   ALTER TABLE ONLY public.materias_alumnos
    ADD CONSTRAINT pk_cursos_materias_idmateria_alumno PRIMARY KEY (idmateria_alumno);
 ^   ALTER TABLE ONLY public.materias_alumnos DROP CONSTRAINT pk_cursos_materias_idmateria_alumno;
       public            postgres    false    200            �
           2606    16460    materias pk_materias_idmaterias 
   CONSTRAINT     e   ALTER TABLE ONLY public.materias
    ADD CONSTRAINT pk_materias_idmaterias PRIMARY KEY (idmaterias);
 I   ALTER TABLE ONLY public.materias DROP CONSTRAINT pk_materias_idmaterias;
       public            postgres    false    202            �
           2606    16462    profesores profesores_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id_profesor);
 D   ALTER TABLE ONLY public.profesores DROP CONSTRAINT profesores_pkey;
       public            postgres    false    206            �
           2606    16464    tipocursos tipocursos_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipocursos
    ADD CONSTRAINT tipocursos_pk PRIMARY KEY (idtipocursos);
 B   ALTER TABLE ONLY public.tipocursos DROP CONSTRAINT tipocursos_pk;
       public            postgres    false    208            �
           2606    16466    usuarios usuarios_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    210            �
           2606    16467    cursos cursos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_fk FOREIGN KEY (tipocurso) REFERENCES public.tipocursos(idtipocursos) ON DELETE RESTRICT;
 :   ALTER TABLE ONLY public.cursos DROP CONSTRAINT cursos_fk;
       public          postgres    false    198    208    2738            �
           2606    16472 +   materias_alumnos fk_cursos_materias_alumnos    FK CONSTRAINT     �   ALTER TABLE ONLY public.materias_alumnos
    ADD CONSTRAINT fk_cursos_materias_alumnos FOREIGN KEY (idalumno) REFERENCES public.alumnos(idalumno) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.materias_alumnos DROP CONSTRAINT fk_cursos_materias_alumnos;
       public          postgres    false    2726    200    196            �
           2606    16477 ,   materias_alumnos fk_cursos_materias_materias    FK CONSTRAINT     �   ALTER TABLE ONLY public.materias_alumnos
    ADD CONSTRAINT fk_cursos_materias_materias FOREIGN KEY (idmateria) REFERENCES public.materias(idmaterias) ON UPDATE RESTRICT ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.materias_alumnos DROP CONSTRAINT fk_cursos_materias_materias;
       public          postgres    false    200    2732    202            �
           2606    16482    materias fk_materias_cursos    FK CONSTRAINT     �   ALTER TABLE ONLY public.materias
    ADD CONSTRAINT fk_materias_cursos FOREIGN KEY (idcurso) REFERENCES public.cursos(idcursos) ON UPDATE RESTRICT ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public.materias DROP CONSTRAINT fk_materias_cursos;
       public          postgres    false    202    2728    198            g           0    0 )   CONSTRAINT fk_materias_cursos ON materias    COMMENT     L   COMMENT ON CONSTRAINT fk_materias_cursos ON public.materias IS 'FK cursos';
          public          postgres    false    2744            �
           2606    16487    materias fk_materias_profesores    FK CONSTRAINT     �   ALTER TABLE ONLY public.materias
    ADD CONSTRAINT fk_materias_profesores FOREIGN KEY (idprofesor) REFERENCES public.profesores(id_profesor);
 I   ALTER TABLE ONLY public.materias DROP CONSTRAINT fk_materias_profesores;
       public          postgres    false    2736    206    202            h           0    0 -   CONSTRAINT fk_materias_profesores ON materias    COMMENT     a   COMMENT ON CONSTRAINT fk_materias_profesores ON public.materias IS 'RelaciÃ³n con profesores';
          public          postgres    false    2745            �
           2606    16492    parientes parientes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.parientes
    ADD CONSTRAINT parientes_fk FOREIGN KEY (idalumnos) REFERENCES public.alumnos(idalumno) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.parientes DROP CONSTRAINT parientes_fk;
       public          postgres    false    2726    196    204           