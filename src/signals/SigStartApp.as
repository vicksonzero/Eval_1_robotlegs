/**
 * Created by Lenovo on 22/7/2014.
 */
package signals {
import org.osflash.signals.Signal;

public class SigStartApp extends Signal {
    public function SigStartApp(){
    }
    override public function dispatch(... rest):void{
        trace("sigstartapp dispatched");
        super.dispatch(rest);
    }
}
}
