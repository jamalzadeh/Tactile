import Toybox.Lang;
import Toybox.WatchUi;

class TactileDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new TactileMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}