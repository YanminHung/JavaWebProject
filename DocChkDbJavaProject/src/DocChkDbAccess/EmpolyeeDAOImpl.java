package DocChkDbAccess;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmpolyeeDAOImpl implements EmpolyeeDAO {


	@Override
    public void add(Empolyee em) {

		try {
			String SQL="Insert Into Empolyee("
					+"Emp_Id,Emp_Pwd,Emp_Name,Emp_BirthD,Emp_InD,Emp_OutD,"
					+ "Emp_Depart,Emp_Title,Emp_Tel,Emp_CellPhone,"
					+ "Emp_Addr,Emp_Email,Emp_BossPosId) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?)" ;
			PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );
			pstmt.setString(1, em.getId());
			pstmt.setString(2, em.getPwd());
			pstmt.setString(3, em.getName());
			pstmt.setString(4, em.getBirthD());
			pstmt.setString(5, em.getInD());
			pstmt.setString(6, em.getOutD());
			pstmt.setString(7, em.getDepart());
			pstmt.setInt(8, em.getTitle());
			pstmt.setString(9, em.getTel());
			pstmt.setString(10, em.getCellPhone());
			pstmt.setString(11, em.getAddr());
			pstmt.setString(12, em.getEmail());
			pstmt.setInt(13, em.getBossPosId());

			pstmt.executeUpdate();
			pstmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}


	@Override
    public void delete(Empolyee em) {

        try {
            String SQL="Delete from Empolyee where Emp_No = ?";
            PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );

            pstmt.setInt(1, em.getNo());
            System.out.println( "DDD" + em.getNo() );

            pstmt.executeUpdate();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

	}


	/**
     * @param em : 欲填入的資料(Empolyee)
     * @param No : 欲修改的資料(where Emp_No=No)
     */
	@Override
    public void update(Empolyee em,int No) {

        try {
            String SQL="Update Empolyee Set Emp_Id=?,Emp_Pwd=?,Emp_Name=?,"
                    + "Emp_BirthD=?,Emp_Depart=?,Emp_Title=?,Emp_Tel=?,"
                    + "Emp_CellPhone=?,Emp_Addr=?,Emp_Email=?,Emp_BossPosId=? "
                    + "where Emp_No=?";

            PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setString(1, em.getId());
            pstmt.setString(2, em.getPwd());
            pstmt.setString(3, em.getName());
            pstmt.setString(4, em.getBirthD());
            //pstmt.setString(5, em.getInD());
            //pstmt.setString(6, em.getOutD());
            pstmt.setString(5, em.getDepart());
            pstmt.setInt(6, em.getTitle());
            pstmt.setString(7, em.getTel());
            pstmt.setString(8, em.getCellPhone());
            pstmt.setString(9, em.getAddr());
            pstmt.setString(10, em.getEmail());
            pstmt.setInt(11, em.getBossPosId());
            pstmt.setInt(12, No);

            pstmt.executeUpdate();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }


	}



	@Override
    public void change(Empolyee em, String Emp_Depart, int Emp_BossPosId) {
	    try {
            String SQL="Update Empolyee set Emp_Depart=? Emp_BossPosId=? where Emp_No=?;";
            PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setString(1, Emp_Depart);
            pstmt.setInt(1, Emp_BossPosId);
            pstmt.setInt(1, em.getNo());

            pstmt.executeUpdate();
            pstmt.close();
            //System.out.println("密碼修改成功");


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }




	}


	@Override
    public Empolyee findByNo(int Emp_No) {
		try {
            String SQL="Select * From Empolyee where Emp_No=? ;";
		    PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setInt(1, Emp_No);
            ResultSet rs=pstmt.executeQuery();
            if (rs.next()){
                Empolyee r = new Empolyee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                        rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),
                        rs.getString(11),rs.getString(12),rs.getString(13),rs.getInt(14));
                pstmt.close();
                return r;


            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


		return null;
	}


	@Override
    public Empolyee findById(String Emp_Id) {
	    try {
            String SQL="Select * From Empolyee where Emp_Id=? Collate Chinese_Taiwan_Stroke_CS_AS;";
            PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setString(1, Emp_Id);
            ResultSet rs=pstmt.executeQuery();
            if (rs.next()){
                Empolyee r = new Empolyee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                        rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),
                        rs.getString(11),rs.getString(12),rs.getString(13),rs.getInt(14));
                pstmt.close();
                return r;


            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        return null;
	}

	/**
	 * 因為ArrayList<Employee>型態,所以嵌入JSP檔時需要事先匯入 util.*
	 */
	@Override
    public ArrayList<Empolyee> findByName(String Emp_Name) {
	    try {
            String SQL="Select * From Empolyee where Emp_Name like ? ;";
            PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setString(1, Emp_Name);
            ResultSet rs=pstmt.executeQuery();
            ArrayList<Empolyee> result = new ArrayList<Empolyee>();

            while(rs.next()){
                result.add(new Empolyee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                        rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),
                        rs.getString(11),rs.getString(12),rs.getString(13),rs.getInt(14)));

            }
            pstmt.close();
            return result;



        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        return null;
	}

	/**
     * 因為ArrayList<Employee>型態,所以嵌入JSP檔時需要事先匯入 util.*
     */
	@Override
    public ArrayList<Empolyee> findByDepart(String Emp_Depart) {
	    try {
            String SQL="Select * From Empolyee where Emp_Depart=? ;";
            PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setString(1, Emp_Depart);
            ResultSet rs=pstmt.executeQuery();
            ArrayList<Empolyee> result = new ArrayList<Empolyee>();

            while(rs.next()){
                result.add(new Empolyee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                        rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),
                        rs.getString(11),rs.getString(12),rs.getString(13),rs.getInt(14)));

            }
                pstmt.close();
                return result;



        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
	}

	/**
     * 因為ArrayList<Employee>型態,所以嵌入JSP檔時需要事先匯入 util.*
     */
	@Override
    public ArrayList<Empolyee> getAll() {
	    try {
            String SQL="Select * From Empolyee;";
            PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );
            ResultSet rs=pstmt.executeQuery();
            ArrayList<Empolyee> result = new ArrayList<Empolyee>();

            while(rs.next()){
                result.add(new Empolyee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                        rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),
                        rs.getString(11),rs.getString(12),rs.getString(13),rs.getInt(14)));

            }
                pstmt.close();
                return result;



        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        return null;
	}


	/**
     * @param Emp_Id 員工編號(String)
     * @return 密碼(String)
     */
    @Override
    public String GetLoginPwd(String Emp_Id) {
        try {
            String SQL="Select * From Empolyee where Emp_OutD is Null and Emp_Id=? " +
                       "Collate Chinese_Taiwan_Stroke_CS_AS;";
            PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );
            pstmt.setString(1, Emp_Id);
            ResultSet rs=pstmt.executeQuery();

            if(rs.next())
            {
                return rs.getString(3);
            }



        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        return null;
    }

    /**
     * 因為ArrayList<Employee>型態,所以嵌入JSP檔時需要事先匯入 util.*
     */
    @Override
    public ArrayList<Empolyee> getAllWork() {
        try {
            String SQL="Select * From Empolyee where Emp_OutD is NULL;";
            PreparedStatement pstmt=DocChkDbConn.GetConnect().prepareStatement( SQL );
            ResultSet rs=pstmt.executeQuery();
            ArrayList<Empolyee> result = new ArrayList<Empolyee>();

            while(rs.next()){
                result.add(new Empolyee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                        rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),
                        rs.getString(11),rs.getString(12),rs.getString(13),rs.getInt(14)));

            }
                pstmt.close();
                return result;



        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        return null;
    }














}
