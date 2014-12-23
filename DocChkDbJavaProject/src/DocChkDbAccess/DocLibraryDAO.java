package DocChkDbAccess;

import java.util.ArrayList;
/**
 * 
 * 文件簽核系統 -歷史紀錄表DAo    
 * @author Judith Chou
 */

public interface DocLibraryDAO {
	/**
	 * 新增一筆
	 * @param l 
	 */
    public void add(DocLibrary l,int Dou_Type);
    /**
     * 新增多筆
     * @param l
     */
    public void add(ArrayList<DocLibrary> l);
	/**
	 * 修改一筆
	 * @param l 修改一筆
	 */
    public void update(DocLibrary l);
	/**
	 * 強迫設定Lib_SetTop為1(置頂),預設0(正常)
	 * @param Lib_Id 流水號Key值
	 */
    public void updateLibSetTop(int Lib_Id); 
	/**
	 * 刪除錯誤資料
	 * @param Lib_Id 流水號Key值
	 * @return
	 */
    public void delete(int Lib_Id);
	/**
	 * 查詢by流水號Key值
	 * @param Lib_Id 流水號Key值
	 */
	DocLibrary findById(int Lib_Id);
	/**
	 * 查詢by正式文號
	 * @param Lib_DocNO 正式文號
	 * @return
	 */
	DocLibrary findbyLibDocNO(String Lib_DocNO);
	/**
	 * 查詢by暫時文號
	 * @param Lib_TmpId 暫時文號
	 * @return
	 */
	DocLibrary findbyLibTmpId(int Lib_TmpId);
	DocLibrary[] getAll();
}
