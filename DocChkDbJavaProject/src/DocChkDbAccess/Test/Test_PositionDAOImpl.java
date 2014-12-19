package DocChkDbAccess.Test;

import java.util.ArrayList;
import java.util.Iterator;

import DocChkDbAccess.Document_Position;
import DocChkDbAccess.Document_PositionDAOImpl;
import DocChkDbAccess.EmpolyeeDAOImpl;

public abstract class Test_PositionDAOImpl
{

    public static void main(String[] args)
    {
        Document_Position r = new Document_Position( "TM", 2 );

        Document_PositionDAOImpl impl = new Document_PositionDAOImpl();

        impl.add( r );

//        Document_Position rdl = new Document_Position( 3, "GM", 2 );

//        impl.Delete( rdl );

        Document_Position r1 = impl.getPosDataFromPosId( 1 );

        System.out.println( r1.getPosID() + ", " +
                            r1.getPosTitle() + ", " +
                            r1.getEmpolyeeID() );

        r1 = impl.getPosDataFromPosId( 2 );

        System.out.println( r1.getPosID() + ", " +
                            r1.getPosTitle() + ", " +
                            r1.getEmpolyeeID() );

        r1 = impl.getPosDataFromPosTitle( "GG" );

        if( r1 == null )
        {
            System.out.println( "get data error" );
        }
        else {
            System.out.println( r1.getPosID() + ", " +
                                r1.getPosTitle() + ", " +
                                r1.getEmpolyeeID() );
        }

        System.out.println( "-------------------" );

        ArrayList<Document_Position> resultList = impl.getPosDataFromEmpId( 2 );

        Iterator< Document_Position > rl = resultList.iterator();

        while( rl.hasNext() )
        {
            Document_Position o = rl.next();
            System.out.println( o.getPosID() + ", " +
                                o.getPosTitle() + ", " +
                                o.getEmpolyeeID() );
        }

        System.out.println( "-------------------" );

        ArrayList<Document_Position> resultAList = impl.getAll();

        Iterator< Document_Position > rA = resultAList.iterator();

        while( rA.hasNext() )
        {
            Document_Position o = rA.next();
            System.out.println( o.getPosID() + ", " +
                                o.getPosTitle() + ", " +
                                o.getEmpolyeeID() );
        }

        System.out.println( "-------------------" );

        impl.updatePosEmpId( "GM", 1 );

        r1 = impl.getPosDataFromPosTitle( "GM" );

        System.out.println( r1.getPosID() + ", " +
                            r1.getPosTitle() + ", " +
                            r1.getEmpolyeeID() );

        EmpolyeeDAOImpl impld = new EmpolyeeDAOImpl();
        String DbPwd = impld.GetLoginPwd( "admin" );

        if ( DbPwd != null)
        {
            System.out.println( "DB: " + DbPwd );
        }

    }

}
