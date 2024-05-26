package com.nkl.page.domain;

import java.util.Date;

import com.nkl.common.domain.BaseDomain;
import com.nkl.common.util.DateUtil;
import com.nkl.common.util.StringUtil;

public class Orders extends BaseDomain {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -6925524708882684408L;
	private int orders_id; // 
	private int user_id; // 
	private int film_id; // 
	private int orders_count; // 
	private String orders_date;
	private int orders_flag; // 1：正常 2：已退票 3：已过期
	private String orders_seat;  
	private String film_scene;
	
	private String real_name; // 
	private String film_name; // 
	private String film_date; // 
	private String film_room; // 
	private String orders_date_min;
	private String orders_date_max;
	
	private String ids;
	
	public String getOrders_flagDesc(){
		switch (orders_flag) {
		case 1:
			return "正常";
		case 2:
			return "已退票"; 
		case 3:
			return "已过期"; 
		default:
			return "";
		}
	}
	
	public String getOrders_seatDesc() {
		String seatDesc = "";
		if (!StringUtil.isEmptyString(orders_seat)) {
			String[] orders_seats = orders_seat.split(",");
			for (String seat : orders_seats) {
				String[] seatTemp = seat.split("-");
				seatDesc = seatDesc + seatTemp[0] + "排" + seatTemp[1] + "座   ";
			}
		}
		return seatDesc;
	}
	
	/**
	 * @Title: getDepreciation
	 * @Description: 是否过时：1-未过时 2-已过时
	 * @return int
	 */
	public int getDepreciation(){
		int depreciation = 1;
		Date curDate = DateUtil.getDate(DateUtil.getCurDate());
		Date reDate = DateUtil.getDate(orders_date);
		if (DateUtil.compareDateStr(reDate, curDate)>0) {
			depreciation = 2;
		}
		return depreciation;
	}
	
	public int getOrders_id() {
		return orders_id;
	}

	public void setOrders_id(int orders_id) {
		this.orders_id = orders_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getFilm_id() {
		return film_id;
	}

	public void setFilm_id(int film_id) {
		this.film_id = film_id;
	}

	public String getOrders_date() {
		return orders_date;
	}

	public void setOrders_date(String orders_date) {
		this.orders_date = orders_date;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public String getFilm_name() {
		return film_name;
	}

	public void setFilm_name(String film_name) {
		this.film_name = film_name;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getOrders_date_min() {
		return orders_date_min;
	}

	public void setOrders_date_min(String orders_date_min) {
		this.orders_date_min = orders_date_min;
	}

	public String getOrders_date_max() {
		return orders_date_max;
	}

	public void setOrders_date_max(String orders_date_max) {
		this.orders_date_max = orders_date_max;
	}
	public int getOrders_flag() {
		return orders_flag;
	}
	public void setOrders_flag(int orders_flag) {
		this.orders_flag = orders_flag;
	}
	public int getOrders_count() {
		return orders_count;
	}
	public void setOrders_count(int orders_count) {
		this.orders_count = orders_count;
	}
	public String getFilm_date() {
		return film_date;
	}
	public void setFilm_date(String film_date) {
		this.film_date = film_date;
	}
	public String getOrders_seat() {
		return orders_seat;
	}
	public void setOrders_seat(String orders_seat) {
		this.orders_seat = orders_seat;
	}

	public String getFilm_scene() {
		return film_scene;
	}

	public void setFilm_scene(String film_scene) {
		this.film_scene = film_scene;
	}

	public String getFilm_room() {
		return film_room;
	}

	public void setFilm_room(String film_room) {
		this.film_room = film_room;
	}

	 

}
