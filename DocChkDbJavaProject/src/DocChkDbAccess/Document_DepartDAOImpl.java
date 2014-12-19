package DocChkDbAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Document_DepartDAOImpl implements Document_DepartDAO
{
    @Override
    public int add(String DepartName)
    {
        int result = 0;

        try {
            /* 查詢是否有相同職位名稱資料 */
            String SQL = "Select * From Depart Where Depart_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, DepartName );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 需沒資料才可新增 */
            if ( ! rs.next() )
            {
                /* 新增Position資料 */
                SQL = "Insert Into Depart ( Depart_Name ) values( ? )";

                pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

                /* 設定SQL語句中參數 */
                pstmt.setString( 1, DepartName );

                /* 執行SQL語句 ，設定類使用Update*/
                pstmt.executeUpdate();

                pstmt.close();

                result = 1;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public Document_Depart getDepart(String DepartName)
    {
        try {
            String SQL = "Select * From Depart Where Depart_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, DepartName );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            if ( rs.next() )
            {
                Document_Depart r;
                r = new Document_Depart( rs.getInt(1),
                                         rs.getString(2) );

                pstmt.close();

                return r;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int updateDepartName(String OldDepartName, String NewDepartName)
    {
        int result = 0;

        try
        {
            /* 查詢是否有相同流程名稱資料 */
            String SQL = "Select Depart_Name From Depart Where Depart_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, NewDepartName );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 需沒資料才可新增 */
            if ( ! rs.next() )
            {
                /* 新增Position資料 */
                SQL = "Update Depart Set Depart_Name = ? where Depart_Name = ?";

                /* 連結資料庫 */
                pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

                /* 設定SQL語句中參數 */
                pstmt.setString( 1, NewDepartName );
                pstmt.setString( 2, OldDepartName );

                /* 執行SQL語句 ，設定類使用Update*/
                pstmt.executeUpdate();

                pstmt.close();

                result = 1;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public ArrayList<Document_Depart> getAll()
    {
        try
        {
            String SQL = "Select * From Depart";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 建立Array List並將資料放入 */
            ArrayList<Document_Depart> result = new ArrayList<Document_Depart>();

            while ( rs.next() )
            {
                result.add( new Document_Depart( rs.getInt(1),
                                                 rs.getString(2) ) );
            }

            pstmt.close();

            return result;

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return null;
    }

}
