/**
 * Created by Lenovo on 18/7/2014.
 */
package configs {
import commands.CmdStartApp;

import mediators.MedApp;

import mediators.MedWelcome;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import signals.SigStartApp;

import spark.components.ViewNavigator;

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


    public function configure():void {
        //injector.map(UserModel).asSingleton();
        mediatorMap.map(AppVN).toMediator(MedApp);
        injector.map(SigStartApp).asSingleton();

        mediatorMap.map(VWelcome).toMediator(MedWelcome);
        //commandMap.map(SigStartApp).toCommand(CmdStartApp);
        //ViewNavigator(this.contextView.view).popToFirstView();
    }
}
}
