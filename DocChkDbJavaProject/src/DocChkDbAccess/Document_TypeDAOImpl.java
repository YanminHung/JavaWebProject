package DocChkDbAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Document_TypeDAOImpl implements Document_TypeDAO
{
    @Override
    public int add(String DocTypeName)
    {
        int result = 0;

        try {
            /* 查詢是否有相同職位名稱資料 */
            String SQL = "Select * From Document_Type Where DocType_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, DocTypeName );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 需沒資料才可新增 */
            if ( ! rs.next() )
            {
                /* 新增Position資料 */
                SQL = "Insert Into Document_Type ( DocType_Name ) values( ? )";

                pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

                /* 設定SQL語句中參數 */
                pstmt.setString( 1, DocTypeName );

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
    public Document_Type getDocType(String DocTypeName)
    {
        try {
            String SQL = "Select * From Document_Type Where DocType_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, DocTypeName );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            if ( rs.next() )
            {
                Document_Type r;
                r = new Document_Type( rs.getInt(1),
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
    public int updateDocTypeName(String OldDocTypeName, String NewDocTypeName)
    {
        int result = 0;

        try
        {
            /* 查詢是否有相同流程名稱資料 */
            String SQL = "Select DocType_Name From Document_Type Where DocType_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, NewDocTypeName );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 需沒資料才可新增 */
            if ( ! rs.next() )
            {
                /* 新增Position資料 */
                SQL = "Update Document_Type Set DocType_Name = ? where DocType_Name = ?";

                /* 連結資料庫 */
                pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

                /* 設定SQL語句中參數 */
                pstmt.setString( 1, NewDocTypeName );
                pstmt.setString( 2, OldDocTypeName );

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
    public ArrayList<Document_Type> getAll()
    {
        try
        {
            String SQL = "Select * From Document_Type";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 建立Array List並將資料放入 */
            ArrayList<Document_Type> result = new ArrayList<Document_Type>();

            while ( rs.next() )
            {
                result.add( new Document_Type( rs.getInt(1),
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
