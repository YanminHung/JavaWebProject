package DocChkDbAccess;

/**
 *
 * @author Boyang
 *
 */


public class Empolyee {

    private int Emp_No;
    private String Emp_Id;
    private String Emp_Name;
    private String Emp_Pwd;
    private String Emp_BirthD;
    private String Emp_InD;
    private String Emp_OutD;
    private String Emp_Depart;
    private int Emp_Title;
    private String Emp_Tel;
    private String Emp_CellPhone;
    private String Emp_Addr;
    private String Emp_Email;
    private int Emp_BossPosId;



    /**建構式1,新增的時候可以直接填入值
     *
     *
     */
    public Empolyee(String Emp_Id,String Emp_Pwd,String Emp_Name,
                    String Emp_BirthD,String Emp_InD,String Emp_OutD,
                    String Emp_Depart,int Emp_Title,String Emp_Tel,
                    String Emp_CellPhone,String Emp_Addr,String Emp_Email,
                     int Emp_BossPosId)
    {
        this.Emp_Id=Emp_Id;
        this.Emp_Name=Emp_Name;
        this.Emp_Pwd=Emp_Pwd;
        this.Emp_BirthD=Emp_BirthD;
        this.Emp_InD=Emp_InD;
        this.Emp_OutD=Emp_OutD;
        this.Emp_Depart=Emp_Depart;
        this.Emp_Title=Emp_Title;
        this.Emp_Tel=Emp_Tel;
        this.Emp_CellPhone=Emp_CellPhone;
        this.Emp_Addr=Emp_Addr;
        this.Emp_Email=Emp_Email;
        this.Emp_BossPosId=Emp_BossPosId;

    }

    /**建構式2,為了讀取的時候從資料庫取值存入用
     *
     *
     */
    public Empolyee(int Emp_No,String Emp_Id,String Emp_Pwd,String Emp_Name,
            String Emp_BirthD,String Emp_InD,String Emp_OutD,
            String Emp_Depart,int Emp_Title,String Emp_Tel,
            String Emp_CellPhone,String Emp_Addr,String Emp_Email,
             int Emp_BossPosId)
    {
        this.Emp_No=Emp_No;
        this.Emp_Id=Emp_Id;
        this.Emp_Name=Emp_Name;
        this.Emp_Pwd=Emp_Pwd;
        this.Emp_BirthD=Emp_BirthD;
        this.Emp_InD=Emp_InD;
        this.Emp_OutD=Emp_OutD;
        this.Emp_Depart=Emp_Depart;
        this.Emp_Title=Emp_Title;
        this.Emp_Tel=Emp_Tel;
        this.Emp_CellPhone=Emp_CellPhone;
        this.Emp_Addr=Emp_Addr;
        this.Emp_Email=Emp_Email;
        this.Emp_BossPosId=Emp_BossPosId;

    }
    /**建構式3,為了可以簡單New 以便使用下列修改的函數                   (新增)
     * 
     */
    public Empolyee(){}
    
    public int getNo()
    {
        return Emp_No;
    }

    public void setNo(int Emp_No)
    {
        this.Emp_No=Emp_No;
    }

    public String getId()
    {
        return this.Emp_Id;
    }

    public void setId(String Emp_Id)
    {
        this.Emp_Id=Emp_Id;
    }

    public String getName()
    {
        return this.Emp_Name;
    }

    public void setName(String Emp_Name)
    {
        this.Emp_Name=Emp_Name;
    }

    public String getPwd()
    {
        return this.Emp_Pwd;
    }

    public void setPwd(String Emp_Pwd)
    {
        this.Emp_Pwd=Emp_Pwd;
    }

    public String getBirthD()
    {
        return this.Emp_BirthD;
    }

    public void setBirthD(String Emp_BirthD)
    {
        this.Emp_BirthD=Emp_BirthD;
    }

    public String getInD()
    {
        return this.Emp_InD;
    }

    public void setInD(String Emp_InD)
    {
        this.Emp_InD=Emp_InD;
    }

    public String getOutD()
    {
        return this.Emp_OutD;
    }

    public void setOutD(String Emp_OutD)
    {
        this.Emp_OutD=Emp_OutD;
    }

    public String getDepart()
    {
        return this.Emp_Depart;
    }

    public void setDepart(String Emp_Depart)
    {
        this.Emp_Depart=Emp_Depart;
    }

    public int getTitle()
    {
        return this.Emp_Title;
    }

    public void setTitle(int Emp_Title)
    {
        this.Emp_Title=Emp_Title;
    }

    public String getTel()
    {
        return this.Emp_Tel;
    }

    public void setTel(String Emp_Tel)
    {
        this.Emp_Tel=Emp_Tel;
    }

    public String getCellPhone()
    {
        return this.Emp_CellPhone;
    }

    public void setCellPhone(String Emp_CellPhone)
    {
        this.Emp_CellPhone=Emp_CellPhone;
    }

    public String getAddr()
    {
        return this.Emp_Addr;
    }

    public void setAddr(String Emp_Addr)
    {
        this.Emp_Addr=Emp_Addr;
    }

    public String getEmail()
    {
        return this.Emp_Email;
    }

    public void setEmail(String Emp_Email)
    {
        this.Emp_Email=Emp_Email;
    }

    public int getBossPosId()
    {
        return this.Emp_BossPosId;
    }

    public void setBossPosId(int Emp_BossPosId)
    {
        this.Emp_BossPosId=Emp_BossPosId;
    }



}
