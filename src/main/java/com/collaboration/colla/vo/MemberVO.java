package com.collaboration.colla.vo;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

public class MemberVO {
	
	 // 공백이없는 email
    @NotBlank(message="You cannot use Blank.")    
    private String email;
    
 // 8자리 이상의 password
    @Range(min=8, max=20, message="Please set your Password at least 8 characters.")
    private String password;
	private String name;
	private String img;
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getImg() {
		return img;
	}
	
	public void setImg(String img) {
		this.img = img;
	}
}
