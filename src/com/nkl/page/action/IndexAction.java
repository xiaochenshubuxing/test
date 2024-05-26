package com.nkl.page.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nkl.common.util.JSONData;
import com.nkl.common.util.Md5;
import com.nkl.common.util.PaperUtil;
import com.nkl.page.domain.Film;
import com.nkl.page.domain.FilmType;
import com.nkl.page.domain.Info;
import com.nkl.page.domain.Orders;
import com.nkl.page.domain.Sblog;
import com.nkl.page.domain.User;
import com.nkl.page.manager.IndexManager;

@Controller
public class IndexAction {

	@Autowired
	IndexManager indexManager;
	String tip;
	
	public IndexManager getIndexManager() {
		return indexManager;
	}

	public void setIndexManager(IndexManager indexManager) {
		this.indexManager = indexManager;
	}
	
	/**
	 * @Title: index
	 * @Description: 首页
	 * @return String
	 */
	@RequestMapping(value="page_index.action",method=RequestMethod.GET)
	public String index(ModelMap model){
		try {
			//查询最新电影资源
			Film film = new Film();
			film.setFilm_new(1);
			film.setStart(0);
			film.setLimit(8);
			List<Film> films = indexManager.listFilms(film,null); 
			if (films==null) {
				films = new ArrayList<Film>();
			}
			model.addAttribute("films", films);
			
			//查询最新影城公告
			Info info = new Info();
			info.setStart(0);
			info.setLimit(8);
			List<Info> infos = indexManager.listInfos(info, null);
			model.addAttribute("infos", infos);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "default";
	}
	
	/**
	 * @Title: listFilms
	 * @Description: 影片资源
	 * @return String
	 */
	@RequestMapping(value="page_listFilms.action")
	public String listFilms(Film paramsFilm,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//查询电影信息集合
			if (paramsFilm==null) {
				paramsFilm = new Film();
			}
			//分页信息设置
			paperUtil.setPagination(paramsFilm);



			int[] sum={0};
			List<Film> films = indexManager.listFilms(paramsFilm,sum);
			System.out.println(Arrays.toString(sum));
			System.out.println(films.size());
			model.addAttribute("films", films);
			paperUtil.setTotalCount(sum[0]);
			model.addAttribute("paramsFilm", paramsFilm);
			
			//查询电影类型
			FilmType filmType = new FilmType();
			filmType.setStart(-1);
			List<FilmType> filmTypes = indexManager.listFilmTypes(filmType, null);
			model.addAttribute("filmTypes", filmTypes);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "film";
	}
	
	/**
	 * @Title: listFilmsTop
	 * @Description: 新片速递
	 * @return String
	 */
	@RequestMapping(value="page_listFilmsTop.action")
	public String listFilmsTop(Film paramsFilm,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//查询新片速递集合
			List<Film> films = indexManager.listFilmsTop();
			System.out.println(films.size());
			model.addAttribute("films", films);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "filmNew";
	}
	
	/**
	 * @Title: queryFilm
	 * @Description: 查询电影详情
	 * @return String
	 */
	@RequestMapping(value="page_queryFilm.action")
	public String queryFilm(Film paramsFilm,Sblog paramsSblog,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到电影
			System.out.println(paramsFilm);
			Film film = indexManager.queryFilm(paramsFilm);
			model.addAttribute("film", film);
			
			//查询影评信息集合
			if (paramsSblog==null) {
				paramsSblog = new Sblog();
				paramsSblog.setFilm_id(film.getFilm_id());
			}
			//分页信息设置
			paperUtil.setPagination(paramsSblog);
			int[] sum={0};
			List<Sblog> sblogs = indexManager.listSblogs(paramsSblog,sum); 
			model.addAttribute("sblogs", sblogs);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "filmDetail";
	}
	
	/**
	 * @Title: addOrdersShow
	 * @Description: 新增订票界面
	 * @return String
	 */
	@RequestMapping(value="page_addOrdersShow.action")
	public String addOrdersShow(Film paramsFilm,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//查询电影
			System.out.println(paramsFilm.getFilm_id());
			Film film = indexManager.queryFilm(paramsFilm);
			model.addAttribute("film", film);
			film.setFilm_scene2(paramsFilm.getFilm_scene2());
			
			//查询座位
			Map<String, String> seatMap = indexManager.listFilmSeats(paramsFilm);
			model.addAttribute("seatMap", seatMap);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "ordersAdd";
	}
	
	/**
	 * @Title: addOrders
	 * @Description: 新增订票
	 * @return String
	 */
	@RequestMapping(value="page_addOrders.action")
	@ResponseBody
	public JSONData addOrders(Orders paramsOrders,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		JSONData jsonData = new JSONData();
		try {
			//新增订票
			indexManager.addOrders(paramsOrders);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.setErrorReason("后台服务器异常");
			return jsonData;
		}
		
		return jsonData;
	}
	
	/**
	 * @Title: listInfos
	 * @Description: 查询影城公告
	 * @return String
	 */
	@RequestMapping(value="page_listInfos.action")
	public String listInfos(Info paramsInfo,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsInfo==null) {
				paramsInfo = new Info();
			}
			//设置分页信息
			paperUtil.setPagination(paramsInfo);
			//总的条数
			int[] sum={0};
			//查询影城公告列表
			List<Info> infos = indexManager.listInfos(paramsInfo,sum); 
			
			model.addAttribute("infos", infos);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "info";
	}
	
	/**
	 * @Title: queryInfo
	 * @Description: 查询影城公告
	 * @return String
	 */
	@RequestMapping(value="page_queryInfo.action")
	public String queryInfo(Info paramsInfo,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到影城公告
			Info info = indexManager.queryInfo(paramsInfo);
			model.addAttribute("info", info);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "infoDetail";
	}
	
	/**
	 * @Title: listSblogs
	 * @Description: 评论信息
	 * @return String
	 */
	@RequestMapping(value="page_listSblogs.action")
	public String listSblogs(Sblog paramsSblog,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//查询评论信息集合
			if (paramsSblog==null) {
				paramsSblog = new Sblog();
			}
			//分页信息设置
			paperUtil.setPagination(paramsSblog);
			int[] sum={0};
			List<Sblog> sblogs = indexManager.listSblogs(paramsSblog,sum); 
			model.addAttribute("sblogs", sblogs);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "sblog";
	}
	
	/**
	 * @Title: addSblog
	 * @Description: 新增评论
	 * @return String
	 */
	@RequestMapping(value="page_addSblog.action")
	@ResponseBody
	public JSONData addSblog(Sblog paramsSblog,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		JSONData jsonData = new JSONData();
		try {
			//验证码验证
			String random = (String)httpSession.getAttribute("random");
			if (!random.equals(paramsSblog.getRandom())) {
				jsonData.setErrorReason("验证码错误！");
				return jsonData;
			}
			
			//新增评论
			indexManager.addSblog(paramsSblog);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.setErrorReason("后台服务器异常");
			return jsonData;
		}
		
		return jsonData;
	}
	 
	/**
	 * @Title: saveAdmin
	 * @Description: 保存修改个人信息
	 * @return String
	 */
	@RequestMapping(value="page_saveUserFront.action",method=RequestMethod.POST)
	@ResponseBody
	public JSONData saveUserFront(User paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		JSONData jsonData = new JSONData();
		try {
			 //保存修改个人信息
			indexManager.updateUser(paramsUser);
			//更新session
			User admin = new User();
			admin.setUser_id(paramsUser.getUser_id());
			admin = indexManager.getUser(admin);
			httpSession.setAttribute("userFront", admin);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.setErrorReason("后台服务器异常");
			return jsonData;
		}
		return jsonData;
	}
	
	/**
	 * @Title: saveUserFrontPass
	 * @Description: 保存修改个人密码
	 * @return String
	 */
	@RequestMapping(value="page_saveUserFrontPass.action",method=RequestMethod.POST)
	@ResponseBody
	public JSONData saveUserFrontPass(User paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		JSONData jsonData = new JSONData();
		try {
			User userFront = (User)httpSession.getAttribute("userFront");
			if (!userFront.getUser_pass().equals(Md5.makeMd5(paramsUser.getUser_passOld()))) {
				jsonData.setErrorReason("修改异常，原密码错误");
				return jsonData;
			}
			 //保存修改个人信息
			indexManager.updateUser(paramsUser);
			//更新session
			if (userFront!=null) {
				userFront.setUser_pass(paramsUser.getUser_pass());
				httpSession.setAttribute("userFront", userFront);
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.setErrorReason("后台服务器异常");
			return jsonData;
		}
		return jsonData;
	}
	
	/**
	 * @Title: listMyOrderss
	 * @Description: 查询我的电影订票
	 * @return String
	 */
	@RequestMapping(value="page_listMyOrderss.action")
	public String listMyOrderss(Orders paramsOrders,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsOrders==null) {
				paramsOrders = new Orders();
			}
			//获取用户,用户只能查询自己的订票
			User userFront = (User)httpSession.getAttribute("userFront");
			if (userFront.getUser_type()==1) {
				paramsOrders.setUser_id(userFront.getUser_id());
			}
			//设置分页信息
			paperUtil.setPagination(paramsOrders);
			//总的条数
			int[] sum={0};
			//查询电影订票列表
			List<Orders> orderss = indexManager.listOrderss(paramsOrders,sum); 
			
			model.addAttribute("orderss", orderss);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "ordersShow";
	}
	
	/**
	 * @Title: cancelOrders
	 * @Description: 退订电影票
	 * @return String
	 */
	@RequestMapping(value="page_cancelOrders.action")
	@ResponseBody
	public JSONData cancelOrders(Orders paramsOrders,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		JSONData jsonData = new JSONData();
		try {
			//退订电影票
			boolean flag = indexManager.cancelOrders(paramsOrders);
			if (!flag) {
				jsonData.setErrorReason("退票失败！必须至少提前1天才能退票!");
				return jsonData;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.setErrorReason("后台服务器异常");
			return jsonData;
		}
		
		return jsonData;
	}
	
	/**
	 * @Title: reg
	 * @Description: 跳转注册页面
	 * @return String
	 */
	@RequestMapping(value="page_reg.action")
	public String reg(){
		return "reg";
	}
	
	/**
	 * @Title: myInfo
	 * @Description: 跳转个人信息页面
	 * @return String
	 */
	@RequestMapping(value="page_myInfo.action")
	public String myInfo(){
		return "myInfo";
	}
	
	/**
	 * @Title: myPwd
	 * @Description: 跳转个人密码页面
	 * @return String
	 */
	@RequestMapping(value="page_myPwd.action")
	public String myPwd(){
		return "myPwd";
	}
	
	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

}
