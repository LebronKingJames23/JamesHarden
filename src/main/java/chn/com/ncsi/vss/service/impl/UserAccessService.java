package chn.com.ncsi.vss.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import chn.com.ncsi.vss.mapper.VisitorMapper;
import chn.com.ncsi.vss.pojo.Visitor;
@Service
public class UserAccessService implements UserDetailsService{
@Resource
private VisitorMapper visitorMapper;
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Visitor visitor = new Visitor();
		visitor.setNAME(username);
		UserDetails userDetails=null;
		Visitor v=visitorMapper.findUserByUsername(visitor);
		if(v!=null){
			 userDetails=new User(v.getNAME(), "", true, true, true, true,getAuthorities() );
		}
		return userDetails;
	}
	 public Collection<GrantedAuthority> getAuthorities() {  
			
	       List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();  
	        authList.add(new SimpleGrantedAuthority("ROLE_USER"));
	        return authList;  
  }  

}
