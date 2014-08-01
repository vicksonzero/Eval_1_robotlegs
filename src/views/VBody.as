/**
 * Created by Lenovo on 21/7/2014.
 */
package views {
import flash.events.Event;

import mx.collections.ArrayCollection;

import mx.events.FlexEvent;

import org.osflash.signals.Signal;

import signals.SigVBodyLoaded;

import spark.components.List;
import spark.components.View;

public class VBody extends View {

    //  skin parts
    [SkinPart(required="true")]
    public var name_list:List;

    private var _sig_loaded:Signal;

    private var _name_list_ac:ArrayCollection;


    public function VBody() {
        trace("VBody created");
        this._sig_loaded = new Signal();
        this.addEventListener(FlexEvent.CREATION_COMPLETE, this.h_creation_complete);
    }

    public function h_creation_complete(p_event:Event):void {
        trace("VBody cc");
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
}

}
