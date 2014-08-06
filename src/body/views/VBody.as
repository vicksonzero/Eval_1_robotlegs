/**
 * Created by Lenovo on 21/7/2014.
 */
package body.views {
import flash.events.Event;
import flash.events.MouseEvent;

import mx.collections.ArrayCollection;

import mx.events.FlexEvent;

import org.osflash.signals.Signal;

import body.signals.SigVBodyLoaded;

import spark.components.Button;

import spark.components.List;
import spark.components.View;

public class VBody extends View {

    //  skin parts
    [SkinPart(required="true")]
    public var name_list:List;
    //[SkinPart(required="true")]
    //public var back_button:Button;

    private var _sig_loaded:Signal = new Signal();
    private var _sig_tired:Signal = new Signal();

    private var _name_list_ac:ArrayCollection;


    public function VBody() {
        trace("VBody created");
        this.addEventListener(FlexEvent.CREATION_COMPLETE, this.h_creation_complete);

    }

    public function h_creation_complete(p_event:Event):void {
        trace("VBody cc");
        //this.back_button.addEventListener(MouseEvent.CLICK, this.go_back);
        var back_button:Button = new Button();
        back_button.addEventListener(MouseEvent.CLICK, this.go_back);
        back_button.label="back";
        this.navigationContent = new Array();
        this.navigationContent.push(back_button);
        this._sig_loaded.dispatch();
    }
    /**
     * Destructor
     */
    public function destroy ():void
    {

    }


    /**
     * Children created handler
     */
    override protected function childrenCreated():void {
        super.childrenCreated();
    }

    public function set name_list_ac(value:ArrayCollection):void {
        _name_list_ac = value;
        this.name_list.dataProvider = this._name_list_ac;
    }

    public function get sig_loaded():Signal {
        return _sig_loaded;
    }

    private function go_back(p_event:Event):void{
        trace("back button pressed");
        this._sig_tired.dispatch();
    }

    public function get sig_tired():Signal {
        return _sig_tired;
    }
}

}
