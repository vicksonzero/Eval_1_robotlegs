/**
 * Created by Lenovo on 18/7/2014.
 */
package configs {
import commands.CmdLoadNameList;
import commands.CmdStartApp;

import mediators.MedApp;
import mediators.MedBody;

import mediators.MedWelcome;

import models.MBody;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import signals.SigStartApp;
import signals.SigVBodyLoaded;

import spark.components.ViewNavigator;

import views.VBody;

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

        injector.map(SigStartApp).asSingleton();
        //injector.map(SigVBodyLoaded).asSingleton();



        mediatorMap.map(AppVN).toMediator(MedApp);
        mediatorMap.map(VWelcome).toMediator(MedWelcome);
        mediatorMap.map(VBody).toMediator(MedBody);

        commandMap.map(SigVBodyLoaded).toCommand(CmdLoadNameList);
        //ViewNavigator(this.contextView.view).popToFirstView();

        injector.map(MBody).asSingleton();
    }
}
}
