package DocChkDbAccess;

/**
 * 資料表Depart基本類別
 * @author Bill Hung
 *
 */
public class Document_Depart
{
    private int DepartId;
    private String DepartName;

    /**
     * 抓取資料時使用
     * @param DepartId    部門 PK值
     * @param DepartName  部門名稱
     */
    Document_Depart( int DepartId, String DepartName )
    {
        this.DepartId = DepartId;
        this.DepartName = DepartName;
    }

    /**
     * 設定資料時使用
     * @param DepartName  部門名稱
     */
    Document_Depart( String DepartName )
    {
        this.DepartName = DepartName;
    }

    /**
     * 取得部門名稱
     * @return 部門名稱
     */
    public String getDepartName()
    {
        return DepartName;
    }

    /**
     * 設定部門名稱
     * @param departName 部門名稱
     */
    public void setDepartName(String departName)
    {
        DepartName = departName;
    }

    /**
     * 取得部門PK值
     * @return 部門PK值
     */
    public int getDepartId()
    {
        return DepartId;
    }


}
