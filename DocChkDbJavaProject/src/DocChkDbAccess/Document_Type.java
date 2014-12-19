package DocChkDbAccess;

/**
 * 資料表Document_Type基本類別
 * @author Bill Hung
 *
 */
public class Document_Type
{
    private int TypeId;
    private String TypeName;

    /**
     * 抓取資料時使用
     * @param TypeId    Type PK值
     * @param TypeName  文件類別名稱
     */
    public Document_Type( int TypeId, String TypeName )
    {
        this.TypeId = TypeId;
        this.TypeName = TypeName;
    }

    /**
     * 設定資料時使用
     * @param TypeName 文件類別名稱
     */
    public Document_Type( String TypeName )
    {
        this.TypeName = TypeName;
    }

    /**
     * 取得文件類別名稱
     * @return 文件類別名稱
     */
    public String getTypeName()
    {
        return this.TypeName;
    }

    /**
     * 設定文件類別名稱
     * @param typeName 文件類別名稱
     */
    public void setTypeName(String typeName)
    {
        this.TypeName = typeName;
    }

    /**
     * 取得文件類別PK值
     * @return 文件類別PK值
     */
    public int getTypeId()
    {
        return this.TypeId;
    }


}
