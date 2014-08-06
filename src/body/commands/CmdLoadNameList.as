/**
 * Created by Lenovo on 22/7/2014.
 */
package body.commands {
import body.models.MBody;

import mx.collections.ArrayCollection;

import robotlegs.bender.bundles.mvcs.Command;

public class CmdLoadNameList extends Command{

    [Inject]
    public var _model:MBody;

    [Embed(source="/data/list.json", mimeType="application/octet-stream")]
    public var name_list_json_class:Class;

    //private var
    public function CmdLoadNameList() {
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
