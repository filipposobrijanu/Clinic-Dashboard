package mainpackage;

import java.util.Scanner;

public class CreateUsers {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        try {
            System.out.print("Enter filename for patient data: ");
            String filename = scanner.next();
            
            Patient patient = Patient.readFromFile(filename);
            if (patient != null) {
                System.out.println("Patient created from file: " + patient.name + " " + patient.surname);
            }
        } catch (Exception e) {
            System.out.println("Invalid input!");
        }
        
        scanner.close();
    }
}