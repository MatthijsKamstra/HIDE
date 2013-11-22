package ;

/**
 * ...
 * @author AS3Boyan
 */
extern class HIDE
{
	public static var plugins:Array<String>;
	
	public static function loadJS(name:String, urls:Array<String>, ?onLoad:Dynamic):Void;
	public static function loadCSS(name:String, urls:Array<String>):Void;
	public static function waitForDependentPluginsToBeLoaded(name:String, plugins:Array<String>, onLoaded:Void->Void, ?callOnLoadWhenAtLeastOnePluginLoaded:Bool = false):Void;
	public static function registerHotkey(hotkey:String, functionName:String):Void;
	public static function registerHotkeyByKeyCode(code:Int, functionName:String):Void;
}