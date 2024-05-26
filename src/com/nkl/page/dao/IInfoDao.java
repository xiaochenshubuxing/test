package com.nkl.page.dao;

import java.util.List;
import com.nkl.page.domain.Info;
import com.nkl.page.domain.User;

public interface IInfoDao {

	public abstract int addInfo(Info info);

	public abstract int delInfo(String info_id);

	public abstract int delInfos(String[] info_ids);

	public abstract int updateInfo(Info info);

	public abstract Info getInfo(Info info);

	public abstract List<Info>  listInfos(Info info);

	public abstract int listInfosCount(Info info);

	public abstract int getInfoId(User user);

}
