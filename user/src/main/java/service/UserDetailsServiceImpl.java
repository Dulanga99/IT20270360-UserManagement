package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;

import util.CommonConstants;
import util.DBConnectionUtil;
import util.QueryUtil;

import model.UserDetails;

	public class UserDetailsServiceImpl implements IUserDetailsService{

		public static final Logger log = Logger.getLogger(UserDetailsServiceImpl.class.getName());
		
		private static Connection connection;
		private PreparedStatement preparedStatement;
		
		@override
		public void addUserDetail(UserDetails userDetail) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_USER));
				connection.setAutoCommit(false);
				
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, userDetail.getName());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, userDetail.getAddress());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, userDetail.getPhone());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, userDetail.getEmail());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, userDetail.getAcc());
				
				
				
				
				preparedStatement.execute();
				connection.commit();
				
			} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
		}

		public ArrayList<UserDetails> getUserDetails() {
			return actionOnUserDetails(0);
		}

		public UserDetails getUserDetails(int id) {
			return actionOnUserDetails(id).get(0);
		}
		
		private ArrayList<UserDetails> actionOnUserDetails(int id) {
			ArrayList<UserDetails> userList = new ArrayList<UserDetails>();
			
			try {
				connection = DBConnectionUtil.getDBConnection();
				
				if (id != 0) {
					preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_USER));
					preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, id);
				}
				else {
					preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_USER));
				}
				
				ResultSet resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					UserDetails user = new UserDetails();
					user.setId(resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE));
					user.setName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
					user.setAddress(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
					user.setPhone(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
					user.setEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
					user.setAcc(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
					userList.add(user);
				}
				
			} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
			
			return userList;
		}


		public UserDetails updateUser(int id, UserDetails userDetail) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_USER));
				
				
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, userDetail.getName());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, userDetail.getAddress());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, userDetail.getPhone());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, userDetail.getEmail());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, userDetail.getAcc());
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_SIX, id);
				
				preparedStatement.executeUpdate();
				
			} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
			
			return getUserDetails(id);
		}

		public void removeUserDetail(int id) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_DELETE_USER));
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, id);
				preparedStatement.executeUpdate();
				
			} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
		}

}
