/**
 * Created by Lenovo on 21/7/2014.
 */
package welcome.views {
import flash.events.MouseEvent;

import org.osflash.signals.Signal;

import spark.components.Button;
import spark.components.SkinnableContainer;
import spark.components.View;

public class VWelcome extends View {

    //  skin parts
    [SkinPart(required="true")]
    public var start_button:Button;
    [SkinPart(required="true")]
    public var start_button_b:Button;

    // welcome.signals
    private var _sig_start_app_button_pressed:Signal = new Signal();
    private var _sig_start_app_button_b_pressed:Signal = new Signal();

    public function VWelcome() {
        // initial signal
        trace("VWelcome started");
    }
    /**
     * Destructor
     */
    public function destroy ():void
    {
        this._sig_start_app_button_pressed.removeAll ();

        this.start_button.removeEventListener (MouseEvent.CLICK, h_s_button_click);
        this.start_button_b.removeEventListener (MouseEvent.CLICK, h_s_button_b_click);
    }


    /**
     * Children created handler
     */
    override protected function childrenCreated():void {
        super.childrenCreated();
        this.start_button.addEventListener(MouseEvent.CLICK, h_s_button_click);
        this.start_button_b.addEventListener(MouseEvent.CLICK, h_s_button_b_click);
    }

    private function h_s_button_click(event:MouseEvent):void {
        trace("View knows start button is clicked");
        this._sig_start_app_button_pressed.dispatch();
    }
    private function h_s_button_b_click(event:MouseEvent):void {
        trace("View knows start button is clicked");
        this._sig_start_app_button_b_pressed.dispatch();
    }

    public function get sig_start_app_button_pressed():Signal {
        return (this._sig_start_app_button_pressed);
    }

    public function get sig_start_app_button_b_pressed():Signal {
        return _sig_start_app_button_b_pressed;
    }
}

}
