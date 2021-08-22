PGDMP                         y        
   Book_Store    13.2    13.3 ?    t           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            u           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            v           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            w           1262    22645 
   Book_Store    DATABASE     p   CREATE DATABASE "Book_Store" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "Book_Store";
                postgres    false            B          0    22721    accounts_customuser 
   TABLE DATA           �   COPY public.accounts_customuser (id, password, username, email, first_name, last_name, is_staff, is_superuser, is_active, last_login, date_joined, slug) FROM stdin;
    public          postgres    false    211   v:       I          0    22801    account_emailaddress 
   TABLE DATA           W   COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
    public          postgres    false    218   J<       J          0    22811    account_emailconfirmation 
   TABLE DATA           ]   COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
    public          postgres    false    219   �<       H          0    22752    accounts_address 
   TABLE DATA           r   COPY public.accounts_address (id, is_default, province, city, street, details, postcode, customer_id) FROM stdin;
    public          postgres    false    217   �<       >          0    22677 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    207   y=       D          0    22736    accounts_customuser_groups 
   TABLE DATA           Q   COPY public.accounts_customuser_groups (id, customuser_id, group_id) FROM stdin;
    public          postgres    false    213   �=       :          0    22659    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    203   �=       <          0    22669    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    205   �>       F          0    22744 $   accounts_customuser_user_permissions 
   TABLE DATA           `   COPY public.accounts_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
    public          postgres    false    215   C       @          0    22687    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    209   gD       d          0    23028    orders_cashoff 
   TABLE DATA           p   COPY public.orders_cashoff (id, title, cash_off, min_price_off, start, "end", status, creator_id) FROM stdin;
    public          postgres    false    245   SE       ^          0    23004    orders_percentoff 
   TABLE DATA           g   COPY public.orders_percentoff (id, title, percent_off, start, "end", status, creator_id) FROM stdin;
    public          postgres    false    239   pE       R          0    22909 
   books_book 
   TABLE DATA           �   COPY public.books_book (id, title, created_at, updated_at, authors, description, quantity, price, image, slug, creator_id, last_edit_by_id, max_cash_off_id, percent_off_id, is_active) FROM stdin;
    public          postgres    false    227   �E       P          0    22901    books_category 
   TABLE DATA           m   COPY public.books_category (id, name, created_at, updated_at, slug, creator_id, last_edit_by_id) FROM stdin;
    public          postgres    false    225   N       T          0    22920    books_book_categories 
   TABLE DATA           I   COPY public.books_book_categories (id, book_id, category_id) FROM stdin;
    public          postgres    false    229   !O       N          0    22877    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    223   hO       8          0    22648    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    201   �T       g          0    23157    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    248   �W       i          0    23169    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    250   jb       V          0    22970    orders_basket 
   TABLE DATA           :   COPY public.orders_basket (id, customer_id) FROM stdin;
    public          postgres    false    231   �b       f          0    23036    orders_cashoff_editors 
   TABLE DATA           Q   COPY public.orders_cashoff_editors (id, cashoff_id, customuser_id) FROM stdin;
    public          postgres    false    247   �b       X          0    22980    orders_discountcode 
   TABLE DATA           �   COPY public.orders_discountcode (id, title, type, percent_off, cash_off, min_price_off, code, start, "end", status, creator_id) FROM stdin;
    public          postgres    false    233   �b       Z          0    22988    orders_discountcode_editors 
   TABLE DATA           [   COPY public.orders_discountcode_editors (id, discountcode_id, customuser_id) FROM stdin;
    public          postgres    false    235   �b       \          0    22996    orders_order 
   TABLE DATA           m   COPY public.orders_order (id, created_at, status, basket_id, delivery_address_id, discount_id) FROM stdin;
    public          postgres    false    237   c       b          0    23020    orders_orderitem 
   TABLE DATA           M   COPY public.orders_orderitem (id, quantity, book_id, order_id) FROM stdin;
    public          postgres    false    243   (c       `          0    23012    orders_percentoff_editors 
   TABLE DATA           W   COPY public.orders_percentoff_editors (id, percentoff_id, customuser_id) FROM stdin;
    public          postgres    false    241   Ec       j          0    23180    socialaccount_socialaccount 
   TABLE DATA           v   COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
    public          postgres    false    251   hc       k          0    23191    socialaccount_socialapp 
   TABLE DATA           ]   COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
    public          postgres    false    252   �c       m          0    23199    socialaccount_socialapp_sites 
   TABLE DATA           R   COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
    public          postgres    false    254   �c       n          0    23207    socialaccount_socialtoken 
   TABLE DATA           l   COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
    public          postgres    false    255   �c       x           0    0    account_emailaddress_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 4, true);
          public          postgres    false    220            y           0    0     account_emailconfirmation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);
          public          postgres    false    221            z           0    0    accounts_address_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accounts_address_id_seq', 3, true);
          public          postgres    false    216            {           0    0 !   accounts_customuser_groups_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.accounts_customuser_groups_id_seq', 4, true);
          public          postgres    false    212            |           0    0    accounts_customuser_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.accounts_customuser_id_seq', 6, true);
          public          postgres    false    210            }           0    0 +   accounts_customuser_user_permissions_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.accounts_customuser_user_permissions_id_seq', 96, true);
          public          postgres    false    214            ~           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);
          public          postgres    false    206                       0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 64, true);
          public          postgres    false    208            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);
          public          postgres    false    204            �           0    0    books_book_categories_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.books_book_categories_id_seq', 11, true);
          public          postgres    false    228            �           0    0    books_book_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.books_book_id_seq', 9, true);
          public          postgres    false    226            �           0    0    books_category_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.books_category_id_seq', 8, true);
          public          postgres    false    224            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 49, true);
          public          postgres    false    222            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);
          public          postgres    false    202            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);
          public          postgres    false    200            �           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    249            �           0    0    orders_basket_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.orders_basket_id_seq', 1, false);
          public          postgres    false    230            �           0    0    orders_cashoff_editors_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.orders_cashoff_editors_id_seq', 1, false);
          public          postgres    false    246            �           0    0    orders_cashoff_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.orders_cashoff_id_seq', 1, false);
          public          postgres    false    244            �           0    0 $   orders_discountcode_editors_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.orders_discountcode_editors_id_seq', 1, false);
          public          postgres    false    234            �           0    0    orders_discountcode_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.orders_discountcode_id_seq', 1, false);
          public          postgres    false    232            �           0    0    orders_order_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);
          public          postgres    false    236            �           0    0    orders_orderitem_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.orders_orderitem_id_seq', 1, false);
          public          postgres    false    242            �           0    0 "   orders_percentoff_editors_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.orders_percentoff_editors_id_seq', 1, true);
          public          postgres    false    240            �           0    0    orders_percentoff_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.orders_percentoff_id_seq', 1, true);
          public          postgres    false    238            �           0    0 "   socialaccount_socialaccount_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);
          public          postgres    false    256            �           0    0    socialaccount_socialapp_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);
          public          postgres    false    257            �           0    0 $   socialaccount_socialapp_sites_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);
          public          postgres    false    253            �           0    0     socialaccount_socialtoken_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);
          public          postgres    false    258            B   �  x�u��N�0Ư���E�&"���KH�BXF[:&�ɡq��4mh�ݤ���=�.&�v�WI��Y:
C�9���#���ɀ����X��Gy]~B*��| |#�dxn������{���)�}F���"�@ְ�F,�8��c�ل��f�b�Q4�F}�ҁn���ժ�#�:9	O�F���]�uk���ԋ�~��\o;����+�������l���2��ՇM�`e~�]�~O�#yEW�=�#��. ����sE�"F�a�lxf�f"��9�P�I��r{B��K��]����,����g�憃)s���շ4򼕲}�����d����O��IcZ�IG]m�.�|�t�a�M�ɑ���N��`�Ϸ��8��H��p��8�Y����1���pW|]HҋoU���d�A`@,�4�b�Ȫ�\"��)}h����k���i����`      I   R   x�3�L���..�/JM�J�K�712pH�M���K���LBC.CΒ�����"#�T�\	s�p�$��"I�4�q��qqq Ҽ�      J      x������ � �      H   �   x�}�K�0D��)r��)������f�{����
Bl8Ǹ�I��ς�gl���z9�GO��Q����d�m��X����Z�R"����j�1d����9�i?4/�/��4vLVq��S2����.IF��E�F)�lRݙ�M%�YS��B)�2��z      >   *   x� ��1	مدیر
2	کارمند
\.


��      D      x�3�4�4�2�4�4�2�4�1z\\\ !��      :   �   x�m�M�� ���0�Bҿ������a"5������Ʋ��l��&5R戮0
�rW���M���>Ӝ�U��"ֲ$ϯ�g�	��"�5�Y��4OE��aD����ebrĲ�_�8
�Ờh�U*4�	�Q7�A���{�G�f#k��+�e�Bqf�A+ޗקW&�2=d��s�ϛr�
�_U�%�ߐ_�*r��=����@��f�T"���Pׁi>�r����"�W�� ��I      <     x�}�Mr�F��3��	\@�p�k�*����H� (��J��,|�l�h�J�]��2��L�A�7��{��y�D�~*O�r�_�57��Է*R��/���c��>���
(��`b�}uW��%7���~lZ`(��U{���nN*��xAg���N���,l����.o����k�~��Z����!����CH�V<`]��$8�5���ݪ8Wjc��Ҵ����3����6��"����/�yp�UnoSk��騐f�!��J���=��k�Ɛu���}�2g�|�1$��z#��O��`q�����C��ձ��O�q�rk��ђ���q�
��s�D���s޺Fz;so��P�ǲ�6���N֗ū��F�ʹ�,����fJ.u����եٓݮ�?�j��]�5�@�.���v��	5"q
w���/�8���+޴+Q����b�T`-�h�T��#ڬ/A��fDoT���ʨ"Q�]қ��X	u�8y�2C}$޼U!KE�$��0<�����j�6~�|Q����T7�4X�=,��	�E���A"Ģ����s�����i�:|S�����V��$B^���s�ȷd�#G�yy���qu�U��h^ڥiE�8.���(p��������(�v������"7-}N!��"��tJ�,z0���5 N��i:��EE9;֧s�||��N����1�̊HI�,2�J��ͥx��i.�j	�fVG�̯��A�.�=�������i
���X���ppd>����	~�&�}�<�
hײ�	{_v�U�"7$�7�C��i'
�ĔO;Q"F̸�!��4�3>��2>N5<������;;$w;�9�階�vMJe�����&����S8���8|W��~M�7-��"EE�C�,(�5HP������kgE��v�͠9t�]�yT��]�W������⮣̿��V���O�>�6$���'�Qo��X%�$�*����T�l1�>#�H��i�<����Xv�ڷ�+G$�gi�+�#5�wi�Ń�
������i��&���      F   E  x���m 1C�s~1��˽��:b΅��G���O�#^:�O�ˤ_�ٗ�}��y��L���7L�9&��b�ɱ�$Yc�l0i��8��<?�<��^�<\�'.��������������	y���Iȋ"�E�by�yqIyyHyi��|���A��$��)/���C��%���ա�Q��)y��/���WE}{hJ^%���W��ׇ��F�k��u����S^-���6;��^Z^_F�F�#o��7�țd��+��iF��ueysYy{Xyk��uV�+o������W9y;��]�k��~�;\y׸�s���ʻɕw�+�6��?*h�      @   �   x�ѹm AA[�p��\�ڶ�����V�Q�U�S�ħ!�%�#!�hʌ�(Z�#���a���򓡥���exr�L9^�s�e��r�x�r�<9^}r�29^��F�W���S�����R���8^�=^�=^�=޼=ޘo\�7�ěT�M)�x�^oV�7���O����[W�m��6Ux[*�mގ
o�������Sᝩ���xj�K5ޕ�Z����F�      d      x������ � �      ^   ?   x�3伱�f�͎���{8MM9��u,t-��H����� *c�k`�.�i����� �X�      R   A  x��X�n�V]�_�eKR�,i��誛 E�E�4.�Ev�+KB���(*E��R��(��W\J�~I眹�"e	�6�D�;�3gf5��[�fR�xfj23Y��=+�̬ȳՕ��l=�/Š8�3kDA�
ڷ�8�Ɓ�� �2���`s��I7�Q�o0�D�H�M��]"��^5�_4�^�҉�z�\^��&�!оz���|\��+F���z�ze�Ǹ����I�O1��D
���
�xq���Kn�a9:,#4+�!J>���D!_������<�M��'pK5�yru&E���u�
R��ܤ]���s̈́�˜A<F"DӜZ�`E�!��g�v�VfƘ��_X�a]���=\A� ���"��!�B,��.�ߨP�H��Ѡ�����[+V�J�D�FM�&�6S�|�Fľ�cw\��o��Ee ���!ZJ��|���H�P�[yߗ��]6�KN�Ձz��o�29�8�� ��Z��S���^R�����Et"r���v`�T�'�p�C ����#��u��	�뱼��̔��19�E&��nD� ?�z����W��}�'����������3o7��ߝo��{�F�#ʨ8R'��(��I�ڭv'�����~�j�I���j��-�Œ�+00YC�� o�C��4���b��[(�T��k:�7�=,N,�(����Ru��aP;�$w-�b���,C�B`�_����+�rj^�fX�"�V:�{��ܫІh�J%x�#c�Wi����]���DJfReŊǏ��+����j\ �^g_�w���-���0lD�uG��?�xг ލ4��S�RA�|���f)�0��(N:����aۏ��V�a!��h=��.����,2R���f4X�`f�`
f�MJ�Y�d�)�*��D3s��������c��(!%0���*���d�rP&��jrX�y%1�2��_"���]�Y���I,�CPւ��v�<��n�S9Ќ�T�<��3�d����S��J=d����:W�E_{��Z+�$Zr��c� �Ԟ\��H*Ќ��* ���w_�BE�< �#���0���b� �T�KaŰ���V�t��M��Z~�lEI��r!����\������.|�4��St�ä��Qe`��\�}�J�>�9u�q7j�a;I�or����v+j7K'�q.�R?�s�%B`��{�ÇO�<|�}��<z��݇������HZbW��t8yC
�d6'��V��{!1x�
���Η� SW�Rk���@�,��� wm-3A2tZ�l�$[�:
�� 9o���~�qG�L^@���x����*�$�gt�OUmV2ͦ�X�����Htő�yժ��kePx�iݦC'Mx���)�_��l��;g:fn�͵iy/�\��s�QF@P�9�����ySr��*eqpUoIg���=Yh�爾Է��Ǹ����5�;������s��T|ڴ�-� �k�<��az{T�$r��9������Yɮl�Zf�u��3�@�M���ˑw���~�	F���H��;Ф�TFo�L�9������=<�{���I�Dr��R,�����:����a���NWA��~'���>kʼ>K�֎�{��[���c�����i{�BG6ۭ/�2����퍺H��������&����=WDHY��E�dR�dNa�+���߆:�(��X��mآҰ�r	��\Zd�"֥N?��K��z`:d�Պ���u�E-�	:�\��3l�"������V�fG�w�d6�5��9C�Ԟ0�Dl��)͸����ݠ}��	w}������ǔ��[D��k��Df�i)ӈ���
��Z�y��ҢtCv�\�I/G��.�t�󮸇B�[ĸ�6s�����fT�G��΢W�pLe�/a��K�sq/���$S�g�v'R�Q1�l4�`�����xnG�W:RV�P�0�Z�k9�n`���"F(Է��f�<��(��������S��"X��X�%J�^�k#�Pό^�ܠ��*;]S��I�s˙l�jWK��К(��
���zP�%�_#�/�Vi��������"      P     x���AN�0 ��+�W���]��[�L-�
.�*TT�?Y������������7`�(�����7�yX���pn@,�>���~��@獜�y'�rF9�+<8��ءoW�@C�54���� ��RDZj���J�d�)oK�U.-��{�8ALtZ`#/_#����UA�!q��T���RK��A�t�˱U!���m��D���3,g�Ȼf#YJ��$5P	��>a�仒>T
*��� �Fȗ���݉N����N �      T   7   x�ɱ !���*����|�u�dȲ̌�RJ�bk��EӪxbs�sm]M�<
�      N   7  x��W�n�F>�OA����bgfyʭ��K��bQ���
$��9�����81�n���9H�e:K�E�����je�o����%¶t�`b�	�D�P��5?H��� �>f��y����_n��t���/_�zF��m�H-���*������4?ξ��i����h�����E������DuAY*eo�#f�w��Hw���ց��t�}*]��7�`��H(�$]�2Qv�}y�}��K��P��
����.?�r-(	��LIa]?����p��h���;���]���wQ	� ���;oǰ�1�6�J�V9�M]U �"�Gq��k���$�����Y~��]|c�9�|ȏ��/���^��6���6�iW�uQ(��u�G�n_\�����+GS����}��0�����q��9�K������ϥQ�x�-O:.���AT�����9�vOiH��e�"ɫI��M2E�E�P>t�˝��iQ;�n\�A��G��~�x���$~�5��9�ԛ�v�jJȳ� l��Lr&�L	)�W�O���Rd�,\���Y'Ax��A���Ol�|�GH�����I�wף���t6���}&>V(�=>�=;�u�l�3[�\�ĩ܊�c���*�t1lKbY��`�0��d���4|�u�N�g��`o:�N������q��pȤS7��ւ�!���n=��\��k��� ��-%�)��n���D5ja�:%��Vh���w�¶)�h'�#�"�e�<3W�����%�۱�>�@C�1&�P�xȮ����x��T�<�~� �7Z��o0<�;\&�:@�6��@y"=�������.�F�.���t�!�����_.�7��l�Q���X;��Y:�=�&Y:��F��x�e6(��t��_����a��<����q��.��X�\N�CW/�]��{y�}��o�] �k�8���J�Rùf��qX��������.������UW��^z#��-���qX�DԲ�T�������nXT��z�Rjko(���4Lp0
������5u�o��M�u.K�����vOUR�g|JR1^���t���aPm��iV��C~t��N��e�.O�L��\ۊ)���^i���e��Ԑ�3nvS4;����+�?��bfo�6{�,L��J.@�F	:!�6�+C�hC���^q����/�𽬰��=�H�n�6�2%�͕�j�oNQE]�d�}
����emj�M�U�2��Xi�桻<X��<j{ۋ��$M�$�?��a=�nU�&j�D���P�3+���#�ڤ(�����&u��|�n���ku������3 �      8     x���͒�:���S��V(K��YR�"��C���������&i6,�>��#��&�1~��T0���Cۺ+�!|c��W�
�bP����1Qq��bt��Çw���qC��c
%����2�z�,BWwя��Ǿ��6�s]_��W��1M��+Mf_i�D��m�d��֬ �AbZ���-N� �Eg��S�z��ז2��c�,��Y�9���kn�\�{��b�1��J����h>ꮽ�1���/��1����T_�_�C˭X��2����q��I�d�}0�Mp�3�J��a��#).d�!�p����6�ϯ]���+͌�^�Fܧ�֎g���(�p��M�!>�y,����|TR>g��#�^�g���g�^O�9��3�,�+	ȹ�i�z�ҷ���QK��#�d�L�����{ ����1�3���g����ˍ���W��ms8@ĳ$?Bx?QBNa�tg"/n�W�O_��j�b;�-3����,&�v��5SvUS�/&���nK2��Ҹ\5����5m#BP�Y��Sh���N@ڴI�>�����]���
	�R��ĝ��c��2����.�K��c��yz9<�ĹQ�%h�U���G%��ӻ��~;��l�>!�D�0|먴s�����M�^*NS��滆{�m�����Rj��hC+6��Y�4�a����z?n��X%u%m)%}
�8���A;݇���� �Qؒ3��k�7��gq̐�Fű��G��fc�SY�,�5��8��0����`1M������H}�      g   �
  x��Xɮ�H\W}E�[�L���w6`�����<�x���ӽU�n���U�$v�D�9��'!�m����USIR�C�(���'��G��'u�L�ne_���h��9YqN[1�o��؇�){g�!_����+��D��*�U0�E�K�v�/��f�9��6��lG�*��Q�\R��6��rU}���	���jhc���e��� \ v�o�� �Qx�`�e��C�ױ�?lF�)3b,+���(f�XP9I��IF�N�}�_�m��Hp�(&a�6=H�/�,������"�%]j
�Ö��M3�غ����Y���BcR�b��H��ԅl ��y���m�jkm{�#Y�C�QSK�q��{��nw�����*b%�}���?x�׸	��[$Q�� ��N��{���3�<ZYݍ�߼+D��=_�i�9"���F@R�.Y�����[��P\�Ub@e0.3�)���7�w����u�y��(�^����g
��|�ZȞ<��L�k�K����MnQ��nz��3��9��H�����'�(*���	崍QC7���ډ?tS���l���|�ZDS�&n3�Mbr$.%y]�bPyu��c�?Lr�M#I�S)�y�]����nY	������?X����4O���.�;)�p\�Q�P��9\}(v��bW�%�Ģ:E2;^�y�����CT5�J_�@s�YBİ�s~\��_��z��M36��eo��r��
�"���,��e7�ʊN��?�}a7��B���B�^����  ���8�k�D@��=�y�9D������`Up���䭇�ަ��?�H�ڰk��Gk��.�bem�/� \"�}P �*�a��+ͩ �i�1� ��a0L��� ��s�3٧�E�G��Z|Ү�}���7�JF��hW�N�d�[w�Vʙ"\z͒u��Q+�4G<��S������3�K<5~�"��Bp_���v�$�QVH]�F��xt�*Ă�X�mu��f�]Di#%軅�m}*Qu�-un����VnV�6�-�`�1fo��^i�=����\�7����4�)�
�h�j`�M�Ħ��i_S	�5F�/�(O��a�L��M�%�C��ɶ��3����
��cQH�f )w}�RZ�P�:3w���G��#Ē�,b?��s�%�}���+�����.뛡�?s)8r�p ��h]ŴJ�����h咱l;�vo�<V��rƃ�MD|�C=flJ��p��n��C�I��1����h���|�ހf_��B��uړ�>��Uge����J�xY+�+�=(0A|Vz;ZMܔE�05ыJro�qtM�My�c4s��㶪ϊAa�BA�֦:����vMJ�*J��q���� �$ID�O4��r�%�k��M�C:�$����՛}0�~�)5�f|}յ�.46L UX�x�W�����Si�9}���.t��WU�қ�J$�+�6�~��]��,��W^6��u��^��8���n*�^��Re��۸a$\,m�ޙ]l�P/��m��Q��-��m��F���<j@[�F]4KZCaj���y?Ք���C�.�Zp��$N ��B���Pj��i�����}����o���s�S�����tl+���&;p�p*�!M�ؚ"mƟ�wĉH`�V�붸3�s L�X��\݀�n�D�.<�+p�8 8�,1�i���0�)$�~�����2�j�.s
�u��R�����3��=�շ��N�i�(J����+���4��\>G}�OUvZ3�5 ��8��A��w�1$`~�v{QWteT�Ĵ	�vq4����g���nz��y4�q̈́WaN�vjט��cޮO�k���f����m<?8)���u&]�8�1�⸪3�/�W;���csr�ޟ�M����Z�>M/D�3��)Q�S�"���\�� 9g@���^m�Q=�]��,Օ�IS �"p�Wu?�̏\Y'�NQ��/�Fb�sS��>^��0�񕸗䥄���f� X��SP��;��G��3�v6+�`���j�CA7z����*��D�?��H��=yQ²p�)Z��r��Xf>��uw��[J���Y#d�n��~�*��!�%K�}���#T����!+�rFD�0��6!�#��3_��l�]�8#�3��若�Eۄ��j����hg��#���[�
���,6�<^�y��TiS�����Fj�_>��$��q7�w��p��j;�L��0��/~�Kܕ��Pm)#����E'��gM���WƢ뭳hض�e8ķ녢)�`>�;Eta���l��>�<�ة3:�0��?Q��"�Fa�r�,��Q�\axa��[7�	
�䫭>.�7��6�>���|�0���b!��~u�AMa?xQ��YY�ǖE�IX���?!~����BV�n�i�k���m��9ԣ&u��Da 4@�_(�4GQ��ʈ������̯�!i������!J���v�o�����ܾ��xRe��f�.�[RU7����f�;���D�R��u<+��}��NO��Hr���|�J~$xEᜇ0��<�Y� f�^��am�-���S?0�'9��~�
�I2!�6�p�I��Uc��
uu~��y����=~ϯ�D.�N��d��J�ӻ*�5g̦X��讑(M���o�s\�D��!�^����K�1�      i      x�3�L�H�-�I�K��Efs��qqq �<	�      V      x������ � �      f      x������ � �      X      x������ � �      Z      x������ � �      \      x������ � �      b      x������ � �      `      x�3�4�4����� �X      j      x������ � �      k      x������ � �      m      x������ � �      n      x������ � �     