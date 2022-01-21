package DataBase;

import java.sql.*;
import veriler.*;

public class database {
     static final String DB_URL = "jdbc:mysql://localhost:3306/okulsistemi";
    static final String USER="root";
    static final String PASSWORD="root";
   
    public static void ogretmen_adminKaydet(ogretmenler ogretmen) {

        Connection con =null;
        PreparedStatement psnt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            String sql ="INSERT INTO ogretmenler(ad,soyad,tc,adres,email,kullaniciadi,sifre,kullanicituru,brans) VALUES(?, ?, ?, ?, ?, ?, ?, ?,?)";
            psnt = con.prepareStatement(sql);
            
            psnt.setString(1,ogretmen.getAd());
            psnt.setString(2,ogretmen.getSoyad());
            psnt.setString(3,ogretmen.getTc());
            psnt.setString(4,ogretmen.getAdres());
            psnt.setString(5,ogretmen.getEmail());
            psnt.setString(6,ogretmen.getKullaniciadi());
            psnt.setString(7,ogretmen.getSifre());
            psnt.setString(8,ogretmen.getKullanicituru());
            psnt.setString(9,ogretmen.getBrans());
            psnt.executeUpdate();
           // veri tabanı kullanıldıktan sonra kapatılıyor

            psnt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("HATA :  "+ e);
        }
    }
    public static void ogrencikaydet(ogrenciler ogrenci) {

        Connection con =null;
        PreparedStatement psnt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            String sql ="INSERT INTO ogrenciler(ad,soyad,tc,adres,sifre,anneadi,babaadi,numara) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            psnt = con.prepareStatement(sql);
            
            psnt.setString(1,ogrenci.getAd());
            psnt.setString(2,ogrenci.getSoyad());
            psnt.setString(3,ogrenci.getTc());
            psnt.setString(4,ogrenci.getAdres());
            psnt.setString(5,ogrenci.getSifre());
            psnt.setString(6,ogrenci.getAnneadi());
            psnt.setString(7,ogrenci.getBabaadi());
            psnt.setString(8,ogrenci.getNumara());
            psnt.executeUpdate();
           // veri tabanı kullanıldıktan sonra kapatılıyor

            psnt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("HATA :  "+ e);
        }
    }
    
    public ResultSet ogrenciTablo(){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM ogrenciler";
            rst = st.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : "+e );
        }
        return rst;
    }
    public ResultSet ogretmenTablo(){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM ogretmenler";
            rst = st.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : "+e );
        }
        return rst;
    }
    
    public ResultSet notTablo(){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM notlar";
            rst = st.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : "+e );
        }
        return rst;
    }
    
    public static void notkaydet(notlar not) {

        Connection con =null;
        PreparedStatement psnt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            String sql ="INSERT INTO notlar(sinav1,sinav2,ortalama) VALUES(?, ?, ?)";
            psnt = con.prepareStatement(sql);
            
            psnt.setString(1,not.getSinav1());
            psnt.setString(2,not.getSinav2());
            psnt.setString(3,not.getOrtalama());
            psnt.executeUpdate();
           // veri tabanı kullanıldıktan sonra kapatılıyor

            psnt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("HATA :  "+ e);
        }
    }
    
     public String hesapKontrolOgretmen(String kullaniciAd, String sifre){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM ogretmenler";
            rst = st.executeQuery(sql);
            
            while(rst.next()){
                if(rst.getString("kullaniciadi").equals(kullaniciAd) && rst.getString("sifre").equals(sifre) && rst.getString("kullanicituru").equals("ogretmen")){
                    System.out.println("YÖNETİCİ BULDU");
                    return "ogretmen";
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : "+e );

        }
        return "Kullanıcı bulunamadı";
    }
     public String hesapKontrolAdmin(String kullaniciAd, String sifre){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM ogretmenler";
            rst = st.executeQuery(sql);
            
            while(rst.next()){
                if(rst.getString("kullaniciadi").equals(kullaniciAd) && rst.getString("sifre").equals(sifre) && rst.getString("kullanicituru").equals("admin")){
                    System.out.println("YÖNETİCİ BULDU");
                    return "admin";
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : "+e );

        }
        return "Kullanıcı bulunamadı";
    }
     public boolean hesapKontrolOgrenci(String tc, String sifre){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;
        boolean durum = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM ogrenciler";
            rst = st.executeQuery(sql);

            while(rst.next()){
                if(rst.getString("tc").equals(tc) && rst.getString("sifre").equals(sifre)){
                    System.out.println("personel BULDU");
                    durum = true;
                    break;
                }else{
                    durum = false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : "+e );

        }
        return durum;
    }

    public  void ogrencisil(int id){
     Connection conn = null;
         PreparedStatement sorgu = null;


          try {
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);

             sorgu = conn.prepareStatement("DELETE FROM ogrenciler WHERE id='" + id + "'");
             sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();

        }
    }
    
   public static void ogrenciGuncelle(int ID, String ad, String soyad, String tc, String adres,String numara, String sifre, String anneadi, String babaadi){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            PreparedStatement sorgu = conn.prepareStatement("UPDATE ogrenciler SET ad ='" + ad + "', soyad='" + soyad + "', tc='" + tc + "', adres='" +
                    adres +"', numara='" + numara +  "', sifre='" + sifre + "', anneadi='" + anneadi + "', babaadi='" + babaadi + "' WHERE id='" + ID + "'");
            sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("KULLANICI GÜNCELLEMEDE HATA");
        }
    }
     public  void ogretmensil(int id){
     Connection conn = null;
         PreparedStatement sorgu = null;


          try {
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             sorgu = conn.prepareStatement("DELETE FROM ogretmenler WHERE id='" + id + "'");
             sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();

        }
    }
   public static void ogretmenGuncelle(int ID, String ad, String soyad, String tc, String adres,String email, String kullaniciadi, String sifre, String kullanicituru){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            PreparedStatement sorgu = conn.prepareStatement("UPDATE ogretmenler SET ad ='" + ad + "', soyad='" + soyad + "', tc='" + tc + "', adres='" +
                    adres +"', email='" + email +  "', kullaniciadi='" + kullaniciadi + "', sifre='" + sifre + "', kullanicituru='" + kullanicituru + "' WHERE id='" + ID + "'");
            sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("KULLANICI GÜNCELLEMEDE HATA");
        }
    }
   
    public  void notsil(int id){
     Connection conn = null;
         PreparedStatement sorgu = null;


          try {
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);

             sorgu = conn.prepareStatement("DELETE FROM notlar WHERE id='" + id + "'");
             sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();

        }
    }
     public static void notGuncelle(int ID, String sinav1, String sinav2){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            PreparedStatement sorgu = conn.prepareStatement("UPDATE notlar SET sinav1 ='" + sinav1 + "', sinav2='" + sinav2 + "' WHERE id='" + ID + "'");
            sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("KULLANICI GÜNCELLEMEDE HATA");
        }
    }
     
     public  ResultSet verigetir(String eposta) {
        Connection con =null;
        Statement st = null;
        ResultSet rs=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM ogretmenler WHERE email='" + eposta + "'";

            rs = st.executeQuery(sql);

        } catch (Exception e) {

            System.out.println(" HATAaa: "+e );

        }
        return rs;
    }
}
