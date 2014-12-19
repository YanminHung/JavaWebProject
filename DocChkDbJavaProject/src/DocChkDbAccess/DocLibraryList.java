package DocChkDbAccess;
/**
 * 文件簽核系統 -歷史紀錄清單
 * @author Judith Chou
 *
 */
public class DocLibraryList {
    private int    Lib_Id;        //流水號
    private int    Lib_TmpId;     //暫時文號
    private String Lib_DocNo;     //文號
    private int    Lib_SetTop;    //1:置頂 0:預設
    private int    Dou_Type;      //文件類型
    private int    Dou_Speed;     //件速
    private String Dou_Keynote;   //主旨
    private int    Dou_Author;    //員工代號
    private String Emp_Name ;     //員工姓名
    private String Dou_Content;   //說明
    private String Emp_Depart ;   //部門
    private String Dou_Date ;     //文件日期
    private int    Dou_FlowType;  //簽核類型

    /**
     * 查詢內容
     * @param DTmpId     暫時文號
     * @param DDocNo     文號
     * @param DSetTop    1:置頂 0:預設
     * @param DType      文件類型
     * @param DSpeed     件速
     * @param DKeynote   主旨
     * @param DAuthor    員工代號
     * @param DName      員工姓名
     * @param DContent   說明
     * @param DDepart    部門
     * @param DDate      文件日期
     * @param DFlowType  簽核類型
     */
    public DocLibraryList(
            int     DId,
            int     DTmpId,
            String  DDocNo,
            int     DSetTop,
            int     DType,
            int     DSpeed,
            String  DKeynote,
            int     DAuthor,
            String  DName,
            String  DContent,
            String  DDepart,
            String  DDate,
            int     DFlowType)
    {
                this.Lib_Id=DId ;
                this.Lib_TmpId=DTmpId ;
                this.Lib_DocNo=DDocNo ;
                this.Lib_SetTop=DSetTop;
                this.Dou_Type=DType;
                this.Dou_Speed=DSpeed;
                this.Dou_Keynote=DKeynote;
                this.Dou_Author=DAuthor;
                this.Emp_Name=DName;
                this.Dou_Content=DContent;
                this.Emp_Depart=DDepart;
                this.Dou_Date=DDate;
                this.Dou_FlowType=DFlowType;

    }

    //新增空白結構式
    public DocLibraryList(){}

    public int getLib_Id() {
        return Lib_Id;
    }

    public int getLib_TmpId() {
        return Lib_TmpId;
    }

    public String getLib_DocNo() {
        return Lib_DocNo;
    }

    public int getLib_SetTop() {
        return Lib_SetTop;
    }

    public int getDou_Type() {
        return Dou_Type;
    }
    public int getDou_Speed() {
        return Dou_Speed;
    }

    public String getDou_Keynote() {
        return Dou_Keynote;
    }


    public int getDou_Author() {
        return Dou_Author;
    }

    public String getEmp_Name() {
        return Emp_Name;
    }

    public String getDou_Content() {
        return Dou_Content;
    }

    public String getEmp_Depart() {
        return Emp_Depart;
    }

    public String getDou_Date() {
        return Dou_Date;
    }

    public int getDou_FlowType() {
        return Dou_FlowType;
    }

}
