package DocChkDbAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DetailDAOImpl implements DetailDAO {

	@Override
	public void add(Document_Detail d) {
		// TODO Auto-generated method stub

		try {
			String SQL =
					"Insert Into Document_Detail (Dou_TmpNo, Dou_Type, Dou_Speed,Dou_Keynote,Dou_Content,Dou_Author,Dou_Date,Dou_FlowType,Dou_Status,Dou_IsHistoryCheck,Dou_Link,Dou_Draft)"
							+ " values (?, ?, ?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );
			pstmt.setString(1, d.getDou_TmpNo());
			pstmt.setInt(2, d.getDou_Type());
			pstmt.setInt(3, d.getDou_Speed());
			pstmt.setString(4, d.getDou_Keynote());
			pstmt.setString(5, d.getDou_Content());
			pstmt.setInt(6, d.getDou_Author());
			pstmt.setString(7, d.getDou_Date());
			pstmt.setInt(8, d.getDou_Flow());
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setString(11, d.getDou_Link());
			pstmt.setInt(12, d.getDou_Draft());
			pstmt.executeUpdate();
			pstmt.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	@Override
	public void update(Document_Detail d) {

	}

	@Override
	public void delete(String Dou_TmpNo) {
        try {
            //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String SQL="Delete from Document_Detail where Dou_TmpNo = ?";
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setString(1, Dou_TmpNo);
            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

	}

    @Override
    public void updateDraftFlag(int Dou_No) {
        try {
            //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String SQL="Update Document_Detail set Dou_Draft=2 where Dou_No = ?";
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setInt(1, Dou_No);
            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void CheckClick(String Dou_TmpNo) {
        try
        {
            String SQL="Update Document_Detail Set Dou_IsHistory=1 where Dou_TmpNo = ?";
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );


            pstmt.setString(1, Dou_TmpNo);



            pstmt.executeUpdate();
            pstmt.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }

    }

    @Override
    public void CheckStatus(String TmpNo, int Dou_Status) {
        // TODO Auto-generated method stub

    }

    @Override
    public Document_Detail searchNo(int Dou_No) {
        // TODO Auto-generated method stub
        try {
            String SQL="Select * From Document_Detail Where Dou_No = ?";
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setInt(1, Dou_No);
            ResultSet rs = pstmt.executeQuery();

           if(rs.next())
           {
               Document_Detail r=new Document_Detail(rs.getInt(1),rs.getString(2),rs.getInt(3),
                                                     rs.getInt(4),rs.getString(5),rs.getString(6),
                                                     rs.getInt(7),rs.getString(8),rs.getInt(9),
                                                     rs.getInt(10),rs.getInt(11),rs.getString(12),
                                                     rs.getInt(13));
               return r;
           }
           pstmt.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Document_Detail searchTmpNo(String Dou_TmpNo) {
        try {
            String SQL="Select * From Document_Detail Where Dou_TmpNo = ?";
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setString(1, Dou_TmpNo);
            ResultSet rs = pstmt.executeQuery();

           if(rs.next())
           {
               Document_Detail r=new Document_Detail(rs.getInt(1),rs.getString(2),rs.getInt(3),
                                                     rs.getInt(4),rs.getString(5),rs.getString(6),
                                                     rs.getInt(7),rs.getString(8),rs.getInt(9),
                                                     rs.getInt(10),rs.getInt(11),rs.getString(12),
                                                     rs.getInt(13));
               return r;
           }
           pstmt.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Document_Detail> searchKeynote(String Dou_Keynote) {
        try {
            String SQL="Select * From Document_Detail Where Dou_Keynote = ?";
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setString(1, Dou_Keynote);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Document_Detail> result = new ArrayList<Document_Detail>();

           while(rs.next())
           {
               result.add(new Document_Detail(rs.getInt(1),rs.getString(2),rs.getInt(3),
                                              rs.getInt(4),rs.getString(5),rs.getString(6),
                                              rs.getInt(7),rs.getString(8),rs.getInt(9),
                                              rs.getInt(10),rs.getInt(11),rs.getString(12),
                                              rs.getInt(13)));

           }
           pstmt.close();
           return result;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public ArrayList<Document_Detail> searchAuthor(int Dou_Author) {
        try {
            String SQL="Select * From Document_Detail Where Dou_Author = ?";
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setInt(1, Dou_Author);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Document_Detail> result = new ArrayList<Document_Detail>();
            while ( rs.next() )
           {
               result.add(new Document_Detail(rs.getInt(1),rs.getString(2),rs.getInt(3),
                                              rs.getInt(4),rs.getString(5),rs.getString(6),
                                              rs.getInt(7),rs.getString(8),rs.getInt(9),
                                              rs.getInt(10),rs.getInt(11),rs.getString(12),
                                              rs.getInt(13)));

           }
           pstmt.close();
           return result;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Document_Detail> searchDraftByAuthor(int Dou_Author) {
        try {
            String SQL="Select * From Document_Detail Where Dou_Draft=1 and  Dou_Author = ?";
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setInt(1, Dou_Author);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Document_Detail> result = new ArrayList<Document_Detail>();
            while ( rs.next() )
           {
               result.add(new Document_Detail(rs.getInt(1),rs.getString(2),rs.getInt(3),
                                              rs.getInt(4),rs.getString(5),rs.getString(6),
                                              rs.getInt(7),rs.getString(8),rs.getInt(9),
                                              rs.getInt(10),rs.getInt(11),rs.getString(12),
                                              rs.getInt(13)));

           }
           pstmt.close();
           return result;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }



    @Override
    public ArrayList<Document_Detail> searchNoDraftByAuthor(int Dou_Author) {
        try {
            String SQL="Select * From Document_Detail Where Dou_Draft=0 and Dou_Author = ?";
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setInt(1, Dou_Author);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Document_Detail> result = new ArrayList<Document_Detail>();
            while ( rs.next() )
           {
               result.add(new Document_Detail(rs.getInt(1),rs.getString(2),rs.getInt(3),
                                              rs.getInt(4),rs.getString(5),rs.getString(6),
                                              rs.getInt(7),rs.getString(8),rs.getInt(9),
                                              rs.getInt(10),rs.getInt(11),rs.getString(12),
                                              rs.getInt(13)));

           }
           pstmt.close();
           return result;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }




    @Override
    public ArrayList<Document_Detail> searchData(String Dou_Date) {
        try {
            String SQL="Select * From Document_Detail Where Dou_Date = ?";
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setString(1,Dou_Date);
            ResultSet rs = pstmt.executeQuery();
            ArrayList<Document_Detail> result = new ArrayList<Document_Detail>();
           if(rs.next())
           {
               result.add(new Document_Detail(rs.getInt(1),rs.getString(2),rs.getInt(3),
                                              rs.getInt(4),rs.getString(5),rs.getString(6),
                                              rs.getInt(7),rs.getString(8),rs.getInt(9),
                                              rs.getInt(10),rs.getInt(11),rs.getString(12),
                                              rs.getInt(13)));

           }
           pstmt.close();
           return result;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }



}
