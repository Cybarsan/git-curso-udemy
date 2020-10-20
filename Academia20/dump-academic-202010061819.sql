--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14
-- Dumped by pg_dump version 12.2

-- Started on 2020-10-06 18:19:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
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


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN alumnos.activo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.alumnos.activo IS 'Campo para activar o inactivar un alumno';


--
-- TOC entry 197 (class 1259 OID 16399)
-- Name: alumnos_idalumno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumnos_idalumno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumnos_idalumno_seq OWNER TO postgres;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 197
-- Name: alumnos_idalumno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumnos_idalumno_seq OWNED BY public.alumnos.idalumno;


--
-- TOC entry 198 (class 1259 OID 16401)
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    idcursos integer NOT NULL,
    nombrecurso character varying(50) NOT NULL,
    tipocurso integer NOT NULL,
    fechainicio date,
    fechafin date,
    comentario character varying(150)
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE cursos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.cursos IS 'Cursos de la Academia';


--
-- TOC entry 199 (class 1259 OID 16404)
-- Name: cursos_idcursos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_idcursos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cursos_idcursos_seq OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 199
-- Name: cursos_idcursos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_idcursos_seq OWNED BY public.cursos.idcursos;


--
-- TOC entry 200 (class 1259 OID 16406)
-- Name: materias_alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias_alumnos (
    idmateria_alumno integer NOT NULL,
    idalumno integer,
    idmateria integer
);


ALTER TABLE public.materias_alumnos OWNER TO postgres;

--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE materias_alumnos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.materias_alumnos IS 'Alumnos por materias';


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN materias_alumnos.idalumno; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.materias_alumnos.idalumno IS 'Alumno que asiste a la clase';


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN materias_alumnos.idmateria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.materias_alumnos.idmateria IS 'RelaciÃ³n con tabla materia';


--
-- TOC entry 201 (class 1259 OID 16409)
-- Name: cursos_materias_idmateriacurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_materias_idmateriacurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cursos_materias_idmateriacurso_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 201
-- Name: cursos_materias_idmateriacurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_materias_idmateriacurso_seq OWNED BY public.materias_alumnos.idmateria_alumno;


--
-- TOC entry 202 (class 1259 OID 16411)
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias (
    idmaterias integer NOT NULL,
    nombremateria character varying(60) NOT NULL,
    idcurso integer,
    idprofesor integer
);


ALTER TABLE public.materias OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE materias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.materias IS 'Materias de los cursos';


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN materias.nombremateria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.materias.nombremateria IS 'Descripcion de Materias';


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN materias.idcurso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.materias.idcurso IS 'RelaciÃ³n con la tabla cursos';


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN materias.idprofesor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.materias.idprofesor IS 'profesor que enseÃ±a la materia';


--
-- TOC entry 203 (class 1259 OID 16414)
-- Name: materias_idmaterias_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materias_idmaterias_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materias_idmaterias_seq OWNER TO postgres;

--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 203
-- Name: materias_idmaterias_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materias_idmaterias_seq OWNED BY public.materias.idmaterias;


--
-- TOC entry 204 (class 1259 OID 16416)
-- Name: parientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parientes (
    idparientes integer NOT NULL,
    idalumnos integer NOT NULL,
    nrocedula character varying(25),
    nombres character varying(70),
    apellidos character varying(70),
    celular character varying(25),
    telefono character varying(25),
    mail character varying(150)
);


ALTER TABLE public.parientes OWNER TO postgres;

--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE parientes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.parientes IS 'Datos de los padres o encargados';


--
-- TOC entry 205 (class 1259 OID 16419)
-- Name: parientes_idparientes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parientes_idparientes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parientes_idparientes_seq OWNER TO postgres;

--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 205
-- Name: parientes_idparientes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parientes_idparientes_seq OWNED BY public.parientes.idparientes;


--
-- TOC entry 206 (class 1259 OID 16421)
-- Name: profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesores (
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


ALTER TABLE public.profesores OWNER TO postgres;

--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN profesores.ruc_profesor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.profesores.ruc_profesor IS 'Ruc del profesor';


--
-- TOC entry 207 (class 1259 OID 16428)
-- Name: profesores_id_profesor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesores_id_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesores_id_profesor_seq OWNER TO postgres;

--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 207
-- Name: profesores_id_profesor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesores_id_profesor_seq OWNED BY public.profesores.id_profesor;


--
-- TOC entry 208 (class 1259 OID 16430)
-- Name: tipocursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipocursos (
    idtipocursos integer NOT NULL,
    descripcion character varying(150)
);


ALTER TABLE public.tipocursos OWNER TO postgres;

--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE tipocursos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tipocursos IS 'Tipo de los cursos de la Academia';


--
-- TOC entry 209 (class 1259 OID 16433)
-- Name: tipocursos_idtipocursos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipocursos_idtipocursos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipocursos_idtipocursos_seq OWNER TO postgres;

--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 209
-- Name: tipocursos_idtipocursos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipocursos_idtipocursos_seq OWNED BY public.tipocursos.idtipocursos;


--
-- TOC entry 210 (class 1259 OID 16435)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    idusuario integer NOT NULL,
    apellido_usuario character varying(255),
    cedusu character varying(255),
    contrasenia character varying(255),
    nombre_usuario character varying(255),
    usuario character varying(255)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16441)
-- Name: usuarios_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_idusuario_seq OWNER TO postgres;

--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 211
-- Name: usuarios_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_idusuario_seq OWNED BY public.usuarios.idusuario;


--
-- TOC entry 2716 (class 2604 OID 16443)
-- Name: alumnos idalumno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos ALTER COLUMN idalumno SET DEFAULT nextval('public.alumnos_idalumno_seq'::regclass);


--
-- TOC entry 2717 (class 2604 OID 16444)
-- Name: cursos idcursos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN idcursos SET DEFAULT nextval('public.cursos_idcursos_seq'::regclass);


--
-- TOC entry 2719 (class 2604 OID 16445)
-- Name: materias idmaterias; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias ALTER COLUMN idmaterias SET DEFAULT nextval('public.materias_idmaterias_seq'::regclass);


--
-- TOC entry 2718 (class 2604 OID 16446)
-- Name: materias_alumnos idmateria_alumno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_alumnos ALTER COLUMN idmateria_alumno SET DEFAULT nextval('public.cursos_materias_idmateriacurso_seq'::regclass);


--
-- TOC entry 2720 (class 2604 OID 16447)
-- Name: parientes idparientes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parientes ALTER COLUMN idparientes SET DEFAULT nextval('public.parientes_idparientes_seq'::regclass);


--
-- TOC entry 2722 (class 2604 OID 16448)
-- Name: profesores id_profesor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores ALTER COLUMN id_profesor SET DEFAULT nextval('public.profesores_id_profesor_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 16449)
-- Name: tipocursos idtipocursos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipocursos ALTER COLUMN idtipocursos SET DEFAULT nextval('public.tipocursos_idtipocursos_seq'::regclass);


--
-- TOC entry 2724 (class 2604 OID 16450)
-- Name: usuarios idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN idusuario SET DEFAULT nextval('public.usuarios_idusuario_seq'::regclass);


--
-- TOC entry 2868 (class 0 OID 16394)
-- Dependencies: 196
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alumnos VALUES (199, 'Benitez Oviedo', NULL, 'hola@mail.com', NULL, '', 'Velma Paloma', '', NULL, NULL);
INSERT INTO public.alumnos VALUES (201, 'sanier', '2837504', 'hola', NULL, '0981', 'alan', '', NULL, NULL);
INSERT INTO public.alumnos VALUES (4, 'Avalos DÃ­az', '252514', '0981565656', '5411441', 'hola@mail.com', 'SofÃ­a Valeria', 'Hola, grabando direcciÃ³n', '2015-01-01', 1);
INSERT INTO public.alumnos VALUES (15, 'Manera Barreto', '', '', '', '', 'Paula', '', NULL, 1);
INSERT INTO public.alumnos VALUES (16, 'Martinez Cardozo', '', '', '', '', 'Maria Eloisa', '', NULL, 1);
INSERT INTO public.alumnos VALUES (17, 'Mujica Torres', '', '', '', '', 'Tizia Nicole', '', NULL, 1);
INSERT INTO public.alumnos VALUES (18, 'Osorio Cardenas', '', '', '', '', 'Kiara Aileen', '', NULL, 1);
INSERT INTO public.alumnos VALUES (19, 'Riveros CabaÃ±as', '', '', '', '', 'Amaia', '', NULL, 1);
INSERT INTO public.alumnos VALUES (20, 'Rodriguez Pico', '', '', '', '', 'Pilar Elena', '', NULL, 1);
INSERT INTO public.alumnos VALUES (21, 'Aranda Godoy', '7490970', '', '', '', 'Kiara Ernestina', '', '2012-12-20', 1);
INSERT INTO public.alumnos VALUES (22, 'Figueredi Villar', '', '', '', '', 'Danna Sophia', '', NULL, 1);
INSERT INTO public.alumnos VALUES (23, 'Formosso Bernal', '7253814', '', '', '', 'Mayka Sophia LujÃ¡n', '', '2012-05-08', 1);
INSERT INTO public.alumnos VALUES (24, 'GimÃ©nez Franco', '7273752', '', '', '', 'Anna Paula', '', '2012-05-02', 1);
INSERT INTO public.alumnos VALUES (25, 'Godoy CÃ¡ceres', '7644324', '', '', '', 'Zaira Nazarena', '', '2012-11-17', 1);
INSERT INTO public.alumnos VALUES (26, 'Godoy FernÃ¡ndez', '7888810', '', '', '', 'Valentina Abigail', '', '2012-02-02', 1);
INSERT INTO public.alumnos VALUES (27, 'Lima Aquino', '7353279', '', '', '', 'Abril Estefania', '', '2012-10-22', 1);
INSERT INTO public.alumnos VALUES (28, 'OrtÃ­z Aguilera', '7082570', '', '', '', 'SofÃ­a Magali', '', '2012-01-12', 1);
INSERT INTO public.alumnos VALUES (29, 'RolÃ³n Prieto', '7460122', '', '', '', 'Fiorella Ahylen', '', '2012-06-25', 1);
INSERT INTO public.alumnos VALUES (30, 'Romero Rojas', '7279953', '', '', '', 'Annette Fiorella', '', '2012-05-03', 1);
INSERT INTO public.alumnos VALUES (31, 'RuÃ­z DÃ­az Miers', '7908337', '', '', '', 'Romina Soledad', '', '2012-12-06', 1);
INSERT INTO public.alumnos VALUES (32, 'Aquino OrtÃ­z', '7347238', '', '', '', ' Ana Paula', '', '2012-10-25', 1);
INSERT INTO public.alumnos VALUES (33, 'Aranda Godoy', '7490970', '', '', '', 'Kiara Ernestina', '', '2012-12-20', 1);
INSERT INTO public.alumnos VALUES (34, 'Arce Perez', '7267310', '', '', '', 'Sol Thais', '', '2012-03-27', 1);
INSERT INTO public.alumnos VALUES (35, 'Barreto BordÃ³n', '7277482', '', '', '', 'Camila MarÃ­a Aylen', '', '2012-05-24', 1);
INSERT INTO public.alumnos VALUES (36, 'BenÃ­tez Afara', '7483198', '', '', '', 'Luana Nicole', '', '2012-03-27', 1);
INSERT INTO public.alumnos VALUES (37, 'Caballero Villamayor', '7287449', '', '', '', 'Paz Anna Paula', '', '2012-03-08', 1);
INSERT INTO public.alumnos VALUES (38, 'FernÃ¡ndez Apontes', '7415619', '', '', '', 'Mia Isabella', '', '2012-11-02', 1);
INSERT INTO public.alumnos VALUES (39, 'Formosso Bernal', '7253814', '', '', '', 'Mayka Sophia LujÃ¡n', '', '2012-05-08', 1);
INSERT INTO public.alumnos VALUES (40, 'GimÃ©nez Franco', '7273752', '', '', '', 'Anna Paula', '', '2012-05-02', 1);
INSERT INTO public.alumnos VALUES (41, 'Godoy CÃ¡ceres', '7644324', '', '', '', 'Zaira Nazarena', '', '2012-11-17', 1);
INSERT INTO public.alumnos VALUES (42, 'Godoy FernÃ¡ndez', '7888810', '', '', '', 'Valentina Abigail', '', '2012-02-02', 1);
INSERT INTO public.alumnos VALUES (43, 'LeguizamÃ³n Medina', '7458646', '', '', '', 'Vanessa', '', '2012-03-03', 1);
INSERT INTO public.alumnos VALUES (44, 'Lima Aquino', '7353279', '', '', '', 'Abril Estefania', '', '2012-08-22', 1);
INSERT INTO public.alumnos VALUES (45, 'Melgarejo Acosta', '7808151', '', '', '', 'Lucero Estefania', '', NULL, 1);
INSERT INTO public.alumnos VALUES (46, 'OrtÃ­z Aguilera', '7082570', '', '', '', 'SofÃ­a Magali', '', '2012-01-12', 1);
INSERT INTO public.alumnos VALUES (47, 'PÃ©rez Cardozo', '7649751', '', '', '', ' Andrea Dilean', '', '2012-08-07', 1);
INSERT INTO public.alumnos VALUES (48, 'RodrÃ­guez Pico', '7652716', '', '', '', 'Pilar Elena', '', '2012-02-23', 1);
INSERT INTO public.alumnos VALUES (49, 'RolÃ³n Prieto', '7460122', '', '', '', 'Fiorella Ahylen', '', '2012-06-25', 1);
INSERT INTO public.alumnos VALUES (50, 'Romero Reyes', '7437529', '', '', '', 'Guadalupe Violeta', '', '2012-09-21', 1);
INSERT INTO public.alumnos VALUES (51, 'Romero Rojas', '7279953', '', '', '', 'Annette Fiorella', '', '2012-05-03', 1);
INSERT INTO public.alumnos VALUES (52, 'RuÃ­z DÃ­az Miers', '7908337', '', '', '', 'Romina Soledad', '', NULL, 1);
INSERT INTO public.alumnos VALUES (53, 'Sanier Urbieta', '7258345', '', '', '', 'Alexandra Fiorella', '', '2012-04-20', 1);
INSERT INTO public.alumnos VALUES (54, 'SordÃ© Cabral', '7933813', '', '', '', 'Montserrat', '', NULL, 1);
INSERT INTO public.alumnos VALUES (55, 'Torres FernÃ¡ndez', '7336080', '', '', '', 'Magali Fiorell', '', NULL, 1);
INSERT INTO public.alumnos VALUES (56, 'Vera Marecos', '7369367', '', '', '', 'Liv Agostina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (57, 'Vera Zoilan', '7315565', '', '', '', 'SofÃ­a Valentina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (58, 'Camperchioli Morales', '7552724', '', '', '', 'Annabella Ines', '', NULL, 1);
INSERT INTO public.alumnos VALUES (59, 'Ojeda Cano', '', '', '', '', 'Camila Maria Sol ', '', NULL, 1);
INSERT INTO public.alumnos VALUES (60, 'Serna Olguin', '7294625', '', '', '', 'Aileen Fabiola', '', NULL, 1);
INSERT INTO public.alumnos VALUES (61, 'Villamayor Cristaldo', '7539838', '', '', '', ' Ximena Monserrat', '', NULL, 1);
INSERT INTO public.alumnos VALUES (62, 'Arana Riquelme', '7009529', '', '', '', 'Fiorella Paloma', '', NULL, 1);
INSERT INTO public.alumnos VALUES (63, 'Arevalos Meza', '7095968', '', '', '', 'Ariane Isabella', '', NULL, 1);
INSERT INTO public.alumnos VALUES (64, 'Arrua Riquelme', '7185819', '', '', '', 'MarÃ­a Florencia', '', NULL, 1);
INSERT INTO public.alumnos VALUES (65, 'Camperchioli Morales', '7552724', '', '', '', ' Annabella Ines', '', NULL, 1);
INSERT INTO public.alumnos VALUES (66, 'Cantero Ferreira', '7809122', '', '', '', 'Zaira Ayelen', '', NULL, 1);
INSERT INTO public.alumnos VALUES (67, 'Riveros Palacios', '7106095', '', '', '', 'SofÃ­a Abigail', '', NULL, 1);
INSERT INTO public.alumnos VALUES (68, 'Salinas MartÃ­nez', '7095988', '', '', '', 'Saidy Magali', '', NULL, 1);
INSERT INTO public.alumnos VALUES (184, 'Maldondo OruÃ©', '5439380', '', '', '', 'Cecilia MagalÃ­', '', NULL, 1);
INSERT INTO public.alumnos VALUES (185, 'Melgarejo Arzamendia', '6754067', '', '', '', 'Cielo Fiorella JazmÃ­n', '', NULL, 1);
INSERT INTO public.alumnos VALUES (186, 'Mendoza Bracho', '5529070', '', '', '', 'Melany Lizzett', '', NULL, 1);
INSERT INTO public.alumnos VALUES (187, 'Montiel Franco', '5777493', '', '', '', 'MarÃ­a BelÃ©n', '', NULL, 1);
INSERT INTO public.alumnos VALUES (188, 'Orihuela Castellani', '6761382', '', '', '', ' Luana', '', NULL, 1);
INSERT INTO public.alumnos VALUES (189, 'Ortellado Flor', '6195125', '', '', '', 'MarÃ­a del Pilar', '', NULL, 1);
INSERT INTO public.alumnos VALUES (190, 'OrtÃ­z Leiva', '5644466', '', '', '', 'Vanina Ayelen', '', NULL, 1);
INSERT INTO public.alumnos VALUES (191, 'Osorio CÃ¡rdenas', '5702753', '', '', '', 'Gabriela Montserrat', '', NULL, 1);
INSERT INTO public.alumnos VALUES (192, 'Ozuna RodrÃ­guez', '5834593', '', '', '', 'Milagros Micaela', '', NULL, 1);
INSERT INTO public.alumnos VALUES (193, 'RodrÃ­guez Arevalos, ', '5930382', '', '', '', 'Fiorella Nahir', '', NULL, 1);
INSERT INTO public.alumnos VALUES (69, 'Serna Olguin', '7294625', '', '', '', 'Aileen Fabiola', '', NULL, 1);
INSERT INTO public.alumnos VALUES (70, 'Soler Riveros', '7064781', '', '', '', ' Luciana Micaela', '', NULL, 1);
INSERT INTO public.alumnos VALUES (71, 'VÃ¡zquez GonzÃ¡lez', '7747564', '', '', '', 'Dulce Valeria', '', NULL, 1);
INSERT INTO public.alumnos VALUES (72, 'Adrian Dominguez, ', '', '', '', '', 'Samira Elizabeth', '', NULL, 1);
INSERT INTO public.alumnos VALUES (73, 'Aquino BÃ¡ez', '7015020', '', '', '', 'LujÃ¡n Aracely', '', NULL, 1);
INSERT INTO public.alumnos VALUES (74, 'ChÃ¡vez EspÃ­nola', '7190815', '', '', '', 'Kamila Tais', '', NULL, 1);
INSERT INTO public.alumnos VALUES (75, 'Del Puerto Cubilla,', '6921929', '', '', '', 'Yessica Stephania', '', NULL, 1);
INSERT INTO public.alumnos VALUES (76, 'DÃ­az Balbuena', '7206282', '', '', '', 'MÃ­a Constanza', '', NULL, 1);
INSERT INTO public.alumnos VALUES (77, 'Figueredo Distefano ', '6705051', '', '', '', 'Maria Alexandra', '', NULL, 1);
INSERT INTO public.alumnos VALUES (78, 'Maioli Grenno', '', '', '', '', 'Fiorella', '', NULL, 1);
INSERT INTO public.alumnos VALUES (79, 'Mendieta Ovelar', '6787279', '', '', '', ' SofÃ­a Leonor', '', NULL, 1);
INSERT INTO public.alumnos VALUES (81, 'Yambay RÃ­os', '6768801', '', '', '', 'Yadira Susana', '', NULL, 1);
INSERT INTO public.alumnos VALUES (82, 'AdriÃ¡n DomÃ­nguez', '6970924', '', '', '', 'Samyra Elizabeth', '', NULL, 1);
INSERT INTO public.alumnos VALUES (83, 'Aquino BÃ¡ez', '7015020', '', '', '', 'LujÃ¡n Aracely', '', NULL, 1);
INSERT INTO public.alumnos VALUES (84, 'Aranda GonzÃ¡lez', '6970924', '', '', '', 'Hiellen BeatrÃ­z ', '', NULL, 1);
INSERT INTO public.alumnos VALUES (85, 'Ayala Garay', '6615221', '', '', '', 'Gabriela LujÃ¡n', '', NULL, 1);
INSERT INTO public.alumnos VALUES (86, 'Barrios RamÃ­rez', '6902325', '', '', '', 'Chiara Sabrina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (87, 'Barrios Segovia', '6974202', '', '', '', 'Fiorella SofÃ­a', '', NULL, 1);
INSERT INTO public.alumnos VALUES (88, 'CenturiÃ³n Rivas', '6683180', '', '', '', 'MarÃ­a Agustina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (203, 'Sanier QuiÃ±Ã³nez', '2837504', 'alan.sanier@gmail.com', '0994259659', '0981597976', 'Alan Cybar', 'Ã‘eembucÃº NÂ° 3283 e/ YbapovÃ³ y ParaÃ­so', NULL, 1);
INSERT INTO public.alumnos VALUES (200, 'Benitez Oviedo', NULL, 'hola@mail.com', NULL, '', 'Velma Paloma', '', NULL, NULL);
INSERT INTO public.alumnos VALUES (202, 'sanier', '2837504', 'hola', NULL, '0981', 'alan', '', NULL, NULL);
INSERT INTO public.alumnos VALUES (1, 'AlmirÃ³n Miers', '', '', '', '', 'Valentina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (89, 'ChÃ¡vez EspÃ­nola', '7190815', '', '', '', ' Kamila Tais', '', NULL, 1);
INSERT INTO public.alumnos VALUES (90, 'Del Puerto Cubilla', '6921929', '', '', '', 'Yessica Stephania', '', NULL, 1);
INSERT INTO public.alumnos VALUES (91, 'DÃ­az Balbuena', '7206282', '', '', '', 'MÃ­a Constanza', '', NULL, 1);
INSERT INTO public.alumnos VALUES (92, 'Figueredo Distefano', '6705051', '', '', '', 'Maria Alexandra', '', NULL, 1);
INSERT INTO public.alumnos VALUES (93, 'LÃ³pez Medina ', '6613722', '', '', '', 'Danna Milagros', '', NULL, 1);
INSERT INTO public.alumnos VALUES (94, 'LÃ³pez Medina', '6691038', '', '', '', 'Julieta Anahi', '', NULL, 1);
INSERT INTO public.alumnos VALUES (95, 'Mendieta Ovelar', '6787279', '', '', '', 'SofÃ­a Leonor', '', NULL, 1);
INSERT INTO public.alumnos VALUES (96, 'Meza Chamorro', '7036086', '', '', '', 'Kamyla Araceli', '', NULL, 1);
INSERT INTO public.alumnos VALUES (97, 'Miltos Peralta', '7074336', '', '', '', 'Fiorella Anahi', '', NULL, 1);
INSERT INTO public.alumnos VALUES (98, 'Miranda BÃ¡ez', '7255554', '', '', '', 'Ainhoa Patricia', '', NULL, 1);
INSERT INTO public.alumnos VALUES (99, 'RodrÃ­guez Rojas', '6776044', '', '', '', 'Isis Giuliana', '', NULL, 1);
INSERT INTO public.alumnos VALUES (100, 'VÃ¡zquez GonzÃ¡lez', '7040734', '', '', '', ' Dannia Valentina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (101, 'Vera DÃ­az', '6928908', '', '', '', 'Stefania Abigail', '', NULL, 1);
INSERT INTO public.alumnos VALUES (102, 'Villamayor Cristaldo', '7539838', '', '', '', 'Ximena Monserrat', '', NULL, 1);
INSERT INTO public.alumnos VALUES (103, 'Ayala BenÃ­tez', '6040674', '', '', '', 'Mia Constanza', '', NULL, 1);
INSERT INTO public.alumnos VALUES (104, 'Di Natale', '', '', '', '', 'Camila Arami', '', NULL, 1);
INSERT INTO public.alumnos VALUES (105, 'Franco VelÃ¡zquez', '7211604', '', '', '', 'Naara Lisette', '', NULL, 1);
INSERT INTO public.alumnos VALUES (106, 'Gonzalez Caceres', '', '', '', '', 'Andrea Karolina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (107, 'LÃ³pez Garcete', '6571260', '', '', '', 'Erika Aylen', '', NULL, 1);
INSERT INTO public.alumnos VALUES (108, 'Morinigo Araujo', '7318740', '', '', '', 'Eileen Amelie', '', NULL, 1);
INSERT INTO public.alumnos VALUES (109, 'RuÃ­z Noguera', '6754321', '', '', '', 'Cecilia InÃ©s', '', NULL, 1);
INSERT INTO public.alumnos VALUES (110, 'Silguero Samudio', '6347748', '', '', '', 'Aracely Monserrath', '', NULL, 1);
INSERT INTO public.alumnos VALUES (111, 'Torres DomÃ­nguez', '6997346', '', '', '', 'JazmÃ­n Betarram', '', NULL, 1);
INSERT INTO public.alumnos VALUES (112, 'Zarza OrtÃ­z', '6507257', '', '', '', 'Brenda Guadalupe', '', NULL, 1);
INSERT INTO public.alumnos VALUES (113, 'Ayala BenÃ­tez', '6040674', '', '', '', 'Mia Constanza', '', NULL, 1);
INSERT INTO public.alumnos VALUES (114, 'Chena Laguna', '5965901', '', '', '', 'Mia Fiorella', '', NULL, 1);
INSERT INTO public.alumnos VALUES (115, 'Di Natale', 'YA5836085', '', '', '', 'Camila Arami', '', NULL, 1);
INSERT INTO public.alumnos VALUES (116, 'Franco VelÃ¡zquez', '7211604', '', '', '', 'Naara Lisette', '', NULL, 1);
INSERT INTO public.alumnos VALUES (117, 'Goldemberg', '7839185', '', '', '', 'Camila Araceli', '', NULL, 1);
INSERT INTO public.alumnos VALUES (118, 'LÃ³pez Garcete', '6571260', '', '', '', 'Erika Aylen', '', NULL, 1);
INSERT INTO public.alumnos VALUES (119, 'Matto Coronel', '6581217', '', '', '', 'Mia Daniela', '', NULL, 1);
INSERT INTO public.alumnos VALUES (120, 'Morinigo Araujo', '7318740', '', '', '', ' Eileen Amelie', '', NULL, 1);
INSERT INTO public.alumnos VALUES (121, 'Parquet Matiauda', '5742304', '', '', '', 'Lourdes Alice', '', NULL, 1);
INSERT INTO public.alumnos VALUES (122, 'RuÃ­z Martinez', '7004701', '', '', '', 'BelÃ©n AramÃ­', '', NULL, 1);
INSERT INTO public.alumnos VALUES (123, 'RuÃ­z Noguera', '6754321', '', '', '', 'Cecilia InÃ©s', '', NULL, 1);
INSERT INTO public.alumnos VALUES (124, 'Silguero Samudio', '6347748', '', '', '', 'Aracely Monserrath', '', NULL, 1);
INSERT INTO public.alumnos VALUES (125, 'Torres DomÃ­nguez', '6997346', '', '', '', 'JazmÃ­n Betarram', '', NULL, 1);
INSERT INTO public.alumnos VALUES (126, 'ValdÃ©z GonzÃ¡lez', '6770293', '', '', '', ' Pauly Arami', '', NULL, 1);
INSERT INTO public.alumnos VALUES (127, 'Yambay RÃ­os', '6768801', '', '', '', 'Yadira Susana', '', NULL, 1);
INSERT INTO public.alumnos VALUES (128, 'Zarza OrtÃ­z', '6507257', '', '', '', 'Brenda Guadalupe', '', NULL, 1);
INSERT INTO public.alumnos VALUES (129, 'Aguilar Tudela', '5798167', '', '', '', ' Daniela LucÃ­a', '', NULL, 1);
INSERT INTO public.alumnos VALUES (130, 'Caceres Ojeda', '6357704', '', '', '', ' Leila Montserrath', '', NULL, 1);
INSERT INTO public.alumnos VALUES (131, 'GonzÃ¡lez RamÃ­rez', '6561643', '', '', '', 'Cecilia MarÃ­a Patricia', '', NULL, 1);
INSERT INTO public.alumnos VALUES (132, 'MartÃ­nez Aguilera', '6335512', '', '', '', 'Selena Alejandra', '', NULL, 1);
INSERT INTO public.alumnos VALUES (133, 'MartÃ­nez Ayala', '6248111', '', '', '', 'Katalina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (134, 'MartÃ­nez GÃ³mez', '5878952', '', '', '', 'Sonia Isabel', '', NULL, 1);
INSERT INTO public.alumnos VALUES (135, 'NuÃ±ez BenÃ­tez ', '7090584', '', '', '', 'MÃ³nica MarÃ­a Cielo', '', NULL, 1);
INSERT INTO public.alumnos VALUES (136, 'Pacher Enciso', '6776958', '', '', '', 'Leyden Amily', '', NULL, 1);
INSERT INTO public.alumnos VALUES (137, 'RamÃ­rez Galeano', '6065125', '', '', '', 'Antonella LujÃ¡n ', '', NULL, 1);
INSERT INTO public.alumnos VALUES (138, 'RamÃ­rez Pera', '6644623', '', '', '', 'LujÃ¡n Montserrat', '', NULL, 1);
INSERT INTO public.alumnos VALUES (139, 'RodrÃ­guez Espinola', '5874008', '', '', '', ' Mareli Angeline', '', NULL, 1);
INSERT INTO public.alumnos VALUES (140, 'Silva Vera', '6065130', '', '', '', 'Sabrina Noeli', '', NULL, 1);
INSERT INTO public.alumnos VALUES (141, 'Vaesken Flores', '6044428', '', '', '', 'MÃ­a MarÃ­a JosÃ©', '', NULL, 1);
INSERT INTO public.alumnos VALUES (142, 'Villalba GonzÃ¡lez', '6696724', '', '', '', 'Gabriela', '', NULL, 1);
INSERT INTO public.alumnos VALUES (143, 'Aguilar Tudela', '5639776', '', '', '', 'Valentina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (144, 'Almada BenÃ­tez', '6154683', '', '', '', 'Avril Ayelen', '', NULL, 1);
INSERT INTO public.alumnos VALUES (145, 'Britos Palacios', '6528524', '', '', '', 'JazmÃ­n Ma. Paz', '', NULL, 1);
INSERT INTO public.alumnos VALUES (146, 'Cabriza DÃ¡valos', '5909767', '', '', '', ' Danna Ma. Elvira', '', NULL, 1);
INSERT INTO public.alumnos VALUES (147, 'Cantero Ferreira', '6109705', '', '', '', ' Pamela Abigail', '', NULL, 1);
INSERT INTO public.alumnos VALUES (148, 'Chamorro GimÃ©nez', '6155984', '', '', '', ' Guiovanna Magali', '', NULL, 1);
INSERT INTO public.alumnos VALUES (149, 'ChÃ¡vez Parodi', '6685169', '', '', '', 'Alba MarÃ­a', '', NULL, 1);
INSERT INTO public.alumnos VALUES (150, 'D Apollo Salinas', '7335776', '', '', '', 'Nicole Fiorella', '', NULL, 1);
INSERT INTO public.alumnos VALUES (151, 'Denis MartÃ­nez', '7054352', '', '', '', 'Valeria BeatrÃ­z', '', NULL, 1);
INSERT INTO public.alumnos VALUES (152, 'Flores Vera', '5931657', '', '', '', 'Patricia Arami', '', NULL, 1);
INSERT INTO public.alumnos VALUES (153, 'Galeano Niz', '5985757', '', '', '', 'Ariadna MarÃ­a', '', NULL, 1);
INSERT INTO public.alumnos VALUES (154, 'GÃ³mez Alvarez', '5595224', '', '', '', 'MarÃ­a Cecilia', '', NULL, 1);
INSERT INTO public.alumnos VALUES (155, 'GonzÃ¡lez BrÃ­tez', '6246635', '', '', '', 'Dana Gabriela', '', NULL, 1);
INSERT INTO public.alumnos VALUES (156, 'GonzÃ¡lez Velozo', '6361867', '', '', '', 'LujÃ¡n Estefania', '', NULL, 1);
INSERT INTO public.alumnos VALUES (157, 'Lange OrtÃ­z', '5874580', '', '', '', 'Tatiana Monserrat', '', NULL, 1);
INSERT INTO public.alumnos VALUES (158, 'Maluf Lettieri', '6665161', '', '', '', 'Nicole Marilyn', '', NULL, 1);
INSERT INTO public.alumnos VALUES (159, 'Melgarejo Lugo', '5605638', '', '', '', 'Fiorella LujÃ¡n', '', NULL, 1);
INSERT INTO public.alumnos VALUES (204, 'sanier', '2837504', 'jojojo@mail.com', '99155447', '098145457', 'alan', 'hola', '1978-06-28', 1);
INSERT INTO public.alumnos VALUES (6, 'Benitez Oviedo', '543217', '0981123456', '124578', 'hola@mail.com', 'Velma Paloma', 'Hola', '2013-01-01', 1);
INSERT INTO public.alumnos VALUES (5, 'Barboza Fernandez', '1234567', '0981123456', '09815956564', 'hola@mail.com', 'SofÃ­a', 'Hola en 123', '2014-02-01', 1);
INSERT INTO public.alumnos VALUES (7, 'Caballer0o Gimenez', '1112224', '', '', 'hola@hola.com', 'Ariana Romina', '', '2015-01-01', 1);
INSERT INTO public.alumnos VALUES (3, 'Andino VelÃ¡zquez', '123456', '0981597976', '0994259789784', 'jojojo@msil.com', 'Zaira Valentina', 'Ã‘eembucÃº NÂ° 3283', '2014-01-01', 1);
INSERT INTO public.alumnos VALUES (2, 'Amarilla Leiva', '', '', '', '', 'SofÃ­a Naiara', '', NULL, 1);
INSERT INTO public.alumnos VALUES (8, 'Cardozo Sanabria', '', '', '', '', 'Jennifer Nicole', '', NULL, 1);
INSERT INTO public.alumnos VALUES (9, 'Del Puerto Ayala', '', '', '', '', 'Brisa Aurora', '', NULL, 1);
INSERT INTO public.alumnos VALUES (10, 'Di Natale', '', '', '', '', 'Ornella Anahi', '', NULL, 1);
INSERT INTO public.alumnos VALUES (11, 'Elizeche Vicencini', '', '', '', '', 'Bianca Annabella', '', NULL, 1);
INSERT INTO public.alumnos VALUES (12, 'Gali Esteche', '', '', '', '', 'Rosa Rebecca', '', NULL, 1);
INSERT INTO public.alumnos VALUES (13, 'Gomez Fernandez', '', '', '', '', 'Paula Valentina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (14, 'Insfran Cano', '', '', '', '', 'Milagros Isabel', '', NULL, 1);
INSERT INTO public.alumnos VALUES (80, 'Samudio', '', '', '', '', ' Sofia', '', NULL, 1);
INSERT INTO public.alumnos VALUES (160, 'NuÃ±ez Espinola', '5746996', '', '', '', ' Christian David', '', NULL, 1);
INSERT INTO public.alumnos VALUES (161, 'NuÃ±ez ServiÃ¡n', '6115175', '', '', '', ' Ariadna SofÃ­a', '', NULL, 1);
INSERT INTO public.alumnos VALUES (162, 'Ojeda NuÃ±ez', '6586480', '', '', '', 'JoselÃ­n Alexandra', '', NULL, 1);
INSERT INTO public.alumnos VALUES (163, 'Olmedo GonzÃ¡lez', '6576625', '', '', '', 'Fiorella Agustina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (164, 'Paredes RuÃ­z', '6246554', '', '', '', 'FÃ¡tima MarÃ­a del Carmen', '', NULL, 1);
INSERT INTO public.alumnos VALUES (165, 'RamÃ­rez CenturiÃ³n', '7043892', '', '', '', 'MarÃ­a LujÃ¡n', '', NULL, 1);
INSERT INTO public.alumnos VALUES (166, 'Reinoso Reinoso', '7040493', '', '', '', 'Samira Jeanette', '', NULL, 1);
INSERT INTO public.alumnos VALUES (167, 'RodrÃ­guez Espinola,', '5874008', '', '', '', ' Mareli Angeline', '', NULL, 1);
INSERT INTO public.alumnos VALUES (168, 'VelÃ¡zquez MartÃ­nez', '5548299', '', '', '', ' Angeles Ariadna ', '', NULL, 1);
INSERT INTO public.alumnos VALUES (169, 'Zayas MartÃ­nez', '5989167', '', '', '', 'Mia Isabella', '', NULL, 1);
INSERT INTO public.alumnos VALUES (170, 'Acosta Burgos', '6061499', '', '', '', 'Luana Azucena', '', NULL, 1);
INSERT INTO public.alumnos VALUES (171, 'Aguilar RamÃ­rez', '5558266', '', '', '', 'Yissela Belen', '', NULL, 1);
INSERT INTO public.alumnos VALUES (172, 'Arce Azuaga', '5443526', '', '', '', 'Sol Magaly', '', NULL, 1);
INSERT INTO public.alumnos VALUES (173, 'Armoa NuÃ±ez', '5740046', '', '', '', 'Sophia Emilia', '', NULL, 1);
INSERT INTO public.alumnos VALUES (174, 'Cabral Mosqueira', '6012808', '', '', '', 'Laura Fernanda', '', NULL, 1);
INSERT INTO public.alumnos VALUES (175, 'Camperchioli Morales', '5659144', '', '', '', 'Violeta Lucia', '', NULL, 1);
INSERT INTO public.alumnos VALUES (176, 'Cartasso Flores', '5934326', '', '', '', 'Araceli Ma. Isabel', '', NULL, 1);
INSERT INTO public.alumnos VALUES (177, 'Chena Galeano', '5930408', '', '', '', 'MarÃ­a LujÃ¡n', '', NULL, 1);
INSERT INTO public.alumnos VALUES (178, 'Da Silveira Medina', '5660011', '', '', '', ' Luanna Camile', '', NULL, 1);
INSERT INTO public.alumnos VALUES (179, 'Gaona GÃ³mez', '5932601', '', '', '', 'MarÃ­a Amelia', '', NULL, 1);
INSERT INTO public.alumnos VALUES (180, 'GarcÃ­a Santacruz', '7103130', '', '', '', 'Astrid Guadalupe', '', NULL, 1);
INSERT INTO public.alumnos VALUES (181, 'GimÃ©nez GarcÃ­a', '6219599', '', '', '', 'Carmen MarÃ­a Paz', '', NULL, 1);
INSERT INTO public.alumnos VALUES (182, 'LeÃ³n GonzÃ¡lez', '5907755', '', '', '', 'Gabriela LeÃ³n', '', NULL, 1);
INSERT INTO public.alumnos VALUES (183, 'Lezcano Figueredo', '6152363', '', '', '', 'MÃ­a Abril', '', NULL, 1);
INSERT INTO public.alumnos VALUES (194, 'RomÃ¡n Roa', '6661791', '', '', '', 'Luana Micaela', '', NULL, 1);
INSERT INTO public.alumnos VALUES (195, 'Valiente NuÃ±ez', '6156980', '', '', '', 'MarÃ­a Gabriela', '', NULL, 1);
INSERT INTO public.alumnos VALUES (196, 'LeÃ³n GonzÃ¡lez', '6843667', '', '', '', 'Sol Regina', '', NULL, 1);
INSERT INTO public.alumnos VALUES (197, 'RodrÃ­guez Orrego', '7214958', '', '', '', 'Jimena SofÃ­a', '', '2015-01-01', 1);
INSERT INTO public.alumnos VALUES (198, 'Stanley Villalba', '6960128', '', '', '', 'Gisella Ivanna', '', '2001-01-01', 1);


--
-- TOC entry 2870 (class 0 OID 16401)
-- Dependencies: 198
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2874 (class 0 OID 16411)
-- Dependencies: 202
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.materias VALUES (1, 'ClÃ¡sico', NULL, NULL);
INSERT INTO public.materias VALUES (2, 'Paraguayo', NULL, NULL);
INSERT INTO public.materias VALUES (3, 'EspaÃ±ol', NULL, NULL);
INSERT INTO public.materias VALUES (4, 'Jazz', NULL, NULL);


--
-- TOC entry 2872 (class 0 OID 16406)
-- Dependencies: 200
-- Data for Name: materias_alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2876 (class 0 OID 16416)
-- Dependencies: 204
-- Data for Name: parientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.parientes VALUES (2, 4, '6546541q', 'hghgf', 'fgdsfdsfesa', '9876543214', NULL, NULL);
INSERT INTO public.parientes VALUES (3, 3, '31321', 'dfgsdfsdf', 'sdfsdf', '321321321', NULL, NULL);


--
-- TOC entry 2878 (class 0 OID 16421)
-- Dependencies: 206
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profesores VALUES (1, 'TORRES MONGELOS', '4753922', '982408535', '', '', 'AGUSTINA', '', '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (2, 'TORRES MONGELOS', '4753922', '982408535', '', '', 'AGUSTINA', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (3, 'TORRES MONGELOS', '4753922', '982408535', '', '', 'AGUSTINA', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (4, 'ACOSTA VILLAMAYOR', '5412353', '985209812', '', '', 'MARIA ALEJANDRA ', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (5, 'CACERES FIGUEREDO', '4342448', '991807108', '', '', 'ANDREA CAROLINA', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (6, 'OVELAR BOGADO', '4619263', '981575703', '', 'aj.ovelar@gmail.com', 'ANGEL DE JESUS', NULL, '12648559', 0, NULL, 1);
INSERT INTO public.profesores VALUES (7, 'BENÃ�TEZ OLMEDO', '4202061', '972389973', '', '', 'CAMILA BEATRIZ', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (8, 'DUARTE ROJAS', '4309524', '972591274', '', '', 'CAMILA MARIA VICTORIA', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (9, 'TORRES ARAVENA', '3956656', '961604109', '', '', 'CARLOS EDMUNDO', NULL, '12648788', 0, NULL, 1);
INSERT INTO public.profesores VALUES (10, 'CACERES ', '4671012', '985447434', '', 'miakcrz@gmail.com', 'CARMEN ROMINA', NULL, '12648567', 0, NULL, 1);
INSERT INTO public.profesores VALUES (11, 'ZARATE MORAL', '3002242', '972216383', '', '', 'CRISTHIAN GABRIEL', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (12, 'ECHAGUE DE LOPEZ', '4637913', '984956521', '', 'cechaguedel@gmail.com', 'CYNTHIA FIDELINA', NULL, '12648575', 0, NULL, 1);
INSERT INTO public.profesores VALUES (13, 'PAEZ NOGUERA', '4275784', '986507777', '', 'flaviapaezn03@gmail.com', 'FLAVIA MARIA', NULL, '12633151', 0, NULL, 1);
INSERT INTO public.profesores VALUES (14, 'LEPEL VELAZQUEZ', '3635529', '992311540', '', 'gianinalepel.gl@gmail.com', 'GIANINA NADIR', NULL, '12648591', 0, NULL, 1);
INSERT INTO public.profesores VALUES (15, 'FERNANDEZ SANCHEZ', '', '984778978', '', 'giannifer9@hotmail.com', 'GIANINNA GABRIELA', NULL, '9062720', 0, NULL, 1);
INSERT INTO public.profesores VALUES (16, 'GAUTO', '4633372', '981282858', '', '', 'HUMBERTO ARMIN', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (17, 'MOLINAS SILVA', '5439338', '971868286', '', 'belen-molinas@hotmail.com', 'IRMA BELEN', NULL, '12648796', 0, NULL, 1);
INSERT INTO public.profesores VALUES (18, 'AMMATUNA CABAÃ‘AS', '4612911', '982277369', '', '', 'SONNIA ISABELLA ', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (19, 'GABAGLIO NAVARRO', '3443217', '994253734', '', 'lauraantonella@hotmail.es', 'LAURA ANTONELLA', NULL, '12648605', 0, NULL, 1);
INSERT INTO public.profesores VALUES (20, 'BOBADILLA GAMARRA', '4219790', '981667286', '', 'lnbobadilla@hotmail.com', 'LAURA NOEMI', NULL, '12648613', 0, NULL, 1);
INSERT INTO public.profesores VALUES (21, 'GIMENEZ GARCIA', '3491293', '983739454', '', 'mauxi_22@hotmail.com', 'MARIA AUXILIADORA', NULL, '12648826', 0, NULL, 1);
INSERT INTO public.profesores VALUES (22, 'BAEZ DUARTE', '', '981242855', '', 'cristi_badu@hotmail.com', 'MARIA CRISTINA', NULL, '12648761', 0, NULL, 1);
INSERT INTO public.profesores VALUES (23, 'AGUILAR', '3871141', '981101086', '', '', 'MARIPAZ', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (24, 'CABRERA AQUINO', '816229', '981354153', '', 'mercabrera84@gmail.com', 'MERCEDES CONCEPCION', NULL, '12648648', 0, NULL, 1);
INSERT INTO public.profesores VALUES (25, 'RAMOS CORVALAN', '1884567', '981170758', '', 'nataliaramosdance@hotmail.com', 'NATALIA ELISA', NULL, '12648656', 0, NULL, 1);
INSERT INTO public.profesores VALUES (26, 'ORREGO COLMAN', '3372025', '982612303', '', 'niniveorregodanza@gmail.com', 'CECILIA NINIVE', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (27, 'SALDIVAR FARIAS', '3642067', '981334357', '', 'sandra_88farias@hotmail.com', 'SANDRA MARIA', NULL, '12648672', 0, NULL, 1);
INSERT INTO public.profesores VALUES (28, 'TORALES FRUTOS ', '3796294', '981405485', '', '', 'VALERIA MARIA', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (29, 'PATIÃ‘O', '3918689', '981661016', '', '', 'YULIA ', NULL, '', 0, NULL, 1);
INSERT INTO public.profesores VALUES (30, 'ID LUGO', '', '971186595', '', 'lauraid@hotmail.com ', 'MARIA LAURA', NULL, '12648818', 0, NULL, 1);
INSERT INTO public.profesores VALUES (31, '', '', '', '', '', '', NULL, '', 0, NULL, 1);


--
-- TOC entry 2880 (class 0 OID 16430)
-- Dependencies: 208
-- Data for Name: tipocursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipocursos VALUES (1, 'Ministerial');
INSERT INTO public.tipocursos VALUES (2, 'Preparatorio');
INSERT INTO public.tipocursos VALUES (3, 'EspecializaciÃ³n');
INSERT INTO public.tipocursos VALUES (4, 'Instructivo');


--
-- TOC entry 2882 (class 0 OID 16435)
-- Dependencies: 210
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios VALUES (1, 'Probando', '1234567', 'probando', 'Prueba', 'usuario');
INSERT INTO public.usuarios VALUES (2, 'Del Sistema', '1234567', 'admin123', 'Administrador', 'admin');
INSERT INTO public.usuarios VALUES (3, NULL, '1234567', '12345', 'Katerine', 'kate');
INSERT INTO public.usuarios VALUES (4, NULL, '1234567', '12345', 'Anita', 'anita');


--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 197
-- Name: alumnos_idalumno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumnos_idalumno_seq', 204, true);


--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 199
-- Name: cursos_idcursos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_idcursos_seq', 1, false);


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 201
-- Name: cursos_materias_idmateriacurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_materias_idmateriacurso_seq', 1, false);


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 203
-- Name: materias_idmaterias_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materias_idmaterias_seq', 4, true);


--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 205
-- Name: parientes_idparientes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parientes_idparientes_seq', 3, true);


--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 207
-- Name: profesores_id_profesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_id_profesor_seq', 31, true);


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 209
-- Name: tipocursos_idtipocursos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipocursos_idtipocursos_seq', 4, true);


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 211
-- Name: usuarios_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_idusuario_seq', 4, true);


--
-- TOC entry 2726 (class 2606 OID 16452)
-- Name: alumnos alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (idalumno);


--
-- TOC entry 2728 (class 2606 OID 16454)
-- Name: cursos cursos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pk PRIMARY KEY (idcursos);


--
-- TOC entry 2734 (class 2606 OID 16456)
-- Name: parientes parientes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parientes
    ADD CONSTRAINT parientes_pk PRIMARY KEY (idparientes);


--
-- TOC entry 2730 (class 2606 OID 16458)
-- Name: materias_alumnos pk_cursos_materias_idmateria_alumno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_alumnos
    ADD CONSTRAINT pk_cursos_materias_idmateria_alumno PRIMARY KEY (idmateria_alumno);


--
-- TOC entry 2732 (class 2606 OID 16460)
-- Name: materias pk_materias_idmaterias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT pk_materias_idmaterias PRIMARY KEY (idmaterias);


--
-- TOC entry 2736 (class 2606 OID 16462)
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id_profesor);


--
-- TOC entry 2738 (class 2606 OID 16464)
-- Name: tipocursos tipocursos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipocursos
    ADD CONSTRAINT tipocursos_pk PRIMARY KEY (idtipocursos);


--
-- TOC entry 2740 (class 2606 OID 16466)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 2741 (class 2606 OID 16467)
-- Name: cursos cursos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_fk FOREIGN KEY (tipocurso) REFERENCES public.tipocursos(idtipocursos) ON DELETE RESTRICT;


--
-- TOC entry 2742 (class 2606 OID 16472)
-- Name: materias_alumnos fk_cursos_materias_alumnos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_alumnos
    ADD CONSTRAINT fk_cursos_materias_alumnos FOREIGN KEY (idalumno) REFERENCES public.alumnos(idalumno) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2743 (class 2606 OID 16477)
-- Name: materias_alumnos fk_cursos_materias_materias; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_alumnos
    ADD CONSTRAINT fk_cursos_materias_materias FOREIGN KEY (idmateria) REFERENCES public.materias(idmaterias) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2744 (class 2606 OID 16482)
-- Name: materias fk_materias_cursos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT fk_materias_cursos FOREIGN KEY (idcurso) REFERENCES public.cursos(idcursos) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 2744
-- Name: CONSTRAINT fk_materias_cursos ON materias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT fk_materias_cursos ON public.materias IS 'FK cursos';


--
-- TOC entry 2745 (class 2606 OID 16487)
-- Name: materias fk_materias_profesores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT fk_materias_profesores FOREIGN KEY (idprofesor) REFERENCES public.profesores(id_profesor);


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 2745
-- Name: CONSTRAINT fk_materias_profesores ON materias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT fk_materias_profesores ON public.materias IS 'RelaciÃ³n con profesores';


--
-- TOC entry 2746 (class 2606 OID 16492)
-- Name: parientes parientes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parientes
    ADD CONSTRAINT parientes_fk FOREIGN KEY (idalumnos) REFERENCES public.alumnos(idalumno) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2020-10-06 18:19:48

--
-- PostgreSQL database dump complete
--

