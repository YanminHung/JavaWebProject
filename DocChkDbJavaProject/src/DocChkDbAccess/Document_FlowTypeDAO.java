package DocChkDbAccess;

import java.util.ArrayList;

/**
 * 資料庫 - Document_FlowType表操作介面
 * @author Bill Hung
 *
 */
public interface Document_FlowTypeDAO {

    /**
     * 新增FlowType，Document_FlowType.FlowType不必給值，由資料庫分配
     * @param FlowTypeData 待新增之FlowType資料
     * @return 1:變更成功；0:失敗
     */
    public int add( Document_FlowType FlowTypeData );

    /**
     * 刪除FlowType
     * @param FlowTypeData 待刪除之FlowType資料
     * @return 1:變更成功；0:失敗
     */
    public int delete( Document_FlowType FlowTypeData );

    /**
     * 依FlowTypeName取出正確資料
     * @param FlowTypeName Flow名稱
     * @return 完整FlowType資料
     */
    public Document_FlowType getFlowType( String FlowTypeName );

    /**
     * 依FlowTypeID取出正確資料
     * @param FlowTypeName Flow名稱
     * @return 完整FlowType資料
     */
    public Document_FlowType getFlowTypeById( int FlowType );

    /**
     * 啟動FlowTypeName所指流程
     * @param FlowTypeName Flow名稱
     * @return 1:變更成功；0:失敗
     */
    public int enableFlowType( String FlowTypeName );

    /**
     * 停止FlowTypeName所指流程
     * @param FlowTypeName Flow名稱
     * @return 1:變更成功；0:失敗
     */
    public int disableFlowType( String FlowTypeName );

    /**
     * 變更FlowTypeName
     * @param OldName 舊Flow名稱
     * @param NewName 新Flow名稱
     * @return 1:變更成功；0:失敗
     */
    public int updateFlowTypeName( String OldName, String NewName );

    /**
     * 取得資料庫所有Flow資料
     * @return 完整FlowType資料
     */
    public ArrayList< Document_FlowType > getAll();

    /**
     * 取得資料庫所有啟動的Flow資料
     * @return 完整FlowType資料
     */
    public ArrayList< Document_FlowType > getAllEnableFlow();
}
