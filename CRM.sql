PGDMP  	    $                }            CRM Application    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    90390    CRM Application    DATABASE     �   CREATE DATABASE "CRM Application" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
 !   DROP DATABASE "CRM Application";
                     postgres    false            �            1259    90391 	   customers    TABLE     )  CREATE TABLE public.customers (
    customerid integer NOT NULL,
    firstname character varying(100),
    lastname character varying(100),
    email character varying(100),
    phone character varying(20),
    city character varying(100),
    country character varying(100),
    joindate date
);
    DROP TABLE public.customers;
       public         heap r       postgres    false            �            1259    90420    interactions    TABLE     �   CREATE TABLE public.interactions (
    interactionid integer NOT NULL,
    customerid integer,
    interactiontype character varying(50),
    interactiondate date
);
     DROP TABLE public.interactions;
       public         heap r       postgres    false            �            1259    90398    orders    TABLE     �   CREATE TABLE public.orders (
    orderid integer NOT NULL,
    customerid integer,
    orderdate date,
    orderamount numeric(10,2),
    orderstatus character varying(20)
);
    DROP TABLE public.orders;
       public         heap r       postgres    false            �            1259    90408    supporttickets    TABLE     �   CREATE TABLE public.supporttickets (
    ticketid integer NOT NULL,
    customerid integer,
    issuedescription text,
    status character varying(20),
    createddate date
);
 "   DROP TABLE public.supporttickets;
       public         heap r       postgres    false            �          0    90391 	   customers 
   TABLE DATA           k   COPY public.customers (customerid, firstname, lastname, email, phone, city, country, joindate) FROM stdin;
    public               postgres    false    217   S       �          0    90420    interactions 
   TABLE DATA           c   COPY public.interactions (interactionid, customerid, interactiontype, interactiondate) FROM stdin;
    public               postgres    false    220   �       �          0    90398    orders 
   TABLE DATA           Z   COPY public.orders (orderid, customerid, orderdate, orderamount, orderstatus) FROM stdin;
    public               postgres    false    218   c       �          0    90408    supporttickets 
   TABLE DATA           e   COPY public.supporttickets (ticketid, customerid, issuedescription, status, createddate) FROM stdin;
    public               postgres    false    219          -           2606    90397    customers customers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public                 postgres    false    217            3           2606    90424    interactions interactions_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.interactions
    ADD CONSTRAINT interactions_pkey PRIMARY KEY (interactionid);
 H   ALTER TABLE ONLY public.interactions DROP CONSTRAINT interactions_pkey;
       public                 postgres    false    220            /           2606    90402    orders orders_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    218            1           2606    90414 "   supporttickets supporttickets_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.supporttickets
    ADD CONSTRAINT supporttickets_pkey PRIMARY KEY (ticketid);
 L   ALTER TABLE ONLY public.supporttickets DROP CONSTRAINT supporttickets_pkey;
       public                 postgres    false    219            6           2606    90425 )   interactions interactions_customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interactions
    ADD CONSTRAINT interactions_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(customerid);
 S   ALTER TABLE ONLY public.interactions DROP CONSTRAINT interactions_customerid_fkey;
       public               postgres    false    217    220    4653            4           2606    90403    orders orders_customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(customerid);
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customerid_fkey;
       public               postgres    false    217    4653    218            5           2606    90415 -   supporttickets supporttickets_customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.supporttickets
    ADD CONSTRAINT supporttickets_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(customerid);
 W   ALTER TABLE ONLY public.supporttickets DROP CONSTRAINT supporttickets_customerid_fkey;
       public               postgres    false    217    4653    219            �   o  x�m��N�0E��_��J���;
��mAHl��CbWNJ_�8���,|f|g2�:3`�Pb�=Ӊ�ȴr�:L��qY�*Kq��^���ֆ�R�'i�d�PX�Mc4�[o�G?Vr��*Í���X]�J2��"�5���wX~�9�m�)�4O��;~�DC�4�܍��'oz\x�k��T��%�\c1w�v:&(p�wG��b���U�U��Z{��.���1I��F[{�-g�x1������F�`=�E��M����bC��Ǚ�KT�1�&�z��h���1�K�w�T�o[%*S�Z�=�&.��_SU�7��ww�O��R�A]�`xU�Y��,?�c�)��p|���~��ɼH!�/�q��      �   �   x�U��
�0C�ҿx�v�&�Co��]v(l����?�+c`�I���Bq~^�X2�����r���3M��p�C�����7Ȓ\̙���,(��+jD���) �����Ĕ=p�X�&��w�1Cy9�� ��/�      �   �   x�]�A� ���.���������Ę����G��([��!$�[!��#��q.�Uf#��b9�9%�:�֫��M�%oE�c: �t�L��y��e�����$r���#��s�L��	�{{ 8|o���j��yHg�ӭ>��A����	����1o<TG      �     x�]��n�0Eg�+�*$���4A�"KEf\����"_͐�F��{(A�>�L�;�/\�m&�����W@	Uq!�j��0P������a!w�P\	VA��݈S��V���1�1P��y�E�U�j����%L�'�n�T�������T�K&=�hXm!�d�	/>��~2�DU�e�:��D�X�"���&[���v��KǤS������֩Z�D�z��h�%�!���vY�Ǧ��$�y5��be��.�����c�/��?yTy7     