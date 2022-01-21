package veriler;

public class admin {
    private String ad;
    private String soyad;
    private String tc;
    private String adres;
    private String email;
    private String kullaniciadi;
    private String sifre;
    
    public admin(String ad,String soyad,String tc,String adres,String email,String kullaniciadi,String sifre){
        this.ad = ad;
        this.soyad = soyad;
        this.tc = tc;
        this.adres = adres;
        this.email = email;
        this.kullaniciadi = kullaniciadi;
        this.sifre = sifre;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getSoyad() {
        return soyad;
    }

    public void setSoyad(String soyad) {
        this.soyad = soyad;
    }

    public String getTc() {
        return tc;
    }

    public void setTc(String tc) {
        this.tc = tc;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getKullaniciadi() {
        return kullaniciadi;
    }

    public void setKullaniciadi(String kullaniciadi) {
        this.kullaniciadi = kullaniciadi;
    }

    public String getSifre() {
        return sifre;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }
    
}
