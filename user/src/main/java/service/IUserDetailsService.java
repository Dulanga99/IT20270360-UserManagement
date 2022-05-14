package service;

import java.util.ArrayList;
import java.util.logging.Logger;

import model.UserDetails;

public interface IUserDetailsService {
	
		public static final Logger log = Logger.getLogger(IUserDetailsService.class.getName());
		
		public void addUserDetail(UserDetails userDetail);
		public  ArrayList<UserDetails> getUserDetails();
		public  UserDetails getUserDetails(int id);
		public  UserDetails updateUser(int id, UserDetails userDetail);
		public  void removeUserDetail(int id);

	
}
