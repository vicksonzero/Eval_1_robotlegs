/**
 * Created by Lenovo on 22/7/2014.
 */
package mediators {
import robotlegs.bender.bundles.mvcs.Mediator;

import signals.SigStartApp;

import views.VWelcome;

public class MedApp extends Mediator{

    // view
    [Inject]
    public var _view:main;

    [Inject]
    public var _sig_start_app:SigStartApp;

    public function MedApp() {

    }
    /**
     * Initialize
     */
    override public function initialize ():void
    {
        this._sig_start_app.add(this.switch_view);

    }

    public function switch_view():void {
        this._view.switchView();
    }
}
}
