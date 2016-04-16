package lang.hong.shuai.service;

import java.sql.SQLException;

import lang.hong.shuai.dao.AdminDao;
import lang.hong.shuai.domain.Admin;

public class AdminService {
	private AdminDao adminDao = new AdminDao();

	/**
	 * 登录功能
	 * 
	 * @param admin
	 * @return
	 */
	public Admin login(Admin admin) {
		try {
			return adminDao.find(admin.getAdminname(), admin.getAdminpwd());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
