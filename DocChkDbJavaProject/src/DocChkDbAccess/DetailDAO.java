package DocChkDbAccess;

import java.util.ArrayList;

public interface DetailDAO {
    public void add(Document_Detail d);
    public void update(Document_Detail d);
    public void delete(String Dou_TmpNo);
    public void updateDraftFlag(int Dou_No);
    public void updateStatusFlag(int Dou_No,int Dou_Status);
    public void CheckClick(String Dou_TmpNo);
    public void CheckStatus(String Dou_TmpNo,int Dou_Status);
    public Document_Detail searchNo(int Dou_No);
    public Document_Detail searchTmpNo(String TmpNo);
    public ArrayList<Document_Detail> searchKeynote(String Keynote);
    public ArrayList<Document_Detail> searchAuthor(int Author);
    public ArrayList<Document_Detail> searchDraftByAuthor(int Author);
    public ArrayList<Document_Detail> searchNoDraftByAuthor(int Author);
    public ArrayList<Document_Detail> searchData(String Date);

    /**
     * @param   Emp_No=Dou_Author
     * @return  ArrayList<Document_Detail>
     */
    public ArrayList<Document_Detail> findByAuthor(int Emp_No);
}
