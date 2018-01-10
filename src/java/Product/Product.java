package Product;

public class Product {

    private int pid;
    private int cid;
    private String name;
    private String image;
    private double price;
    private String content;
    private String key;

    public Product() {
    }

    public Product(int pid, int cid, String name, String image, double price, String content, String key) {
        this.pid = pid;
        this.cid = cid;
        this.name = name;
        this.image = image;
        this.price = price;
        this.content = content;
        this.key = key;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
    
}
