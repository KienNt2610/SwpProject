package entity;

/**
 *
 * @author Dung
 */
public class Role {

    private int RoleId;
    private String RoleName;

    public Role() {
    }

    public Role(String RoleName) {
        this.RoleName = RoleName;
    }

    public Role(int RoleId, String RoleName) {
        this.RoleId = RoleId;
        this.RoleName = RoleName;
    }

    public int getRoleId() {
        return RoleId;
    }

    public void setRoleId(int RoleId) {
        this.RoleId = RoleId;
    }

    public String getRoleName() {
        return RoleName;
    }

    public void setRoleName(String RoleName) {
        this.RoleName = RoleName;
    }

    @Override
    public String toString() {
        return "Role{" + "RoleId=" + RoleId + ", RoleName=" + RoleName + '}';
    }

}
