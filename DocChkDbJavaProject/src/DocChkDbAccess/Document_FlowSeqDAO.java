package DocChkDbAccess;

import java.util.ArrayList;

/**
 * 資料庫 - Document_FlowSeq表操作介面
 * @author Bill Hung
 *
 */
public interface Document_FlowSeqDAO
{
    /**
     * 新增Document_FlowSeq，一次增加完整流程資料(同一FlowType)
     * @param FlowSeq 完整的流程資料
     * @return 1:變更成功；0:失敗
     */
    public int add( Document_FlowSeq[] FlowSeq );

    /**
     * 刪除FlowType所有步驟
     * @param FlowType FlowType表PK值
     * @return 1:變更成功；0:失敗
     */
    public int delete( int FlowType );

    /* 取出PositionID所有的FlowType */
    /**
     * 取出所有含有PositionID的FlowType
     * @param PositionID 職位表PK值
     * @return 回傳所有的FlowType PK值
     */
    public Integer[] getAllFlowTypeByPosId( int PositionID );

    /**
     * 取出FlowType所有步驟
     * @param FlowType FlowType PK值
     * @return FlowType所指定的所有步驟
     */
    public ArrayList< Document_FlowSeq > getAll( int FlowType );
}
