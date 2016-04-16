package lang.hong.shuai.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lang.hong.shuai.domain.Car;
import lang.hong.shuai.domain.Category;
import lang.hong.shuai.pager.Expression;
import lang.hong.shuai.pager.PageBean;
import lang.hong.shuai.pager.PageConstants;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class CarDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 删除汽车配件
	 * 
	 * @param carId
	 * @throws SQLException
	 */
	public void delete(String carId) throws SQLException {
		String sql = "delete from t_car where carId=?";
		qr.update(sql, carId);
	}

	/**
	 * 修改汽车配件
	 * 
	 * @param car
	 * 
	 * @throws SQLException
	 */
	public void edit(Car car) throws SQLException {
		String sql = "update t_car set cname=?,machine=?,price=?,currPrice=?,"
				+ "discount=?,paiLiang=?,oil=?,doorNum=?,carType=?,shaftDis=?,"
				+ "volume=?,keepPolicy=?,maxWat=?,cid=? where carId=?";
		Object[] params = { car.getCname(), car.getMachine(), car.getPrice(),
				car.getCurrPrice(), car.getDiscount(), car.getPaiLiang(),
				car.getOil(), car.getDoorNum(), car.getCarType(),
				car.getShaftDis(), car.getVolume(), car.getKeepPolicy(),
				car.getMaxWat(), car.getCategory().getCid(), car.getCarId() };
		qr.update(sql, params);
	}

	/**
	 * 按carId查询
	 * 
	 * @param carId
	 * @return
	 * @throws SQLException
	 */
	public Car findByCarId(String carId) throws SQLException {
		String sql = "SELECT * FROM t_car b, t_category c WHERE b.cid=c.cid AND b.carId=?";
		// 一行记录中，包含了很多的car的属性，还有一个cid属性
		Map<String, Object> map = qr.query(sql, new MapHandler(), carId);
		// 把Map中除了cid以外的其他属性映射到Car对象中
		Car car = CommonUtils.toBean(map, Car.class);
		// 把Map中cid属性映射到Category中，即这个Category只有cid
		Category category = CommonUtils.toBean(map, Category.class);
		// 两者建立关系
		car.setCategory(category);

		// 把pid获取出来，创建一个Category parnet，把pid赋给它，然后再把parent赋给category
		if (map.get("pid") != null) {
			Category parent = new Category();
			parent.setCid((String) map.get("pid"));
			category.setParent(parent);
		}
		return car;
	}

	/**
	 * 查询指定分类下汽车配件的个数
	 * 
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	public int findCarCountByCategory(String carId) throws SQLException {
		String sql = "select count(*) from t_car where carId=?";
		Number cnt = (Number) qr.query(sql, new ScalarHandler(), carId);
		return cnt == null ? 0 : cnt.intValue();
	}

	/**
	 * 按分类查询
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Car> findByCategory(String cid, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("cid", "=", cid));
		return findByCriteria(exprList, pc);
	}

	/**
	 * 按车名模糊查询
	 * 
	 * @param cname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Car> findByCname(String cname, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("cname", "like", "%" + cname + "%"));
		return findByCriteria(exprList, pc);
	}

	/**
	 * 按排量查
	 * 
	 * @param cname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Car> findByPaiLiang(String paiLiang, int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("paiLiang", "like", "%" + paiLiang + "%"));
		return findByCriteria(exprList, pc);
	}

	/**
	 * 按出版社查
	 * 
	 * @param press
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Car> findByOil(String oil, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("oil", "like", "%" + oil + "%"));
		return findByCriteria(exprList, pc);
	}

	/**
	 * 多条件组合查询
	 * 
	 * @param combination
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Car> findByCombination(Car criteria, int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("cname", "like", "%" + criteria.getCname()
				+ "%"));
		exprList.add(new Expression("paiLiang", "like", "%"
				+ criteria.getPaiLiang() + "%"));
		exprList.add(new Expression("oil", "like", "%" + criteria.getOil()
				+ "%"));
		return findByCriteria(exprList, pc);
	}

	/**
	 * 通用的查询方法
	 * 
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	private PageBean<Car> findByCriteria(List<Expression> exprList, int pc)
			throws SQLException {
		/*
		 * 1. 得到ps 2. 得到tr 3. 得到beanList 4. 创建PageBean，返回
		 */
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.BOOK_PAGE_SIZE;// 每页记录数
		/*
		 * 2. 通过exprList来生成where子句
		 */
		StringBuilder whereSql = new StringBuilder(" where 1=1");
		List<Object> params = new ArrayList<Object>();// SQL中有问号，它是对应问号的值
		for (Expression expr : exprList) {
			/*
			 * 添加一个条件上， 1) 以and开头 2) 条件的名称 3) 条件的运算符，可以是=、!=、>、< ... is null，is
			 * null没有值 4) 如果条件不是is null，再追加问号，然后再向params中添加一与问号对应的值
			 */
			whereSql.append(" and ").append(expr.getName()).append(" ")
					.append(expr.getOperator()).append(" ");
			// where 1=1 and carId = ?
			if (!expr.getOperator().equals("is null")) {
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}

		/*
		 * 3. 总记录数
		 */
		String sql = "select count(*) from t_car" + whereSql;
		Number number = (Number) qr.query(sql, new ScalarHandler(),
				params.toArray());
		int tr = number.intValue();// 得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		sql = "select * from t_car" + whereSql + " order by orderBy limit ?,?";
		params.add((pc - 1) * ps);// 当前页首行记录的下标
		params.add(ps);// 一共查询几行，就是每页记录数

		List<Car> beanList = qr.query(sql, new BeanListHandler<Car>(Car.class),
				params.toArray());

		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Car> pb = new PageBean<Car>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);

		return pb;
	}

	/**
	 * 添加汽车配件
	 * 
	 * @param car
	 * @throws SQLException
	 */
	public void add(Car car) throws SQLException {
		String sql = "insert into t_car(carId,cname,machine,price,currPrice,"
				+ "discount,paiLiang,oil,doorNum,carType,shaftDis,volume,"
				+ "keepPolicy,maxWat,cid,image_w,image_b)"
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { car.getCarId(), car.getCname(), car.getMachine(),
				car.getPrice(), car.getCurrPrice(), car.getDiscount(),
				car.getPaiLiang(), car.getOil(), car.getDoorNum(),
				car.getCarType(), car.getShaftDis(), car.getVolume(),
				car.getKeepPolicy(), car.getMaxWat(),
				car.getCategory().getCid(), car.getImage_w(), car.getImage_b() };
		qr.update(sql, params);
	}

	/**
	 * 按照价格区间查
	 * 
	 * @param currPrice
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Car> findByCurrPrice(String currPrice, int pc)
			throws SQLException {
		Double price = Double.parseDouble(currPrice);
		Double litPrice = price - 10;
		Double bigPrice = price + 10;
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("currPrice", ">", litPrice + ""));
		exprList.add(new Expression("currPrice", "<", bigPrice + ""));
		return findByCriteria(exprList, pc);
	}
}
