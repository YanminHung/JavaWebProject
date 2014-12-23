package DocChkDbAccess;
/**
* 
* 文件簽核系統 -歷史紀錄清單DAO   
* @author Judith Chou
*/
public interface DocLibraryListDAO {       

        /**
         * 查詢by正式文號
         * @param Lib_DocNO 正式文號
         * @return
         */
        DocLibraryList findbyLibDocNO(String Lib_DocNO);
        /**
         * 查詢by暫時文號
         * @param Lib_TmpId 暫時文號
         * @return
         */
        DocLibraryList findbyLibTmpId(int Lib_TmpId);
        /**
         * 查詢by主旨
         * @param Dou_KeyNote 主旨
         * @return
         */
        DocLibraryList[] findbyDouKeyNote(String  Dou_KeyNote);
        /**
         * 查詢by作者
         * @param Dou_Author 作者
         * @return
         */
        DocLibraryList[] findbyDouAuthor(int Dou_Author);
        /**
         * 查詢by日期
         * @param Dou_Date 日期
         * @return
         */
        DocLibraryList[] findbyDouDate(String  Dou_Date);
        /**
         * 查詢by部門
         * @param Emp_Depart 部門
         * @return
         */
        DocLibraryList[] findbyEmpDepart(String Emp_Depart);              

        
        DocLibraryList[] findAll(int Dou_Author);
        
        DocLibraryList[] findAnnouncementAll();
        
        DocLibraryList[] SearchDocData(
                String Lib_DocNo,    //文號
                String Dou_Type,     //文件類型
                String Dou_Keynote,  //主旨
                String Emp_Name,     //員工姓名(承辦人)
                String Emp_Depart,   //部門   
                String Dou_Date_B,  //發文日期起  
                String Dou_Date_E);  //發文日期迄  
      
        
        
        
        
}
