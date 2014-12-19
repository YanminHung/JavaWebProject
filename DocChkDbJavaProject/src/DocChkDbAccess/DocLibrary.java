package DocChkDbAccess;
/**
 * 文件簽核系統 -歷史紀錄表
 * @author Judith Chou
 *
 */
public class DocLibrary {


    private int Lib_Id; //流水號
    private int Lib_TmpId; //暫時文號
    private String Lib_DocNO; //正式文號
    private int Lib_SetTop; //1:置頂 0:預設

	/**
	 * 新增
	 * @param t 暫時文號
	 * @param d 正式文號
	 */
    public DocLibrary(int t,String d)
	{
		this.Lib_TmpId = t;
		this.Lib_DocNO = d;
	}
	/**
	 * 查詢
	 * @param i 暫時文號
	 * @param t 正式文號
	 * @param d 正式文號
	 * @param s 1:置頂 0:預設
	 */
    public DocLibrary(int i,int t,String d,int s)
	{
		this.Lib_Id=i;
		this.Lib_TmpId = t;
		this.Lib_DocNO = d;
		this.Lib_SetTop = s;
	}

    public int getLib_Id() {
        return this.Lib_Id;
    }

    public int getLib_TmpId() {
        return this.Lib_TmpId;
    }

    public String getLib_DocNO() {
        return this.Lib_DocNO;
    }

    public int getLib_SetTop() {
        return this.Lib_SetTop;
    }

}
