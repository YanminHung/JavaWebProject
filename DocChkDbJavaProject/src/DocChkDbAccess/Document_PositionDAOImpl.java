package DocChkDbAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 資料庫 - Position表操作實現
 * @author Bill Hung
 *
 */
public class Document_PositionDAOImpl implements Document_PositionDAO
{

    @Override
    public int add(Document_Position pos)
    {
        int result = 0;

        try {
            /* 查詢是否有相同職位名稱資料 */
            String SQL = "Select Pos_Title From Position Where Pos_Title = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, pos.getPosTitle() );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 需沒資料才可新增 */
            if ( ! rs.next() )
            {
                /* 新增Position資料 */
                SQL = "Insert Into Position ( Pos_Title, Pos_Emp_Id ) values( ?, ? )";

                pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

                /* 設定SQL語句中參數 */
                pstmt.setString( 1, pos.getPosTitle() );
                pstmt.setInt( 2, pos.getEmpolyeeID() );

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
    public int delete(Document_Position pos)
    {
        int result = 0;
        try {
            /* 新增Position資料 */
            String SQL = "Delete From Position Where Pos_Id = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, pos.getPosID() );

            /* 執行SQL語句 ，設定類使用Update*/
            pstmt.executeUpdate();

            pstmt.close();

            result = 1;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;

    }

    @Override
    public ArrayList<Document_Position> getPosDataFromEmpId(int EmpolyeeID)
    {
        try
        {
            String SQL = "Select * From Position Where Pos_Emp_Id = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, EmpolyeeID );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 建立Array List並將資料放入 */
            ArrayList<Document_Position> result = new ArrayList<Document_Position>();

            while ( rs.next() )
            {
                result.add( new Document_Position( rs.getInt(1),
                                                   rs.getString(2),
                                                   rs.getInt(3) ) );
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

    @Override
    public Document_Position getPosDataFromPosId(int PosID)
    {
        try {
            String SQL = "Select * From Position Where Pos_Id = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, PosID );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            if ( rs.next() )
            {
                Document_Position r;
                r = new Document_Position( rs.getInt(1),
                                           rs.getString(2),
                                           rs.getInt(3) );

                pstmt.close();

                return r;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Document_Position getPosDataFromPosTitle(String PosTitle)
    {
        try {
            String SQL = "Select * From Position Where Pos_Title = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, PosTitle );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            if ( rs.next() )
            {
                Document_Position r;
                r = new Document_Position( rs.getInt(1),
                                           rs.getString(2),
                                           rs.getInt(3) );

                pstmt.close();

                return r;
            }


      } catch (SQLException e) {
          e.printStackTrace();
      }
      return null;
    }

    @Override
    public int updatePosEmpId(String PosTitle, int EmpolyeeID)
    {
        try {
            String SQL = "Update Position Set Pos_Emp_Id = ? where Pos_Title = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, EmpolyeeID );
            pstmt.setString( 2, PosTitle );

            /* 執行SQL語句 ，設定類使用Update*/
            pstmt.executeUpdate();

            pstmt.close();

            return 1;


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;

    }

    @Override
    public ArrayList<Document_Position> getAll()
    {
        try
        {
            String SQL = "Select * From Position";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 建立Array List並將資料放入 */
            ArrayList<Document_Position> result = new ArrayList<Document_Position>();

            while ( rs.next() )
            {
                result.add( new Document_Position( rs.getInt(1),
                                                   rs.getString(2),
                                                   rs.getInt(3) ) );
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

    @Override
    public int addNewTitle(String TitleName)
    {
        int result = 0;

        try {
            /* 查詢是否有相同職位名稱資料 */
            String SQL = "Select Pos_Title From Position Where Pos_Title = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, TitleName );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 需沒資料才可新增 */
            if ( ! rs.next() )
            {
                /* 新增Position資料 */
                SQL = "Insert Into Position ( Pos_Title ) values( ? )";

                pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

                /* 設定SQL語句中參數 */
                pstmt.setString( 1, TitleName );

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
    public ArrayList<Document_Position> getAllWithoutNullEmpId()
    {
        try
        {
            String SQL = "Select * From Position Where (Pos_Emp_Id > 0)";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 建立Array List並將資料放入 */
            ArrayList<Document_Position> result = new ArrayList<Document_Position>();

            while ( rs.next() )
            {
                result.add( new Document_Position( rs.getInt(1),
                                                   rs.getString(2),
                                                   rs.getInt(3) ) );
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
