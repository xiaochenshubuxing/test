package com.nkl.page.dao;

import java.util.List;
import com.nkl.page.domain.Film;

public interface IFilmDao {

	public abstract int addFilm(Film film);

	public abstract int delFilm(String film_id);

	public abstract int delFilms(String[] film_ids);

	public abstract int updateFilm(Film film);

	public abstract int updateFilmScore(Film film);

	public abstract Film getFilm(Film film);

	public abstract List<Film>  listFilms(Film film);

	public abstract int listFilmsCount(Film film);

	public abstract List<Film> listFilmsTop();

}
