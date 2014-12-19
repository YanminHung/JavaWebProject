package DocChkDbAccess;

/**
 * 資料庫 - Document_FlowType基本類別(簽核流程名稱表)
 * @author Bill Hung
 *
 */
public class Document_FlowType {

    public static final int Enable = 1;
    public static final int Disable = 0;

    private int FlowType;
    private String FlowName;
    private int FlowMax;

    /* 規定FlowEnable只有Enable及Disable兩種狀態 */
    private int FlowEnable;

    /**
     * 建立FlowType資料，讀取時使用
     * @param FlowType    FlowType - PK值
     * @param FlowName    簽核流程名
     * @param FlowMax     簽核流程最大步驟數
     * @param FlowEnable  簽核流程啟動旗標
     */
    public Document_FlowType( int FlowType, String FlowName, int FlowMax, int FlowEnable )
    {
        this.FlowType = FlowType;
        this.FlowName = FlowName;
        this.FlowMax = FlowMax;
        setFlowEnable( FlowEnable );
    }

    /**
     * 建立FlowType資料，新增資料使用
     * @param FlowName    簽核流程名
     * @param FlowMax     簽核流程最大步驟數
     * @param FlowEnable  簽核流程啟動旗標
     */
    public Document_FlowType( String FlowName, int FlowMax, int FlowEnable )
    {
        this.FlowName = FlowName;
        this.FlowMax = FlowMax;
        setFlowEnable( FlowEnable );
    }

    /**
     * 取得FlowType - PK值
     * @return FlowType - PK值
     */
    public int getFlowType()
    {
        return this.FlowType;
    }

    /**
     * 取得簽核流程名
     * @return 簽核流程名
     */
    public String getFlowName()
    {
        return this.FlowName;
    }

    /**
     * 設定簽核流程名
     * @param FlowName 簽核流程名
     */
    public void setFlowName( String FlowName )
    {
        this.FlowName = FlowName;
    }

    /**
     * 取得簽核流程最大步驟數
     * @return 簽核流程最大步驟數
     */
    public int getFlowMax()
    {
        return this.FlowMax;
    }

    /**
     * 設定簽核流程最大步驟數
     * @param FlowMax 簽核流程最大步驟數
     */
    public void setFlowMax( int FlowMax )
    {
        this.FlowMax = FlowMax;
    }

    /**
     * 取得簽核流程啟動旗標狀態
     * @return 簽核流程啟動旗標狀態
     */
    public int getFlowEnable()
    {
        return FlowEnable;
    }

    /**
     * 設定簽核流程啟動旗標狀態
     * @param FlowEnable 簽核流程啟動旗標狀態，輸入參數分別為:
     *                   <p>1. Document_FlowType.Enable</p>
     *                   <p>2. Document_FlowType.Disable</p>
     */
    public void setFlowEnable( int FlowEnable )
    {
        if( Enable == FlowEnable )
        {
            this.FlowEnable = Enable;
        }
        else
        {
            this.FlowEnable = Disable;
        }
    }
}
