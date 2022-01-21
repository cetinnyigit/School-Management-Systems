package veriler;

public class notlar {
    private String sinav1;
    private String sinav2;
    private String ortalama;
    
    public notlar(String sinav1,String sinav2, String ortalama){
        this.sinav1 = sinav1;
        this.sinav2 = sinav2;
        this.ortalama = ortalama;
    }

    public String getSinav1() {
        return sinav1;
    }

    public void setSinav1(String sinav1) {
        this.sinav1 = sinav1;
    }

    public String getSinav2() {
        return sinav2;
    }

    public void setSinav2(String sinav2) {
        this.sinav2 = sinav2;
    }

    public String getOrtalama() {
        return ortalama;
    }

    public void setOrtalama(String ortalama) {
        this.ortalama = ortalama;
    }
}
