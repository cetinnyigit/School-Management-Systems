<%-- 
    Document   : ogrenciguncelle
    Created on : 18.Oca.2022, 22:57:22
    Author     : TÜRKMEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DataBase.database"%>
<%@page import="veriler.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <form action="">
        <label>ad</label>
        <input type="text" name="ad"/>
        <label>soyad</label>
        <input type="text" name="soyad"/>
        <label>tc</label>
        <input type="text" name="tc"/>
        <label>adres</label>
        <input type="text" name="adres"/>
        <label>numara</label>
        <input type="text" name="numara"/>
        <label>sifre</label>
        <input type="text" name="sifre"/>
        <label>anneadi</label>
        <input type="text" name="anneadi"/>
        <label>babaadi</label>
        <input type="text" name="babaadi"/>
        <button type="submit" name="guncelle">güncelle</button>
        <button type="submit" name="iptal">iptal</button>
    </form>
    <%
        database dt = new database();
        String ad =request.getParameter("ad");
        String soyad =request.getParameter("soyad");
        String tc =request.getParameter("tc");
        String adres =request.getParameter("adres");
        String numara =request.getParameter("numara");
        String sifre =request.getParameter("sifre");
        String anneadi = request.getParameter("anneadi");
        String babaadi = request.getParameter("babaadi");
        String guncelle = request.getParameter("guncelle");
        String iptal = request.getParameter("iptal");
        
        HttpSession oturum = request.getSession();
        String edit;
        if (guncelle != null) {
            edit=oturum.getAttribute("edit").toString();
                if (!ad.equals("")&&!soyad.equals("")&&!tc.equals("")&&!adres.equals("")&&!sifre.equals("")&&!anneadi.equals("")&&!babaadi.equals("")&&!numara.equals("")&&edit != null) {
                    dt.ogrenciGuncelle(Integer.valueOf(edit), ad, soyad, tc,numara,adres  ,sifre, anneadi, babaadi);
                    response.sendRedirect("ogrenciduzenle.jsp");
                }
            }
        else if (iptal != null) {
                response.sendRedirect("ogrenciduzenle.jsp");
            }
    %>
</body>
</html>
