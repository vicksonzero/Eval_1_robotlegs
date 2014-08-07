/**
 * Created by Lenovo on 22/7/2014.
 */
package bodyB.commands {
import bodyB.models.MBodyB;

import mx.collections.ArrayCollection;

import robotlegs.bender.bundles.mvcs.Command;

public class CmdLoadNameListB extends Command{

    [Inject]
    public var _model:MBodyB;

    [Embed(source="/data/listb.json", mimeType="application/octet-stream")]
    public var name_list_json_class:Class;

    //private var
    public function CmdLoadNameListB() {
    }
    override public function execute():void{
        trace("Cmd loads name list");

        var t_json_array:Array = JSON.parse (new name_list_json_class ()) as Array;
        trace(t_json_array);
        var t_name_list_ac:ArrayCollection = new ArrayCollection(t_json_array);

        _model.name_list_ac = t_name_list_ac;
    }
}
}
