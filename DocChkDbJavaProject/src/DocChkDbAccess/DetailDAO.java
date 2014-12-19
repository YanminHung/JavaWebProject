test

package DocChkDbAccess;

import java.util.ArrayList;

public interface DetailDAO {
    public void add(Document_Detail d);
    public void update(Document_Detail d);
    public void delete(String Dou_TmpNo);
    public void updateDraftFlag(int Dou_No);
    public void CheckClick(String Dou_TmpNo);
    public void CheckStatus(String Dou_TmpNo,int Dou_Status);
    public Document_Detail searchNo(int Dou_No);
    public Document_Detail searchTmpNo(String TmpNo);
    public ArrayList<Document_Detail> searchKeynote(String Keynote);
    public ArrayList<Document_Detail> searchAuthor(String Author);
    public ArrayList<Document_Detail> searchDraftByAuthor(String Author);
    public ArrayList<Document_Detail> searchNoDraftByAuthor(String Author);
    public ArrayList<Document_Detail> searchData(String Date);

}
