package DocChkDbAccess.Test;

import java.util.ArrayList;

import DocChkDbAccess.Document_FlowSeq;
import DocChkDbAccess.Document_FlowSeqDAOImpl;

public class Test_FlowSeqDAOImpl
{

    public static void main(String[] args)
    {
        Document_FlowSeq[] rightFlow = {
            new Document_FlowSeq( 5, 1, 5 ),
            new Document_FlowSeq( 5, 2, 5 ),
            new Document_FlowSeq( 5, 3, 5 ),
            new Document_FlowSeq( 5, 4, 5 )
        };

        Document_FlowSeq[] errFlow1 = {
            new Document_FlowSeq( 5, 1, 5 ),
            new Document_FlowSeq( 7, 2, 5 ),
            new Document_FlowSeq( 5, 5, 5 ),
            new Document_FlowSeq( 5, 4, 5 )
        };

        Document_FlowSeq[] errFlow2 = {
            new Document_FlowSeq( 6, 1, 5 ),
            new Document_FlowSeq( 6, 2, 5 ),
            new Document_FlowSeq( 6, 2, 5 ),
            new Document_FlowSeq( 6, 4, 5 )
        };

        Document_FlowSeqDAOImpl impl = new Document_FlowSeqDAOImpl();

//        System.out.println( impl.add( rightFlow ) );
//        System.out.println( impl.delete( rightFlow[0].getFlowType() ) );
        System.out.println( impl.add( errFlow1 ) );
        System.out.println( impl.add( errFlow2 ) );

        System.out.println( "----------------" );

        Integer[] flowList = impl.getAllFlowTypeByPosId( 4 );

        for (int i = 0; i < flowList.length; i++)
        {
            System.out.println( flowList[ i ] + ", " );
        }

        System.out.println( "----------------" );

        ArrayList<Document_FlowSeq> FlowSeqList = impl.getAll( 2 );

        for ( Document_FlowSeq o : FlowSeqList )
        {
            System.out.println( o.getFlowType() + ", " +
                                o.getFlowSeq() + ", " +
                                o.getFlowPosId() );
        }

    }

}
