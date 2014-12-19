package DocChkDbAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class DocLibraryDAODBImpl implements DocLibraryDAO {
    
	@Override
    public void add(DocLibrary l) {

			try {
				String SQL ="Insert Into Document_Library (Lib_TmpId,Lib_DocNO) values (?,?)";
				PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
				pstmt.setInt(1, l.getLib_TmpId());
				pstmt.setString(2, l.getLib_DocNO());
				pstmt.executeUpdate();
				pstmt.close();
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
		public void updateLibSetTop(int Lib_Id ) {
           
            try {
                String SQL="Update Document_Library Set Lib_SetTop=1 where Lib_Id=?";
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
