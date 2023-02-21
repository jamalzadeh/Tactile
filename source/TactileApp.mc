using Toybox.Application as App;
using Toybox.Lang;
using Toybox.WatchUi;
using Toybox.Communications;
using Toybox.System;
using Toybox.Attention as Attention;

class TactileApp extends App.AppBase {
    
    function initialize() {
        App.AppBase.initialize();
        
        if( Communications has :registerForPhoneAppMessages)
        {       
            Communications.registerForPhoneAppMessages(method(:onReceiveMessage));
        	//var phoneCallback = method(:onReceiveMessage);
        	//Communications.registerForPhoneAppMessages(phoneCallback);
        }
        else
        {
        	// crash if registerForPhoneAppMessages interface isn't available
        	throw new Lang.Exception();
        }
    }
    
        // callback function to receive a phone message
	function onReceiveMessage( msg)
	{
		PhoneMessageHandler.isNewMessage = true;
		PhoneMessageHandler.message = msg;
        var test2=msg.data.toNumber();
        
		var vibeData=[new Attention.VibeProfile(test2, 2000)];
        
        try {
            Attention.vibrate(vibeData);
        }catch (e) {
            // Catch and handle any exceptions thrown
            
            System.println(e.getErrorMessage());
        }
        WatchUi.requestUpdate();
	}

    // onStart() is called on application start up
    function onStart(state) {
    	    
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new TactileView(), new TactileDelegate() ];
        
    }

}

function getApp() as TactileApp {
    return App.getApp() as TactileApp;
}