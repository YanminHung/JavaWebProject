package DocChkDbAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class DocLibraryDAODBImpl implements DocLibraryDAO {
    
	@Override
    public void add(DocLibrary l,int Dou_Type) {

			try {
				String SQL01 ="select * from Document_Library where Lib_TmpId=0 and Lib_DocNo = ?";
				String SQL02 ="Insert Into Document_Library (Lib_TmpId,Lib_DocNo,Lib_SetTop) values (0,?,0)";
		 	   	String SQL1 ="select * from Document_Library where Lib_TmpId=0 and Lib_DocNo = ?";
			    String SQL2 ="Update Document_Library Set Lib_SetTop=Lib_SetTop+1 where Lib_TmpId=0 and Lib_DocNo = ?";
				String SQL3 ="Insert Into Document_Library (Lib_TmpId,Lib_DocNo,Lib_SetTop) values (?,?,?)";
				PreparedStatement pstmt01 = DocChkDbConn.GetConnect().prepareStatement(SQL01);	
				PreparedStatement pstmt02  = DocChkDbConn.GetConnect().prepareStatement(SQL02);
	            PreparedStatement pstmt1  = DocChkDbConn.GetConnect().prepareStatement(SQL1);
	            PreparedStatement pstmt2  = DocChkDbConn.GetConnect().prepareStatement(SQL2);


				PreparedStatement pstmt3  = DocChkDbConn.GetConnect().prepareStatement(SQL3);

                //System.out.println(l.getLib_TmpId());
                // System.out.println(l.getLib_SetTop());
				
				pstmt01.setString(1, "JavaWeb-"+Dou_Type+"-");
				pstmt01.executeQuery();
				ResultSet rs01 = pstmt01.executeQuery();	
				if ( rs01.next())
                 {				}
                else 
                {
                	// i 為文件類型目前有1:公告 2:一般         
                	pstmt02.setString(1, "JavaWeb-"+Dou_Type+"-");
                	pstmt02.executeUpdate();
                	pstmt01.close();
				    pstmt02.close();
                }	
				 pstmt1.setString(1, "JavaWeb-"+Dou_Type+"-");
				 System.out.print("JavaWeb-"+Dou_Type+"-");
				 ResultSet rs1 = pstmt1.executeQuery();	
				 if ( rs1.next())

				 {
				   // DocLibrary  libr = new DocLibrary(rs1.getInt(1),rs1.getInt(2),rs1.getString(3),rs1.getInt(4));

                    System.out.println( rs1.getString(3));
                    pstmt2.setString(1, rs1.getString(3));
                    pstmt2.executeUpdate();
                    pstmt3.setInt(1, l.getLib_TmpId());
                    pstmt3.setString(2,rs1.getString(3)+String.format("%05d",rs1.getInt(4)+1));
                    pstmt3.setInt(3, l.getLib_SetTop());
                    pstmt3.executeUpdate();	
       			    pstmt3.close();
       		        pstmt2.close();

				 } 
       		        pstmt1.close();
				    
                 
                 
                 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	
	@Override
    public void add(ArrayList<DocLibrary> l) {
			try {
				for (DocLibrary o:l)
				{
				String SQL ="Insert Into Document_Library (Lib_TmpId,Lib_DocNO) values (?,?)";
				PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
				pstmt.setInt(1, o.getLib_TmpId());
				pstmt.setString(2, o.getLib_DocNO());
				pstmt.executeUpdate();
				pstmt.close();                
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	
		@Override
		public void update(DocLibrary l) {
			try {
			    String SQL ="Update Document_Library Set Lib_TmpId=?,Lib_DocNO=? Lib_SetTop=? where Lib_Id=?";
				PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
				pstmt.setInt(1, l.getLib_TmpId());
				pstmt.setString(2, l.getLib_DocNO());
				pstmt.setInt(3, l.getLib_SetTop());
				pstmt.executeUpdate();
				pstmt.close();				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// 強迫設定Lib_SetTop為1(置頂),預設0(正常)
		@Override 
		public void updateLibSetTop(int Lib_Id){
           
            try {
                
            	String SQL1="Select * from Document_Library where Lib_Id=?";
            	String SQL2="Update Document_Library Set Lib_SetTop = ? where Lib_Id = ?";
                PreparedStatement pstmt1 = DocChkDbConn.GetConnect().prepareStatement(SQL1);
                PreparedStatement pstmt2 = DocChkDbConn.GetConnect().prepareStatement(SQL2);
                pstmt1.setInt(1,Lib_Id);
                ResultSet rs = pstmt1.executeQuery();
                 if (rs.next())
                {
                     if (rs.getInt(4)==1)
                     {
                    	pstmt2.setInt(1,0);
                     }
                     else
                     {
                     	pstmt2.setInt(1,1);
                     }
                     pstmt2.setInt(2,Lib_Id);
                     pstmt2.executeUpdate();
                     pstmt2.close();
                }
                pstmt1.close(); 
            
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
		
		
		@Override
		public void delete(int Lib_Id) {
            try {
                String SQL="Delete Document_Library where Lib_Id=?";
                PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                pstmt.setInt(1,Lib_Id);
                pstmt.executeUpdate();
                pstmt.close();               
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }		
		}

		@Override
		public DocLibrary findById(int Lib_Id) {
           
            try {
                String SQL="Select * From Document_Library Where Lib_Id = ?";
                PreparedStatement pstmt =DocChkDbConn.GetConnect().prepareStatement(SQL);
                pstmt.setInt(1,Lib_Id);
                ResultSet rs = pstmt.executeQuery();
                                  
                if (rs.next())
                {
                    DocLibrary r = new DocLibrary(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4));
                    System.out.println(r.getLib_Id()+" "+r.getLib_TmpId()+" "+r.getLib_DocNO());
                    return r;
                }
                pstmt.close();               
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            
            return null;
        }
        
		

		@Override
		public DocLibrary[] getAll() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public DocLibrary findbyLibDocNO(String Lib_DocNO)
		{
			try {
				PreparedStatement pstmt = 
				DocChkDbConn.GetConnect().prepareStatement("Select * From Document_Library Where Lib_DocNO = ?");
				pstmt.setString(1, Lib_DocNO);
				ResultSet rs = pstmt.executeQuery();				
		        if (rs.next())
	            {
                	DocLibrary r = new DocLibrary(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4));
                	 System.out.println(r.getLib_Id()+" "+r.getLib_TmpId()+" "+r.getLib_DocNO());
	                return r;
	            }
		        pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;			
		}
		
		@Override
		public DocLibrary findbyLibTmpId(int Lib_TmpId)
		{
			try {
				PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement("Select * From Document_Library Where "
						+ "Lib_TmpId = ?");
				pstmt.setInt(1, Lib_TmpId);
				ResultSet rs = pstmt.executeQuery();				
					
				if (rs.next())
				{
				
					DocLibrary r = new DocLibrary(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4));
					 System.out.println(r.getLib_Id()+" "+r.getLib_TmpId()+" "+r.getLib_DocNO());
					return r;
				}
				
				//stmt.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		}
		
		
		
	
}
