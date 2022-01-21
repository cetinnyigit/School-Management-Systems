<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DataBase.database" %>
<%@page import="veriler.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <form action="">
        <input type="text" name="tc" placeholder="tc"/>
        <input type="password" name="sifre" placeholder="şifre"/>
        <button type="submit" name="giris">giriş</button>
    </form>
    <%
            database dt = new database();
            String tc = request.getParameter("tc");
            String sifre = request.getParameter("sifre");
            String giris = request.getParameter("giris");
             if(giris != null){
                      if (dt.hesapKontrolOgrenci(tc, sifre)) {
                                response.sendRedirect("ogrenci/anasayfa.jsp");
                            }
                  }
    %>
</body>
</html>
