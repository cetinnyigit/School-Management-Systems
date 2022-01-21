<%-- 
    Document   : ogrenciduzenle
    Created on : 18.Oca.2022, 16:31:48
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
        <input name="ad" type="text"/><br>
        <label>soyad</label>
        <input name="soyad" type="text"/><br>
        <label>tc</label>
        <input name="tc" type="text"/><br>
        <label>adres</label>
        <input name="adres" type="text"/><br>
        <label>numara</label>
        <input name="numara" type="text"/><br>
        <label>şifre</label>
        <input name="sifre" type="text"/><br>
        <label>anne adı</label>
        <input name="anneadi" type="text"/><br>
        <label>baba adı</label>
        <input name="babaadi" type="text"/><br>
        
        <button name="kaydet" type="submit">kaydet</button>
        <button name="iptal" type="submit">iptal</button>
    </form>
    <table>
                    <tr>
                        <th>isim</th>
                        <th>soyisim</th>
                        <th>tc</th>
                        <th>numara</th>
                        <th>adres</th>
                        <th>sifre</th>
                        <th>anneadı</th>
                        <th>babaadı</th>
                    </tr>
      <%
                  database database =  new database();
                  ResultSet result = database.ogrenciTablo();
                while (result.next()) {
                        out.print("<tr>");
                        out.print("<td>" + result.getString("ad")+"</td>" );
                        out.print("<td>" + result.getString("soyad")+"</td>");
                        out.print("<td>" + result.getString("tc")+"</td>");
                        out.print("<td>" + result.getString("numara")+"</td>");
                        out.print("<td>" + result.getString("adres")+"</td>");
                        out.print("<td>" + result.getString("sifre")+"</td>");
                        out.print("<td>" + result.getString("anneadi")+"</td>");
                        out.print("<td>" + result.getString("babaadi")+"</td>");
                        %>
                        <td><a href="ogrenciduzenle.jsp?id=<%= result.getString("id")%>"> Sil</a></td>
                        <td><a href="ogrenciduzenle.jsp?edit=<%= result.getString("id")%>">güncelle</a></td>
                    <%
                        out.print("<tr>");
                    }
                    HttpSession oturum = request.getSession(true);
                        String sil = request.getParameter("id");
                        String guncelle = request.getParameter("edit");
                        oturum.setAttribute("edit", guncelle);
                        if(sil != null){
                            database.ogrencisil(Integer.valueOf(sil));
                            response.sendRedirect("ogrenciduzenle.jsp");
                        }
                        if(guncelle != null){
                           response.sendRedirect("ogrenciguncelle.jsp");
                        }
              %>
              
    </table>
              
    <%
        database dt = new database();
        String ad = request.getParameter("ad");
        String soyad = request.getParameter("soyad");
        String tc = request.getParameter("tc");
        String numara = request.getParameter("numara");
        String adres = request.getParameter("adres");
        String sifre = request.getParameter("sifre");
        String anneadi = request.getParameter("anneadi");
        String babaadi = request.getParameter("babaadi");
        
        String kaydet = request.getParameter("kaydet");
        String iptal = request.getParameter("iptal");
       if(kaydet != null){
           if (!ad.equals("")&&!soyad.equals("")&& !tc.equals("")&&!adres.equals("")&&!sifre.equals("")&&!anneadi.equals("")&&!babaadi.equals("")&&!numara.equals("")) {
                    ogrenciler ogrenci = new ogrenciler(ad, soyad, tc,numara ,adres, sifre, anneadi, babaadi);
                    dt.ogrencikaydet(ogrenci);
                    response.sendRedirect("ogrenciduzenle.jsp");
               }
          
       }
       else if(iptal != null){
           response.sendRedirect("anasayfa.jsp");
       }
    %>
</body>
</html>
