/**
 * Created by Lenovo on 22/7/2014.
 */
package welcome.mediators {
import robotlegs.bender.bundles.mvcs.Mediator;

import welcome.signals.SigLoadBody;
import welcome.signals.SigLoadBodyB;

import welcome.views.VWelcome;

public class MedWelcome extends Mediator{

    // view
    [Inject]
    public var _view:VWelcome;

    [Inject]
    public var _sig_load_body:SigLoadBody;
    [Inject]
    public var _sig_load_body_b:SigLoadBodyB;

    public function MedWelcome() {
        trace("medwelcome created");
    }
    /**
     * Initialize
     */
    override public function initialize ():void
    {
        this._view.sig_start_app_button_pressed.add(this.h_load_body);
        this._view.sig_start_app_button_b_pressed.add(this.h_load_body_b);

    }

    /**
     * Destuctor
     */
    override public function destroy ():void
    {
        super.destroy ();

        this._view.destroy ();
    }

    public function h_load_body():void {
        // tell welcome to switch to next view
        trace("dispatch sig start welcome");
        this._sig_load_body.dispatch();
    }
    public function h_load_body_b():void {
        // tell welcome to switch to next view
        trace("dispatch sig start welcome");
        this._sig_load_body_b.dispatch();
    }
}
}
