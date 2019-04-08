package com.ims.model;

import java.util.List;

public class Navigation {
	private Long navId;
	private String navigationName;
	private String navIcon;
	private List<Permission> childNavigations;

	public Navigation() {
	}

	public Long getNavId() {
		return navId;
	}

	public void setNavId(Long navId) {
		this.navId = navId;
	}

	public String getNavigationName() {
		return navigationName;
	}

	public void setNavigationName(String navigationName) {
		this.navigationName = navigationName;
	}

	public String getNavIcon() {
		return navIcon;
	}

	public void setNavIcon(String navIcon) {
		this.navIcon = navIcon;
	}

	public List<Permission> getChildNavigations() {
		return childNavigations;
	}

	public void setChildNavigations(List<Permission> childNavigations) {
		this.childNavigations = childNavigations;
	}
}
