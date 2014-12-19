package DocChkDbAccess;

/**
 * 資料庫 - Document_FlowSeq基本類別(簽核流程細項表)
 * @author Bill Hung
 *
 */
public class Document_FlowSeq {
    private int FlowType;
    private int FlowSeq;
    private int FlowPosId;

    /**
     * 建立FlowSeq資料
     * @param FlowType   流程名PK值
     * @param FlowSeq    流程序號
     * @param FlowPosId  處理職階，對應職務表PK值
     */
    public Document_FlowSeq( int FlowType, int FlowSeq, int FlowPosId )
    {
        this.FlowType = FlowType;
        this.FlowSeq = FlowSeq;
        this.FlowPosId = FlowPosId;
    }

    /**
     * 取得流程名PK值
     * @return 流程名PK值
     */
    public int getFlowType()
    {
        return this.FlowType;
    }

    /**
     * 取得流程序號
     * @return 取得流程序號
     */
    public int getFlowSeq()
    {
        return this.FlowSeq;
    }

    /**
     * 設定流程序號
     * @param FlowSeq 流程序號
     */
    public void setFlowSeq( int FlowSeq )
    {
        this.FlowSeq = FlowSeq;
    }

    /**
     * 取得簽核職務ID，對應職務表PK值
     * @return 職務ID，對應職務表PK值
     */
    public int getFlowPosId()
    {
        return this.FlowPosId;
    }

    /**
     * 設定簽核職務ID，對應職務表PK值
     * @param FlowPosId 職務ID，對應職務表PK值
     */
    public void setFlowPosId( int FlowPosId )
    {
        this.FlowPosId = FlowPosId;
    }

}
