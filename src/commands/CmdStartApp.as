/**
 * Created by Lenovo on 22/7/2014.
 */
package commands {
import robotlegs.bender.bundles.mvcs.Command;

public class CmdStartApp extends Command{

    //private var
    public function CmdStartApp() {
    }
    override public function execute():void{
        trace("Cmd receives signal start app");
        //main.switchView();
    }
}
}
