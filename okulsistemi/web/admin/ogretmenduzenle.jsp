<%-- 
    Document   : ogretmenduzenle
    Created on : 18.Oca.2022, 16:31:34
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
        <label>email</label>
        <input name="email" type="text"/><br>
        <label>kullaniciadi</label>
        <input name="kullaniciadi" type="text"/><br>
        <label>şifre</label>
        <input name="sifre" type="text"/><br>
        
        <label>branş</label>
        <select name="brans">
            <option>türkçe</option>
            <option>matematik</option>
            <option>fizik</option>
            <option>kimya</option>
            <option>all</option>
        </select><br>
        <label>kullanicituru</label>
        <select name="kullanicituru">
            <option>ogretmen</option>
            <option>admin</option>
        </select><br>
        
        <button name="kaydet" type="submit">kaydet</button>
        <button name="iptal" type="submit">iptal</button>
    </form>
    
    <table>
         <tr>
                        <th>isim</th>
                        <th>soyisim</th>
                        <th>tc</th>
                        <th>adres</th>
                        <th>email</th>
                        <th>kullanici adı</th>
                        <th>sifre</th>
                        <th>kullanicituru</th>
                        <th>brans</th>
                    </tr>
      <%
                  database database =  new database();
                  ResultSet result = database.ogretmenTablo();
                while (result.next()) {
                        out.print("<tr>");
                        out.print("<td>" + result.getString("ad")+"</td>" );
                        out.print("<td>" + result.getString("soyad")+"</td>");
                        out.print("<td>" + result.getString("tc")+"</td>");
                        out.print("<td>" + result.getString("adres")+"</td>");
                        out.print("<td>" + result.getString("email")+"</td>");
                        out.print("<td>" + result.getString("kullaniciadi")+"</td>");
                        out.print("<td>" + result.getString("sifre")+"</td>");
                        out.print("<td>" + result.getString("kullanicituru")+"</td>");
                        out.print("<td>" + result.getString("brans")+"</td>");
                        %>
                        <td><a href="ogretmenduzenle.jsp?id=<%= result.getString("id")%>">Sil</a></td>
                        <td><a href="ogretmenduzenle.jsp?edit=<%= result.getString("id")%>">güncelle</a></td>    
                    <%
                        out.print("<tr>");
                    }

                        HttpSession oturum = request.getSession(true);
                        String sil = request.getParameter("id");
                        String guncelle = request.getParameter("edit");
                        oturum.setAttribute("edit", guncelle);
                        if(sil != null){
                            database.ogretmensil(Integer.valueOf(sil));
                            response.sendRedirect("ogretmenduzenle.jsp");
                        }
                        if(guncelle != null){
                           response.sendRedirect("ogretmenguncelle.jsp");
                        }
              %>
    </table>
    
    
    <%
        database dt = new database();
        String ad = request.getParameter("ad");
        String soyad = request.getParameter("soyad");
        String tc = request.getParameter("tc");
        String adres = request.getParameter("adres");
        String email = request.getParameter("email");
        String kullaniciadi = request.getParameter("kullaniciadi");
        String sifre = request.getParameter("sifre");
        String kullanicituru = request.getParameter("kullanicituru");
        String brans = request.getParameter("brans");
        String kaydet = request.getParameter("kaydet");
        String iptal = request.getParameter("iptal");
       if(kaydet != null){
           if (!ad.equals("")&&!soyad.equals("")&& !tc.equals("")&&!adres.equals("")&&!email.equals("")&&!kullaniciadi.equals("")&&!sifre.equals("")&&!kullanicituru.equals("")) {
                    ogretmenler ogretmen = new ogretmenler(ad, soyad, tc, adres, email, kullaniciadi, sifre, kullanicituru,brans);
                    dt.ogretmen_adminKaydet(ogretmen);
                    response.sendRedirect("ogretmenduzenle.jsp");
               }
       }
       else if(iptal != null){
           response.sendRedirect("anasayfa.jsp");
       }
    %>
</body>
</html>
