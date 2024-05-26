package com.nkl.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nkl.admin.manager.AdminManager;
import com.nkl.common.util.DateUtil;
import com.nkl.common.util.Md5;
import com.nkl.common.util.PaperUtil;
import com.nkl.page.domain.Film;
import com.nkl.page.domain.FilmType;
import com.nkl.page.domain.Info;
import com.nkl.page.domain.Orders;
import com.nkl.page.domain.Sblog;
import com.nkl.page.domain.User;

@Controller
public class AdminAction{

	@Autowired
	AdminManager adminManager;
	public AdminManager getAdminManager() {
		return adminManager;
	}
	public void setAdminManager(AdminManager adminManager) {
		this.adminManager = adminManager;
	}

	String tip;
	
	/**
	 * @Title: saveAdmin
	 * @Description: 保存修改个人信息
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveAdmin.action")
	public String saveAdmin(User paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//验证用户会话是否失效
			if (!validateAdmin(httpSession)) {
				return "loginTip";
			}
			 //保存修改个人信息
			adminManager.updateUser(paramsUser);
			//更新session
			User admin = new User();
			admin.setUser_id(paramsUser.getUser_id());
			admin = adminManager.getUser(admin);
			httpSession.setAttribute("admin", admin);

			setSuccessTip("编辑成功", "modifyInfo.jsp", model);
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("编辑异常", "modifyInfo.jsp", model);
		}
		return "infoTip";
	}
	
	/**
	 * @Title: saveAdminPass
	 * @Description: 保存修改个人密码
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveAdminPass.action")
	public String saveAdminPass(User paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//验证用户会话是否失效
			if (!validateAdmin(httpSession)) {
				return "loginTip";
			}
			//验证原密码
			User admin = (User)httpSession.getAttribute("admin");
			String user_passOld1 = admin.getUser_pass();
			String user_passOld2 = Md5.makeMd5(paramsUser.getUser_passOld());
			if (!user_passOld1.equals(user_passOld2)) {
				setErrorTip("原密码不正确", "modifyPwd.jsp", model);
				return "infoTip";
			}
			 //保存修改个人密码
			adminManager.updateUser(paramsUser);
			//更新session
			if (admin!=null) {
				admin.setUser_pass(paramsUser.getUser_pass());
				httpSession.setAttribute("admin", admin);
			}

			setSuccessTip("修改成功", "modifyPwd.jsp", model);
		} catch (Exception e) {
			setErrorTip("修改异常", "modifyPwd.jsp", model);
		}
		return "infoTip";
	}
	
	/**
	 * @Title: listUsers
	 * @Description: 查询用户
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listUsers.action")
	public String listUsers(User paramsUser,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsUser==null) {
				paramsUser = new User();
			}
			if (paperUtil==null) {
				paperUtil = new PaperUtil();
			}
			//设置分页信息
			paperUtil.setPagination(paramsUser);
			//总的条数
			int[] sum={0};
			//查询用户列表
			paramsUser.setUser_type(1);
			List<User> users = adminManager.listUsers(paramsUser,sum); 
			model.addAttribute("users", users);
			model.addAttribute("paramsUser", paramsUser);
			paperUtil.setTotalCount(sum[0]);

		} catch (Exception e) {
			setErrorTip("查询用户异常", "main.jsp", model);
			return "infoTip";
		}
		
		return "userShow";
	}
	
	/**
	 * @Title: addUserShow
	 * @Description: 显示添加用户页面
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addUserShow.action")
	public String addUserShow(ModelMap model){
		return "userEdit";
	}
	
	/**
	 * @Title: addUser
	 * @Description: 添加用户
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addUser.action")
	public String addUser(User paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//检查用户是否存在
			User user = new User();
			user.setUser_name(paramsUser.getUser_name());
			user = adminManager.getUser(user);
			if (user!=null) {
				model.addAttribute("tip","失败，该用户名已经存在！");
				model.addAttribute("user", paramsUser);
				
				return "userEdit";
			}
			 //添加用户
			paramsUser.setUser_type(1);
			paramsUser.setReg_date(DateUtil.getCurDateTime());
			adminManager.addUser(paramsUser);
			
			setSuccessTip("添加成功", "Admin_listUsers.action", model);
		} catch (Exception e) {
			setErrorTip("添加用户异常", "Admin_listUsers.action", model);
		}
		
		return "infoTip";
	}
	
	 
	/**
	 * @Title: editUser
	 * @Description: 编辑用户
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_editUser.action")
	public String editUser(User paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到用户
			User user = adminManager.getUser(paramsUser);
			model.addAttribute("user", user);
			
		} catch (Exception e) {
			setErrorTip("查询用户异常", "Admin_listUsers.action", model);
			return "infoTip";
		}
		
		return "userEdit";
	}
	
	/**
	 * @Title: saveUser
	 * @Description: 保存编辑用户
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveUser.action")
	public String saveUser(User paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //保存编辑用户
			adminManager.updateUser(paramsUser);
			
			setSuccessTip("编辑成功", "Admin_listUsers.action", model);
		} catch (Exception e) {
			setErrorTip("编辑用户异常", "Admin_listUsers.action", model);
			return "infoTip";
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: delUsers
	 * @Description: 删除用户
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delUsers.action")
	public String delUsers(User paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除用户
			adminManager.delUsers(paramsUser);
			
			setSuccessTip("删除用户成功", "Admin_listUsers.action", model);
		} catch (Exception e) {
			setErrorTip("删除用户异常", "Admin_listUsers.action", model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: listFilmTypes
	 * @Description: 查询电影类型
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listFilmTypes.action")
	public String listFilmTypes(FilmType paramsFilmType,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsFilmType==null) {
				paramsFilmType = new FilmType();
			}
			
			//设置分页信息
			paperUtil.setPagination(paramsFilmType);
			//总的条数
			int[] sum={0};
			//查询电影类型列表
			List<FilmType> filmTypes = adminManager.listFilmTypes(paramsFilmType,sum); 
			
			model.addAttribute("filmTypes", filmTypes);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			setErrorTip("查询电影类型异常","main.jsp",model);
			return "infoTip";
		}
		
		return "filmTypeShow";
	}
	
	/**
	 * @Title: addFilmTypeShow
	 * @Description: 显示添加电影类型页面
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addFilmTypeShow.action")
	public String addFilmTypeShow(FilmType paramsFilmType,ModelMap model){
		return "filmTypeEdit";
	}
	
	/**
	 * @Title: addFilmType
	 * @Description: 添加电影类型
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addFilmType.action")
	public String addFilmType(FilmType paramsFilmType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//检查电影类型是否存在
			FilmType filmType = new FilmType();
			filmType.setFilm_type_name(paramsFilmType.getFilm_type_name());
			filmType = adminManager.queryFilmType(filmType);
			if (filmType!=null) {
				model.addAttribute("tip","失败，该类型已经存在！");
				model.addAttribute("filmType", paramsFilmType);
				return "filmTypeEdit";
			}
			
			 //添加电影类型
			adminManager.addFilmType(paramsFilmType);
			
			setSuccessTip("添加成功","Admin_listFilmTypes.action",model);
		} catch (Exception e) {
			setErrorTip("添加电影类型异常","Admin_listFilmTypes.action",model);
		}
		
		return "infoTip";
	}
	
	 
	/**
	 * @Title: editFilmType
	 * @Description: 编辑电影类型
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_editFilmType.action")
	public String editFilmType(FilmType paramsFilmType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到电影类型
			FilmType filmType = adminManager.queryFilmType(paramsFilmType);
			model.addAttribute("filmType", filmType);
			
		} catch (Exception e) {
			setErrorTip("查询电影类型异常","Admin_listFilmTypes.action",model);
			return "infoTip";
		}
		
		return "filmTypeEdit";
	}
	
	/**
	 * @Title: saveFilmType
	 * @Description: 保存编辑电影类型
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveFilmType.action")
	public String saveFilmType(FilmType paramsFilmType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//检查电影类型是否存在
			FilmType filmType = new FilmType();
			filmType.setFilm_type_name(paramsFilmType.getFilm_type_name());
			filmType = adminManager.queryFilmType(filmType);
			if (filmType!=null&&filmType.getFilm_type_id()!=paramsFilmType.getFilm_type_id()) {
				model.addAttribute("tip","失败，该类型已经存在！");
				model.addAttribute("filmType", paramsFilmType);
				return "filmTypeEdit";
			}
			
			 //保存编辑电影类型
			adminManager.updateFilmType(paramsFilmType);
			
			setSuccessTip("编辑成功","Admin_listFilmTypes.action",model);
		} catch (Exception e) {
			model.addAttribute("tip","编辑失败");
			model.addAttribute("filmType", paramsFilmType);
			return "filmTypeEdit";
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: delFilmTypes
	 * @Description: 删除电影类型
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delFilmTypes.action")
	public String delFilmTypes(FilmType paramsFilmType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除电影类型
			adminManager.delFilmTypes(paramsFilmType);
			
			setSuccessTip("删除电影类型成功","Admin_listFilmTypes.action",model);
		} catch (Exception e) {
			setErrorTip("删除电影类型异常","Admin_listFilmTypes.action",model);
		}
		
		return "infoTip";
	}
	
	
	/**
	 * @Title: listFilms
	 * @Description: 查询电影
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listFilms.action")
	public String listFilms(Film paramsFilm,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsFilm==null) {
				paramsFilm = new Film();
			}
			//设置分页信息
			paperUtil.setPagination(paramsFilm);
			int[] sum={0};
			List<Film> films = adminManager.listFilms(paramsFilm,sum); 
			
			model.addAttribute("films", films);
			paperUtil.setTotalCount(sum[0]);
			
			//查询电影类型
			FilmType filmType = new FilmType();
			filmType.setStart(-1);
			List<FilmType> filmTypes = adminManager.listFilmTypes(filmType, null);
			model.addAttribute("filmTypes", filmTypes);
			
		} catch (Exception e) {
			setErrorTip("查询电影异常","main.jsp",model);
			return "infoTip";
		}
		
		return "filmShow";
	}
	
	/**
	 * @Title: addFilmShow
	 * @Description: 显示添加电影页面
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addFilmShow.action")
	public String addFilmShow(Film paramsFilm,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		//查询电影类型
		FilmType filmType = new FilmType();
		filmType.setStart(-1);
		List<FilmType> filmTypes = adminManager.listFilmTypes(filmType, null);
		model.addAttribute("filmTypes", filmTypes);
		
		return "filmEdit";
	}
	
	/**
	 * @Title: addFilm
	 * @Description: 添加电影
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addFilm.action")
	public String addFilm(Film paramsFilm,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//场次判断
			String[] film_scenes = paramsFilm.getFilm_scene().split(",");
			for (String film_scene : film_scenes) {
				Film film = new Film();				
				film.setFilm_scene(film_scene);
				film.setFilm_room(paramsFilm.getFilm_room());
				film.setFilm_date(paramsFilm.getFilm_date());
				List<Film> films = adminManager.listFilms(film, null);
				if (films!=null && films.size()>0) {
					model.addAttribute("tip","添加失败，当天放映厅场次冲突");
					model.addAttribute("film", paramsFilm);
					
					//查询电影类型
					FilmType filmType = new FilmType();
					filmType.setStart(-1);
					List<FilmType> filmTypes = adminManager.listFilmTypes(filmType, null);
					model.addAttribute("filmTypes", filmTypes);
					
					return "filmEdit";
				}
			}
			
			 //添加电影
			adminManager.addFilm(paramsFilm);
			
			setSuccessTip("添加电影成功","Admin_listFilms.action",model);
		} catch (Exception e) {
			setErrorTip("添加电影异常","Admin_listFilms.action",model);
		}
		return "infoTip";
	}
	
	/**
	 * @Title: queryFilm
	 * @Description: 查询电影详情
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_queryFilm.action")
	public String queryFilm(Film paramsFilm,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到电影
			Film film = adminManager.queryFilm(paramsFilm);
			model.addAttribute("film", film);
			
		} catch (Exception e) {
			setErrorTip("查询电影异常","Admin_listFilms.action",model);
			return "infoTip";
		}
		
		return "filmDetail";
	}
	 
	/**
	 * @Title: editFilm
	 * @Description: 编辑电影
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_editFilm.action")
	public String editFilm(Film paramsFilm,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到电影
			Film film = adminManager.queryFilm(paramsFilm);
			model.addAttribute("film", film);
			
			//查询电影类型
			FilmType filmType = new FilmType();
			filmType.setStart(-1);
			List<FilmType> filmTypes = adminManager.listFilmTypes(filmType, null);
			model.addAttribute("filmTypes", filmTypes);
			
		} catch (Exception e) {
			setErrorTip("查询电影异常","Admin_listFilms.action",model);
			return "infoTip";
		}
		
		return "filmEdit";
	}
	
	/**
	 * @Title: saveFilm
	 * @Description: 保存编辑电影
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveFilm.action")
	public String saveFilm(Film paramsFilm,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//场次判断
			String[] film_scenes = paramsFilm.getFilm_scene().split(",");
			for (String film_scene : film_scenes) {
				Film film = new Film();				
				film.setFilm_scene(film_scene);
				film.setFilm_room(paramsFilm.getFilm_room());
				film.setFilm_date(paramsFilm.getFilm_date());
				List<Film> films = adminManager.listFilms(film, null);
				if (films!=null && (films.size()>1 || 
						(films.size()==1 && films.get(0).getFilm_id()!=paramsFilm.getFilm_id())
						)) {
					model.addAttribute("tip","编辑失败，当天放映厅场次冲突");
					model.addAttribute("film", paramsFilm);
					
					//查询电影类型
					FilmType filmType = new FilmType();
					filmType.setStart(-1);
					List<FilmType> filmTypes = adminManager.listFilmTypes(filmType, null);
					model.addAttribute("filmTypes", filmTypes);
					
					return "filmEdit";
				}
			}
			
			 //保存编辑电影
			adminManager.updateFilm(paramsFilm);
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("tip","编辑失败");
			model.addAttribute("film", paramsFilm);
			
			//查询电影类型
			FilmType filmType = new FilmType();
			filmType.setStart(-1);
			List<FilmType> filmTypes = adminManager.listFilmTypes(filmType, null);
			model.addAttribute("filmTypes", filmTypes);
			
			return "filmEdit";
		}
		setSuccessTip("编辑电影成功","Admin_listFilms.action",model);
		return "infoTip";
	}
	
	/**
	 * @Title: delFilms
	 * @Description: 删除电影
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delFilms.action")
	public String delFilms(Film paramsFilm,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除电影
			adminManager.delFilms(paramsFilm);

			setSuccessTip("删除电影成功","Admin_listFilms.action",model);
		} catch (Exception e) {
			setErrorTip("删除电影异常","Admin_listFilms.action",model);
		}
		return "infoTip";
	}
	
	/**
	 * @Title: listOrderss
	 * @Description: 查询电影订票
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listOrderss.action")
	public String listOrderss(Orders paramsOrders,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsOrders==null) {
				paramsOrders = new Orders();
			}
			//设置分页信息
			paperUtil.setPagination(paramsOrders);
			//总的条数
			int[] sum={0};
			//查询电影订票列表
			List<Orders> orderss = adminManager.listOrderss(paramsOrders,sum); 
			
			model.addAttribute("orderss", orderss);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			setErrorTip("查询电影订票异常","main.jsp",model);
			return "infoTip";
		}
		
		return "ordersShow";
	}
	
	/**
	 * @Title: delOrderss
	 * @Description: 删除电影订票
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delOrderss.action")
	public String delOrderss(Orders paramsOrders,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除电影订票
			adminManager.delOrderss(paramsOrders);
			
			setSuccessTip("删除电影订票成功","Admin_listOrderss.action",model);
		} catch (Exception e) {
			setErrorTip("删除电影订票异常","Admin_listOrderss.action",model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: listInfos
	 * @Description: 查询影城公告
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listInfos.action")
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
			List<Info> infos = adminManager.listInfos(paramsInfo,sum); 
			
			model.addAttribute("infos", infos);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			setErrorTip("查询影城公告异常","main.jsp",model);
			return "infoTip";
		}
		
		return "infoShow";
	}
	
	/**
	 * @Title: addInfoShow
	 * @Description: 显示添加影城公告页面
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addInfoShow.action")
	public String addInfoShow(Info paramsInfo,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		return "infoEdit";
	}
	
	/**
	 * @Title: addInfo
	 * @Description: 添加影城公告
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addInfo.action")
	public String addInfo(Info paramsInfo,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //添加影城公告
			adminManager.addInfo(paramsInfo);
			
			setSuccessTip("添加成功","Admin_listInfos.action",model);
		} catch (Exception e) {
			System.out.println(e);
			setErrorTip("添加影城公告异常","Admin_listInfos.action",model);
		}
		
		return "infoTip";
	}
	
	 
	/**
	 * @Title: editInfo
	 * @Description: 编辑影城公告
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_editInfo.action")
	public String editInfo(Info paramsInfo,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到影城公告
			Info info = adminManager.queryInfo(paramsInfo);
			model.addAttribute("info", info);
			
		} catch (Exception e) {
			setErrorTip("查询影城公告异常","Admin_listInfos.action",model);
			return "infoTip";
		}
		
		return "infoEdit";
	}
	
	/**
	 * @Title: saveInfo
	 * @Description: 保存编辑影城公告
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveInfo.action")
	public String saveInfo(Info paramsInfo,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //保存编辑影城公告
			adminManager.updateInfo(paramsInfo);
			
			setSuccessTip("编辑成功","Admin_listInfos.action",model);
		} catch (Exception e) {
			model.addAttribute("tip","编辑失败");
			model.addAttribute("info", paramsInfo);
			return "infoEdit";
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: delInfos
	 * @Description: 删除影城公告
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delInfos.action")
	public String delInfos(Info paramsInfo,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除影城公告
			adminManager.delInfos(paramsInfo);
			
			setSuccessTip("删除影城公告成功","Admin_listInfos.action",model);
		} catch (Exception e) {
			setErrorTip("删除影城公告异常","Admin_listInfos.action",model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: listSblogs
	 * @Description: 查询留言板
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listSblogs.action")
	public String listSblogs(Sblog paramsSblog,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//查询留言板
			if (paramsSblog==null) {
				paramsSblog = new Sblog();
			}
			//分页设置
			paperUtil.setPagination(paramsSblog);
			int[] sum={0};
			List<Sblog> sblogs = adminManager.listSblogs(paramsSblog,sum); 
			
			model.addAttribute("sblogs", sblogs);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("查询异常","main.jsp",model);
			return "infoTip";
		}
		
		return "sblogShow";
	}
	
	/**
	 * @Title: delSblogs
	 * @Description: 删除留言板
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delSblogs.action")
	public String delSblogs(Sblog paramsSblog,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除留言板
			adminManager.delSblogs(paramsSblog);

			setSuccessTip("删除成功","Admin_listSblogs.action",model);
		} catch (Exception e) {
			setErrorTip("删除异常","Admin_listSblogs.action",model);
		}
		return "infoTip";
	}
	
	private boolean validateAdmin(HttpSession httpSession){
		User admin = (User)httpSession.getAttribute("admin");
		if (admin!=null) {
			return true;
		}else {
			return false;
		}
	}
	
	private void setErrorTip(String tip,String url,ModelMap model){
		model.addAttribute("tipType", "error");
		model.addAttribute("tip", tip);
		model.addAttribute("url1", url);
		model.addAttribute("value1", "确 定");
	}
	
	private void setSuccessTip(String tip,String url,ModelMap model){
		model.addAttribute("tipType", "success");
		model.addAttribute("tip", tip);
		model.addAttribute("url1", url);
		model.addAttribute("value1", "确 定");
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}


}
