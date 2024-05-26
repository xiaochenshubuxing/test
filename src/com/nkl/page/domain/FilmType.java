package com.nkl.page.domain;

import com.nkl.common.domain.BaseDomain;

public class FilmType extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1770185824735782580L;
	private int film_type_id; // 
	private String film_type_name; // 

	private String ids;

	public int getFilm_type_id() {
		return film_type_id;
	}

	public void setFilm_type_id(int film_type_id) {
		this.film_type_id = film_type_id;
	}

	public String getFilm_type_name() {
		return film_type_name;
	}

	public void setFilm_type_name(String film_type_name) {
		this.film_type_name = film_type_name;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
