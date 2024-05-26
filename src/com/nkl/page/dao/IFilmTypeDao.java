package com.nkl.page.dao;

import java.util.List;
import com.nkl.page.domain.FilmType;

public interface IFilmTypeDao {

	public abstract int addFilmType(FilmType filmType);

	public abstract int delFilmType(String film_type_id);

	public abstract int delFilmTypes(String[] film_type_ids);

	public abstract int updateFilmType(FilmType filmType);

	public abstract FilmType getFilmType(FilmType filmType);

	public abstract List<FilmType>  listFilmTypes(FilmType filmType);

	public abstract int listFilmTypesCount(FilmType filmType);

}
