/**
 * Created by Lenovo on 18/7/2014.
 */
package configs {
import commands.CmdStartApp;

import mediators.MedWelcome;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import signals.SigStartApp;

import views.VWelcome;

public class AppConfig implements IConfig {
    [Inject]
    public var injector:IInjector;

    [Inject]
    public var mediatorMap:IMediatorMap;

    [Inject]
    public var commandMap:ISignalCommandMap;

    [Inject]
    public var contextView:ContextView;

    [Inject]
    public var sig_start_app:SigStartApp;

    public function configure():void {
      /*
        // Map UserModel as a context enforced singleton
        injector.map(UserModel).asSingleton();
*/
        // Create a UserProfileMediator for each UserProfileView
        // that lands inside of the Context View
        mediatorMap.map(VWelcome).toMediator(MedWelcome);
        //mediatorMap.map(main).toMediator(MedWelcome);


        // Execute UserSignInCommand when UserEvent.SIGN_IN
        // is dispatched on the context's Event Dispatcherwww.win2.c
        commandMap.map(SigStartApp).toCommand(CmdStartApp);


        // The "view" property is a DisplayObjectContainer reference.
        // If this was a Flex application we would need to cast it
        // as an IVisualElementContainer and call addElement().
        //ViewNavigator(this.contextView.view).popToFirstView();

    }
}
}
