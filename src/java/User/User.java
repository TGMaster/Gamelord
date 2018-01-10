package User;

public class User {

    private int ID;
    private String Email;
    private String Name;
    private String Pass;
    private String DOB;
    private String Address;
    private String Image;
    private boolean Admin;

    public User() {
    }

    public User(int ID, String Email, String Name, String Pass, String DOB, String Address, String Image, boolean Admin) {
        this.ID = ID;
        this.Email = Email;
        this.Name = Name;
        this.Pass = Pass;
        this.DOB = DOB;
        this.Address = Address;
        this.Image = Image;
        this.Admin = Admin;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String Pass) {
        this.Pass = Pass;
    }

    public boolean isAdmin() {
        return Admin;
    }

    public void setAdmin(boolean Admin) {
        this.Admin = Admin;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }
    
}
