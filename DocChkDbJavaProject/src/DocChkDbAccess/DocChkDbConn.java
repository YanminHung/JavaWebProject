package DocChkDbAccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 文件簽核系統 - 資料庫連線類別
 * @author Bill Hung
 *
 */
public class DocChkDbConn
{
    private final static String connectionUrl =
            "jdbc:sqlserver://localhost:1433;databaseName=Document;user=sa;password=12345678";

    private static Connection con = null;

//    static String connectionUrl = "jdbc:sqlserver://192.168.0.86:1433;" +
//            "databaseName=Document;user=sa;password=5566";

    /**
     * 建立資料庫連線，若已連線則提供舊有資源
     * @return Connection類別資料
     */
    static public Connection GetConnect()
    {
        /* 檢查連線是否已被建立，是則使用舊連線 */
        if( con != null )
        {
            //System.out.println( "UseOld" );
            return con;
        }

        /* 建立DB連線 */
        //System.out.println( "UseNew" );
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            con = DriverManager.getConnection( connectionUrl );

            return con;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            con = null;

            e.printStackTrace();
        }
        catch (ClassNotFoundException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 關閉資料庫連線
     */
    static public void CloseConnect()
    {
        /* 在已連線狀況下才斷開連線 */
        if( con != null )
        {
            try
            {
                con.close();
            }
            catch (SQLException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
