package DocChkDbAccess.Test;

import java.util.ArrayList;

import DocChkDbAccess.Document_FlowType;
import DocChkDbAccess.Document_FlowTypeDAOImpl;

public class Test_FlowTypeDAOImpl
{

    public static void main(String[] args)
    {
        Document_FlowType flowA = new Document_FlowType( "FlowA",
                                                         4,
                                                         Document_FlowType.Enable );

        Document_FlowType flowB = new Document_FlowType( "FlowB",
                                                         4,
                                                         Document_FlowType.Enable );

        Document_FlowTypeDAOImpl impl = new Document_FlowTypeDAOImpl();

//        System.out.println( impl.add( flowA ) );
//        System.out.println( impl.add( flowA ) );
//        System.out.println( impl.add( flowB ) );

        System.out.println( "----------------" );
        Document_FlowType flowG = impl.getFlowType( "FlowB" );

        if( flowG != null )
        {
            System.out.println( "delete ------------" );
            System.out.println( impl.delete( flowG ) );
        }

        System.out.println( "----------------" );

        Document_FlowType flowE = impl.getFlowType( "FlowA" );
        impl.enableFlowType( flowE.getFlowName() );
        flowE = impl.getFlowType( flowE.getFlowName() );
        System.out.println( "Status = " + flowE.getFlowEnable() );

        impl.disableFlowType( flowE.getFlowName() );
        flowE = impl.getFlowType( flowE.getFlowName() );
        System.out.println( "Status = " + flowE.getFlowEnable() );

        ArrayList<Document_FlowType> FlowList = impl.getAll();

        for ( Document_FlowType o : FlowList )
        {
            System.out.println( o.getFlowType() + ", " +
                                o.getFlowName() + ", " +
                                o.getFlowMax() + ", " +
                                o.getFlowEnable() );
        }
    }

}
