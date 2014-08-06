/**
 * Created by Lenovo on 22/7/2014.
 */
package welcome.mediators {
import body.views.VBody;

import bodyB.signals.SigVBodyBTired;
import bodyB.views.VBodyB;

import robotlegs.bender.bundles.mvcs.Mediator;

import welcome.signals.SigLoadBody;
import body.signals.SigVBodyTired;

import welcome.signals.SigLoadBodyB;

import welcome.views.VWelcome;

public class MedApp extends Mediator{

    // view
    [Inject]
    public var _view:AppVN;

    [Inject]
    public var _sig_load_body:SigLoadBody;
    [Inject]
    public var _sig_load_body_b:SigLoadBodyB;

    [Inject]
    public var _sig_v_body_tired:SigVBodyTired;
    [Inject]
    public var _sig_v_body_b_tired:SigVBodyBTired;

    public function MedApp() {
        trace("Medapp created");
    }
    /**
     * Initialize
     */
    override public function initialize ():void
    {
        trace("MedApp initialize");
        this._sig_load_body.add(this.switch_view);
        this._sig_load_body_b.add(this.switch_view_b);
        this._sig_v_body_tired.add(this.go_back);
        this._sig_v_body_b_tired.add(this.go_back);
    }

    public function switch_view():void {
        trace("MedApp received sig start welcome");
        this._view.switchView(VBody);
    }
    public function switch_view_b():void {
        trace("MedApp received sig start welcome");
        this._view.switchView(VBodyB);
    }
    public function go_back():void {
        trace("MedApp received sig start welcome");
        this._view.go_home();
    }
}
}
