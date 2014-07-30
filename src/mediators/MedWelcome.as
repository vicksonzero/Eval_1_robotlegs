/**
 * Created by Lenovo on 22/7/2014.
 */
package mediators {
import robotlegs.bender.bundles.mvcs.Mediator;

import signals.SigStartApp;

import views.VWelcome;

public class MedWelcome extends Mediator{

    // view
    [Inject]
    public var _view:VWelcome;

    [Inject]
    public var _sig_start_app:SigStartApp;

    public function MedWelcome() {

    }
    /**
     * Initialize
     */
    override public function initialize ():void
    {
        this._view.sig_start_app_button_pressed.add(this.h_start_app);

    }

    /**
     * Destuctor
     */
    override public function destroy ():void
    {
        super.destroy ();

        this._view.destroy ();
    }

    public function h_start_app():void {
        // tell app to switch to next view
        trace("dispatch sig start app");
        trace(this._sig_start_app);
        this._sig_start_app.dispatch();
    }
}
}
