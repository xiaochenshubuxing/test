package com.nkl.page.domain;

import com.nkl.common.domain.BaseDomain;
import com.nkl.common.util.DateUtil;
import com.nkl.common.util.StringUtil;
import com.nkl.common.util.Transcode;

public class Film extends BaseDomain {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -6925524708882684408L;
	private int film_id; // 
	private int film_type_id; // 
	private String film_name; // 
	private String film_pic;
	private double film_price; // 
	private String film_actors; // 
	private String film_date; //  
	private String film_scene;//09:00、11:00、13:00、15:00、17:00、19:00、 21:00、23:00
	private String film_room;//1-5号放映厅
	private double film_score;
	private String film_desc; // 
	private String ids;

	private String film_duration;
	
	private String film_type_name; // 
	private int film_new; // 1-最新电影 
	private String film_scene2;

	public int getFilm_flag() {
		if (DateUtil.getCurDate().compareTo(film_date)>0) {
			return 1;
		}
		return 0;
	}
	
	public int getFilm_id() {
		return film_id;
	}

	public void setFilm_id(int film_id) {
		this.film_id = film_id;
	}

	public int getFilm_type_id() {
		return film_type_id;
	}

	public void setFilm_type_id(int film_type_id) {
		this.film_type_id = film_type_id;
	}

	public String getFilm_name() {
		return film_name;
	}

	public void setFilm_name(String film_name) {
		this.film_name = film_name;
	}

	public String getFilm_pic() {
		return film_pic;
	}

	public void setFilm_pic(String film_pic) {
		this.film_pic = film_pic;
	}

	public double getFilm_price() {
		return film_price;
	}

	public void setFilm_price(double film_price) {
		this.film_price = film_price;
	}

	public String getFilm_descShow(){
		if (!StringUtil.isEmptyString(film_desc)) {
			return Transcode.htmlDiscode(film_desc);
		}
		return film_desc;
	}
	
	public String getFilm_desc() {
		return film_desc;
	}

	public void setFilm_desc(String film_desc) {
		this.film_desc = film_desc;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getFilm_actors() {
		return film_actors;
	}

	public void setFilm_actors(String film_actors) {
		this.film_actors = film_actors;
	}

	public String getFilm_date() {
		return film_date;
	}

	public void setFilm_date(String film_date) {
		this.film_date = film_date;
	}

	public String getFilm_scene() {
		return film_scene;
	}

	public void setFilm_scene(String film_scene) {
		this.film_scene = film_scene;
	}

	public double getFilm_score() {
		return film_score;
	}

	public void setFilm_score(double film_score) {
		this.film_score = film_score;
	}

	public String getFilm_type_name() {
		return film_type_name;
	}

	public void setFilm_type_name(String film_type_name) {
		this.film_type_name = film_type_name;
	}

	public int getFilm_new() {
		return film_new;
	}

	public void setFilm_new(int film_new) {
		this.film_new = film_new;
	}

	public String getFilm_room() {
		return film_room;
	}

	public void setFilm_room(String film_room) {
		this.film_room = film_room;
	}

	public String getFilm_scene2() {
		return film_scene2;
	}

	public void setFilm_scene2(String film_scene2) {
		this.film_scene2 = film_scene2;
	}


	public String getFilm_duration() {
		return film_duration;
	}

	public void setFilm_duration(String film_duration) {
		this.film_duration = film_duration;
	}
}
