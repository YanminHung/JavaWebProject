package DocChkDbAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 * 資料庫 - Document_FlowType表操作實現
 * @author BillHung
 */
public class Document_FlowTypeDAOImpl implements Document_FlowTypeDAO
{

    @Override
    public int add(Document_FlowType FlowTypeData)
    {
        int result = 0;

        try {
            /* 查詢是否有相同流程名稱資料 */
            String SQL = "Select Flow_Name From Document_FlowType Where Flow_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, FlowTypeData.getFlowName() );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 需沒資料才可新增 */
            if ( ! rs.next() )
            {
                /* 新增FlowType資料 */
                SQL = "Insert Into Document_FlowType ( Flow_Name, Flow_Max, Flow_Enable ) values( ?, ?, ? )";

                pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

                /* 設定SQL語句中參數 */
                pstmt.setString( 1, FlowTypeData.getFlowName() );
                pstmt.setInt( 2, FlowTypeData.getFlowMax() );
                pstmt.setInt( 3, FlowTypeData.getFlowEnable() );

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
    public int delete(Document_FlowType FlowTypeData)
    {
        int result = 0;

        try {
            /* 新增Position資料 */
            String SQL = "Delete From Document_FlowType Where Flow_Type = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, FlowTypeData.getFlowType() );

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
    public Document_FlowType getFlowType(String FlowTypeName)
    {
        try {
            String SQL = "Select * From Document_FlowType Where Flow_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, FlowTypeName );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            if ( rs.next() )
            {
                Document_FlowType r;
                r = new Document_FlowType( rs.getInt(1),
                                           rs.getString(2),
                                           rs.getInt(3),
                                           rs.getInt(4) );

                pstmt.close();

                return r;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int enableFlowType(String FlowTypeName)
    {
        int result = 0;

        try {
            /* 新增Position資料 */
            String SQL = "Update Document_FlowType Set Flow_Enable = ? where Flow_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, Document_FlowType.Enable );
            pstmt.setString( 2, FlowTypeName );

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
    public int disableFlowType(String FlowTypeName)
    {
        int result = 0;

        try {
            /* 新增Position資料 */
            String SQL = "Update Document_FlowType Set Flow_Enable = ? where Flow_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, Document_FlowType.Disable );
            pstmt.setString( 2, FlowTypeName );

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
    public int updateFlowTypeName(String OldName, String NewName)
    {
        int result = 0;

        try {
            /* 查詢是否有相同流程名稱資料 */
            String SQL = "Select Flow_Name From Document_FlowType Where Flow_Name = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setString( 1, NewName );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 需沒資料才可新增 */
            if ( ! rs.next() )
            {
                /* 新增Position資料 */
                SQL = "Update Document_FlowType Set Flow_Name = ? where Flow_Name = ?";

                /* 連結資料庫 */
                pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

                /* 設定SQL語句中參數 */
                pstmt.setString( 1, NewName );
                pstmt.setString( 2, OldName );

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
    public ArrayList<Document_FlowType> getAll()
    {
        try
        {
            String SQL = "Select * From Document_FlowType";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 建立Array List並將資料放入 */
            ArrayList<Document_FlowType> result = new ArrayList<Document_FlowType>();

            while ( rs.next() )
            {
                result.add( new Document_FlowType( rs.getInt(1),
                                                   rs.getString(2),
                                                   rs.getInt(3),
                                                   rs.getInt(4) ) );
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
    public ArrayList<Document_FlowType> getAllEnableFlow()
    {
        try
        {
            String SQL = "Select * From Document_FlowType Where Flow_Enable = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, Document_FlowType.Enable );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 建立Array List並將資料放入 */
            ArrayList<Document_FlowType> result = new ArrayList<Document_FlowType>();

            while ( rs.next() )
            {
                result.add( new Document_FlowType( rs.getInt(1),
                                                   rs.getString(2),
                                                   rs.getInt(3),
                                                   rs.getInt(4) ) );
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
    public Document_FlowType getFlowTypeById(int FlowType)
    {
        try {
            String SQL = "Select * From Document_FlowType Where Flow_Type = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, FlowType );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            if ( rs.next() )
            {
                Document_FlowType r;
                r = new Document_FlowType( rs.getInt(1),
                                           rs.getString(2),
                                           rs.getInt(3),
                                           rs.getInt(4) );

                pstmt.close();

                return r;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
