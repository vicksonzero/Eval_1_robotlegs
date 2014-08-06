/**
 * Created by Lenovo on 18/7/2014.
 */
package bodyB.configs {
import body.commands.CmdLoadNameList;

import bodyB.commands.CmdLoadNameListB;
import bodyB.mediators.MedBodyB;
import bodyB.models.MBodyB;

import bodyB.signals.SigVBodyBLoaded;

import bodyB.signals.SigVBodyBTired;
import bodyB.views.VBodyB;

import welcome.mediators.MedApp;
import body.mediators.MedBody;

import welcome.mediators.MedWelcome;

import body.models.MBody;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import welcome.signals.SigLoadBody;
import body.signals.SigVBodyLoaded;
import body.signals.SigVBodyTired;

import spark.components.ViewNavigator;

import body.views.VBody;

import welcome.signals.SigLoadBodyB;

import welcome.views.VWelcome;

public class BodyBConfig implements IConfig {
    [Inject]
    public var injector:IInjector;

    [Inject]
    public var mediatorMap:IMediatorMap;

    [Inject]
    public var commandMap:ISignalCommandMap;

    [Inject]
    public var contextView:ContextView;


    public function configure():void {

        injector.map(SigVBodyBTired).asSingleton();

        mediatorMap.map(VBodyB).toMediator(MedBodyB);

        commandMap.map(SigVBodyBLoaded).toCommand(CmdLoadNameListB);

        injector.map(MBodyB).asSingleton();
    }
}
}
