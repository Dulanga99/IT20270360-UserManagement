package model;

public class UserDetails {

		private	int id;
		private	String name;
		private	String address;
		private	String phone;
		private	String email;
		private	String acc;
	
		
		
		public UserDetails() {
			super();
		}
		public UserDetails(int id, String name,String address, String phone,String email,String acc) {
				super();
				this.id = id;
				this.name = name;
				this.address = address;
				this.phone = phone;
				this.email = email;
				this.acc = acc;
				
			}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getAcc() {
			return acc;
		}
		public void setAcc(String acc) {
			this.acc = acc;
		}
		
		
		
}