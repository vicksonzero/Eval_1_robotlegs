/**
 * Created by Lenovo on 1/8/2014.
 */
package bodyB.models {
import mx.collections.ArrayCollection;

import org.osflash.signals.Signal;
public class MBodyB{

    private var _name_list_updated:Signal;

    private var _name_list_ac:ArrayCollection;

    public function MBodyB(){
        trace("MBody construct");
        _name_list_updated = new Signal();
    }

    public function get name_list_updated():Signal {
        return _name_list_updated;
    }

    [Bindable]
    public function get name_list_ac():ArrayCollection {
        return _name_list_ac;
    }

    [Bindable]
    public function set name_list_ac(value:ArrayCollection):void {
        _name_list_ac = value;
        this._name_list_updated.dispatch();
    }
}
}
