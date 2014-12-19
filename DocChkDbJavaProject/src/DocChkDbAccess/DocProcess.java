package DocChkDbAccess;
/**
 * 文件簽核系統 -簽核紀錄表
 * @author Judith Chou
 *
 */
public class DocProcess {
    public static final int Enable = 1;
    public static final int Disable = 0;

	private int    Proc_Id; //系統自動給號
	private int    Proc_TmpNo;     //暫存文號，簽核完成給正式文號
	private int    Proc_Flow_Type; //簽核類型
	private int    Proc_Flow_Seq;  //簽核序號
	private int    Proc_Flow_Max;   //簽核筆數
	private int    Proc_Emp_Id;      //簽核者員工代號
	private String Proc_CheckD;   //簽核時間
	private int    Proc_BreakOff;   //簽核狀態
	private int    Proc_CheckFlag; //是否往下簽核

	public DocProcess(int pn,int pt,int ps,int pm,int pe, int cf)
    {
	    this.Proc_TmpNo = pn;
        this.Proc_Flow_Type=pt; //簽核類型
        this.Proc_Flow_Seq=ps;  //簽核序號
        this.Proc_Flow_Max=pm;   //簽核筆數
        this.Proc_Emp_Id=pe;      //簽核者員工代號

        if( cf == Enable )
        {
            this.Proc_CheckFlag=Enable;
        }
        else
        {
            this.Proc_CheckFlag=Disable;
        }
    }

	public DocProcess(int pn,int pt,int ps,int pm,int pe,String date, int boff, int cf)
    {
        this.Proc_TmpNo = pn;
        this.Proc_Flow_Type=pt; //簽核類型
        this.Proc_Flow_Seq=ps;  //簽核序號
        this.Proc_Flow_Max=pm;   //簽核筆數
        this.Proc_Emp_Id=pe;      //簽核者員工代號
        this.Proc_CheckD=date;
        this.Proc_BreakOff=boff;
        this.Proc_CheckFlag=cf;
    }

    public int getProc_Id() {
        return this.Proc_Id;
    }

    public int getProc_TmpNo() {
        return this.Proc_TmpNo;
    }


    public int getProc_Flow_Type() {
         return this.Proc_Flow_Type;
    }


    public int getProc_Flow_Seq() {
        return this.Proc_Flow_Seq;
    }


    public int getProc_Flow_Max() {
        return this.Proc_Flow_Max;
    }


    public int getProc_Emp_Id() {
        return this.Proc_Emp_Id;
    }


    public String getProc_CheckD() {
        return this.Proc_CheckD;
    }

    public int getProc_BreakOff() {
        return this.Proc_BreakOff;
    }

    public int getProc_CheckFlag() {
        return this.Proc_CheckFlag;
    }

}
