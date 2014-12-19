package DocChkDbAccess;

/**
 * 資料庫 - Document_Position基本類別(職務表)
 * @author Bill Hung
 *
 */
public class Document_Position {
    private int PosID;
    private int EmpolyeeID;
    private String PosTitle;

    /**
     * 建立Position資料，讀取時使用
     * @param PosId       Position - PK值
     * @param PosTitle    職位名稱
     * @param EmpolyeeID  人員，對應人員資料表PK值
     */
    public Document_Position( int PosId, String PosTitle, int EmpolyeeID )
    {
        this.PosID = PosId;
        this.EmpolyeeID = EmpolyeeID;
        this.PosTitle = PosTitle;
    }
    
    /**
     * 建立Position資料，新增資料使用
     * @param PosTitle    職位名稱
     * @param EmpolyeeID  人員，對應人員資料表PK值
     */
    public Document_Position( String PosTitle, int EmpolyeeID )
    {
        this.PosID = 0;
        this.PosTitle = PosTitle;
        this.EmpolyeeID = EmpolyeeID;
    }
    
    /**
     * 取得職務 - PK值
     * @return 職務 - PK值
     */
    public int getPosID()
    {
        return this.PosID;
    }
    
    /**
     * 取得人員，對應人員資料表PK值
     * @return 人員資料表PK值
     */
    public int getEmpolyeeID()
    {
        return this.EmpolyeeID;
    }
    
    /**
     * 取得職位名稱
     * @return 職位名稱
     */
    public String getPosTitle()
    {
        return this.PosTitle;
    }
}
