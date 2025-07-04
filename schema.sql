PGDMP  2                    }           database    17.5    17.5     &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            )           1262    16388    database    DATABASE     {   CREATE DATABASE database WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';
    DROP DATABASE database;
                     postgres    false            �            1259    16406    order    TABLE     �   CREATE TABLE public."order" (
    id integer NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_value numeric(10,2) NOT NULL
);
    DROP TABLE public."order";
       public         heap r       postgres    false            �            1259    16405    order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.order_id_seq;
       public               postgres    false    219            *           0    0    order_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;
          public               postgres    false    218            �            1259    16397    product    TABLE     �   CREATE TABLE public.product (
    name text NOT NULL,
    price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    keywords text[],
    stars numeric,
    image text,
    id uuid NOT NULL
);
    DROP TABLE public.product;
       public         heap r       postgres    false            �           2604    16409    order id    DEFAULT     f   ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);
 9   ALTER TABLE public."order" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    219    219            #          0    16406    order 
   TABLE DATA           >   COPY public."order" (id, order_date, total_value) FROM stdin;
    public               postgres    false    219   /       !          0    16397    product 
   TABLE DATA           T   COPY public.product (name, price, quantity, keywords, stars, image, id) FROM stdin;
    public               postgres    false    217   L       +           0    0    order_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.order_id_seq', 1, false);
          public               postgres    false    218            �           2606    16412    order order_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public                 postgres    false    219            �           2606    16429    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public                 postgres    false    217            #      x������ � �      !   G  x��YMs�H�=������05�B} ǖ<n϶{��roGl쥾@� 4-;��*P�e�.(Ve%�2�{��ꍻ+��?���a���ܹ�z��aW��n*�P�Ӎӊ��M�������L�a��������ĥ\u�f������<��,6�%��v��}�x��~�
�RU�)cJ��d�n)0_�`���Z�m7��>��̡�龄��Lwa���W~��ѱ�}�r�[�8՝Y�c��a����+9ƤU�S-U\�	�|��Dji*����y*>��۝���nn�qF�8"��V��iVR���S��1d������d����)vy7q���L����p�I*�J»Ԧ"geY���5/n�a.>f»õ�x�+VG�8k�9���fwv�ɾ3;��ڸ�L0K�����y��J�PܒU����\1���)���o��M���)1�n��*����>�mz��w�n�}�N�R�"�E��"��4�9yV����4յ*���4�
�v�({��a7!o�6ŵm��9����S�!����Nr�1�L��ד�n���o���.VE<	��%w���W�k��V�4�Ae8KFzFL�F^k'�uμw���/��!�~s&'ˊ�˲\U��Ś���a���͙w��R����h�B��V�kɰڢN���˒*���M������� "^�@`�>]�U%S��X}� �q�7G3�1Lsz���is��������@�k�RZ�\ֺa���� ��Z"��B��_�R��w�8t�xo;��mv�`�,��O���a/~��⩖�R����Y2�9�	��ȟN�e�s��?�W��
�n�
ِ��-})�����x��:��O�n~�]@��S�6�\%o ��R�b<�{E�x�i�a����,�#�O�e��n��ڊ�5�BS;ܠ�)���QZ5f�� ��ϩ����Eu���';?~�?B0@�+^!��`Ҷ��ݜ���&F9�~1���Dr�<���8ﰧ�c�U׍��k����V�Dᕒk��^�:ஊ��nۛi
 Ey�P`��q��iS����c4Aӣ�3���Q0M�
�	�a*��q�)��@	ET\�]����>^�G����X�����u3���d��f:�߇��u�lN��B��)+�)����iu��d������\\�	=��91^s�a%R��
n��s�,�7�8�y��b�����m4���)Y�@%�j�IT<P�ےTkTm�F5�So��ޢjnR���(!VL%<���Zy����)Fj��ZJ*�OERs2���u��V�ʺ�:ҵe��f��>�yD��$�L>�"�S�z/~
�[��]jz ���Z�j�qqL����a�8#��>G�a9�Rj��yO̔�]:5G�q藁L�
DY��4|Ŵk�5x���G�BK�𽛦C(8}���uq5|��G��H��7sZ�����6�/6;�O>{�q��)/�B� V����ʖڋ���bZ�j�A��\zk���XT��}׆����ڋw\�#�rD�n.��0>_,Ut�E�8�VǺǆ�=e���T@������j�JJV0�Iet}�ț�N�5d��5㈯��Yf��� ��as�H�䟯�����&�>�d�2�V	�$A0�Knp�H
Rs�@�<�GPB�.��0���K�c��s�d�!�o��#(�ͧ|��!�M��-[���N�5;x�0��E��A�r}��t�_��g3�,>+���[D�h-.e�b���~o��#ÿ�Q�ی�MeX�<�&��pmEF����О�0{��ȯЋ 2��1�ԥ �pu"ﶏI�D�%��AK�m�A�[��%Z�Z砉HOH稩$~Vy� ��]��W�D����߇�Z�@�8�-��!%��2����խOtv���~ @i��?d�V[	`	�T	u!8�Q
��nxm��b�q�t�r�����)>�W��0݆�� ���}T*o^��-4?���HC���P�9��xa��(^��q�w��Ȃ���H�d� �����j��k�o�p�YE�L/��~����0�!�1�'Ҽ�d\	���M�8�4���>���P�O����<Hݠ�I
UA	Ԑik
�1Q��ҝ���tm,�*j�pҜ�x�����}/�i��i3���'������Qޝ�5A�[-.H�
���
](TJp\�A�R�Ւ�ב��t k4��|T��-����T���Mh��+3�E�v,�$9kѮ)j���5
�ĸ5��@P[.���x_Uu��?U�/*�'�7!f��|Ϯԍ���e�^�-++⬩��t��Z\����m�<�g�|?�I.�+�y�����q����Ng��B�c�홪�y����Y������*/+�F�N7��F�<V��k���E�o3��%��dHL+�+�$Tl�S��|�2 <5�˞TP��RϹ����XY^�~]]��"0�M1 ��������qD�S���CxŚ��܇oy��o�����%��)�By!MIYd��QմĠ��qO��^r^���rhF�~7�װ�F��D:pQ�Jg:}5m��⳦�E]����� ��i�G:�{?,nK(�ҐR蕅w@V����F��ۛ���O����n�&���2䤣"n�_^������� 
���F@�`:ͧ8��V���BYB@;^�a��V���p��]Z�@���v�\�kq6�{Y,��K/��BR���6�q�kϓ�;��Y��\��t=�ȓ�JC2��gueɘ��4J6P�R�r}=�m��r:��ڌ���)�ۮ��I.�_�lN����x,I�dlzvP�ܵ�m�����<8�A%rg��6΂|C��I����\|���P���E5�E�4�݅~�}Y�ꉯ_�۞J*#t ��,����:�U��U�MX����4�N�6Mݦ�y��M�$��=ڙK���p$��Lھ�4��(����<�4��e�^�G�c9����,-���L�>t��WO���򵃫=�g�Y|-Q�R{�6�r�wSQ�43��5ZD��!�y��v�Χ<Ub@�B��'�S�R_
�B4s�ټ����5Y����Z��4|Y����2b
�"G�ۆ���kH�q�� ���s���p�t����Тq�U
�݋���by�ei�8�~if�&[��S��4pW`4�pRZ��i%Zq��qײ�	\��4�| �3��Ǆ����z[V������p����������*��R��R5 �k��ln5@4�hJ�}}j���� ��|�.���N��}���<�ݗnO��������5� 	PE=QV-Y�~ݚ���r������|<�     