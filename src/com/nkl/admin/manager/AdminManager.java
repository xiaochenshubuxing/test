package com.nkl.admin.manager;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkl.common.util.DateUtil;
import com.nkl.common.util.Md5;
import com.nkl.common.util.StringUtil;
import com.nkl.common.util.Transcode;
import com.nkl.page.dao.IFilmDao;
import com.nkl.page.dao.IFilmTypeDao;
import com.nkl.page.dao.IInfoDao;
import com.nkl.page.dao.IOrdersDao;
import com.nkl.page.dao.ISblogDao;
import com.nkl.page.dao.IUserDao;
import com.nkl.page.domain.Film;
import com.nkl.page.domain.FilmType;
import com.nkl.page.domain.Info;
import com.nkl.page.domain.Orders;
import com.nkl.page.domain.Sblog;
import com.nkl.page.domain.User;

@Service
public class AdminManager {

	@Autowired
	IUserDao userDao;
	@Autowired
	IFilmTypeDao filmTypeDao;
	@Autowired
	IFilmDao filmDao;
	@Autowired
	IOrdersDao ordersDao;
	@Autowired
	ISblogDao sblogDao;
	@Autowired
	IInfoDao infoDao;
	
	/**
	 * @Title: listUsers
	 * @Description: 用户查询
	 * @param user
	 * @return List<User>
	 */
	public List<User>  listUsers(User user,int[] sum){
		
		if (sum!=null) {
			sum[0] = userDao.listUsersCount(user);
		}
		List<User> users = userDao.listUsers(user);
		
		
		return users;
	}
	
	/**
	 * @Title: getUser
	 * @Description: 用户查询
	 * @param user
	 * @return User
	 */
	public User  getUser(User user){
		
		User _user = userDao.getUser(user);
		
		return _user;
	}
	 
	/**
	 * @Title: addUser
	 * @Description: 添加用户
	 * @param user
	 * @return void
	 */
	public void  addUser(User user){
		
if (!StringUtil.isEmptyString(user.getUser_pass())) {
			user.setUser_pass(Md5.makeMd5(user.getUser_pass()));
		}
		userDao.addUser(user);
		
	}
	
	/**
	 * @Title: updateUser
	 * @Description: 更新用户信息
	 * @param user
	 * @return void
	 */
	public void  updateUser(User user){
		
		if (!StringUtil.isEmptyString(user.getUser_pass())) {
			user.setUser_pass(Md5.makeMd5(user.getUser_pass()));
		}
		userDao.updateUser(user);
		
	}
	
	/**
	 * @Title: delUsers
	 * @Description: 删除用户信息
	 * @param user
	 * @return void
	 */
	public void  delUsers(User user){
		
		userDao.delUsers(user.getIds().split(","));
		
	}
	
	/**
	 * @Title: listFilmTypes
	 * @Description: 电影类型查询
	 * @param filmType
	 * @return List<FilmType>
	 */
	public List<FilmType> listFilmTypes(FilmType filmType, int[] sum) {
		
		if (sum != null) {
			sum[0] = filmTypeDao.listFilmTypesCount(filmType);
		}
		List<FilmType> filmTypes = filmTypeDao.listFilmTypes(filmType);

		
		return filmTypes;
	}

	/**
	 * @Title: editFilmType
	 * @Description: 编辑电影类型信息
	 * @param filmType
	 * @return void
	 */
	public void editFilmType(FilmType filmType) {
		

		filmTypeDao.updateFilmType(filmType);

		
	}

	/**
	 * @Title: queryFilmType
	 * @Description: 电影类型查询
	 * @param filmType
	 * @return FilmType
	 */
	public FilmType queryFilmType(FilmType filmType) {
		
		FilmType _filmType = filmTypeDao.getFilmType(filmType);
		
		return _filmType;
	}

	/**
	 * @Title: addFilmType
	 * @Description: 添加电影类型
	 * @param filmType
	 * @return void
	 */
	public void addFilmType(FilmType filmType) {
		
		filmTypeDao.addFilmType(filmType);
		
	}

	/**
	 * @Title: updateFilmType
	 * @Description: 更新电影类型信息
	 * @param filmType
	 * @return void
	 */
	public void updateFilmType(FilmType filmType) {
		
		filmTypeDao.updateFilmType(filmType);
		
	}

	/**
	 * @Title: delFilmType
	 * @Description: 删除电影类型信息
	 * @param filmType
	 * @return void
	 */
	public void delFilmTypes(FilmType filmType) {
		
		filmTypeDao.delFilmTypes(filmType.getIds().split(","));
		
	}
	
	/**
	 * @Title: listFilms
	 * @Description: 电影查询
	 * @param film
	 * @return List<Film>
	 */
	public List<Film> listFilms(Film film, int[] sum) {
		
		if (sum != null) {
			sum[0] = filmDao.listFilmsCount(film);
		}
		List<Film> films = filmDao.listFilms(film);

		
		return films;
	}

	/**
	 * @Title: queryFilm
	 * @Description: 电影查询
	 * @param film
	 * @return Film
	 */
	public Film queryFilm(Film film) {
		
		Film _film = filmDao.getFilm(film);
		
		return _film;
	}

	/**
	 * @Title: addFilm
	 * @Description: 添加电影
	 * @param film
	 * @return void
	 */
	public void addFilm(Film film) {
		
		if (!StringUtil.isEmptyString(film.getFilm_desc())) {
			film.setFilm_desc(Transcode.htmlEncode(film.getFilm_desc()));
		}
		filmDao.addFilm(film);
		
	}

	/**
	 * @Title: updateFilm
	 * @Description: 更新电影信息
	 * @param film
	 * @return void
	 */
	public void updateFilm(Film film) {
		
		if (!StringUtil.isEmptyString(film.getFilm_desc())) {
			film.setFilm_desc(Transcode.htmlEncode(film.getFilm_desc()));
		}
		filmDao.updateFilm(film);
		
	}

	/**
	 * @Title: delFilm
	 * @Description: 删除电影信息
	 * @param film
	 * @return void
	 */
	public void delFilms(Film film) {
		
		filmDao.delFilms(film.getIds().split(","));
		
	}
	
	/**
	 * @Title: listOrderss
	 * @Description: 电影订票查询
	 * @param orders
	 * @return List<Orders>
	 */
	public List<Orders>  listOrderss(Orders orders,int[] sum){
		
		ordersDao.updateOrdersFlag();//更新过期订票为已过期
		if (sum!=null) {
			sum[0] = ordersDao.listOrderssCount(orders);
		}
		List<Orders> orderss = ordersDao.listOrderss(orders);
		
		
		return orderss;
	}
	
	/**
	 * @Title: queryOrders
	 * @Description: 电影订票查询
	 * @param orders
	 * @return Orders
	 */
	public Orders  queryOrders(Orders orders){
		
		Orders _orders = ordersDao.getOrders(orders);
		
		return _orders;
	}
	 
	/**
	 * @Title: delOrderss
	 * @Description: 删除电影订票信息
	 * @param orders
	 * @return void
	 */
	public void  delOrderss(Orders orders){
		
		ordersDao.delOrderss(orders.getIds().split(","));
		
	}
	
	/**
	 * @Title: listSblogs
	 * @Description: 留言查询
	 * @param sblog
	 * @return List<Sblog>
	 */
	public List<Sblog>  listSblogs(Sblog sblog,int[] sum){
		
		if (sum!=null) {
			sum[0] = sblogDao.listSblogsCount(sblog);
		}
		List<Sblog> sblogs = sblogDao.listSblogs(sblog);
		
		
		return sblogs;
	}
	
	/**
	 * @Title: delSblogs
	 * @Description: 删除留言
	 * @param sblog
	 * @return void
	 */
	public void  delSblogs(Sblog sblog){
		
		sblogDao.delSblogs(sblog.getIds().split(","));
		
	}
	
	/**
	 * @Title: listInfos
	 * @Description: 影城公告查询
	 * @param info
	 * @return List<Info>
	 */
	public List<Info> listInfos(Info info, int[] sum) {
		
		if (sum != null) {
			sum[0] = infoDao.listInfosCount(info);
		}
		List<Info> infos = infoDao.listInfos(info);

		
		return infos;
	}

	/**
	 * @Title: queryInfo
	 * @Description: 影城公告查询
	 * @param info
	 * @return Info
	 */
	public Info queryInfo(Info info) {
		
		Info _info = infoDao.getInfo(info);
		
		return _info;
	}

	/**
	 * @Title: addInfo
	 * @Description: 添加影城公告
	 * @param info
	 * @return void
	 */
	public void addInfo(Info info) {
		
		if (!StringUtil.isEmptyString(info.getInfo_content())) {
			info.setInfo_content(Transcode.htmlEncode(info.getInfo_content()));
		}
		info.setInfo_date(DateUtil.dateToDateString(new Date()));
		infoDao.addInfo(info);
		
	}

	/**
	 * @Title: updateInfo
	 * @Description: 更新影城公告信息
	 * @param info
	 * @return void
	 */
	public void updateInfo(Info info) {
		
		if (!StringUtil.isEmptyString(info.getInfo_content())) {
			info.setInfo_content(Transcode.htmlEncode(info.getInfo_content()));
		}
		infoDao.updateInfo(info);
		
	}

	/**
	 * @Title: delInfo
	 * @Description: 删除影城公告信息
	 * @param info
	 * @return void
	 */
	public void delInfos(Info info) {
		
		infoDao.delInfos(info.getIds().split(","));
		
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public IFilmTypeDao getFilmTypeDao() {
		return filmTypeDao;
	}

	public IFilmDao getFilmDao() {
		return filmDao;
	}

	public IOrdersDao getOrdersDao() {
		return ordersDao;
	}

	public ISblogDao getSblogDao() {
		return sblogDao;
	}

	public IInfoDao getInfoDao() {
		return infoDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	public void setFilmTypeDao(IFilmTypeDao filmTypeDao) {
		this.filmTypeDao = filmTypeDao;
	}

	public void setFilmDao(IFilmDao filmDao) {
		this.filmDao = filmDao;
	}

	public void setOrdersDao(IOrdersDao ordersDao) {
		this.ordersDao = ordersDao;
	}

	public void setSblogDao(ISblogDao sblogDao) {
		this.sblogDao = sblogDao;
	}

	public void setInfoDao(IInfoDao infoDao) {
		this.infoDao = infoDao;
	}
	
}
