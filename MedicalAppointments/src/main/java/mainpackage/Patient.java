package mainpackage;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Patient extends Users {
    private final String amka;
    
    public Patient(String username, String password, String name, String surname, String amka) {
        super(username, password, name, surname);
        this.amka = amka;
    }

    public static Patient readFromFile(String filepath) {
        try (Scanner sc = new Scanner(new File(filepath))) {
            return new Patient(sc.next(), sc.next(), sc.next(), sc.next(), sc.next());
        } catch (FileNotFoundException e) {
            System.out.println("File not found.");
            return null;
        }
    }

    public String getAmka() {
        return amka;
    }
}
