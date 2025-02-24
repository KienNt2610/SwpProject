package entity;

/**
 *
 * @author Dung
 */
public class Employees {

    private int EmployeeId;
    private String EmployeeName;
    private java.util.Date EmpBirthDate;
    private String PhoneNumber;
    private String Email;
    private String EmpGender;
    private int RoleId;

    public Employees() {
    }

    public Employees(String EmployeeName, java.util.Date EmpBirthDate, String PhoneNumber, String Email, String EmpGender, int RoleId) {
        this.EmployeeName = EmployeeName;
        this.EmpBirthDate = EmpBirthDate;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.EmpGender = EmpGender;
        this.RoleId = RoleId;
    }

    public Employees(int EmployeeId, String EmployeeName, java.util.Date EmpBirthDate, String PhoneNumber, String Email, String EmpGender, int RoleId) {
        this.EmployeeId = EmployeeId;
        this.EmployeeName = EmployeeName;
        this.EmpBirthDate = EmpBirthDate;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.EmpGender = EmpGender;
        this.RoleId = RoleId;
    }

    public int getEmployeeId() {
        return EmployeeId;
    }

    public void setEmployeeId(int EmployeeId) {
        this.EmployeeId = EmployeeId;
    }

    public String getEmployeeName() {
        return EmployeeName;
    }

    public void setEmployeeName(String EmployeeName) {
        this.EmployeeName = EmployeeName;
    }

    public java.util.Date getEmpBirthDate() {
        return EmpBirthDate;
    }

    public void setEmpBirthDate(java.util.Date EmpBirthDate) {
        this.EmpBirthDate = EmpBirthDate;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getEmpGender() {
        return EmpGender;
    }

    public void setEmpGender(String EmpGender) {
        this.EmpGender = EmpGender;
    }

    public int getRoleId() {
        return RoleId;
    }

    public void setRoleId(int RoleId) {
        this.RoleId = RoleId;
    }

    @Override
    public String toString() {
        return "Employees{" + "EmployeeId=" + EmployeeId + ", EmployeeName=" + EmployeeName + ", EmpBirthDate=" + EmpBirthDate + ", PhoneNumber=" + PhoneNumber + ", Email=" + Email + ", EmpGender=" + EmpGender + ", RoleId=" + RoleId + '}';
    }

}
