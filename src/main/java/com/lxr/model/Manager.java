package com.lxr.model;

public class Manager {
    private Integer id;

    private String managername;

    private String managerpassword;

    private Integer permission;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getManagername() {
        return managername;
    }

    public void setManagername(String managername) {
        this.managername = managername == null ? null : managername.trim();
    }

    public String getManagerpassword() {
        return managerpassword;
    }

    public void setManagerpassword(String managerpassword) {
        this.managerpassword = managerpassword == null ? null : managerpassword.trim();
    }

    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
    }

	@Override
	public String toString() {
		return "Manager [id=" + id + ", managername=" + managername + ", managerpassword=" + managerpassword
				+ ", permission=" + permission + "]";
	}
    
}