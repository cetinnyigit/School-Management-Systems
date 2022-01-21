<%-- 
    Document   : notduzenle
    Created on : 18.Oca.2022, 16:32:11
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
     <link rel="stylesheet" type="text/css" href="style/notduzenle.css"/>
</head>
<body>
    <form action="">
        <label>sınav 1</label>
        <input type="text" name="sinav1"/>
        <label>sınav 2</label>
        <input type="text" name="sinav2"/>
        <div style="border:1px solid black; width: 20%"><p name="ortalama"></p></div>
        <button type="submit" name="notgir">not gir</button>
        <button type="submit" name="iptal">iptal</button>
    </form>
    
        <table id="divsol">
            <tr>
                        <th>isim</th>
                        <th>soyisim</th>
                        <th>numara</th>
                        
                    </tr>
                    
      <%
                  database database =  new database();
                  ResultSet result = database.ogrenciTablo();
                  ResultSet result2 = database.notTablo();
                while (result.next()) {
                   
                        out.print("<tr");
                        out.print("<td>" +"</td>");
                        out.print("<td>" + result.getString("ad")+"</td>" );
                        out.print("<td>" + result.getString("soyad")+"</td>");
                        out.print("<td>" + result.getString("numara")+"</td>");
                        
                        out.print("</tr>");
                    }%>
                    </table>
                    <table id="divsag">
                    
                        <tr>
                        <th>sınav1</th>
                        <th>sınav2</th>
                        <th>ortalama</th>
                    </tr>
                    <%
                while (result2.next()){
                        out.print("<tr>");
                        out.print("<td>" + result2.getString("sinav1")+"</td>");
                        out.print("<td>" + result2.getString("sinav2")+"</td>");
                        out.print("<td>" + result2.getString("ortalama")+"</td>");
                        %>
                        <td><a href="notduzenle.jsp?id=<%= result2.getString("id")%>">Sil</a></td>
                        <td><a href="notduzenle.jsp?edit=<%= result2.getString("id")%>">güncelle</a></td>
                    <%
                        out.print("<tr>");
                }

                        HttpSession oturum = request.getSession(true);
                        String sil = request.getParameter("id");
                        String guncelle = request.getParameter("edit");
                        oturum.setAttribute("edit", guncelle);
                        if(sil != null){
                            database.notsil(Integer.valueOf(sil));
                            response.sendRedirect("notduzenle.jsp");
                        }
                        if(guncelle != null){
                           response.sendRedirect("notguncelle.jsp");
                        }
              %>
                   
    </table>
    
    <%
        database dt = new database();
        String sinav1 = request.getParameter("sinav1");
        String sinav2 = request.getParameter("sinav2");
        String ortalama = request.getParameter("ortalama");
        String notgir = request.getParameter("notgir");
        String iptal = request.getParameter("iptal");
       if(notgir != null){
           notlar not = new notlar(sinav1, sinav2, ortalama);
           dt.notkaydet(not);
           response.sendRedirect("notduzenle.jsp");
       }
       else if(iptal != null){
           response.sendRedirect("anasayfa.jsp");
       }
    %>
</body>
</html>
