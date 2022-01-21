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
        <input type="text" name="kullaniciadi" placeholder="kullanıcı adı"/>
        <input type="password" name="sifre" placeholder="şifre"/>
        <button type="submit" name="giris">giriş</button>
    </form>
    <%
        database dt = new database();
            String kullaniciadi = request.getParameter("kullaniciadi");
            String sifre = request.getParameter("sifre");
            String giris = request.getParameter("giris");
             if(giris != null){
                      if (dt.hesapKontrolOgretmen(kullaniciadi, sifre).equals("ogretmen")) {
                                response.sendRedirect("ogretmen/anasayfa.jsp");
                            }else if (dt.hesapKontrolAdmin(kullaniciadi, sifre).equals("admin")) {
                                     response.sendRedirect("admin/anasayfa.jsp");
                                }
                  }
    
               ResultSet r = dt.verigetir(kullaniciadi);
while(r.next()){
    out.print("brans"+r.getString("brans"));
}
            HttpSession oturum = request.getSession(true);
            String sil = request.getParameter("id");
            String guncelle = request.getParameter("edit");
            oturum.setAttribute("edit", guncelle);
                if(guncelle != null){
                    response.sendRedirect("notguncelle.jsp");
                }
            %>
</body>
</html>
