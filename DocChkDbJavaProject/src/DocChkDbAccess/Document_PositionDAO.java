package DocChkDbAccess;

import java.util.ArrayList;

/**
 * 資料庫 - Position表操作介面
 * @author Bill Hung
 *
 */
public interface Document_PositionDAO{
    /**
     * 新增職務，Position.PosID不必給值，由資料庫分配
     * @param pos 待新增之Position資料
     * @return 1:新增成功；0:失敗
     */
    public int add( Document_Position pos );

    /**
     * 新增職務名
     * @param TitleName 職務名
     * @return 1:新增成功；0:失敗
     */
    public int addNewTitle( String TitleName );

    /**
     * 刪除職務
     * @param pos 待刪除之Position資料
     * @return 1:變更成功；0:失敗
     */
    public int delete( Document_Position pos );

    /**
     * 透過 EmpolyeeID取得Position
     * @param EmpolyeeID 員工資料表之PK值
     * @return 以ArrayList方式傳回Document_Position
     */
    public ArrayList< Document_Position > getPosDataFromEmpId( int EmpolyeeID );

    /**
     * 透過 PosID取得Position
     * @param PosID 職務表之PK職
     * @return Document_Position資料
     */
    public Document_Position getPosDataFromPosId( int PosID );

    /**
     * 透過 PosTitle取得Position
     * @param PosTitle 職位名稱
     * @return Document_Position資料
     */
    public Document_Position getPosDataFromPosTitle( String PosTitle );

    /**
     * 透過PosTitle變更職務人員
     * @param PosTitle   職位名稱
     * @param EmpolyeeID 員工資料表之PK值
     * @return 1:變更成功；0:失敗
     */
    public int updatePosEmpId( String PosTitle, int EmpolyeeID );

    /**
     * 取得所有職位資料
     * @return 以ArrayList方式傳回Document_Position
     */
    public ArrayList< Document_Position > getAll();

    /**
     * 取出所有職位資料，但不包含Pos_Emp_Id為0或NULL的資料
     * @return 以ArrayList方式傳回Document_Position
     */
    public ArrayList< Document_Position > getAllWithoutNullEmpId();
}
