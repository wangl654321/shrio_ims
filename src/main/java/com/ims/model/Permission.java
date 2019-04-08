package com.ims.model;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;

public class Permission implements Serializable{
	private Long id;
	private String name;
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
	private String url;
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
	private String code;
	@JsonInclude(JsonInclude.Include.NON_EMPTY)
	private Integer isNav;
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
	private Integer priority;
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
	private String icon;
	private Long pId;
	@JsonInclude(JsonInclude.Include.NON_EMPTY)
	private Integer state;

	public Permission(){

	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getIsNav() {
		return isNav;
	}

	public void setIsNav(Integer isNav) {
		this.isNav = isNav;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Long getpId() {
		return pId;
	}

	public void setpId(Long pId) {
		this.pId = pId;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
}
