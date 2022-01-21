<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DataBase.database"%>
<%@page import="java.sql.*"%>
<%@page import="veriler.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <form action="">
        <label>sınav 1</label><br>
        <input type="text" name="sinav1"/><br>
        <label>sınav 2</label><br>
        <input type="text" name="sinav2"/><br>
        <button type="submit" name="guncelle">güncelle</button>
        <button type="submit" name="iptal">iptal</button>
    </form>
    <%
        database dt = new database();
        String sinav1 = request.getParameter("sinav1");
        String sinav2 = request.getParameter("sinav2");
        String guncelle = request.getParameter("guncelle");
        String iptal = request.getParameter("iptal");
        
        HttpSession oturum = request.getSession();
        String edit;
        if (guncelle != null) {
            edit=oturum.getAttribute("edit").toString();
                    if (!sinav1.equals("")&&!sinav2.equals("")&&edit != null) {
                    dt.notGuncelle(Integer.valueOf(edit), sinav1, sinav2);
                    response.sendRedirect("notduzenle.jsp");
                }
            }
        else if (iptal != null) {
                response.sendRedirect("ogrenciduzenle.jsp");
            }
    %>
</body>
</html>
