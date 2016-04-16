package lang.hong.shuai.domain;

import java.math.BigDecimal;

public class CartItem {
	private String cartItemId;// 主键
	private int quantity;// 数量
	private Car car;// 条目对应的汽车配件
	private User user;// 所属用户

	// 添加小计方法
	public double getSubtotal() {
		/*
		 * 使用BigDecimal不会有误差 要求必须使用String类型构造器
		 */
		BigDecimal b1 = new BigDecimal(car.getCurrPrice() + "");
		BigDecimal b2 = new BigDecimal(quantity + "");
		BigDecimal b3 = b1.multiply(b2);
		return b3.doubleValue();
	}

	public String getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(String cartItemId) {
		this.cartItemId = cartItemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public static void main(String[] args) {
		System.out.println(2.0 - 1.1);// 0.8999999999999999
	}
}
