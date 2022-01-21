package veriler;

public class ogrenciler {
    private String ad;
    private String soyad;
    private String tc;
    private String adres;
    private String sifre;
    private String anneadi;
    private String babaadi;
    private String numara;
    
    public ogrenciler(String ad,String soyad,String tc,String adres,String sifre,String anneadi,String babaadi,String numara){
        this.ad = ad;
        this.soyad = soyad;
        this.tc = tc;
        this.adres = adres;
        this.sifre = sifre;
        this.anneadi = anneadi;
        this.babaadi = babaadi;
        this.numara = numara;
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

    public String getSifre() {
        return sifre;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }

    public String getAnneadi() {
        return anneadi;
    }

    public void setAnneadi(String anneadi) {
        this.anneadi = anneadi;
    }

    public String getBabaadi() {
        return babaadi;
    }

    public void setBabaadi(String babaadi) {
        this.babaadi = babaadi;
    }

    public String getNumara() {
        return numara;
    }

    public void setNumara(String numara) {
        this.numara = numara;
    }
    
}
