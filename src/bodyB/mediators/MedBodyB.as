/**
 * Created by Lenovo on 22/7/2014.
 */
package bodyB.mediators {
import body.signals.SigVBodyLoaded;
import body.signals.SigVBodyTired;

import bodyB.models.MBodyB;
import bodyB.signals.SigVBodyBLoaded;
import bodyB.signals.SigVBodyBTired;
import bodyB.views.VBodyB;

import robotlegs.bender.bundles.mvcs.Mediator;

public class MedBodyB extends Mediator{

    // view
    [Inject]
    public var _view:VBodyB;
    [Inject]
    public var _model:MBodyB;

    // welcome.signals
    [Inject]
    public var _sig_v_body_b_loaded:SigVBodyBLoaded;
    [Inject]
    public var _sig_v_body_b_tired:SigVBodyBTired;

    public function MedBodyB() {
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
        this._sig_v_body_b_tired.dispatch();
    }
    public function h_view_loaded():void {
        this._sig_v_body_b_loaded.dispatch();
    }
    public function update_my_name_list():void{
        _view.name_list_ac = _model.name_list_ac;
    }

}
}
