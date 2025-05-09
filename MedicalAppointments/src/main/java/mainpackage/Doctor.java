package mainpackage;

public class Doctor extends Users {
    private String specialty;

    public Doctor(String username, String password, String name, String surname, String specialty) {
        super(username, password, name, surname);
        this.specialty = specialty;
    }

    public String getSpecialty() {
        return specialty;
    }
}
