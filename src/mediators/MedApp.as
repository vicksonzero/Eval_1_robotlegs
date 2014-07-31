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
    public var _view:AppVN;

    [Inject]
    public var _sig_start_app:SigStartApp;

    public function MedApp() {
        trace("Medapp created");
    }
    /**
     * Initialize
     */
    override public function initialize ():void
    {
        trace("MedApp initialize")
        this._sig_start_app.add(this.switch_view);

    }

    public function switch_view():void {
        trace("MedApp received sig start app");
        this._view.switchView();
    }
}
}
