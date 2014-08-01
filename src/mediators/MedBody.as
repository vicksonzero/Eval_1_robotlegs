/**
 * Created by Lenovo on 22/7/2014.
 */
package mediators {
import models.MBody;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.SigVBodyLoaded;

import views.VBody;

public class MedBody extends Mediator{

    // view
    [Inject]
    public var _view:VBody;
    [Inject]
    public var _model:MBody;

    // signals
    [Inject]
    public var _sig_init_name_list:SigVBodyLoaded;

    public function MedBody() {
        trace("medwelcome construct");
    }
    /**
     * Initialize
     */
    override public function initialize ():void {
        trace("MedBody init")
        this._model.name_list_updated.add(this.update_my_name_list);
        //this._view.sig_loaded.add(this.h_view_loaded);
        this.h_view_loaded();
    }

    /**
     * Destuctor
     */
    override public function destroy ():void
    {
        super.destroy ();

        this._view.destroy ();
    }

    public function h_view_loaded():void {
        trace("pm catched view cc");
        this._sig_init_name_list.dispatch();
    }
    public function update_my_name_list():void{
        _view.name_list_ac = _model.name_list_ac;
    }

}
}
