package DocChkDbAccess;

import java.util.ArrayList;

/**
 * 資料表Depart操作介面
 * @author Bill Hung
 *
 */
public interface Document_DepartDAO
{
    /**
     * 新增部門
     * @param Depart Name
     * @return 1:新增成功；0:失敗
     */
    public int add( String DepartName );

    /**
     * 取得部門類別結構
     * @param DepartName Depart Name
     * @return 文件種類類別
     */
    public Document_Depart getDepart( String DepartName );

    /**
     * 變更Depart名
     * @param OldDepartName 舊Depart名
     * @param NewDepartName 新Depart名
     * @return 1:變更成功；0:失敗
     */
    public int updateDepartName( String OldDepartName, String NewDepartName );

    /**
     * 取得所有Depart
     * @return Depart清單
     */
    public ArrayList< Document_Depart > getAll();
}
