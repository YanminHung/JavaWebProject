package DocChkDbAccess;

import java.util.ArrayList;
/**
 * 文件簽核系統 -簽核紀錄表定義方法   
 * @author Judith Chou
 *
 */
public interface DocProcessDAO {

	void add(ArrayList<DocProcess> p); //新增多筆
	int add(DocProcess p); //新增1筆
	int update(DocProcess p); //修改整筆
	int updateBreakOff(int Proc_Id ); // 日期抓系統日期，強迫設定Proc_BreakOff為1(退件),預設0(正常)
	int updateCheckFlag(int Proc_Id); // 強迫設定CheckFlag為1(待審),預設0(未審)
	int AddCheckD(int Proc_Id); // 帶入系統日期
	ArrayList<DocProcess> findByReadyCheck(int Proc_Emp_Id); //選取條件login ID及CheckFlag為1(待審)
	ArrayList<DocProcess> getAll();	
	
	
}
