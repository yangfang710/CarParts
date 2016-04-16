package lang.hong.shuai.service;

import java.sql.SQLException;

import lang.hong.shuai.dao.CarDao;
import lang.hong.shuai.domain.Car;
import lang.hong.shuai.pager.PageBean;

public class CarService {
	private CarDao carDao = new CarDao();

	/**
	 * 删除车辆
	 * 
	 * @param carId
	 */
	public void delete(String carId) {
		try {
			carDao.delete(carId);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 修改图书
	 * 
	 * @param car
	 */
	public void edit(Car car) {
		try {
			carDao.edit(car);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 返回当前分类下图书个数
	 * 
	 * @param cid
	 * @return
	 */
	public int findCarCountByCategory(String cid) {
		try {
			return carDao.findCarCountByCategory(cid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 加载图书
	 * 
	 * @param bid
	 * @return
	 */
	public Car load(String carId) {
		try {
			return carDao.findByCarId(carId);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 按分类查
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 */
	public PageBean<Car> findByCategory(String cid, int pc) {
		try {
			return carDao.findByCategory(cid, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 按车名查
	 * 
	 * @param cname
	 * @param pc
	 * @return
	 */
	public PageBean<Car> findByCname(String cname, int pc) {
		try {
			return carDao.findByCname(cname, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 按排量查
	 * 
	 * @param paiLiang
	 * @param pc
	 * @return
	 */
	public PageBean<Car> findByPaiLiang(String paiLiang, int pc) {
		try {
			return carDao.findByPaiLiang(paiLiang, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 按燃油查
	 * 
	 * @param oil
	 * @param pc
	 * @return
	 */
	public PageBean<Car> findByOil(String oil, int pc) {
		try {
			return carDao.findByOil(oil, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 多条件组合查询
	 * 
	 * @param criteria
	 * @param pc
	 * @return
	 */
	public PageBean<Car> findByCombination(Car criteria, int pc) {
		try {
			return carDao.findByCombination(criteria, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 添加图书
	 * 
	 * @param car
	 */
	public void add(Car car) {
		try {
			carDao.add(car);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 按照价格区间查
	 * 
	 * @param currPrice
	 * @param pc
	 * @return
	 */
	public PageBean<Car> findByPrice(String currPrice, int pc) {
		try {
			return carDao.findByCurrPrice(currPrice, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
