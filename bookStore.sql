PGDMP         6                 y        	   BookStore    13.2    13.3 C   y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            {           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            |           1262    20395 	   BookStore    DATABASE     o   CREATE DATABASE "BookStore" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "BookStore";
                postgres    false            �            1259    20523    account_emailaddress    TABLE     �   CREATE TABLE public.account_emailaddress (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.account_emailaddress;
       public         heap    postgres    false            �            1259    20568    account_emailaddress_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_emailaddress_id_seq;
       public          postgres    false    216            }           0    0    account_emailaddress_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;
          public          postgres    false    218            �            1259    20533    account_emailconfirmation    TABLE     �   CREATE TABLE public.account_emailconfirmation (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id bigint NOT NULL
);
 -   DROP TABLE public.account_emailconfirmation;
       public         heap    postgres    false            �            1259    20594     account_emailconfirmation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.account_emailconfirmation_id_seq;
       public          postgres    false    217            ~           0    0     account_emailconfirmation_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;
          public          postgres    false    219            �            1259    20638    accounts_address    TABLE     A  CREATE TABLE public.accounts_address (
    id bigint NOT NULL,
    province character varying(200) NOT NULL,
    city character varying(200) NOT NULL,
    street character varying(200) NOT NULL,
    details character varying(300) NOT NULL,
    postcode character varying(10) NOT NULL,
    customer_id integer NOT NULL
);
 $   DROP TABLE public.accounts_address;
       public         heap    postgres    false            �            1259    20636    accounts_address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_address_id_seq;
       public          postgres    false    221                       0    0    accounts_address_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_address_id_seq OWNED BY public.accounts_address.id;
          public          postgres    false    220            �            1259    20427 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    20425    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    207            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    206            �            1259    20437    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    20435    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    209            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    208            �            1259    20419    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    20417    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    205            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    204            �            1259    20445 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    20455    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    20453    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    213            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    212            �            1259    20443    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    211            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    210            �            1259    20463    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    20461 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    215            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    214            �            1259    20724 
   books_book    TABLE     �  CREATE TABLE public.books_book (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authors character varying(200) NOT NULL,
    description text,
    quantity integer NOT NULL,
    price double precision NOT NULL,
    image character varying(100),
    creator_id integer NOT NULL,
    max_cash_off_id bigint,
    percent_off_id bigint
);
    DROP TABLE public.books_book;
       public         heap    postgres    false            �            1259    20735    books_book_categories    TABLE     �   CREATE TABLE public.books_book_categories (
    id bigint NOT NULL,
    book_id bigint NOT NULL,
    category_id bigint NOT NULL
);
 )   DROP TABLE public.books_book_categories;
       public         heap    postgres    false            �            1259    20733    books_book_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_book_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.books_book_categories_id_seq;
       public          postgres    false    231            �           0    0    books_book_categories_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.books_book_categories_id_seq OWNED BY public.books_book_categories.id;
          public          postgres    false    230            �            1259    20743    books_book_editors    TABLE     ~   CREATE TABLE public.books_book_editors (
    id bigint NOT NULL,
    book_id bigint NOT NULL,
    user_id integer NOT NULL
);
 &   DROP TABLE public.books_book_editors;
       public         heap    postgres    false            �            1259    20741    books_book_editors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_book_editors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.books_book_editors_id_seq;
       public          postgres    false    233            �           0    0    books_book_editors_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.books_book_editors_id_seq OWNED BY public.books_book_editors.id;
          public          postgres    false    232            �            1259    20722    books_book_id_seq    SEQUENCE     z   CREATE SEQUENCE public.books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.books_book_id_seq;
       public          postgres    false    229            �           0    0    books_book_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books_book.id;
          public          postgres    false    228            �            1259    20708    books_category    TABLE     �   CREATE TABLE public.books_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    creator_id integer NOT NULL
);
 "   DROP TABLE public.books_category;
       public         heap    postgres    false            �            1259    20716    books_category_editors    TABLE     �   CREATE TABLE public.books_category_editors (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    user_id integer NOT NULL
);
 *   DROP TABLE public.books_category_editors;
       public         heap    postgres    false            �            1259    20714    books_category_editors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_category_editors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.books_category_editors_id_seq;
       public          postgres    false    227            �           0    0    books_category_editors_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.books_category_editors_id_seq OWNED BY public.books_category_editors.id;
          public          postgres    false    226            �            1259    20706    books_category_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.books_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.books_category_id_seq;
       public          postgres    false    225            �           0    0    books_category_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.books_category_id_seq OWNED BY public.books_category.id;
          public          postgres    false    224            �            1259    20684    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    20682    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    223            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    222            �            1259    20409    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    20407    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    203            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    202            �            1259    20398    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    20396    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    201            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    200            �            1259    20965    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    20977    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         heap    postgres    false            �            1259    20975    django_site_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public          postgres    false    252            �           0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
          public          postgres    false    251            �            1259    20805    payments_basket    TABLE     �   CREATE TABLE public.payments_basket (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    customer_id integer NOT NULL,
    discount_id bigint
);
 #   DROP TABLE public.payments_basket;
       public         heap    postgres    false            �            1259    20803    payments_basket_id_seq    SEQUENCE        CREATE SEQUENCE public.payments_basket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payments_basket_id_seq;
       public          postgres    false    235            �           0    0    payments_basket_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payments_basket_id_seq OWNED BY public.payments_basket.id;
          public          postgres    false    234            �            1259    20853    payments_cashoff    TABLE     �   CREATE TABLE public.payments_cashoff (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    cash_off integer,
    deadline timestamp with time zone,
    status character varying(2) NOT NULL,
    creator_id integer NOT NULL
);
 $   DROP TABLE public.payments_cashoff;
       public         heap    postgres    false            �            1259    20861    payments_cashoff_editors    TABLE     �   CREATE TABLE public.payments_cashoff_editors (
    id bigint NOT NULL,
    cashoff_id bigint NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.payments_cashoff_editors;
       public         heap    postgres    false            �            1259    20859    payments_cashoff_editors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_cashoff_editors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.payments_cashoff_editors_id_seq;
       public          postgres    false    249            �           0    0    payments_cashoff_editors_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.payments_cashoff_editors_id_seq OWNED BY public.payments_cashoff_editors.id;
          public          postgres    false    248            �            1259    20851    payments_cashoff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_cashoff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.payments_cashoff_id_seq;
       public          postgres    false    247            �           0    0    payments_cashoff_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.payments_cashoff_id_seq OWNED BY public.payments_cashoff.id;
          public          postgres    false    246            �            1259    20837    payments_discountcode    TABLE     [  CREATE TABLE public.payments_discountcode (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    type character varying(2) NOT NULL,
    percent_off integer,
    cash_off integer,
    code character varying(100),
    deadline timestamp with time zone,
    status character varying(2) NOT NULL,
    creator_id integer NOT NULL
);
 )   DROP TABLE public.payments_discountcode;
       public         heap    postgres    false            �            1259    20845    payments_discountcode_editors    TABLE     �   CREATE TABLE public.payments_discountcode_editors (
    id bigint NOT NULL,
    discountcode_id bigint NOT NULL,
    user_id integer NOT NULL
);
 1   DROP TABLE public.payments_discountcode_editors;
       public         heap    postgres    false            �            1259    20843 $   payments_discountcode_editors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_discountcode_editors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.payments_discountcode_editors_id_seq;
       public          postgres    false    245            �           0    0 $   payments_discountcode_editors_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.payments_discountcode_editors_id_seq OWNED BY public.payments_discountcode_editors.id;
          public          postgres    false    244            �            1259    20835    payments_discountcode_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_discountcode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.payments_discountcode_id_seq;
       public          postgres    false    243            �           0    0    payments_discountcode_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.payments_discountcode_id_seq OWNED BY public.payments_discountcode.id;
          public          postgres    false    242            �            1259    20829    payments_order    TABLE     �   CREATE TABLE public.payments_order (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    status character varying(2) NOT NULL,
    basket_id bigint NOT NULL,
    book_id bigint NOT NULL
);
 "   DROP TABLE public.payments_order;
       public         heap    postgres    false            �            1259    20827    payments_order_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.payments_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.payments_order_id_seq;
       public          postgres    false    241            �           0    0    payments_order_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.payments_order_id_seq OWNED BY public.payments_order.id;
          public          postgres    false    240            �            1259    20813    payments_percentoff    TABLE     �   CREATE TABLE public.payments_percentoff (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    percent_off integer,
    deadline timestamp with time zone,
    status character varying(2) NOT NULL,
    creator_id integer NOT NULL
);
 '   DROP TABLE public.payments_percentoff;
       public         heap    postgres    false            �            1259    20821    payments_percentoff_editors    TABLE     �   CREATE TABLE public.payments_percentoff_editors (
    id bigint NOT NULL,
    percentoff_id bigint NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.payments_percentoff_editors;
       public         heap    postgres    false            �            1259    20819 "   payments_percentoff_editors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_percentoff_editors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.payments_percentoff_editors_id_seq;
       public          postgres    false    239            �           0    0 "   payments_percentoff_editors_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.payments_percentoff_editors_id_seq OWNED BY public.payments_percentoff_editors.id;
          public          postgres    false    238            �            1259    20811    payments_percentoff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_percentoff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.payments_percentoff_id_seq;
       public          postgres    false    237            �           0    0    payments_percentoff_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.payments_percentoff_id_seq OWNED BY public.payments_percentoff.id;
          public          postgres    false    236            �            1259    20988    socialaccount_socialaccount    TABLE     C  CREATE TABLE public.socialaccount_socialaccount (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.socialaccount_socialaccount;
       public         heap    postgres    false                       1259    21075 "   socialaccount_socialaccount_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.socialaccount_socialaccount_id_seq;
       public          postgres    false    253            �           0    0 "   socialaccount_socialaccount_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;
          public          postgres    false    258            �            1259    20999    socialaccount_socialapp    TABLE     "  CREATE TABLE public.socialaccount_socialapp (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);
 +   DROP TABLE public.socialaccount_socialapp;
       public         heap    postgres    false                       1259    21106    socialaccount_socialapp_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.socialaccount_socialapp_id_seq;
       public          postgres    false    254            �           0    0    socialaccount_socialapp_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;
          public          postgres    false    259                        1259    21007    socialaccount_socialapp_sites    TABLE     �   CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id bigint NOT NULL,
    site_id integer NOT NULL
);
 1   DROP TABLE public.socialaccount_socialapp_sites;
       public         heap    postgres    false            �            1259    21005 $   socialaccount_socialapp_sites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.socialaccount_socialapp_sites_id_seq;
       public          postgres    false    256            �           0    0 $   socialaccount_socialapp_sites_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;
          public          postgres    false    255                       1259    21015    socialaccount_socialtoken    TABLE     �   CREATE TABLE public.socialaccount_socialtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id bigint NOT NULL,
    app_id bigint NOT NULL
);
 -   DROP TABLE public.socialaccount_socialtoken;
       public         heap    postgres    false                       1259    21150     socialaccount_socialtoken_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.socialaccount_socialtoken_id_seq;
       public          postgres    false    257            �           0    0     socialaccount_socialtoken_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;
          public          postgres    false    260            �           2604    20570    account_emailaddress id    DEFAULT     �   ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);
 F   ALTER TABLE public.account_emailaddress ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    216            �           2604    20596    account_emailconfirmation id    DEFAULT     �   ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);
 K   ALTER TABLE public.account_emailconfirmation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    217            �           2604    20641    accounts_address id    DEFAULT     z   ALTER TABLE ONLY public.accounts_address ALTER COLUMN id SET DEFAULT nextval('public.accounts_address_id_seq'::regclass);
 B   ALTER TABLE public.accounts_address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    20430    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    20440    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �           2604    20422    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �           2604    20448    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    20458    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    20466    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    20727    books_book id    DEFAULT     n   ALTER TABLE ONLY public.books_book ALTER COLUMN id SET DEFAULT nextval('public.books_book_id_seq'::regclass);
 <   ALTER TABLE public.books_book ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    20738    books_book_categories id    DEFAULT     �   ALTER TABLE ONLY public.books_book_categories ALTER COLUMN id SET DEFAULT nextval('public.books_book_categories_id_seq'::regclass);
 G   ALTER TABLE public.books_book_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    20746    books_book_editors id    DEFAULT     ~   ALTER TABLE ONLY public.books_book_editors ALTER COLUMN id SET DEFAULT nextval('public.books_book_editors_id_seq'::regclass);
 D   ALTER TABLE public.books_book_editors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    20711    books_category id    DEFAULT     v   ALTER TABLE ONLY public.books_category ALTER COLUMN id SET DEFAULT nextval('public.books_category_id_seq'::regclass);
 @   ALTER TABLE public.books_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    20719    books_category_editors id    DEFAULT     �   ALTER TABLE ONLY public.books_category_editors ALTER COLUMN id SET DEFAULT nextval('public.books_category_editors_id_seq'::regclass);
 H   ALTER TABLE public.books_category_editors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    20687    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    20412    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �           2604    20401    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            �           2604    20980    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    252    252            �           2604    20808    payments_basket id    DEFAULT     x   ALTER TABLE ONLY public.payments_basket ALTER COLUMN id SET DEFAULT nextval('public.payments_basket_id_seq'::regclass);
 A   ALTER TABLE public.payments_basket ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    20856    payments_cashoff id    DEFAULT     z   ALTER TABLE ONLY public.payments_cashoff ALTER COLUMN id SET DEFAULT nextval('public.payments_cashoff_id_seq'::regclass);
 B   ALTER TABLE public.payments_cashoff ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247            �           2604    20864    payments_cashoff_editors id    DEFAULT     �   ALTER TABLE ONLY public.payments_cashoff_editors ALTER COLUMN id SET DEFAULT nextval('public.payments_cashoff_editors_id_seq'::regclass);
 J   ALTER TABLE public.payments_cashoff_editors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    249    249            �           2604    20840    payments_discountcode id    DEFAULT     �   ALTER TABLE ONLY public.payments_discountcode ALTER COLUMN id SET DEFAULT nextval('public.payments_discountcode_id_seq'::regclass);
 G   ALTER TABLE public.payments_discountcode ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243            �           2604    20848     payments_discountcode_editors id    DEFAULT     �   ALTER TABLE ONLY public.payments_discountcode_editors ALTER COLUMN id SET DEFAULT nextval('public.payments_discountcode_editors_id_seq'::regclass);
 O   ALTER TABLE public.payments_discountcode_editors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244    245            �           2604    20832    payments_order id    DEFAULT     v   ALTER TABLE ONLY public.payments_order ALTER COLUMN id SET DEFAULT nextval('public.payments_order_id_seq'::regclass);
 @   ALTER TABLE public.payments_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    241    241            �           2604    20816    payments_percentoff id    DEFAULT     �   ALTER TABLE ONLY public.payments_percentoff ALTER COLUMN id SET DEFAULT nextval('public.payments_percentoff_id_seq'::regclass);
 E   ALTER TABLE public.payments_percentoff ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    20824    payments_percentoff_editors id    DEFAULT     �   ALTER TABLE ONLY public.payments_percentoff_editors ALTER COLUMN id SET DEFAULT nextval('public.payments_percentoff_editors_id_seq'::regclass);
 M   ALTER TABLE public.payments_percentoff_editors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    21077    socialaccount_socialaccount id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);
 M   ALTER TABLE public.socialaccount_socialaccount ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    253            �           2604    21108    socialaccount_socialapp id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);
 I   ALTER TABLE public.socialaccount_socialapp ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    254            �           2604    21010     socialaccount_socialapp_sites id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);
 O   ALTER TABLE public.socialaccount_socialapp_sites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    256    256            �           2604    21152    socialaccount_socialtoken id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);
 K   ALTER TABLE public.socialaccount_socialtoken ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    257            J          0    20523    account_emailaddress 
   TABLE DATA           W   COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
    public          postgres    false    216   X�      K          0    20533    account_emailconfirmation 
   TABLE DATA           ]   COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
    public          postgres    false    217   ��      O          0    20638    accounts_address 
   TABLE DATA           f   COPY public.accounts_address (id, province, city, street, details, postcode, customer_id) FROM stdin;
    public          postgres    false    221   ��      A          0    20427 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    207   ��      C          0    20437    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    209   �      ?          0    20419    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    205   {�      E          0    20445 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    211   �      G          0    20455    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    213   ��      I          0    20463    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    215   ��      W          0    20724 
   books_book 
   TABLE DATA           �   COPY public.books_book (id, title, created_at, updated_at, authors, description, quantity, price, image, creator_id, max_cash_off_id, percent_off_id) FROM stdin;
    public          postgres    false    229   ��      Y          0    20735    books_book_categories 
   TABLE DATA           I   COPY public.books_book_categories (id, book_id, category_id) FROM stdin;
    public          postgres    false    231   ��      [          0    20743    books_book_editors 
   TABLE DATA           B   COPY public.books_book_editors (id, book_id, user_id) FROM stdin;
    public          postgres    false    233   �      S          0    20708    books_category 
   TABLE DATA           V   COPY public.books_category (id, name, created_at, updated_at, creator_id) FROM stdin;
    public          postgres    false    225   7�      U          0    20716    books_category_editors 
   TABLE DATA           J   COPY public.books_category_editors (id, category_id, user_id) FROM stdin;
    public          postgres    false    227   :�      Q          0    20684    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    223   ~�      =          0    20409    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    203   �      ;          0    20398    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    201   ��      l          0    20965    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    250   ��      n          0    20977    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    252   ��      ]          0    20805    payments_basket 
   TABLE DATA           S   COPY public.payments_basket (id, created_at, customer_id, discount_id) FROM stdin;
    public          postgres    false    235   �      i          0    20853    payments_cashoff 
   TABLE DATA           ]   COPY public.payments_cashoff (id, title, cash_off, deadline, status, creator_id) FROM stdin;
    public          postgres    false    247   ^�      k          0    20861    payments_cashoff_editors 
   TABLE DATA           K   COPY public.payments_cashoff_editors (id, cashoff_id, user_id) FROM stdin;
    public          postgres    false    249   ��      e          0    20837    payments_discountcode 
   TABLE DATA           {   COPY public.payments_discountcode (id, title, type, percent_off, cash_off, code, deadline, status, creator_id) FROM stdin;
    public          postgres    false    243   ��      g          0    20845    payments_discountcode_editors 
   TABLE DATA           U   COPY public.payments_discountcode_editors (id, discountcode_id, user_id) FROM stdin;
    public          postgres    false    245   ��      c          0    20829    payments_order 
   TABLE DATA           R   COPY public.payments_order (id, quantity, status, basket_id, book_id) FROM stdin;
    public          postgres    false    241   �      _          0    20813    payments_percentoff 
   TABLE DATA           c   COPY public.payments_percentoff (id, title, percent_off, deadline, status, creator_id) FROM stdin;
    public          postgres    false    237   :�      a          0    20821    payments_percentoff_editors 
   TABLE DATA           Q   COPY public.payments_percentoff_editors (id, percentoff_id, user_id) FROM stdin;
    public          postgres    false    239   ��      o          0    20988    socialaccount_socialaccount 
   TABLE DATA           v   COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
    public          postgres    false    253   ��      p          0    20999    socialaccount_socialapp 
   TABLE DATA           ]   COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
    public          postgres    false    254   ��      r          0    21007    socialaccount_socialapp_sites 
   TABLE DATA           R   COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
    public          postgres    false    256   �      s          0    21015    socialaccount_socialtoken 
   TABLE DATA           l   COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
    public          postgres    false    257   %�      �           0    0    account_emailaddress_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);
          public          postgres    false    218            �           0    0     account_emailconfirmation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);
          public          postgres    false    219            �           0    0    accounts_address_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.accounts_address_id_seq', 1, false);
          public          postgres    false    220            �           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);
          public          postgres    false    206            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 102, true);
          public          postgres    false    208            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);
          public          postgres    false    204            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);
          public          postgres    false    212            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);
          public          postgres    false    210            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    214            �           0    0    books_book_categories_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.books_book_categories_id_seq', 7, true);
          public          postgres    false    230            �           0    0    books_book_editors_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.books_book_editors_id_seq', 3, true);
          public          postgres    false    232            �           0    0    books_book_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.books_book_id_seq', 3, true);
          public          postgres    false    228            �           0    0    books_category_editors_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.books_category_editors_id_seq', 9, true);
          public          postgres    false    226            �           0    0    books_category_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.books_category_id_seq', 9, true);
          public          postgres    false    224            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 31, true);
          public          postgres    false    222            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);
          public          postgres    false    202            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);
          public          postgres    false    200            �           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    251            �           0    0    payments_basket_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.payments_basket_id_seq', 1, true);
          public          postgres    false    234            �           0    0    payments_cashoff_editors_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.payments_cashoff_editors_id_seq', 1, true);
          public          postgres    false    248            �           0    0    payments_cashoff_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payments_cashoff_id_seq', 1, true);
          public          postgres    false    246            �           0    0 $   payments_discountcode_editors_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.payments_discountcode_editors_id_seq', 1, false);
          public          postgres    false    244            �           0    0    payments_discountcode_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.payments_discountcode_id_seq', 1, false);
          public          postgres    false    242            �           0    0    payments_order_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.payments_order_id_seq', 3, true);
          public          postgres    false    240            �           0    0 "   payments_percentoff_editors_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.payments_percentoff_editors_id_seq', 2, true);
          public          postgres    false    238            �           0    0    payments_percentoff_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.payments_percentoff_id_seq', 2, true);
          public          postgres    false    236            �           0    0 "   socialaccount_socialaccount_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);
          public          postgres    false    258            �           0    0    socialaccount_socialapp_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);
          public          postgres    false    259            �           0    0 $   socialaccount_socialapp_sites_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);
          public          postgres    false    255            �           0    0     socialaccount_socialtoken_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);
          public          postgres    false    260            %           2606    20556 3   account_emailaddress account_emailaddress_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_email_key;
       public            postgres    false    216            '           2606    20560 .   account_emailaddress account_emailaddress_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_pkey;
       public            postgres    false    216            ,           2606    20540 ;   account_emailconfirmation account_emailconfirmation_key_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);
 e   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_key_key;
       public            postgres    false    217            .           2606    20586 8   account_emailconfirmation account_emailconfirmation_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_pkey;
       public            postgres    false    217            1           2606    20646 &   accounts_address accounts_address_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.accounts_address
    ADD CONSTRAINT accounts_address_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.accounts_address DROP CONSTRAINT accounts_address_pkey;
       public            postgres    false    221            	           2606    20604    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    207                       2606    20479 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    209    209                       2606    20442 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    209                       2606    20432    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    207                       2606    20470 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    205    205                       2606    20424 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    205                       2606    20460 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    213                       2606    20494 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    213    213                       2606    20450    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    211                       2606    20468 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    215            "           2606    20508 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    215    215                       2606    20598     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    211            H           2606    20776 M   books_book_categories books_book_categories_book_id_category_id_019abde5_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.books_book_categories
    ADD CONSTRAINT books_book_categories_book_id_category_id_019abde5_uniq UNIQUE (book_id, category_id);
 w   ALTER TABLE ONLY public.books_book_categories DROP CONSTRAINT books_book_categories_book_id_category_id_019abde5_uniq;
       public            postgres    false    231    231            K           2606    20740 0   books_book_categories books_book_categories_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.books_book_categories
    ADD CONSTRAINT books_book_categories_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.books_book_categories DROP CONSTRAINT books_book_categories_pkey;
       public            postgres    false    231            N           2606    20790 C   books_book_editors books_book_editors_book_id_user_id_126aa7ea_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.books_book_editors
    ADD CONSTRAINT books_book_editors_book_id_user_id_126aa7ea_uniq UNIQUE (book_id, user_id);
 m   ALTER TABLE ONLY public.books_book_editors DROP CONSTRAINT books_book_editors_book_id_user_id_126aa7ea_uniq;
       public            postgres    false    233    233            P           2606    20748 *   books_book_editors books_book_editors_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.books_book_editors
    ADD CONSTRAINT books_book_editors_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.books_book_editors DROP CONSTRAINT books_book_editors_pkey;
       public            postgres    false    233            C           2606    20732    books_book books_book_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.books_book DROP CONSTRAINT books_book_pkey;
       public            postgres    false    229            ;           2606    20756 O   books_category_editors books_category_editors_category_id_user_id_1ca8698b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.books_category_editors
    ADD CONSTRAINT books_category_editors_category_id_user_id_1ca8698b_uniq UNIQUE (category_id, user_id);
 y   ALTER TABLE ONLY public.books_category_editors DROP CONSTRAINT books_category_editors_category_id_user_id_1ca8698b_uniq;
       public            postgres    false    227    227            =           2606    20721 2   books_category_editors books_category_editors_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.books_category_editors
    ADD CONSTRAINT books_category_editors_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.books_category_editors DROP CONSTRAINT books_category_editors_pkey;
       public            postgres    false    227            8           2606    20713 "   books_category books_category_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.books_category
    ADD CONSTRAINT books_category_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.books_category DROP CONSTRAINT books_category_pkey;
       public            postgres    false    225            4           2606    20693 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    223            �           2606    20416 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    203    203                       2606    20414 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    203            �           2606    20406 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    201            w           2606    20972 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    250            {           2606    20984 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public            postgres    false    252            }           2606    20982    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public            postgres    false    252            U           2606    20810 $   payments_basket payments_basket_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.payments_basket
    ADD CONSTRAINT payments_basket_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.payments_basket DROP CONSTRAINT payments_basket_pkey;
       public            postgres    false    235            q           2606    20937 R   payments_cashoff_editors payments_cashoff_editors_cashoff_id_user_id_498e741b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.payments_cashoff_editors
    ADD CONSTRAINT payments_cashoff_editors_cashoff_id_user_id_498e741b_uniq UNIQUE (cashoff_id, user_id);
 |   ALTER TABLE ONLY public.payments_cashoff_editors DROP CONSTRAINT payments_cashoff_editors_cashoff_id_user_id_498e741b_uniq;
       public            postgres    false    249    249            s           2606    20866 6   payments_cashoff_editors payments_cashoff_editors_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.payments_cashoff_editors
    ADD CONSTRAINT payments_cashoff_editors_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.payments_cashoff_editors DROP CONSTRAINT payments_cashoff_editors_pkey;
       public            postgres    false    249            n           2606    20858 &   payments_cashoff payments_cashoff_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.payments_cashoff
    ADD CONSTRAINT payments_cashoff_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.payments_cashoff DROP CONSTRAINT payments_cashoff_pkey;
       public            postgres    false    247            g           2606    20917 \   payments_discountcode_editors payments_discountcode_ed_discountcode_id_user_id_1cddb7ff_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.payments_discountcode_editors
    ADD CONSTRAINT payments_discountcode_ed_discountcode_id_user_id_1cddb7ff_uniq UNIQUE (discountcode_id, user_id);
 �   ALTER TABLE ONLY public.payments_discountcode_editors DROP CONSTRAINT payments_discountcode_ed_discountcode_id_user_id_1cddb7ff_uniq;
       public            postgres    false    245    245            j           2606    20850 @   payments_discountcode_editors payments_discountcode_editors_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.payments_discountcode_editors
    ADD CONSTRAINT payments_discountcode_editors_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.payments_discountcode_editors DROP CONSTRAINT payments_discountcode_editors_pkey;
       public            postgres    false    245            e           2606    20842 0   payments_discountcode payments_discountcode_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.payments_discountcode
    ADD CONSTRAINT payments_discountcode_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.payments_discountcode DROP CONSTRAINT payments_discountcode_pkey;
       public            postgres    false    243            b           2606    20834 "   payments_order payments_order_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.payments_order
    ADD CONSTRAINT payments_order_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.payments_order DROP CONSTRAINT payments_order_pkey;
       public            postgres    false    241            [           2606    20885 [   payments_percentoff_editors payments_percentoff_editors_percentoff_id_user_id_6d8af8a8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.payments_percentoff_editors
    ADD CONSTRAINT payments_percentoff_editors_percentoff_id_user_id_6d8af8a8_uniq UNIQUE (percentoff_id, user_id);
 �   ALTER TABLE ONLY public.payments_percentoff_editors DROP CONSTRAINT payments_percentoff_editors_percentoff_id_user_id_6d8af8a8_uniq;
       public            postgres    false    239    239            ]           2606    20826 <   payments_percentoff_editors payments_percentoff_editors_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.payments_percentoff_editors
    ADD CONSTRAINT payments_percentoff_editors_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.payments_percentoff_editors DROP CONSTRAINT payments_percentoff_editors_pkey;
       public            postgres    false    239            X           2606    20818 ,   payments_percentoff payments_percentoff_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.payments_percentoff
    ADD CONSTRAINT payments_percentoff_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.payments_percentoff DROP CONSTRAINT payments_percentoff_pkey;
       public            postgres    false    237                       2606    21065 <   socialaccount_socialaccount socialaccount_socialaccount_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_pkey;
       public            postgres    false    253            �           2606    21027 R   socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);
 |   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq;
       public            postgres    false    253    253            �           2606    21123 Y   socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);
 �   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq;
       public            postgres    false    256    256            �           2606    21098 4   socialaccount_socialapp socialaccount_socialapp_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.socialaccount_socialapp DROP CONSTRAINT socialaccount_socialapp_pkey;
       public            postgres    false    254            �           2606    21012 @   socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_socialapp_sites_pkey;
       public            postgres    false    256            �           2606    21110 S   socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);
 }   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq;
       public            postgres    false    257    257            �           2606    21139 8   socialaccount_socialtoken socialaccount_socialtoken_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_socialtoken_pkey;
       public            postgres    false    257            E           2606    20962    books_book unique_book 
   CONSTRAINT     [   ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT unique_book UNIQUE (title, authors);
 @   ALTER TABLE ONLY public.books_book DROP CONSTRAINT unique_book;
       public            postgres    false    229    229            #           1259    20557 (   account_emailaddress_email_03be32b2_like    INDEX     ~   CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);
 <   DROP INDEX public.account_emailaddress_email_03be32b2_like;
       public            postgres    false    216            (           1259    20547 %   account_emailaddress_user_id_2c513194    INDEX     i   CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);
 9   DROP INDEX public.account_emailaddress_user_id_2c513194;
       public            postgres    false    216            )           1259    20571 3   account_emailconfirmation_email_address_id_5b7f8c58    INDEX     �   CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);
 G   DROP INDEX public.account_emailconfirmation_email_address_id_5b7f8c58;
       public            postgres    false    217            *           1259    20553 +   account_emailconfirmation_key_f43612bd_like    INDEX     �   CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);
 ?   DROP INDEX public.account_emailconfirmation_key_f43612bd_like;
       public            postgres    false    217            /           1259    20681 %   accounts_address_customer_id_224ca293    INDEX     i   CREATE INDEX accounts_address_customer_id_224ca293 ON public.accounts_address USING btree (customer_id);
 9   DROP INDEX public.accounts_address_customer_id_224ca293;
       public            postgres    false    221                       1259    20605    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    207                       1259    20490 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    209                       1259    20491 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    209                       1259    20476 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    205                       1259    20506 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    213                       1259    20505 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    213                       1259    20520 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    215                        1259    20519 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    215                       1259    20599     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    211            F           1259    20787 &   books_book_categories_book_id_7ebd7550    INDEX     k   CREATE INDEX books_book_categories_book_id_7ebd7550 ON public.books_book_categories USING btree (book_id);
 :   DROP INDEX public.books_book_categories_book_id_7ebd7550;
       public            postgres    false    231            I           1259    20788 *   books_book_categories_category_id_eee537c6    INDEX     s   CREATE INDEX books_book_categories_category_id_eee537c6 ON public.books_book_categories USING btree (category_id);
 >   DROP INDEX public.books_book_categories_category_id_eee537c6;
       public            postgres    false    231            ?           1259    20774    books_book_creator_id_efb34f77    INDEX     [   CREATE INDEX books_book_creator_id_efb34f77 ON public.books_book USING btree (creator_id);
 2   DROP INDEX public.books_book_creator_id_efb34f77;
       public            postgres    false    229            L           1259    20801 #   books_book_editors_book_id_eaf7aeea    INDEX     e   CREATE INDEX books_book_editors_book_id_eaf7aeea ON public.books_book_editors USING btree (book_id);
 7   DROP INDEX public.books_book_editors_book_id_eaf7aeea;
       public            postgres    false    233            Q           1259    20802 #   books_book_editors_user_id_e9101467    INDEX     e   CREATE INDEX books_book_editors_user_id_e9101467 ON public.books_book_editors USING btree (user_id);
 7   DROP INDEX public.books_book_editors_user_id_e9101467;
       public            postgres    false    233            @           1259    20963 #   books_book_max_cash_off_id_520ebe5d    INDEX     e   CREATE INDEX books_book_max_cash_off_id_520ebe5d ON public.books_book USING btree (max_cash_off_id);
 7   DROP INDEX public.books_book_max_cash_off_id_520ebe5d;
       public            postgres    false    229            A           1259    20964 "   books_book_percent_off_id_be930110    INDEX     c   CREATE INDEX books_book_percent_off_id_be930110 ON public.books_book USING btree (percent_off_id);
 6   DROP INDEX public.books_book_percent_off_id_be930110;
       public            postgres    false    229            6           1259    20754 "   books_category_creator_id_323fd784    INDEX     c   CREATE INDEX books_category_creator_id_323fd784 ON public.books_category USING btree (creator_id);
 6   DROP INDEX public.books_category_creator_id_323fd784;
       public            postgres    false    225            9           1259    20767 +   books_category_editors_category_id_9e1d0317    INDEX     u   CREATE INDEX books_category_editors_category_id_9e1d0317 ON public.books_category_editors USING btree (category_id);
 ?   DROP INDEX public.books_category_editors_category_id_9e1d0317;
       public            postgres    false    227            >           1259    20768 '   books_category_editors_user_id_75f5e6e0    INDEX     m   CREATE INDEX books_category_editors_user_id_75f5e6e0 ON public.books_category_editors USING btree (user_id);
 ;   DROP INDEX public.books_category_editors_user_id_75f5e6e0;
       public            postgres    false    227            2           1259    20704 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    223            5           1259    20705 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    223            u           1259    20974 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    250            x           1259    20973 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    250            y           1259    20985     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public            postgres    false    252            R           1259    20877 $   payments_basket_customer_id_bf1e8149    INDEX     g   CREATE INDEX payments_basket_customer_id_bf1e8149 ON public.payments_basket USING btree (customer_id);
 8   DROP INDEX public.payments_basket_customer_id_bf1e8149;
       public            postgres    false    235            S           1259    20950 $   payments_basket_discount_id_5bfc8c8f    INDEX     g   CREATE INDEX payments_basket_discount_id_5bfc8c8f ON public.payments_basket USING btree (discount_id);
 8   DROP INDEX public.payments_basket_discount_id_5bfc8c8f;
       public            postgres    false    235            l           1259    20935 $   payments_cashoff_creator_id_db6fb07d    INDEX     g   CREATE INDEX payments_cashoff_creator_id_db6fb07d ON public.payments_cashoff USING btree (creator_id);
 8   DROP INDEX public.payments_cashoff_creator_id_db6fb07d;
       public            postgres    false    247            o           1259    20948 ,   payments_cashoff_editors_cashoff_id_38589bd2    INDEX     w   CREATE INDEX payments_cashoff_editors_cashoff_id_38589bd2 ON public.payments_cashoff_editors USING btree (cashoff_id);
 @   DROP INDEX public.payments_cashoff_editors_cashoff_id_38589bd2;
       public            postgres    false    249            t           1259    20949 )   payments_cashoff_editors_user_id_d95474f1    INDEX     q   CREATE INDEX payments_cashoff_editors_user_id_d95474f1 ON public.payments_cashoff_editors USING btree (user_id);
 =   DROP INDEX public.payments_cashoff_editors_user_id_d95474f1;
       public            postgres    false    249            c           1259    20915 )   payments_discountcode_creator_id_92f9224b    INDEX     q   CREATE INDEX payments_discountcode_creator_id_92f9224b ON public.payments_discountcode USING btree (creator_id);
 =   DROP INDEX public.payments_discountcode_creator_id_92f9224b;
       public            postgres    false    243            h           1259    20928 6   payments_discountcode_editors_discountcode_id_db412202    INDEX     �   CREATE INDEX payments_discountcode_editors_discountcode_id_db412202 ON public.payments_discountcode_editors USING btree (discountcode_id);
 J   DROP INDEX public.payments_discountcode_editors_discountcode_id_db412202;
       public            postgres    false    245            k           1259    20929 .   payments_discountcode_editors_user_id_ed0b5095    INDEX     {   CREATE INDEX payments_discountcode_editors_user_id_ed0b5095 ON public.payments_discountcode_editors USING btree (user_id);
 B   DROP INDEX public.payments_discountcode_editors_user_id_ed0b5095;
       public            postgres    false    245            _           1259    20908 !   payments_order_basket_id_6291f5f2    INDEX     a   CREATE INDEX payments_order_basket_id_6291f5f2 ON public.payments_order USING btree (basket_id);
 5   DROP INDEX public.payments_order_basket_id_6291f5f2;
       public            postgres    false    241            `           1259    20909    payments_order_book_id_dff5a9fb    INDEX     ]   CREATE INDEX payments_order_book_id_dff5a9fb ON public.payments_order USING btree (book_id);
 3   DROP INDEX public.payments_order_book_id_dff5a9fb;
       public            postgres    false    241            V           1259    20883 '   payments_percentoff_creator_id_6d0dfeb4    INDEX     m   CREATE INDEX payments_percentoff_creator_id_6d0dfeb4 ON public.payments_percentoff USING btree (creator_id);
 ;   DROP INDEX public.payments_percentoff_creator_id_6d0dfeb4;
       public            postgres    false    237            Y           1259    20896 2   payments_percentoff_editors_percentoff_id_70959c9d    INDEX     �   CREATE INDEX payments_percentoff_editors_percentoff_id_70959c9d ON public.payments_percentoff_editors USING btree (percentoff_id);
 F   DROP INDEX public.payments_percentoff_editors_percentoff_id_70959c9d;
       public            postgres    false    239            ^           1259    20897 ,   payments_percentoff_editors_user_id_6427a31c    INDEX     w   CREATE INDEX payments_percentoff_editors_user_id_6427a31c ON public.payments_percentoff_editors USING btree (user_id);
 @   DROP INDEX public.payments_percentoff_editors_user_id_6427a31c;
       public            postgres    false    239            �           1259    21033 ,   socialaccount_socialaccount_user_id_8146e70c    INDEX     w   CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);
 @   DROP INDEX public.socialaccount_socialaccount_user_id_8146e70c;
       public            postgres    false    253            �           1259    21047 .   socialaccount_socialapp_sites_site_id_2579dee5    INDEX     {   CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);
 B   DROP INDEX public.socialaccount_socialapp_sites_site_id_2579dee5;
       public            postgres    false    256            �           1259    21124 3   socialaccount_socialapp_sites_socialapp_id_97fb6e7d    INDEX     �   CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);
 G   DROP INDEX public.socialaccount_socialapp_sites_socialapp_id_97fb6e7d;
       public            postgres    false    256            �           1259    21080 -   socialaccount_socialtoken_account_id_951f210e    INDEX     y   CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);
 A   DROP INDEX public.socialaccount_socialtoken_account_id_951f210e;
       public            postgres    false    257            �           1259    21111 )   socialaccount_socialtoken_app_id_636a42d7    INDEX     q   CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);
 =   DROP INDEX public.socialaccount_socialtoken_app_id_636a42d7;
       public            postgres    false    257            �           2606    20541 J   account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id;
       public          postgres    false    211    3091    216            �           2606    20579 P   account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk;
       public          postgres    false    3111    217    216            �           2606    20676 F   accounts_address accounts_address_customer_id_224ca293_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_address
    ADD CONSTRAINT accounts_address_customer_id_224ca293_fk_auth_user_id FOREIGN KEY (customer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.accounts_address DROP CONSTRAINT accounts_address_customer_id_224ca293_fk_auth_user_id;
       public          postgres    false    211    221    3091            �           2606    20485 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    3078    205    209            �           2606    20480 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3083    209    207            �           2606    20471 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    205    3073    203            �           2606    20500 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    213    207    3083            �           2606    20495 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    3091    211    213            �           2606    20514 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    205    3078    215            �           2606    20509 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    215    211    3091            �           2606    20777 M   books_book_categories books_book_categories_book_id_7ebd7550_fk_books_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_book_categories
    ADD CONSTRAINT books_book_categories_book_id_7ebd7550_fk_books_book_id FOREIGN KEY (book_id) REFERENCES public.books_book(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.books_book_categories DROP CONSTRAINT books_book_categories_book_id_7ebd7550_fk_books_book_id;
       public          postgres    false    231    229    3139            �           2606    20782 U   books_book_categories books_book_categories_category_id_eee537c6_fk_books_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_book_categories
    ADD CONSTRAINT books_book_categories_category_id_eee537c6_fk_books_category_id FOREIGN KEY (category_id) REFERENCES public.books_category(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.books_book_categories DROP CONSTRAINT books_book_categories_category_id_eee537c6_fk_books_category_id;
       public          postgres    false    225    3128    231            �           2606    20769 9   books_book books_book_creator_id_efb34f77_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_creator_id_efb34f77_fk_auth_user_id FOREIGN KEY (creator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.books_book DROP CONSTRAINT books_book_creator_id_efb34f77_fk_auth_user_id;
       public          postgres    false    3091    211    229            �           2606    20791 G   books_book_editors books_book_editors_book_id_eaf7aeea_fk_books_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_book_editors
    ADD CONSTRAINT books_book_editors_book_id_eaf7aeea_fk_books_book_id FOREIGN KEY (book_id) REFERENCES public.books_book(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.books_book_editors DROP CONSTRAINT books_book_editors_book_id_eaf7aeea_fk_books_book_id;
       public          postgres    false    229    3139    233            �           2606    20796 F   books_book_editors books_book_editors_user_id_e9101467_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_book_editors
    ADD CONSTRAINT books_book_editors_user_id_e9101467_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.books_book_editors DROP CONSTRAINT books_book_editors_user_id_e9101467_fk_auth_user_id;
       public          postgres    false    233    3091    211            �           2606    21154 E   books_book books_book_max_cash_off_id_520ebe5d_fk_payments_cashoff_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_max_cash_off_id_520ebe5d_fk_payments_cashoff_id FOREIGN KEY (max_cash_off_id) REFERENCES public.payments_cashoff(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.books_book DROP CONSTRAINT books_book_max_cash_off_id_520ebe5d_fk_payments_cashoff_id;
       public          postgres    false    229    3182    247            �           2606    21159 G   books_book books_book_percent_off_id_be930110_fk_payments_percentoff_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_percent_off_id_be930110_fk_payments_percentoff_id FOREIGN KEY (percent_off_id) REFERENCES public.payments_percentoff(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.books_book DROP CONSTRAINT books_book_percent_off_id_be930110_fk_payments_percentoff_id;
       public          postgres    false    3160    237    229            �           2606    20749 A   books_category books_category_creator_id_323fd784_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_category
    ADD CONSTRAINT books_category_creator_id_323fd784_fk_auth_user_id FOREIGN KEY (creator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.books_category DROP CONSTRAINT books_category_creator_id_323fd784_fk_auth_user_id;
       public          postgres    false    225    211    3091            �           2606    20757 M   books_category_editors books_category_edito_category_id_9e1d0317_fk_books_cat    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_category_editors
    ADD CONSTRAINT books_category_edito_category_id_9e1d0317_fk_books_cat FOREIGN KEY (category_id) REFERENCES public.books_category(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.books_category_editors DROP CONSTRAINT books_category_edito_category_id_9e1d0317_fk_books_cat;
       public          postgres    false    3128    225    227            �           2606    20762 N   books_category_editors books_category_editors_user_id_75f5e6e0_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_category_editors
    ADD CONSTRAINT books_category_editors_user_id_75f5e6e0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.books_category_editors DROP CONSTRAINT books_category_editors_user_id_75f5e6e0_fk_auth_user_id;
       public          postgres    false    211    3091    227            �           2606    20694 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3073    223    203            �           2606    20699 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    3091    211    223            �           2606    20872 D   payments_basket payments_basket_customer_id_bf1e8149_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_basket
    ADD CONSTRAINT payments_basket_customer_id_bf1e8149_fk_auth_user_id FOREIGN KEY (customer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.payments_basket DROP CONSTRAINT payments_basket_customer_id_bf1e8149_fk_auth_user_id;
       public          postgres    false    211    235    3091            �           2606    20867 A   payments_basket payments_basket_discount_id_5bfc8c8f_fk_payments_    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_basket
    ADD CONSTRAINT payments_basket_discount_id_5bfc8c8f_fk_payments_ FOREIGN KEY (discount_id) REFERENCES public.payments_discountcode(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.payments_basket DROP CONSTRAINT payments_basket_discount_id_5bfc8c8f_fk_payments_;
       public          postgres    false    235    3173    243            �           2606    20930 E   payments_cashoff payments_cashoff_creator_id_db6fb07d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_cashoff
    ADD CONSTRAINT payments_cashoff_creator_id_db6fb07d_fk_auth_user_id FOREIGN KEY (creator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.payments_cashoff DROP CONSTRAINT payments_cashoff_creator_id_db6fb07d_fk_auth_user_id;
       public          postgres    false    3091    247    211            �           2606    20938 N   payments_cashoff_editors payments_cashoff_edi_cashoff_id_38589bd2_fk_payments_    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_cashoff_editors
    ADD CONSTRAINT payments_cashoff_edi_cashoff_id_38589bd2_fk_payments_ FOREIGN KEY (cashoff_id) REFERENCES public.payments_cashoff(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.payments_cashoff_editors DROP CONSTRAINT payments_cashoff_edi_cashoff_id_38589bd2_fk_payments_;
       public          postgres    false    249    247    3182            �           2606    20943 R   payments_cashoff_editors payments_cashoff_editors_user_id_d95474f1_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_cashoff_editors
    ADD CONSTRAINT payments_cashoff_editors_user_id_d95474f1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.payments_cashoff_editors DROP CONSTRAINT payments_cashoff_editors_user_id_d95474f1_fk_auth_user_id;
       public          postgres    false    211    3091    249            �           2606    20918 X   payments_discountcode_editors payments_discountcod_discountcode_id_db412202_fk_payments_    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_discountcode_editors
    ADD CONSTRAINT payments_discountcod_discountcode_id_db412202_fk_payments_ FOREIGN KEY (discountcode_id) REFERENCES public.payments_discountcode(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.payments_discountcode_editors DROP CONSTRAINT payments_discountcod_discountcode_id_db412202_fk_payments_;
       public          postgres    false    245    3173    243            �           2606    20910 O   payments_discountcode payments_discountcode_creator_id_92f9224b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_discountcode
    ADD CONSTRAINT payments_discountcode_creator_id_92f9224b_fk_auth_user_id FOREIGN KEY (creator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.payments_discountcode DROP CONSTRAINT payments_discountcode_creator_id_92f9224b_fk_auth_user_id;
       public          postgres    false    243    211    3091            �           2606    20923 \   payments_discountcode_editors payments_discountcode_editors_user_id_ed0b5095_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_discountcode_editors
    ADD CONSTRAINT payments_discountcode_editors_user_id_ed0b5095_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.payments_discountcode_editors DROP CONSTRAINT payments_discountcode_editors_user_id_ed0b5095_fk_auth_user_id;
       public          postgres    false    245    211    3091            �           2606    20898 F   payments_order payments_order_basket_id_6291f5f2_fk_payments_basket_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_order
    ADD CONSTRAINT payments_order_basket_id_6291f5f2_fk_payments_basket_id FOREIGN KEY (basket_id) REFERENCES public.payments_basket(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.payments_order DROP CONSTRAINT payments_order_basket_id_6291f5f2_fk_payments_basket_id;
       public          postgres    false    235    241    3157            �           2606    20903 ?   payments_order payments_order_book_id_dff5a9fb_fk_books_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_order
    ADD CONSTRAINT payments_order_book_id_dff5a9fb_fk_books_book_id FOREIGN KEY (book_id) REFERENCES public.books_book(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.payments_order DROP CONSTRAINT payments_order_book_id_dff5a9fb_fk_books_book_id;
       public          postgres    false    229    241    3139            �           2606    20886 T   payments_percentoff_editors payments_percentoff__percentoff_id_70959c9d_fk_payments_    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_percentoff_editors
    ADD CONSTRAINT payments_percentoff__percentoff_id_70959c9d_fk_payments_ FOREIGN KEY (percentoff_id) REFERENCES public.payments_percentoff(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.payments_percentoff_editors DROP CONSTRAINT payments_percentoff__percentoff_id_70959c9d_fk_payments_;
       public          postgres    false    237    3160    239            �           2606    20878 K   payments_percentoff payments_percentoff_creator_id_6d0dfeb4_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_percentoff
    ADD CONSTRAINT payments_percentoff_creator_id_6d0dfeb4_fk_auth_user_id FOREIGN KEY (creator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.payments_percentoff DROP CONSTRAINT payments_percentoff_creator_id_6d0dfeb4_fk_auth_user_id;
       public          postgres    false    211    237    3091            �           2606    20891 X   payments_percentoff_editors payments_percentoff_editors_user_id_6427a31c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_percentoff_editors
    ADD CONSTRAINT payments_percentoff_editors_user_id_6427a31c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.payments_percentoff_editors DROP CONSTRAINT payments_percentoff_editors_user_id_6427a31c_fk_auth_user_id;
       public          postgres    false    3091    211    239            �           2606    21041 P   socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si;
       public          postgres    false    3197    252    256            �           2606    21028 X   socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id;
       public          postgres    false    253    3091    211            �           2606    21091 J   socialaccount_socialtoken socialaccount_socialtoken_account_id_951f210e_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_account_id_951f210e_fk FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_socialtoken_account_id_951f210e_fk;
       public          postgres    false    3199    257    253            �           2606    21132 F   socialaccount_socialtoken socialaccount_socialtoken_app_id_636a42d7_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_636a42d7_fk FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_socialtoken_app_id_636a42d7_fk;
       public          postgres    false    3204    254    257            J   &   x�3�,N�I��t�L����K���,�L�4����� ��X      K      x������ � �      O      x������ � �      A   4   x�3��zc����8o�����ƛ�7�n��2�l������=\1z\\\ 2}x      C   _  x�ҹq 1C��(�#�R/��oB��Fe?�c��ʝ��Yꝭ�9�;���';�vdF��\a!���Xɀ�eP620�28{r<?r<��|r9���S��%����������)��(��x������T�E)�x1
��
�xJ�<J�4%^�/�ξKK%^�/[����˫�˧«��+Sᕫ�*Tx�[��P*�j^�
��
�����M�׮��P�u��z��-��x=j��j�~�9�1޸oB�7�����;�社o�o�.�=�{�������i�I�n��ۛ{w�����G�+<�����o{?��������o�=�������~v ���mbr���+��p      ?   y  x�}�Mn�0���)|��ԯ��5��8BK��Y��t�St�4�Aڻ��eJ��$�������RJ|^�f��z��63�k��B	����?eHq��m4��P c �z�[ڡ & ~-�7��J��Z�o˦)����Z�5�@tG؜�c,$�"Xd$x$�һ�쫻Z�`���Ssn}!��'��D�`���c���{����Q�������R�:����6N��v2�+ծ5om���Z�� ����� FC�_R_�Q>���2Vy׍�o5��KF���>=ƪ=`h�c���<*�)[-rk�<ʈ�7�:# ��F�Y �2N��a2T��]���io\�X�1�1+�!������P�&�����ל���k�*������e�@�e��s�4צ�D-�ŵ�0�@r]貦*ʕٓ���v�0�
�⠌Y���x����X�
���tc�-2.P�$u�-�J�4u-�h*	W�4�(�J�E<M/J�I�����$����F�<0$��|��d�P��O�,��)ɉ�pBt��{9��u������$����?ћ����1ɻ��K�1)q罗�CbR`�|��S������=e/�˪��);(�^-�:�Rh�R��)�,���iܿu�B��k)�`J�!��� zr`F:�b`�C�;͞>�{�x�B���r���Vf�-Ǩ�5�Y?�i�{H�F�v�h������t|�A���r��X������뾓���腬�N
�7���;)s�^D:���`J��#������|x�������@�� �)��=��=7u~0F ��s�e~Q��̓��uh�K��Υ�K�ɝ�B��e�T����;��h��]sݿ�|q"�5���ƟxV��O��
<�,�IJ���P0      E     x�m��N�`��?���\���65)454�bm�C@0�-�M��tѫ�z�XYٟs�������wtװ�MdS���a�8q��H�wF����u��Ǯ�$�|�DWn��P6ժ.G~�>�K��\��-�K����Ca�=$JH�8T��D �5<g
����H������?�Bq�.��D���Z^.�ؖV��D����=v���m���`4)�(�r�ly�C�� ���'����z󒭲��v�=l����	DtB=��R��F��S��"�8�� �k��"O�iAܸE��� L�)�z����VWҫn�N�R�TK��ypYhgjg��'w�5X��w�FlFq�3�ԞQ`�)5��q���3y���秠��>(
oce�      G      x�3�4�4����� �Z      I      x������ � �      W   �   x����m�0����1H� ���Y&����=����A�˔JQH[�F���#�����9�XL]��1?a(��UN����r��rBD���d�,/v�U5X~Ս�6�~�#ORu�����6j#U�&�����:O.R��0O��縏_��Bj�f���J]/ m����)�����f5K6��"uy~����!�?@~
Zz��[�[J�H�c�{{Y��9s�1^��w      Y   /   x�ı  ��?w	��.�?V�P(H_L�,�����E����q�      [      x�3�4�4�2�B.cNc ;F��� !��      S   �   x���KR�0��u
�L=z���,��,z
6e�6����eP��3��|#E&�g=�U?�����12�0�Ċ�S�(�C�? `��zi��4�8	o��@�ތ�I����\2or� �6�E��t�=��H[�: �N��.�5#��&�i\�{���^�G���T	=����� ����6c۷C�3y�"m�� ;}7�M������x�Q ��b�-o��ﲇm��gNe����?��x      U   4   x�ȹ  ��T36�M/�_J6� %i'�.��l{8���M����!���      Q   �  x�͖�nG���S,X%H�ؙ���@��	� )%g�d1ɀG��"@D��S��-�eH��أ^&�"ug,��p@�}@�ۙ���� C��+�. ��?�%xc�WB�Rd��gaywn�v�Š�� g/^�<�d;�0P�Jp�tf��l�6\����^�eG��p����F�Pn�U���聨"sḱ�m*��ф��;����dB�r�8X�=6	�PS�;G�I)2Ý�(L#��<_sG��dX����Ѭ��I1._���Gߎ��	��geU�?ϋ�#V͋��������oU��d�|4<Di�(Uȵ�N��>UqR�GO~/��S~8wd��R��pk@����:��z�yhO�o�b픵�-�YxW��7��t�I��7-n�BQ�R`�"���Ee���z�pM�m���)Ն���WTE�~�#S��ApԒ:z�1Y��jY�I*��Km�8H���,�+\�4���%r�� ��~,g��d���s���pξ�/��6"S�(����j��%�b��(��!�n�(�=x����{އ�GJ�����&c��;���MQ�g~("/���s\"h�lE�Y��������">ߐg\�z��gm}�P/H�/��}��TJ�;sA�d�]Q|⮏9����0��_�Y_�����ڔց��S:v*F5��'��3F��"���)m�a���� ��;y��^J��3
�U���E��~Q`���`�kA���]��^�cj%�Dɑ�ltF�}�.bx�(�k�-��m(t��do�o����	V�n���YκdtO�rO�GV.<����]�S_�"�I$W�/=+�_�9��&�'e��sr_B���_pC�[�O]��ǀL�FC�5Uڛv��/O����� ����o�>�����7      =   �   x�m�K��0Eǰ��N�{��$���2� �/n_�W����'�����<!q�j�	�e�?Ŭ��^�b��$���A���5�h,6V#^���y*�#ŁB�6��ol�m�#��w{P�u�B�~�SB��l��l���|*܉}��H��N�M
�����+{��l�/��yK�m�]7,9���m#!���K`l�[Ó>���C�>ΑM      ;   �  x����n�0���S����g|γ�dy��Z�����_a�*d����s�:t�u1^/n�!`|磷M�ᕨW�_�����((��7aGJ^��c|�Qɥ�"Zٺc�u�
@=�ؽ�k�oLk�M�s�b $ � ~�&��$"
� �����Lf��]���_���l��a�p!g�,Mt�������CwCle'p�g�*4:��!=v�$�p���݃��-�p��:e� )~Oi�M�>e86�U4��2
H$�?G��oU0�O8$͜�W�Зm����ƞN��}�M���ݓ����HQ��e:Ws���~�kM��i<Ӏ̴s��>�bi�2I���r�҇��]�>�JK���@�u����|�3?I4g�-�Gy��R))���L=1����ЬϮ���#?0Ԝ\�5g!��ܑ�:���n;4-�,�E��(�A�yݖZ��u2J��H]8�$�:N+譱gS�_?M%�<Ȫ�!|lDc"�xu����(�8��J�R�X>���Q��H�S.��)���琲O��IC�#�,�OU���3lƁ�+��|�>�I&X���j�E����r�����q�gB*]2�P�N_�yE�wZ���)>����ẻ�]�Nh �KN�#��{k҂I�f�&����*NZp���]w�F�j��0(_Z�'ӕad!�/B���8 &��///� �U�      l     x���n�0  ���{_0mQ��!0+FD��%EQ� ���Α�̇L��f<��y�?�R���X�U�{����\�6��e�"6�b;�A���O�F�02a�y:��u�w�۱�4ȶ�yz��
��������(`�鹓��W{�F���Ñ�`��[sim��)����ƭг�}W����-h+m���׀	kG��$�^5ۄ�Q;I�y����V}o��D
�Hz����>@PXE�O�6!6Wp��k�,M(EQ��G_V      n      x�3�L�H�-�I�K��Efs��qqq �<	�      ]   5   x�3�4202�5��54R00�25�2��352�03�60�26�4������� ��      i   ;   x�3伱�f�͎�nl�44510�4202�50�50R00�#m+c�0N#�=... ��      k      x�3�4�4����� �X      e      x������ � �      g      x������ � �      c   $   x�3�4��4�4�2� ��1��bC�=... R�y      _   ]   x�3伱�ƺ���{n6*�l���f;��)��������������i�Xp�qrq��x���&���nl���fB����16m1z\\\ �H%�      a      x�3�4�4�2�B�=... 
      o      x������ � �      p      x������ � �      r      x������ � �      s      x������ � �     