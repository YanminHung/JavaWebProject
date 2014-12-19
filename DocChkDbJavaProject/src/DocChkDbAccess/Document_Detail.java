package DocChkDbAccess;
/**
 *
 * @author 彭治堯
 *
 */
public class Document_Detail {
    private int Dou_No;
    private String Dou_TmpNo;
    private int Dou_Type;
    private int Dou_Speed;
    private String Dou_Keynote;
    private String Dou_Content;
    private int Dou_Author;
    private String Dou_Date;
    private int Dou_Flow;
    private int Status;
    private int Dou_IsHistoryCheck;
    private String Dou_Link;
    private int Dou_Draft;
    /**
     *
     * @param Dou_TmpNo     流水號
     * @param Dou_Type      文號
     * @param Dou_Speed     急不急件
     * @param Dou_Keynote   主旨
     * @param Dou_Content   內容
     * @param Dou_Author    作者
     * @param Dou_Date      日期
     * @param Dou_Flow      簽核人員
     * @param Status        狀態
     * @param Dou_IsHistory 是否點過  1:點過  0:沒點
     * @param Dou_Link      附件
     */

    /**
     * 建立資料 用的Method
     */
     public Document_Detail(String Dou_TmpNo,int Dou_Type,int Dou_Speed,String Dou_Keynote,
                String Dou_Content,int Dou_Author,String Dou_Date,int Dou_Flow,
                int Status,int Dou_IsHistory,String Dou_Link,int Dou_Draft)
     {
         this.Dou_TmpNo=Dou_TmpNo;
         this.Dou_Type=Dou_Type;
         this.Dou_Speed=Dou_Speed;
         this.Dou_Keynote=Dou_Keynote;
         this.Dou_Content=Dou_Content;
         this.Dou_Author=Dou_Author;
         this.Dou_Date=Dou_Date;
         this.Dou_Flow=Dou_Flow;
         this.Status=Status;
         this.Dou_IsHistoryCheck=Dou_IsHistory;
         this.Dou_Link=Dou_Link;
         this.Dou_Draft=Dou_Draft;
     }
    /**
     * 讀取資料庫
     */
    public Document_Detail(int Dou_No,String Dou_TmpNo,int Dou_Type,int Dou_Speed,String Dou_Keynote,
                    String Dou_Content,int Dou_Author,String Dou_Date,int Dou_Flow,
                    int Status,int Dou_IsHistory,String Dou_Link,int Dou_Draft)
    {
        this.Dou_No=Dou_No;
        this.Dou_TmpNo=Dou_TmpNo;
        this.Dou_Type=Dou_Type;
        this.Dou_Speed=Dou_Speed;
        this.Dou_Keynote=Dou_Keynote;
        this.Dou_Content=Dou_Content;
        this.Dou_Author=Dou_Author;
        this.Dou_Date=Dou_Date;
        this.Dou_Flow=Dou_Flow;
        this.Status=Status;
        this.Dou_IsHistoryCheck=Dou_IsHistory;
        this.Dou_Link=Dou_Link;
        this.Dou_Draft=Dou_Draft;
    }
    public Document_Detail(){}

    public int getDou_No()
    {
        return this.Dou_No;
    }
    public void setDou_No(int dou_No)
    {
        this.Dou_No = dou_No;
    }
    public String getDou_TmpNo()
    {
        return this.Dou_TmpNo;
    }
    public void setDou_TmpNo(String dou_TmpNo)
    {
        this.Dou_TmpNo = dou_TmpNo;
    }
    public int getDou_Type()
    {
        return this.Dou_Type;
    }
    public void setDou_Type(int dou_Type)
    {
        this.Dou_Type = dou_Type;
    }
    public int getDou_Speed()
    {
        return this.Dou_Speed;
    }
    public void setDou_Speed(int dou_Speed)
    {
        this.Dou_Speed = dou_Speed;
    }
    public String getDou_Keynote()
    {
        return this.Dou_Keynote;
    }
    public void setDou_Keynote(String dou_Keynote)
    {
        this.Dou_Keynote = dou_Keynote;
    }
    public String getDou_Content()
    {
        return this.Dou_Content;
    }
    public void setDou_Content(String dou_Content)
    {
        this.Dou_Content = dou_Content;
    }
    public int getDou_Author()
    {
        return this.Dou_Author;
    }
    public void setDou_Author(int dou_Author)
    {
        this.Dou_Author = dou_Author;
    }
    public String getDou_Date()
    {
        return this.Dou_Date;
    }
    public void setDou_Date(String dou_Date)
    {
        this.Dou_Date = dou_Date;
    }
    public int getDou_Flow()
    {
        return this.Dou_Flow;
    }
    public void setDou_Flow(int dou_Flow)
    {
        this.Dou_Flow = dou_Flow;
    }
    public int getStatus()
    {
        return this.Status;
    }
    public void setStatus(int status)
    {
        this.Status = status;
    }
    public int getDou_IsHistoryCheck()
    {
        return this.Dou_IsHistoryCheck;
    }
    public void setDou_IsHistoryCheck(int dou_IsHistoryCheck)
    {
        this.Dou_IsHistoryCheck = dou_IsHistoryCheck;
    }
    public String getDou_Link()
    {
        return this.Dou_Link;
    }
    public void setDou_Link(String dou_Link)
    {
        this.Dou_Link = dou_Link;
    }
    public int getDou_Draft()
    {
        return this.Dou_Draft;
    }
    public void setDou_Draft(int dou_Draft)
    {
        this.Dou_Draft = dou_Draft;
    }



    /**
     * 以下 Method 都是 Getter 直接取得  ， 因為用 Private 保護
     *
     */

    /*
	public int GetDou_No()
	{
	    return this.Dou_No;
	}
	public String GetDou_TmpNo()
    {
        return this.Dou_TmpNo;
    }
	public int GetDou_Type()
    {
        return this.Dou_Type;
    }
	public int GetDou_Speed()
    {
        return this.Dou_Speed;
    }
	public String GetDou_Keynote()
    {
        return this.Dou_Keynote;
    }
	public String GetDou_Content()
    {
        return this.Dou_Content;
    }
	public int GetDou_Author()
    {
        return this.Dou_Author;
    }
	public String GetDou_Date()
    {
        return this.Dou_Date;
    }
	public String GetDou_Flow()
    {
        return this.Dou_Flow;
    }
	public int Status()
    {
        return this.Status;
    }
	public int Dou_IsHistory()
    {
        return this.Dou_IsHistoryCheck;
    }
	public String GetDou_Link()
    {
        return this.Dou_Link;
    }
	public int GetDou_Draft()
    {
        return this.Dou_Draft;
    }
    */
}
