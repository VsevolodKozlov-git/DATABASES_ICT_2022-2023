PGDMP     -                     {            session    14.7    14.7 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    session    DATABASE     d   CREATE DATABASE session WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE session;
                postgres    false            �           1247    16668    certification_data_type    TYPE     w   CREATE TYPE public.certification_data_type AS ENUM (
    'зачет',
    'дифзачет',
    'экзамен'
);
 *   DROP TYPE public.certification_data_type;
       public          postgres    false            `           1247    16525    payment_status_type    TYPE     �   CREATE TYPE public.payment_status_type AS ENUM (
    'выплачено',
    'не выплачено',
    'в обработке'
);
 &   DROP TYPE public.payment_status_type;
       public          postgres    false            �           1247    16594    room_type_datatype    TYPE     �   CREATE TYPE public.room_type_datatype AS ENUM (
    'лекционная',
    'практическая',
    'лаборатория'
);
 %   DROP TYPE public.room_type_datatype;
       public          postgres    false            Z           1247    16494    scholarship_type    TYPE     �   CREATE TYPE public.scholarship_type AS ENUM (
    'социальная',
    'академическая',
    'именная'
);
 #   DROP TYPE public.scholarship_type;
       public          postgres    false            W           1247    16421    subdivision_type    TYPE     \   CREATE TYPE public.subdivision_type AS ENUM (
    'основной',
    'филиал'
);
 #   DROP TYPE public.subdivision_type;
       public          postgres    false            �            1259    16509    awarded_scholarships    TABLE       CREATE TABLE public.awarded_scholarships (
    id_awarded_scholarship integer NOT NULL,
    id_record_book integer NOT NULL,
    id_scholarship integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    CONSTRAINT end_after_start CHECK ((end_date > start_date))
);
 (   DROP TABLE public.awarded_scholarships;
       public         heap    postgres    false            �            1259    16508 /   awarded_scholarships_id_awarded_scholarship_seq    SEQUENCE     �   CREATE SEQUENCE public.awarded_scholarships_id_awarded_scholarship_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.awarded_scholarships_id_awarded_scholarship_seq;
       public          postgres    false    222            �           0    0 /   awarded_scholarships_id_awarded_scholarship_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.awarded_scholarships_id_awarded_scholarship_seq OWNED BY public.awarded_scholarships.id_awarded_scholarship;
          public          postgres    false    221            �            1259    16602    campuses    TABLE     t   CREATE TABLE public.campuses (
    id_campus integer NOT NULL,
    address text NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.campuses;
       public         heap    postgres    false            �            1259    16601    campuses_id_campus_seq    SEQUENCE     �   CREATE SEQUENCE public.campuses_id_campus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.campuses_id_campus_seq;
       public          postgres    false    240            �           0    0    campuses_id_campus_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.campuses_id_campus_seq OWNED BY public.campuses.id_campus;
          public          postgres    false    239            �            1259    16446    disciplines    TABLE       CREATE TABLE public.disciplines (
    id_discipline integer NOT NULL,
    name text NOT NULL,
    selfstudy_hours smallint NOT NULL,
    practice_hours smallint NOT NULL,
    lecture_hours smallint NOT NULL,
    CONSTRAINT pos_practice CHECK ((practice_hours > 0))
);
    DROP TABLE public.disciplines;
       public         heap    postgres    false            �            1259    16445    discipline_id_discipline_seq    SEQUENCE     �   CREATE SEQUENCE public.discipline_id_discipline_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.discipline_id_discipline_seq;
       public          postgres    false    214            �           0    0    discipline_id_discipline_seq    SEQUENCE OWNED BY     ^   ALTER SEQUENCE public.discipline_id_discipline_seq OWNED BY public.disciplines.id_discipline;
          public          postgres    false    213            �            1259    16431 
   edu_tracks    TABLE     �   CREATE TABLE public.edu_tracks (
    id_edu_track integer NOT NULL,
    code_edu_track character varying(10) NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.edu_tracks;
       public         heap    postgres    false            �            1259    16430    edu_track_id_edu_track_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_track_id_edu_track_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.edu_track_id_edu_track_seq;
       public          postgres    false    212            �           0    0    edu_track_id_edu_track_seq    SEQUENCE OWNED BY     Z   ALTER SEQUENCE public.edu_track_id_edu_track_seq OWNED BY public.edu_tracks.id_edu_track;
          public          postgres    false    211            �            1259    16572    employment_contracts    TABLE     &  CREATE TABLE public.employment_contracts (
    id_contract integer NOT NULL,
    id_teacher integer NOT NULL,
    share_rate real NOT NULL,
    id_subdivision integer NOT NULL,
    CONSTRAINT share_rate CHECK (((share_rate > (0)::double precision) AND (share_rate < (1)::double precision)))
);
 (   DROP TABLE public.employment_contracts;
       public         heap    postgres    false            �            1259    16571 $   employment_contracts_id_contract_seq    SEQUENCE     �   CREATE SEQUENCE public.employment_contracts_id_contract_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.employment_contracts_id_contract_seq;
       public          postgres    false    234            �           0    0 $   employment_contracts_id_contract_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.employment_contracts_id_contract_seq OWNED BY public.employment_contracts.id_contract;
          public          postgres    false    233            �            1259    16476    groups    TABLE     (  CREATE TABLE public.groups (
    id_group integer NOT NULL,
    id_study_plan integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    group_name character varying(10) NOT NULL,
    course integer NOT NULL,
    CONSTRAINT end_after_start CHECK ((end_date > start_date))
);
    DROP TABLE public.groups;
       public         heap    postgres    false            �            1259    16475    group_id_group_seq    SEQUENCE     �   CREATE SEQUENCE public.group_id_group_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.group_id_group_seq;
       public          postgres    false    218            �           0    0    group_id_group_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.group_id_group_seq OWNED BY public.groups.id_group;
          public          postgres    false    217            �            1259    16549    record_book    TABLE     �  CREATE TABLE public.record_book (
    id_row_record_book integer NOT NULL,
    id_group_row integer NOT NULL,
    id_teacher integer NOT NULL,
    id_study_course integer NOT NULL,
    mark smallint NOT NULL,
    exam_date date NOT NULL,
    try_number smallint NOT NULL,
    CONSTRAINT mark_check CHECK (((mark >= 2) AND (mark <= 5))),
    CONSTRAINT try_number_check CHECK (((try_number >= 1) AND (try_number <= 3)))
);
    DROP TABLE public.record_book;
       public         heap    postgres    false            �            1259    16548 "   record_book_id_row_record_book_seq    SEQUENCE     �   CREATE SEQUENCE public.record_book_id_row_record_book_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.record_book_id_row_record_book_seq;
       public          postgres    false    230            �           0    0 "   record_book_id_row_record_book_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.record_book_id_row_record_book_seq OWNED BY public.record_book.id_row_record_book;
          public          postgres    false    229            �            1259    16587    rooms    TABLE     �   CREATE TABLE public.rooms (
    id_room integer NOT NULL,
    id_campus integer NOT NULL,
    room_number character varying(10) NOT NULL,
    room_type public.room_type_datatype NOT NULL
);
    DROP TABLE public.rooms;
       public         heap    postgres    false    909            �            1259    16586    rooms_id_room_seq    SEQUENCE     �   CREATE SEQUENCE public.rooms_id_room_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.rooms_id_room_seq;
       public          postgres    false    238            �           0    0    rooms_id_room_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.rooms_id_room_seq OWNED BY public.rooms.id_room;
          public          postgres    false    237            �            1259    16485    scholarships    TABLE     �   CREATE TABLE public.scholarships (
    id_scholarship integer NOT NULL,
    name text NOT NULL,
    money_amount numeric(8,2) NOT NULL,
    type_of_scholarship public.scholarship_type NOT NULL
);
     DROP TABLE public.scholarships;
       public         heap    postgres    false    858            �            1259    16484    scholarship_id_scholarship_seq    SEQUENCE     �   CREATE SEQUENCE public.scholarship_id_scholarship_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.scholarship_id_scholarship_seq;
       public          postgres    false    220            �           0    0    scholarship_id_scholarship_seq    SEQUENCE OWNED BY     b   ALTER SEQUENCE public.scholarship_id_scholarship_seq OWNED BY public.scholarships.id_scholarship;
          public          postgres    false    219            �            1259    16518    scholarship_payments    TABLE     �   CREATE TABLE public.scholarship_payments (
    id_scholarship_pay integer NOT NULL,
    id_awarded_scholarship integer NOT NULL,
    pay_date date NOT NULL,
    status public.payment_status_type NOT NULL
);
 (   DROP TABLE public.scholarship_payments;
       public         heap    postgres    false    864            �            1259    16517 2   scholarship_payment_history_id_scholarship_pay_seq    SEQUENCE     �   CREATE SEQUENCE public.scholarship_payment_history_id_scholarship_pay_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.scholarship_payment_history_id_scholarship_pay_seq;
       public          postgres    false    224            �           0    0 2   scholarship_payment_history_id_scholarship_pay_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.scholarship_payment_history_id_scholarship_pay_seq OWNED BY public.scholarship_payments.id_scholarship_pay;
          public          postgres    false    223            �            1259    16580    session_schedule    TABLE       CREATE TABLE public.session_schedule (
    id_schedule integer NOT NULL,
    id_group integer NOT NULL,
    id_teacher integer NOT NULL,
    id_room integer NOT NULL,
    id_study_course integer NOT NULL,
    date_time timestamp(0) without time zone NOT NULL
);
 $   DROP TABLE public.session_schedule;
       public         heap    postgres    false            �            1259    16579     session_schedule_id_schedule_seq    SEQUENCE     �   CREATE SEQUENCE public.session_schedule_id_schedule_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.session_schedule_id_schedule_seq;
       public          postgres    false    236            �           0    0     session_schedule_id_schedule_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.session_schedule_id_schedule_seq OWNED BY public.session_schedule.id_schedule;
          public          postgres    false    235            �            1259    16542    student_groups    TABLE     �   CREATE TABLE public.student_groups (
    id_group_row integer NOT NULL,
    id_record_book integer NOT NULL,
    id_group integer NOT NULL
);
 "   DROP TABLE public.student_groups;
       public         heap    postgres    false            �            1259    16541    student_groups_id_group_row_seq    SEQUENCE     �   CREATE SEQUENCE public.student_groups_id_group_row_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.student_groups_id_group_row_seq;
       public          postgres    false    228            �           0    0    student_groups_id_group_row_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.student_groups_id_group_row_seq OWNED BY public.student_groups.id_group_row;
          public          postgres    false    227            �            1259    16531    students    TABLE     �   CREATE TABLE public.students (
    id_record_book integer NOT NULL,
    name character varying(40) NOT NULL,
    surname character varying(40) NOT NULL,
    patronimic character varying(40) NOT NULL
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    16534    students_id_record_book_seq    SEQUENCE     �   CREATE SEQUENCE public.students_id_record_book_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.students_id_record_book_seq;
       public          postgres    false    225            �           0    0    students_id_record_book_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.students_id_record_book_seq OWNED BY public.students.id_record_book;
          public          postgres    false    226            �            1259    16651    study_courses    TABLE     �   CREATE TABLE public.study_courses (
    id_study_course integer NOT NULL,
    id_study_plan integer NOT NULL,
    id_discipline integer NOT NULL,
    semester smallint NOT NULL,
    certification public.certification_data_type NOT NULL
);
 !   DROP TABLE public.study_courses;
       public         heap    postgres    false    918            �            1259    16650 !   study_courses_id_study_course_seq    SEQUENCE     �   CREATE SEQUENCE public.study_courses_id_study_course_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.study_courses_id_study_course_seq;
       public          postgres    false    242            �           0    0 !   study_courses_id_study_course_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.study_courses_id_study_course_seq OWNED BY public.study_courses.id_study_course;
          public          postgres    false    241            �            1259    16458    study_plans    TABLE     �   CREATE TABLE public.study_plans (
    id_study_plan integer NOT NULL,
    id_subdivision integer NOT NULL,
    year smallint NOT NULL,
    id_edu_track integer
);
    DROP TABLE public.study_plans;
       public         heap    postgres    false            �            1259    16457    study_plan_id_study_plan_seq    SEQUENCE     �   CREATE SEQUENCE public.study_plan_id_study_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.study_plan_id_study_plan_seq;
       public          postgres    false    216            �           0    0    study_plan_id_study_plan_seq    SEQUENCE OWNED BY     ^   ALTER SEQUENCE public.study_plan_id_study_plan_seq OWNED BY public.study_plans.id_study_plan;
          public          postgres    false    215            �            1259    16403    subdivisions    TABLE     �   CREATE TABLE public.subdivisions (
    id_subdivision integer NOT NULL,
    name text NOT NULL,
    headquarter_address text NOT NULL,
    type public.subdivision_type NOT NULL
);
     DROP TABLE public.subdivisions;
       public         heap    postgres    false    855            �            1259    16402    subdivision_id_subdivision_seq    SEQUENCE     �   CREATE SEQUENCE public.subdivision_id_subdivision_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.subdivision_id_subdivision_seq;
       public          postgres    false    210            �           0    0    subdivision_id_subdivision_seq    SEQUENCE OWNED BY     b   ALTER SEQUENCE public.subdivision_id_subdivision_seq OWNED BY public.subdivisions.id_subdivision;
          public          postgres    false    209            �            1259    16565    teachers    TABLE     �   CREATE TABLE public.teachers (
    id_teacher integer NOT NULL,
    name character varying(40) NOT NULL,
    surname character varying(40) NOT NULL,
    patronymic character varying(40)
);
    DROP TABLE public.teachers;
       public         heap    postgres    false            �            1259    16564    teachers_id_teacher_seq    SEQUENCE     �   CREATE SEQUENCE public.teachers_id_teacher_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.teachers_id_teacher_seq;
       public          postgres    false    232            �           0    0    teachers_id_teacher_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.teachers_id_teacher_seq OWNED BY public.teachers.id_teacher;
          public          postgres    false    231            �           2604    16743 +   awarded_scholarships id_awarded_scholarship    DEFAULT     �   ALTER TABLE ONLY public.awarded_scholarships ALTER COLUMN id_awarded_scholarship SET DEFAULT nextval('public.awarded_scholarships_id_awarded_scholarship_seq'::regclass);
 Z   ALTER TABLE public.awarded_scholarships ALTER COLUMN id_awarded_scholarship DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16744    campuses id_campus    DEFAULT     x   ALTER TABLE ONLY public.campuses ALTER COLUMN id_campus SET DEFAULT nextval('public.campuses_id_campus_seq'::regclass);
 A   ALTER TABLE public.campuses ALTER COLUMN id_campus DROP DEFAULT;
       public          postgres    false    240    239    240            �           2604    16745    disciplines id_discipline    DEFAULT     �   ALTER TABLE ONLY public.disciplines ALTER COLUMN id_discipline SET DEFAULT nextval('public.discipline_id_discipline_seq'::regclass);
 H   ALTER TABLE public.disciplines ALTER COLUMN id_discipline DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    16746    edu_tracks id_edu_track    DEFAULT     �   ALTER TABLE ONLY public.edu_tracks ALTER COLUMN id_edu_track SET DEFAULT nextval('public.edu_track_id_edu_track_seq'::regclass);
 F   ALTER TABLE public.edu_tracks ALTER COLUMN id_edu_track DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    16747     employment_contracts id_contract    DEFAULT     �   ALTER TABLE ONLY public.employment_contracts ALTER COLUMN id_contract SET DEFAULT nextval('public.employment_contracts_id_contract_seq'::regclass);
 O   ALTER TABLE public.employment_contracts ALTER COLUMN id_contract DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    16748    groups id_group    DEFAULT     q   ALTER TABLE ONLY public.groups ALTER COLUMN id_group SET DEFAULT nextval('public.group_id_group_seq'::regclass);
 >   ALTER TABLE public.groups ALTER COLUMN id_group DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16749    record_book id_row_record_book    DEFAULT     �   ALTER TABLE ONLY public.record_book ALTER COLUMN id_row_record_book SET DEFAULT nextval('public.record_book_id_row_record_book_seq'::regclass);
 M   ALTER TABLE public.record_book ALTER COLUMN id_row_record_book DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    16750    rooms id_room    DEFAULT     n   ALTER TABLE ONLY public.rooms ALTER COLUMN id_room SET DEFAULT nextval('public.rooms_id_room_seq'::regclass);
 <   ALTER TABLE public.rooms ALTER COLUMN id_room DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    16751 '   scholarship_payments id_scholarship_pay    DEFAULT     �   ALTER TABLE ONLY public.scholarship_payments ALTER COLUMN id_scholarship_pay SET DEFAULT nextval('public.scholarship_payment_history_id_scholarship_pay_seq'::regclass);
 V   ALTER TABLE public.scholarship_payments ALTER COLUMN id_scholarship_pay DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16752    scholarships id_scholarship    DEFAULT     �   ALTER TABLE ONLY public.scholarships ALTER COLUMN id_scholarship SET DEFAULT nextval('public.scholarship_id_scholarship_seq'::regclass);
 J   ALTER TABLE public.scholarships ALTER COLUMN id_scholarship DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    16753    session_schedule id_schedule    DEFAULT     �   ALTER TABLE ONLY public.session_schedule ALTER COLUMN id_schedule SET DEFAULT nextval('public.session_schedule_id_schedule_seq'::regclass);
 K   ALTER TABLE public.session_schedule ALTER COLUMN id_schedule DROP DEFAULT;
       public          postgres    false    236    235    236            �           2604    16754    student_groups id_group_row    DEFAULT     �   ALTER TABLE ONLY public.student_groups ALTER COLUMN id_group_row SET DEFAULT nextval('public.student_groups_id_group_row_seq'::regclass);
 J   ALTER TABLE public.student_groups ALTER COLUMN id_group_row DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    16755    students id_record_book    DEFAULT     �   ALTER TABLE ONLY public.students ALTER COLUMN id_record_book SET DEFAULT nextval('public.students_id_record_book_seq'::regclass);
 F   ALTER TABLE public.students ALTER COLUMN id_record_book DROP DEFAULT;
       public          postgres    false    226    225            �           2604    16756    study_courses id_study_course    DEFAULT     �   ALTER TABLE ONLY public.study_courses ALTER COLUMN id_study_course SET DEFAULT nextval('public.study_courses_id_study_course_seq'::regclass);
 L   ALTER TABLE public.study_courses ALTER COLUMN id_study_course DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    16757    study_plans id_study_plan    DEFAULT     �   ALTER TABLE ONLY public.study_plans ALTER COLUMN id_study_plan SET DEFAULT nextval('public.study_plan_id_study_plan_seq'::regclass);
 H   ALTER TABLE public.study_plans ALTER COLUMN id_study_plan DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16758    subdivisions id_subdivision    DEFAULT     �   ALTER TABLE ONLY public.subdivisions ALTER COLUMN id_subdivision SET DEFAULT nextval('public.subdivision_id_subdivision_seq'::regclass);
 J   ALTER TABLE public.subdivisions ALTER COLUMN id_subdivision DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    16759    teachers id_teacher    DEFAULT     z   ALTER TABLE ONLY public.teachers ALTER COLUMN id_teacher SET DEFAULT nextval('public.teachers_id_teacher_seq'::regclass);
 B   ALTER TABLE public.teachers ALTER COLUMN id_teacher DROP DEFAULT;
       public          postgres    false    232    231    232            �          0    16509    awarded_scholarships 
   TABLE DATA           |   COPY public.awarded_scholarships (id_awarded_scholarship, id_record_book, id_scholarship, start_date, end_date) FROM stdin;
    public          postgres    false    222   �       �          0    16602    campuses 
   TABLE DATA           <   COPY public.campuses (id_campus, address, name) FROM stdin;
    public          postgres    false    240   %�       �          0    16446    disciplines 
   TABLE DATA           j   COPY public.disciplines (id_discipline, name, selfstudy_hours, practice_hours, lecture_hours) FROM stdin;
    public          postgres    false    214   B�       �          0    16431 
   edu_tracks 
   TABLE DATA           H   COPY public.edu_tracks (id_edu_track, code_edu_track, name) FROM stdin;
    public          postgres    false    212   _�       �          0    16572    employment_contracts 
   TABLE DATA           c   COPY public.employment_contracts (id_contract, id_teacher, share_rate, id_subdivision) FROM stdin;
    public          postgres    false    234   |�       �          0    16476    groups 
   TABLE DATA           c   COPY public.groups (id_group, id_study_plan, start_date, end_date, group_name, course) FROM stdin;
    public          postgres    false    218   ��       �          0    16549    record_book 
   TABLE DATA           �   COPY public.record_book (id_row_record_book, id_group_row, id_teacher, id_study_course, mark, exam_date, try_number) FROM stdin;
    public          postgres    false    230   ��       �          0    16587    rooms 
   TABLE DATA           K   COPY public.rooms (id_room, id_campus, room_number, room_type) FROM stdin;
    public          postgres    false    238   ��       �          0    16518    scholarship_payments 
   TABLE DATA           l   COPY public.scholarship_payments (id_scholarship_pay, id_awarded_scholarship, pay_date, status) FROM stdin;
    public          postgres    false    224   ��       �          0    16485    scholarships 
   TABLE DATA           _   COPY public.scholarships (id_scholarship, name, money_amount, type_of_scholarship) FROM stdin;
    public          postgres    false    220   �       �          0    16580    session_schedule 
   TABLE DATA           r   COPY public.session_schedule (id_schedule, id_group, id_teacher, id_room, id_study_course, date_time) FROM stdin;
    public          postgres    false    236   *�       �          0    16542    student_groups 
   TABLE DATA           P   COPY public.student_groups (id_group_row, id_record_book, id_group) FROM stdin;
    public          postgres    false    228   G�       �          0    16531    students 
   TABLE DATA           M   COPY public.students (id_record_book, name, surname, patronimic) FROM stdin;
    public          postgres    false    225   d�       �          0    16651    study_courses 
   TABLE DATA           o   COPY public.study_courses (id_study_course, id_study_plan, id_discipline, semester, certification) FROM stdin;
    public          postgres    false    242   ��       �          0    16458    study_plans 
   TABLE DATA           X   COPY public.study_plans (id_study_plan, id_subdivision, year, id_edu_track) FROM stdin;
    public          postgres    false    216   ��       �          0    16403    subdivisions 
   TABLE DATA           W   COPY public.subdivisions (id_subdivision, name, headquarter_address, type) FROM stdin;
    public          postgres    false    210   ��       �          0    16565    teachers 
   TABLE DATA           I   COPY public.teachers (id_teacher, name, surname, patronymic) FROM stdin;
    public          postgres    false    232   ��       �           0    0 /   awarded_scholarships_id_awarded_scholarship_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.awarded_scholarships_id_awarded_scholarship_seq', 1, false);
          public          postgres    false    221            �           0    0    campuses_id_campus_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.campuses_id_campus_seq', 1, false);
          public          postgres    false    239            �           0    0    discipline_id_discipline_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.discipline_id_discipline_seq', 1, true);
          public          postgres    false    213            �           0    0    edu_track_id_edu_track_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.edu_track_id_edu_track_seq', 1, false);
          public          postgres    false    211            �           0    0 $   employment_contracts_id_contract_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.employment_contracts_id_contract_seq', 1, false);
          public          postgres    false    233            �           0    0    group_id_group_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.group_id_group_seq', 1, false);
          public          postgres    false    217            �           0    0 "   record_book_id_row_record_book_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.record_book_id_row_record_book_seq', 1, false);
          public          postgres    false    229            �           0    0    rooms_id_room_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.rooms_id_room_seq', 1, false);
          public          postgres    false    237            �           0    0    scholarship_id_scholarship_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.scholarship_id_scholarship_seq', 1, false);
          public          postgres    false    219            �           0    0 2   scholarship_payment_history_id_scholarship_pay_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.scholarship_payment_history_id_scholarship_pay_seq', 1, false);
          public          postgres    false    223            �           0    0     session_schedule_id_schedule_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.session_schedule_id_schedule_seq', 1, false);
          public          postgres    false    235            �           0    0    student_groups_id_group_row_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.student_groups_id_group_row_seq', 1, false);
          public          postgres    false    227            �           0    0    students_id_record_book_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.students_id_record_book_seq', 1, false);
          public          postgres    false    226            �           0    0 !   study_courses_id_study_course_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.study_courses_id_study_course_seq', 1, false);
          public          postgres    false    241            �           0    0    study_plan_id_study_plan_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.study_plan_id_study_plan_seq', 1, false);
          public          postgres    false    215            �           0    0    subdivision_id_subdivision_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.subdivision_id_subdivision_seq', 1, false);
          public          postgres    false    209            �           0    0    teachers_id_teacher_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.teachers_id_teacher_seq', 1, false);
          public          postgres    false    231            �           2606    16474    study_plans 1800<year    CHECK CONSTRAINT     _   ALTER TABLE public.study_plans
    ADD CONSTRAINT "1800<year" CHECK ((year > 1800)) NOT VALID;
 <   ALTER TABLE public.study_plans DROP CONSTRAINT "1800<year";
       public          postgres    false    216    216            �           2606    16515 .   awarded_scholarships awarded_scholarships_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.awarded_scholarships
    ADD CONSTRAINT awarded_scholarships_pkey PRIMARY KEY (id_awarded_scholarship);
 X   ALTER TABLE ONLY public.awarded_scholarships DROP CONSTRAINT awarded_scholarships_pkey;
       public            postgres    false    222            �           2606    16609    campuses campuses_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.campuses
    ADD CONSTRAINT campuses_pkey PRIMARY KEY (id_campus);
 @   ALTER TABLE ONLY public.campuses DROP CONSTRAINT campuses_pkey;
       public            postgres    false    240            �           2606    16440    edu_tracks cone_edu_track 
   CONSTRAINT     ^   ALTER TABLE ONLY public.edu_tracks
    ADD CONSTRAINT cone_edu_track UNIQUE (code_edu_track);
 C   ALTER TABLE ONLY public.edu_tracks DROP CONSTRAINT cone_edu_track;
       public            postgres    false    212            �           2606    16454    disciplines discipline_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT discipline_pkey PRIMARY KEY (id_discipline);
 E   ALTER TABLE ONLY public.disciplines DROP CONSTRAINT discipline_pkey;
       public            postgres    false    214            �           2606    16438    edu_tracks edu_track_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.edu_tracks
    ADD CONSTRAINT edu_track_pkey PRIMARY KEY (id_edu_track);
 C   ALTER TABLE ONLY public.edu_tracks DROP CONSTRAINT edu_track_pkey;
       public            postgres    false    212            �           2606    16578 .   employment_contracts employment_contracts_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.employment_contracts
    ADD CONSTRAINT employment_contracts_pkey PRIMARY KEY (id_contract);
 X   ALTER TABLE ONLY public.employment_contracts DROP CONSTRAINT employment_contracts_pkey;
       public            postgres    false    234            �           2606    16483    groups group_constraint    CHECK CONSTRAINT     s   ALTER TABLE public.groups
    ADD CONSTRAINT group_constraint CHECK (((course >= 1) AND (course <= 4))) NOT VALID;
 <   ALTER TABLE public.groups DROP CONSTRAINT group_constraint;
       public          postgres    false    218    218            �           2606    16482    groups group_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT group_pkey PRIMARY KEY (id_group);
 ;   ALTER TABLE ONLY public.groups DROP CONSTRAINT group_pkey;
       public            postgres    false    218            �           2606    16557    scholarships money_is_positive    CHECK CONSTRAINT     v   ALTER TABLE public.scholarships
    ADD CONSTRAINT money_is_positive CHECK ((money_amount > (0)::numeric)) NOT VALID;
 C   ALTER TABLE public.scholarships DROP CONSTRAINT money_is_positive;
       public          postgres    false    220    220            �           2606    16455    disciplines pos_lecture    CHECK CONSTRAINT     e   ALTER TABLE public.disciplines
    ADD CONSTRAINT pos_lecture CHECK ((lecture_hours > 0)) NOT VALID;
 <   ALTER TABLE public.disciplines DROP CONSTRAINT pos_lecture;
       public          postgres    false    214    214            �           2606    16456    disciplines pos_selfstudy    CHECK CONSTRAINT     i   ALTER TABLE public.disciplines
    ADD CONSTRAINT pos_selfstudy CHECK ((selfstudy_hours > 0)) NOT VALID;
 >   ALTER TABLE public.disciplines DROP CONSTRAINT pos_selfstudy;
       public          postgres    false    214    214            �           2606    16556    record_book record_book_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.record_book
    ADD CONSTRAINT record_book_pkey PRIMARY KEY (id_row_record_book);
 F   ALTER TABLE ONLY public.record_book DROP CONSTRAINT record_book_pkey;
       public            postgres    false    230            �           2606    16592    rooms rooms_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id_room);
 :   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
       public            postgres    false    238            �           2606    16523 5   scholarship_payments scholarship_payment_history_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.scholarship_payments
    ADD CONSTRAINT scholarship_payment_history_pkey PRIMARY KEY (id_scholarship_pay);
 _   ALTER TABLE ONLY public.scholarship_payments DROP CONSTRAINT scholarship_payment_history_pkey;
       public            postgres    false    224            �           2606    16492    scholarships scholarship_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.scholarships
    ADD CONSTRAINT scholarship_pkey PRIMARY KEY (id_scholarship);
 G   ALTER TABLE ONLY public.scholarships DROP CONSTRAINT scholarship_pkey;
       public            postgres    false    220            �           2606    16675    study_courses semester_check    CHECK CONSTRAINT     |   ALTER TABLE public.study_courses
    ADD CONSTRAINT semester_check CHECK (((semester >= 1) AND (semester <= 8))) NOT VALID;
 A   ALTER TABLE public.study_courses DROP CONSTRAINT semester_check;
       public          postgres    false    242    242            �           2606    16585 &   session_schedule session_schedule_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_pkey PRIMARY KEY (id_schedule);
 P   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT session_schedule_pkey;
       public            postgres    false    236            �           2606    16547 "   student_groups student_groups_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.student_groups
    ADD CONSTRAINT student_groups_pkey PRIMARY KEY (id_group_row);
 L   ALTER TABLE ONLY public.student_groups DROP CONSTRAINT student_groups_pkey;
       public            postgres    false    228            �           2606    16540    students students_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id_record_book);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            postgres    false    225            �           2606    16656     study_courses study_courses_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.study_courses
    ADD CONSTRAINT study_courses_pkey PRIMARY KEY (id_study_course);
 J   ALTER TABLE ONLY public.study_courses DROP CONSTRAINT study_courses_pkey;
       public            postgres    false    242            �           2606    16463    study_plans study_plan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.study_plans
    ADD CONSTRAINT study_plan_pkey PRIMARY KEY (id_study_plan);
 E   ALTER TABLE ONLY public.study_plans DROP CONSTRAINT study_plan_pkey;
       public            postgres    false    216            �           2606    16410    subdivisions subdivision_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivision_pkey PRIMARY KEY (id_subdivision);
 G   ALTER TABLE ONLY public.subdivisions DROP CONSTRAINT subdivision_pkey;
       public            postgres    false    210            �           2606    16570    teachers teachers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id_teacher);
 @   ALTER TABLE ONLY public.teachers DROP CONSTRAINT teachers_pkey;
       public            postgres    false    232            �           2606    16442    subdivisions unique_name 
   CONSTRAINT     S   ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT unique_name UNIQUE (name);
 B   ALTER TABLE ONLY public.subdivisions DROP CONSTRAINT unique_name;
       public            postgres    false    210                       2606    16625 +   scholarship_payments awarder_scholarship_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.scholarship_payments
    ADD CONSTRAINT "awarder_scholarship_FK" FOREIGN KEY (id_awarded_scholarship) REFERENCES public.awarded_scholarships(id_awarded_scholarship) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 W   ALTER TABLE ONLY public.scholarship_payments DROP CONSTRAINT "awarder_scholarship_FK";
       public          postgres    false    222    224    3305                       2606    16721    rooms campus_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT "campus_FK" FOREIGN KEY (id_campus) REFERENCES public.campuses(id_campus) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 ;   ALTER TABLE ONLY public.rooms DROP CONSTRAINT "campus_FK";
       public          postgres    false    240    238    3323                       2606    16662    study_courses discipline_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_courses
    ADD CONSTRAINT "discipline_FK" FOREIGN KEY (id_discipline) REFERENCES public.disciplines(id_discipline) ON UPDATE CASCADE ON DELETE RESTRICT;
 G   ALTER TABLE ONLY public.study_courses DROP CONSTRAINT "discipline_FK";
       public          postgres    false    214    3297    242                       2606    16701    session_schedule group_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT "group_FK" FOREIGN KEY (id_group) REFERENCES public.groups(id_group) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 E   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT "group_FK";
       public          postgres    false    218    236    3301                       2606    16676    record_book group_history_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.record_book
    ADD CONSTRAINT "group_history_FK" FOREIGN KEY (id_group_row) REFERENCES public.student_groups(id_group_row) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public.record_book DROP CONSTRAINT "group_history_FK";
       public          postgres    false    230    3311    228                       2606    16645    student_groups groups_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_groups
    ADD CONSTRAINT "groups_FK" FOREIGN KEY (id_group) REFERENCES public.groups(id_group) ON UPDATE CASCADE DEFERRABLE NOT VALID;
 D   ALTER TABLE ONLY public.student_groups DROP CONSTRAINT "groups_FK";
       public          postgres    false    218    3301    228            �           2606    16469    study_plans id_edu_track_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_plans
    ADD CONSTRAINT "id_edu_track_FK" FOREIGN KEY (id_edu_track) REFERENCES public.edu_tracks(id_edu_track) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 G   ALTER TABLE ONLY public.study_plans DROP CONSTRAINT "id_edu_track_FK";
       public          postgres    false    3295    216    212            �           2606    16464    study_plans id_subdivision_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_plans
    ADD CONSTRAINT "id_subdivision_FK" FOREIGN KEY (id_subdivision) REFERENCES public.subdivisions(id_subdivision) ON UPDATE CASCADE ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.study_plans DROP CONSTRAINT "id_subdivision_FK";
       public          postgres    false    210    3289    216                       2606    16635 #   awarded_scholarships record_book_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.awarded_scholarships
    ADD CONSTRAINT "record_book_FK" FOREIGN KEY (id_record_book) REFERENCES public.students(id_record_book) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 O   ALTER TABLE ONLY public.awarded_scholarships DROP CONSTRAINT "record_book_FK";
       public          postgres    false    3309    222    225                       2606    16711    session_schedule room_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT "room_FK" FOREIGN KEY (id_room) REFERENCES public.rooms(id_room) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 D   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT "room_FK";
       public          postgres    false    236    3321    238                       2606    16630 #   awarded_scholarships scholarship_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.awarded_scholarships
    ADD CONSTRAINT "scholarship_FK" FOREIGN KEY (id_scholarship) REFERENCES public.scholarships(id_scholarship) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 O   ALTER TABLE ONLY public.awarded_scholarships DROP CONSTRAINT "scholarship_FK";
       public          postgres    false    220    222    3303                       2606    16640    student_groups students_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_groups
    ADD CONSTRAINT "students_FK" FOREIGN KEY (id_record_book) REFERENCES public.students(id_record_book) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public.student_groups DROP CONSTRAINT "students_FK";
       public          postgres    false    225    3309    228                       2606    16686    record_book study_course_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.record_book
    ADD CONSTRAINT "study_course_FK" FOREIGN KEY (id_study_course) REFERENCES public.study_courses(id_study_course) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 G   ALTER TABLE ONLY public.record_book DROP CONSTRAINT "study_course_FK";
       public          postgres    false    3325    230    242                       2606    16716     session_schedule study_course_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT "study_course_FK" FOREIGN KEY (id_study_course) REFERENCES public.study_courses(id_study_course) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 L   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT "study_course_FK";
       public          postgres    false    242    3325    236                        2606    16610    groups study_plan_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT "study_plan_FK" FOREIGN KEY (id_study_plan) REFERENCES public.study_plans(id_study_plan) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 @   ALTER TABLE ONLY public.groups DROP CONSTRAINT "study_plan_FK";
       public          postgres    false    3299    218    216                       2606    16657    study_courses study_plan_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_courses
    ADD CONSTRAINT "study_plan_FK" FOREIGN KEY (id_study_plan) REFERENCES public.study_plans(id_study_plan) ON UPDATE CASCADE ON DELETE RESTRICT;
 G   ALTER TABLE ONLY public.study_courses DROP CONSTRAINT "study_plan_FK";
       public          postgres    false    242    216    3299            	           2606    16691 #   employment_contracts subdivision_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.employment_contracts
    ADD CONSTRAINT "subdivision_FK" FOREIGN KEY (id_subdivision) REFERENCES public.subdivisions(id_subdivision) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 O   ALTER TABLE ONLY public.employment_contracts DROP CONSTRAINT "subdivision_FK";
       public          postgres    false    210    234    3289                       2606    16681    record_book teacher_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.record_book
    ADD CONSTRAINT "teacher_FK" FOREIGN KEY (id_teacher) REFERENCES public.teachers(id_teacher) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 B   ALTER TABLE ONLY public.record_book DROP CONSTRAINT "teacher_FK";
       public          postgres    false    232    230    3315            
           2606    16696    employment_contracts teacher_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.employment_contracts
    ADD CONSTRAINT "teacher_FK" FOREIGN KEY (id_teacher) REFERENCES public.teachers(id_teacher) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY public.employment_contracts DROP CONSTRAINT "teacher_FK";
       public          postgres    false    234    3315    232                       2606    16706    session_schedule teacher_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT "teacher_FK" FOREIGN KEY (id_teacher) REFERENCES public.teachers(id_teacher) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 G   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT "teacher_FK";
       public          postgres    false    3315    232    236            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     