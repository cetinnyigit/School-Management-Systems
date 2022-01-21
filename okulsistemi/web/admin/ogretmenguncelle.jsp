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
    <h1>ogretmen güncelle</h1>
   <form action="">
        <label>ad</label>
        <input type="text" name="ad"/>
        <label>soyad</label>
        <input type="text" name="soyad"/>
        <label>tc</label>
        <input type="text" name="tc"/>
        <label>adres</label>
        <input type="text" name="adres"/>
        <label>email</label>
        <input type="text" name="email"/>
        <label>kullaniciadi</label>
        <input type="text" name="kullaniciadi"/>
        <label>sifre</label>
        <input type="text" name="sifre"/>
        <select name="kullanicituru">
            <option>ogretmen</option>
            <option>admin</option>
        </select>
       
        <button type="submit" name="guncelle">güncelle</button>
        <button type="submit" name="iptal">iptal</button>
    </form>
    <%
    
        database dt = new database();
        String ad =request.getParameter("ad");
        String soyad =request.getParameter("soyad");
        String tc =request.getParameter("tc");
        String adres =request.getParameter("adres");
        String email =request.getParameter("email");
        String kullaniciadi =request.getParameter("kullaniciadi");
        String sifre = request.getParameter("sifre");
        String kullanicituru = request.getParameter("kullanicituru");
        String guncelle = request.getParameter("guncelle");
        String iptal = request.getParameter("iptal");
        
        HttpSession oturum = request.getSession();
        String edit;
        if (guncelle != null) {
            edit=oturum.getAttribute("edit").toString();
                if (!ad.equals("")&&!soyad.equals("")&&!tc.equals("")&&!adres.equals("")&&!email.equals("")&&!kullaniciadi.equals("")&&!sifre.equals("")&&!kullanicituru.equals("")&&edit != null) {
                    dt.ogretmenGuncelle(Integer.valueOf(edit), ad, soyad, tc, adres, email, kullaniciadi, sifre, kullanicituru);
                    response.sendRedirect("ogretmenduzenle.jsp");
                }
            }
        else if (iptal != null) {
                response.sendRedirect("ogretmenduzenle.jsp");
            }
    %>
</body>
</html>
