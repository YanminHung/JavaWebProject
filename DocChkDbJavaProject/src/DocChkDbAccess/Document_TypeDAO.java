package DocChkDbAccess;

import java.util.ArrayList;

/**
 * Document_Type表操作介面
 * @author Bill Hung
 *
 */
public interface Document_TypeDAO
{
    /**
     * 新增文件類別
     * @param DocTypeName
     * @return 1:新增成功；0:失敗
     */
    public int add( String DocTypeName );

    /**
     * 取得文件種類類別結構
     * @param DocTypeName 文件類別名稱
     * @return 文件種類類別
     */
    public Document_Type getDocType( String DocTypeName );

    /**
     * 變更文件種類名
     * @param OldDocTypeName 舊文件種類名
     * @param NewDocTypeName 新文件種類名
     * @return 1:變更成功；0:失敗
     */
    public int updateDocTypeName( String OldDocTypeName, String NewDocTypeName );

    /**
     * 取得所有文件種類
     * @return 文件種類清單
     */
    public ArrayList< Document_Type > getAll();
}
