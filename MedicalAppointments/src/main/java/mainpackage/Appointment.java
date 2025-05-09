package mainpackage;

public class Appointment {
    @SuppressWarnings("unused")
	private Patient patient;
    @SuppressWarnings("unused")
	private Doctor doctor;
    @SuppressWarnings("unused")
	private String datetime;

    public Appointment(Patient patient, Doctor doctor, String datetime) {
        this.patient = patient;
        this.doctor = doctor;
        this.datetime = datetime;
    }
}
