package DocChkDbAccess;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 文件簽核系統 -簽核紀錄表方法實作
 * @author Judith Chou
 *
 */

 	public class DocProcessDAODBImpl implements DocProcessDAO {
		/**
		 * 新增多筆資料
		 */
		@Override
		public void add(ArrayList<DocProcess> p) {
		  try {
                 for (DocProcess o:p)
                {
                String SQL ="Insert Into Document_Process (Proc_TmpNo,Proc_Flow_Type,"
                    +"Proc_Flow_Seq,Proc_Flow_Max,Proc_Emp_Id,"
                    +"Proc_CheckD,Proc_BreakOff,Proc_CheckFlag)"
                    +"values (?,?,?,?,?,null,0,?)";
                PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                pstmt.setInt(1, o.getProc_TmpNo());
                pstmt.setInt(2, o.getProc_Flow_Type());
                pstmt.setInt(3, o.getProc_Flow_Seq());
                pstmt.setInt(4, o.getProc_Flow_Max());
                pstmt.setInt(5, o.getProc_Emp_Id());
                pstmt.setInt(6, o.getProc_CheckFlag());
                pstmt.executeUpdate();
                pstmt.close();
                }

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }


		}
		/**
		 * 新增單筆資料
		 */
		@Override
		public int add(DocProcess p) {

			try {
					String SQL ="Insert Into Document_Process (Proc_TmpNo,Proc_Flow_Type,"
					+"Proc_Flow_Seq,Proc_Flow_Max,Proc_Emp_Id,"
					+"Proc_CheckD,Proc_BreakOff,Proc_CheckFlag)"
					+"values (?,?,?,?,?,null,0,?)";
					PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
					pstmt.setInt(1, p.getProc_TmpNo());
					pstmt.setInt(2, p.getProc_Flow_Type());
					pstmt.setInt(3, p.getProc_Flow_Seq());
					pstmt.setInt(4, p.getProc_Flow_Max());
					pstmt.setInt(5, p.getProc_Emp_Id());
					pstmt.setInt(6, p.getProc_CheckFlag());
					pstmt.executeUpdate();
	                pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return 0;
		}


	     /**
         * 修改單筆資料
         */
		@Override
		public int update(DocProcess p) {
			// TODO Auto-generated method stub
			return 0;
		}
		 /**
         * 搜尋文件流水號Key值後，強迫設定Proc_BreakOff為1(退件),預設0(正常);日期抓系統日期
         */
		@Override  //
		public int updateBreakOff(int Proc_Id )
		{
            try {
                String SQL ="Update  Document_Process Set Proc_BreakOff=1,Proc_CheckD=SYSDATETIME()"
                        +"where Proc_Id =?";
                PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                pstmt.setInt(1, Proc_Id);
                pstmt.executeUpdate();
                pstmt.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

		    return 0;
		}
	     /**
         * 搜尋文件流水號Key值後，核准帶入系統日期
         */
		@Override  //  帶入系統日期
        public int AddCheckD(int Proc_Id )
        {
           try {
                String SQL ="Update  Document_Process Set Proc_CheckD=SYSDATETIME()"
                        +"where Proc_CheckFlag=1 and Proc_TmpNo =?";
                PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                pstmt.setInt(1, Proc_Id);
                pstmt.executeUpdate();
                pstmt.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            return 0;
        }
		/**
		 * 搜尋文件流水號Key值後，迫設定CheckFlag為1(待審),預設0(未審)
		 */
		@Override
		public int updateCheckFlag(int Proc_Id)
		{
            try {
                String SQL =
                        "update Document_Process set Proc_CheckFlag=1 "
                        +"where Proc_TmpNo=? and Proc_CheckFlag=0 and "
                        +"Proc_Flow_Seq=(select MIN(b.Proc_Flow_Seq) "
                        +"from  Document_Process b where b.Proc_TmpNo=? "
                        +"and b.Proc_CheckFlag=0)";  
                PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                pstmt.setInt(1, Proc_Id);
                pstmt.setInt(2, Proc_Id);
                pstmt.executeUpdate();
                pstmt.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

		    return 0;
		}

		 /**
         * 搜尋簽核者代號後，帶出待核簽資料
         */
		@Override
		public ArrayList<DocProcess> findByReadyCheck(int Proc_Emp_Id) {
		       try {
	             	String SQL="Select * From Document_Process Where Proc_CheckFlag=1"+
	                "and Proc_BreakOff!=1 and Proc_CheckD is null and Proc_Emp_Id=?";
	                PreparedStatement pstmt =DocChkDbConn.GetConnect().prepareStatement(SQL);
	         	    pstmt.setInt(1,Proc_Emp_Id);
	         	   	 /* 執行SQL語句 ，查詢類使用Query*/
                    ResultSet rs = pstmt.executeQuery();
	         	     /* 建立Array List並將資料放入 */
	                ArrayList<DocProcess> result = new ArrayList<DocProcess>();
	                while ( rs.next() )
	                {
	                    result.add( new DocProcess( rs.getInt(2),
	                                                rs.getInt(3),
	                                                rs.getInt(4),
	                                                rs.getInt(5),
	                                                rs.getInt(6),
	                                                rs.getString(7),
	                                                rs.getInt(8),
	                                                rs.getInt(9) ));
	                //    System.out.println( rs.getInt(1)+" "+rs.getInt(2)+" "+rs.getInt(3)+""+" "+rs.getInt(4)+"");
	                }
	                pstmt.close();
	                return result;


	            } catch (SQLException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }

			return null;
		}



		@Override
		public ArrayList<DocProcess>  getAll() {
			// TODO Auto-generated method stub
			return null;
		}
}
