package com.nkl.page.manager;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class IndexManager {

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
	 * @Title: listFilms
	 * @Description: 查询影片信息
	 * @param film
	 * @return List<Film>
	 */
	public List<Film>  listFilms(Film film,int[] sum){
		
		if (sum!=null) {
			sum[0] = filmDao.listFilmsCount(film);
		}
		List<Film> films = filmDao.listFilms(film);
		
		return films;
	}
	
	public List<Film>  listFilmsTop(){
		
		List<Film> films = filmDao.listFilmsTop();
		
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
		System.out.println("xxxxxxx");
		System.out.println(_film.getFilm_id());
		
		return _film;
	}
	
	/**
	 * @Title: listFilmSeats
	 * @Description: 查询影片座位选取情况
	 * @param film
	 * @return Map<String, String>
	 */
	public Map<String, String>  listFilmSeats(Film film){
		
		//查询预定的座位放到map里
		Map<String, String> map = new HashMap<String, String>();
		Orders orders = new Orders();
		orders.setFilm_id(film.getFilm_id());
		orders.setStart(-1);
		orders.setOrders_flag(1);
		List<Orders> orderss = ordersDao.listOrderss(orders);
		if (orderss!=null) {
			for (Orders orders2 : orderss) {
				String[] temp = orders2.getOrders_seat().split(",");
				for (String seat : temp) {
					map.put(seat, seat);
				}
			}
		}
		
		return map;
	}
	
	/**
	 * @Title: addOrders
	 * @Description: 添加电影订票
	 * @param orders
	 * @return Orders
	 */
	public void addOrders(Orders orders) {
		
		orders.setOrders_flag(1);//正常
		orders.setOrders_date(DateUtil.dateToDateString(new Date(), "yyyy-MM-dd"));
		orders.setOrders_count(orders.getOrders_seat().split(",").length);
		ordersDao.addOrders(orders);
		
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
	 * @Title: listSblogs
	 * @Description: 查询留言信息
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
	 * @Title: addSblog
	 * @Description: 新增评论
	 * @param sblog
	 * @return void
	 */
	public void  addSblog(Sblog sblog){
		
		if (!StringUtil.isEmptyString(sblog.getSblog_content())) {
			sblog.setSblog_content(Transcode.htmlEncode(sblog.getSblog_content()));
		}
		sblog.setSblog_date(DateUtil.dateToDateString(new Date(), "yyyy-MM-dd HH:mm:ss"));//留言时间
		sblogDao.addSblog(sblog);
		
		//更新电影平均得分
		Film film = new Film();
		film.setFilm_id(sblog.getFilm_id());
		filmDao.updateFilmScore(film);
		
		
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
	 * @Title: cancelOrders
	 * @Description: 退订电影票
	 * @param orders
	 * @return boolean
	 */
	public boolean cancelOrders(Orders orders) {
		boolean flag = true;
		
		orders = ordersDao.getOrders(orders);
		//查询电影时间
		Film film = new Film();
		film.setFilm_id(orders.getFilm_id());
		film = filmDao.getFilm(film);
		//当前日期
		Date nowDate = DateUtil.getDateAfter(DateUtil.getDate(DateUtil.getCurDate()), 1);
		//电影播出日期
		Date filmDate = DateUtil.getDate(film.getFilm_date());
		if (DateUtil.compareDateStr(nowDate, filmDate)>=0) {
			//至少提前一天时，可以退票
			orders.setOrders_flag(2);
			ordersDao.updateOrders(orders);
		}else {
			flag = false;
		}
		
		return flag;
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
