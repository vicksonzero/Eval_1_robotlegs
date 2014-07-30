/**
 * Created by Lenovo on 21/7/2014.
 */
package views {
import flash.events.MouseEvent;

import org.osflash.signals.Signal;

import spark.components.Button;
import spark.components.SkinnableContainer;
import spark.components.View;

public class VBody extends View {

    //  skin parts
    [SkinPart(required="true")]
    public var start_button:Button;

    // signals
    private var _sig_start_app_button_pressed:Signal;

    public function VBody() {
        // initial signal
        this._sig_start_app_button_pressed = new Signal();
        trace("VWelcome started");

    }
    /**
     * Destructor
     */
    public function destroy ():void
    {
        this._sig_start_app_button_pressed.removeAll ();

        this.start_button.removeEventListener (MouseEvent.CLICK, h_s_button_click);
    }


    /**
     * Children created handler
     */
    override protected function childrenCreated():void {
        super.childrenCreated();
        this.start_button.addEventListener(MouseEvent.CLICK, h_s_button_click);
    }

    private function h_s_button_click(event:MouseEvent):void {
        trace("View knows start button is clicked");
        this._sig_start_app_button_pressed.dispatch();
    }

    public function get sig_start_app_button_pressed():Signal {
        return (this._sig_start_app_button_pressed);
    }

}

}
