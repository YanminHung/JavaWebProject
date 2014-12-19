package DocChkDbAccess;

import java.util.ArrayList;

public interface EmpolyeeDAO {

	void add(Empolyee m);
	void delete(Empolyee m);

	/**
	 * @param m : 欲填入的資料(empolyee)
	 * @param No: 欲修改的資料(where Emp_No=No)
	 */
	void update(Empolyee m,int No);
	void change(Empolyee em,String Emp_Depart,int Emp_BossPosId);

	/**
	 * @param Emp_Id 員工編號(String)
	 * @return 密碼(String)
	 */
	public String GetLoginPwd(String Emp_Id);
	public Empolyee findByNo(int Emp_No);
	public Empolyee findById(String Emp_Id);

	/**
	 * 以下皆ArrayList<Employee>型態,嵌入JSP檔時需要事先匯入 util.*
	 */
	public ArrayList<Empolyee> findByName(String Emp_Name);
	public ArrayList<Empolyee> findByDepart(String Emp_Depart);
	public ArrayList<Empolyee> getAll();
	public ArrayList<Empolyee> getAllWork();

}
