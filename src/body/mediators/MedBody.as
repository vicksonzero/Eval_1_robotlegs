/**
 * Created by Lenovo on 22/7/2014.
 */
package body.mediators {
import body.models.MBody;

import robotlegs.bender.bundles.mvcs.Mediator;

import body.signals.SigVBodyLoaded;
import body.signals.SigVBodyTired;

import body.views.VBody;

public class MedBody extends Mediator{

    // view
    [Inject]
    public var _view:VBody;
    [Inject]
    public var _model:MBody;

    // welcome.signals
    [Inject]
    public var _sig_v_body_loaded:SigVBodyLoaded;
    [Inject]
    public var _sig_v_body_tired:SigVBodyTired;

    public function MedBody() {
        trace("medwelcome construct");
    }
    /**
     * Initialize
     */
    override public function initialize ():void {
        trace("MedBody init");
        this._model.name_list_updated.add(this.update_my_name_list);
        this._view.sig_tired.add(this.h_view_tired);
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

    public function h_view_tired():void {
        this._sig_v_body_tired.dispatch();
    }
    public function h_view_loaded():void {
        this._sig_v_body_loaded.dispatch();
    }
    public function update_my_name_list():void{
        _view.name_list_ac = _model.name_list_ac;
    }

}
}
