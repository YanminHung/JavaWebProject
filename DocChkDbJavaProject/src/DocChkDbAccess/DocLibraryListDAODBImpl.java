package DocChkDbAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DocLibraryListDAODBImpl implements DocLibraryListDAO {    

            @Override
            public DocLibraryList findbyLibDocNO(String Lib_DocNO) {
               
                try {
                    String SQL="Select * From LibraryList Where Lib_DocNO = ?";
                    PreparedStatement pstmt =DocChkDbConn.GetConnect().prepareStatement(SQL);
                    pstmt.setString(1,Lib_DocNO);
                    ResultSet rs = pstmt.executeQuery();
                                      
                    if (rs.next())
                    {
                        DocLibraryList r = new DocLibraryList(
                                rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
                                rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),
                                rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13));
                        System.out.println(r.getLib_TmpId()+" "+r.getLib_DocNo()+" "+r.getEmp_Name());
                        return r;
                    }
                    pstmt.close();               
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                
                return null;
            }
            
           
            @Override
            public DocLibraryList findbyLibTmpId(int Lib_TmpId)
            {
                try {
                    String SQL="Select * From LibraryList Where Lib_TmpId= ?";
                    PreparedStatement pstmt = 
                    DocChkDbConn.GetConnect().prepareStatement(SQL);
                    pstmt.setInt(1, Lib_TmpId);
                    ResultSet rs = pstmt.executeQuery();                
                    if (rs.next())
                    {
                        DocLibraryList r = new DocLibraryList(
                                rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
                                rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),
                                rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13));
                        System.out.println(r.getLib_TmpId()+" "+r.getLib_DocNo()+" "+r.getEmp_Name());
                        return r;
                                           }
                    pstmt.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                return null;            
            }
            
            @Override
            public DocLibraryList findbyDouKeyNote(String Dou_KeyNote)
            {
                try {
                    String SQL="Select * From LibraryList Where Dou_Keynote like ?";
                    PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                    pstmt.setString(1, Dou_KeyNote);
                    ResultSet rs = pstmt.executeQuery();                
                        
                    if (rs.next())
                    {
                        DocLibraryList r = new DocLibraryList(
                                rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
                                rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),
                                rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13));                        
                        System.out.println(r.getLib_TmpId()+" "+r.getLib_DocNo()+" "+r.getEmp_Name());
                        return r;
                    }
                 
                    pstmt.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                
                return null;
            }
            
            
            @Override
            public DocLibraryList findbyDouAuthor(int Dou_Author)
            {
                try {
                    String SQL="Select * From LibraryList Where Dou_Author = ? ";
                   PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                    pstmt.setInt(1, Dou_Author);
                    ResultSet rs = pstmt.executeQuery();                
                        
                    if (rs.next())
                    {
                        DocLibraryList r = new DocLibraryList(
                                rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
                                rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),
                                rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13));                        
                        System.out.println(r.getLib_TmpId()+" "+r.getLib_DocNo()+" "+r.getEmp_Name());
                        return r;
                    }
                    
                    //stmt.close();
                    pstmt.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                
                return null;
            }
            @Override
            public DocLibraryList findbyDouDate(String Dou_Date)
            {
                try {
                    String SQL="Select * From LibraryList Where cast(Dou_Date as date) = ?";
                    PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                    pstmt.setString(1, Dou_Date);
                    ResultSet rs = pstmt.executeQuery();                
                        
                    if (rs.next())
                    {
                        DocLibraryList r = new DocLibraryList(
                                rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
                                rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),
                                rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13));                
                        System.out.println(r.getLib_TmpId()+" "+r.getLib_DocNo()+" "+r.getEmp_Name());
                        return r;
                    }
                    
                    //stmt.close();
                    pstmt.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                
                return null;
            }
            
            @Override
            public DocLibraryList findbyEmpDepart(String Emp_Depart)
            {
                try {
                    String SQL="Select * From LibraryList Where Emp_Depart = ?";            
                    PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                    pstmt.setString(1, Emp_Depart );
                    ResultSet rs = pstmt.executeQuery();                
                        
                    if (rs.next())
                    {
                        DocLibraryList r = new DocLibraryList(
                                rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
                                rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),
                                rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13));                    
                        System.out.println(r.getLib_TmpId()+" "+r.getLib_DocNo()+" "+r.getEmp_Name());
                        return r;
                    }
                    
                    //stmt.close();
                    pstmt.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                
                return null;
            }  
            
            @Override 
            public DocLibraryList[] findAll() {

                try {
                    String SQL ="select * from LibraryList where DATEDIFF(m,Dou_Date,SYSDATETIME()) <=3 "
                                +"Order By Dou_Date desc";
                    PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                    ResultSet rs = pstmt.executeQuery();
                    ArrayList<DocLibraryList> r = new ArrayList<DocLibraryList>();
                    while (rs.next())
                    {
                         DocLibraryList newr = new  DocLibraryList(
                                 rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
                                 rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),
                                 rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13));               
                         r.add(newr);   
                    }
                    pstmt.close();
                    DocLibraryList[] r1 = r.toArray(new DocLibraryList[r.size()]);
                    return r1;

                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                return null;
            }
           
            
            @Override 
            public DocLibraryList[] findAnnouncementAll() {

                try {
                    String SQL ="select * from LibraryList where Dou_Type=1 and (Lib_SetTop=1 or "
                                +"( Lib_SetTop!=1 and DATEDIFF(m,Dou_Date,SYSDATETIME()) <=3 )) "
                                +" Order By  Lib_SetTop desc,Dou_Date desc"; 
                    
                    PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                    ResultSet rs = pstmt.executeQuery();
                    ArrayList<DocLibraryList> r = new ArrayList<DocLibraryList>();
                    while (rs.next())
                    {
                         DocLibraryList newr = new  DocLibraryList(
                                 rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
                                 rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),
                                 rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13));               
                         r.add(newr);   
                    }
                    pstmt.close();
                    DocLibraryList[] r1 = r.toArray(new DocLibraryList[r.size()]);
                    return r1;

                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                return null;
            }

             @Override
             public DocLibraryList[] SearchDocData(
                    String Lib_DocNo,    //文號
                    String Dou_Type,     //文件類型
                    String Dou_Keynote,  //主旨
                    String Emp_Name,     //員工姓名(承辦人)
                    String Emp_Depart,   //部門   
                    String Dou_Date_B,  //發文日期起  
                    String Dou_Date_E)  //發文日期迄  
            
            {
                try {
                    String SQL ="select * from LibraryList where Lib_DocNo like ? and "
                                +"CAST(Dou_Type as CHAR(1)) like ? and  Dou_Keynote like ?  and  Emp_Name like ? "
                                +"and  Emp_Depart like ? and  Dou_Date between ? and ? "
                                +"Order By Dou_Date desc";
            
             
                    PreparedStatement pstmt = DocChkDbConn.GetConnect().prepareStatement(SQL);
                    pstmt.setString(1, Lib_DocNo );
                    pstmt.setString(2, Dou_Type );
                    pstmt.setString(3, Dou_Keynote );
                    pstmt.setString(4, Emp_Name );
                    pstmt.setString(5, Emp_Depart );
                    pstmt.setString(6, Dou_Date_B );
                    pstmt.setString(7, Dou_Date_E );
                 
                    ResultSet rs = pstmt.executeQuery();
                    ArrayList<DocLibraryList> r = new ArrayList<DocLibraryList>();
                    while (rs.next())
                    {
                         DocLibraryList newr = new  DocLibraryList(
                                 rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
                                 rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),
                                 rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13));               
                         System.out.println(rs.getInt(1)+" "+rs.getString(7));
                         r.add(newr);   
                    }
                    pstmt.close();
                    DocLibraryList[] r1 = r.toArray(new DocLibraryList[r.size()]);
                    return r1;

                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                return null;
            }
 
            

                  
            
            
    
}
