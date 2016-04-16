package lang.hong.shuai.domain;

public class Car {
	private String carId;// 主键
	private String cname;// 车名
	private String machine;// 发动机
	private double price;// 定价
	private double currPrice;// 当前价
	private double discount;// 折扣
	private String paiLiang;// 排量
	private String oil;// 燃油
	private int doorNum;// 车门数
	private String carType;// 车身型式
	private String shaftDis;// 轴距
	private String volume;// 邮箱容积
	private String keepPolicy;// 保修政策
	private String maxWat;// 最大功率
	private Category category;// 所属分类
	private String image_w;// 大图路径
	private String image_b;// 小图路径

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getMachine() {
		return machine;
	}

	public void setMachine(String machine) {
		this.machine = machine;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getCurrPrice() {
		return currPrice;
	}

	public void setCurrPrice(double currPrice) {
		this.currPrice = currPrice;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public String getOil() {
		return oil;
	}

	public void setOil(String oil) {
		this.oil = oil;
	}

	public int getDoorNum() {
		return doorNum;
	}

	public void setDoorNum(int doorNum) {
		this.doorNum = doorNum;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getShaftDis() {
		return shaftDis;
	}

	public void setShaftDis(String shaftDis) {
		this.shaftDis = shaftDis;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getKeepPolicy() {
		return keepPolicy;
	}

	public void setKeepPolicy(String keepPolicy) {
		this.keepPolicy = keepPolicy;
	}

	public String getMaxWat() {
		return maxWat;
	}

	public void setMaxWat(String maxWat) {
		this.maxWat = maxWat;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getImage_w() {
		return image_w;
	}

	public void setImage_w(String image_w) {
		this.image_w = image_w;
	}

	public String getImage_b() {
		return image_b;
	}

	public void setImage_b(String image_b) {
		this.image_b = image_b;
	}

	public String getPaiLiang() {
		return paiLiang;
	}

	public void setPaiLiang(String paiLiang) {
		this.paiLiang = paiLiang;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}
}
