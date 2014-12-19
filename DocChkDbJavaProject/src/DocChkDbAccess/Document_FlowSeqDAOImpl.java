package DocChkDbAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 資料庫 - Document_FlowSeq表操作實現
 * @author Bill Hung
 */
public class Document_FlowSeqDAOImpl implements Document_FlowSeqDAO
{
    /**
     * 檢查FlowType是否全一致及步驟序號是否正確
     * @param FlowSeq 流程步驟清單
     * @return true or false
     */
    private boolean isSameFlowType( Document_FlowSeq[] FlowSeq )
    {
        boolean result = true;

        /* 檢查FlowType是否全一致 */
        for( int i = 1; i < FlowSeq.length; i++ )
        {
            System.out.println( FlowSeq[ 0 ].getFlowType() + "  " +
                                FlowSeq[ i ].getFlowType() );

            /* 不一致則回報錯誤並停止For迴圈 */
            if( FlowSeq[ 0 ].getFlowType() != FlowSeq[ i ].getFlowType() )
            {
                result = false;

                break;
            }
        }

        /* 檢查FlowSeq是否有重複 */
        for( int i = 0; i < FlowSeq.length; i++ )
        {
            System.out.println( "seq=" + i + " " +
                                FlowSeq[ i ].getFlowSeq() );

            if( FlowSeq[ i ].getFlowSeq() != ( i + 1 ) )
            {
                result = false;

                break;
            }
        }

        return result;
    }

    @Override
    public int add(Document_FlowSeq[] FlowSeq)
    {
        int result = 0;

        /* 檢查FlowType是否全一致 */
        if( isSameFlowType( FlowSeq ) )
        {
            try {
                /* 查詢是否有相同流程名稱資料 */
                String SQL = "Select Flow_Type From Document_FlowSeq Where Flow_Type = ?";

                /* 連結資料庫 */
                PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

                /* 設定SQL語句中參數 */
                pstmt.setInt( 1, FlowSeq[ 0 ].getFlowType() );

                /* 執行SQL語句 ，查詢類使用Query*/
                ResultSet rs = pstmt.executeQuery();

                /* 需沒資料才可新增 */
                if ( ! rs.next() )
                {
                    /* 新增FlowType資料 */
                    SQL = "Insert Into Document_FlowSeq ( Flow_Type, Flow_Seq, Flow_Pos_Id ) values( ?, ?, ? )";

                    pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

                    for( Document_FlowSeq o : FlowSeq )
                    {
                        /* 設定SQL語句中參數 */
                        pstmt.setInt( 1, o.getFlowType() );
                        pstmt.setInt( 2, o.getFlowSeq() );
                        pstmt.setInt( 3, o.getFlowPosId() );

                        /* 執行SQL語句 ，設定類使用Update*/
                        pstmt.executeUpdate();
                    }

                    pstmt.close();

                    result = 1;
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    @Override
    public int delete(int FlowType)
    {
        int result = 0;

        try {
            /* 新增Position資料 */
            String SQL = "Delete From Document_FlowSeq Where Flow_Type = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, FlowType );

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
    public Integer[] getAllFlowTypeByPosId(int PositionID)
    {
        try
        {
            /* 搜尋該職位需簽核的流程 */
            String SQL = "Select Flow_Type From Document_FlowSeq Where Flow_Pos_Id = ? Group by Flow_Type";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, PositionID );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 建立Array List並將資料放入 */
            ArrayList<Integer> result = new ArrayList<Integer>();

            while ( rs.next() )
            {
                result.add( rs.getInt(1) );
            }

            pstmt.close();

            return result.toArray( new Integer[0] );

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public ArrayList<Document_FlowSeq> getAll(int FlowType)
    {
        try
        {
            String SQL = "Select * From Document_FlowSeq Where Flow_Type = ?";

            /* 連結資料庫 */
            PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement( SQL );

            /* 設定SQL語句中參數 */
            pstmt.setInt( 1, FlowType );

            /* 執行SQL語句 ，查詢類使用Query*/
            ResultSet rs = pstmt.executeQuery();

            /* 建立Array List並將資料放入 */
            ArrayList<Document_FlowSeq> result = new ArrayList<Document_FlowSeq>();

            while ( rs.next() )
            {
                result.add( new Document_FlowSeq( rs.getInt(2),
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

}
