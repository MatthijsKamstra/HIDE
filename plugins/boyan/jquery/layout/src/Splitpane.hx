package ;
import haxe.Timer;
import js.Browser;
import js.html.DivElement;
import jQuery.JQuery;

/**
 * ...
 * @author AS3Boyan
 */
@:keepSub @:expose class Splitpane
{
	public static var components:Array<DivElement> = new Array();
	private static var layout:Dynamic;
	
	public static function createSplitPane():Void
	{
		//<div id="panel" class="ui-layout-container" style="position: absolute; top: 51px;">
			//<div class="outer-center ui-layout-center">
					//<div id="sourceCodeEditor" class="middle-center ui-layout-center">
							//<ul class="tabs" id="docs" style="-webkit-touch-callout: none; -webkit-user-select: none; user-select: none;"></ul>
							//
							//<div class="ui-layout-content">
									//<textarea id='code' name='code' style="width: 100%; height: 100%;"></textarea>
							//</div>
					//</div>
					//
					//<div class="middle-south ui-layout-south">
							//<div id="output" class="ui-layout-content">
									//<textarea style="width: 100%; height: 100%; resize: none;"></textarea>
							//</div>
					//</div>
			//</div>
			//<div class="outer-west ui-layout-west">
					//<div id="tree_well" class="well" style="overflow: auto; padding: 0; margin: 0; width: 100%; height: 100%; font-size: 10pt; line-height: 1;">
							//<ul id="tree" class="nav nav-list" style="padding: 5px 0px;">
							//</ul>
					//</div>
			//</div>
		//</div>
		
		var panel:DivElement = Browser.document.createDivElement();
		panel.id = "panel";
		panel.className = "ui-layout-container";
		panel.style.position = "absolute";
		panel.style.top = "51px";
		
		var outerCenterPanel:DivElement = createComponent("outer", "center");
		panel.appendChild(outerCenterPanel);
		
		var middleCenterPanel:DivElement = createComponent("middle", "center");
		outerCenterPanel.appendChild(middleCenterPanel);
		
		var middleCenterPanelContent:DivElement = createContent();
		middleCenterPanel.appendChild(middleCenterPanelContent);
		
		var middleSouthPanel:DivElement = createComponent("middle", "south");
		outerCenterPanel.appendChild(middleSouthPanel);
		
		var middleSouthPanelContent:DivElement = createContent();
		middleSouthPanel.appendChild(middleSouthPanelContent);
		//components.push(middleSouthPanelContent);
		
		var outerWestPanel:DivElement = createComponent("outer", "west");
		panel.appendChild(outerWestPanel);
		
		components.push(outerWestPanel);
		components.push(middleCenterPanelContent);
		
		Browser.document.body.appendChild(panel);
		
		//Browser.document.addEventListener("load", function (e)
		//{
		Timer.delay(function ():Void
		{
			
			Splitpane.activateSplitpane();
		}
		,10000);
		//}
		//);
	}
	
	public static function activateSplitpane():Void
	{
		layout = untyped new JQuery("#panel").layout(
		{
			center__paneSelector:        ".outer-center",
			west__paneSelector:                ".outer-west",
			west__size:                                120,
			spacing_open:                        8,  // ALL panes
			spacing_closed:                        12, // ALL panes
			
			center__childOptions: {
					center__paneSelector:        ".middle-center",
					south__paneSelector:        ".middle-south",
					south__size:                        100,
					spacing_open:                        8,  // ALL panes
					spacing_closed:                        12 // ALL panes
			},
			
			animatePaneSizing:                        true,
			stateManagement__enabled:        true
		});
	}
	
	public static function createComponent(layout:String, side:String):DivElement
	{
		var component:DivElement = Browser.document.createDivElement();
		component.className = layout + "-" + side + " " + "ui-layout-" + side;
		return component;
	}
	
	public static function createContent():DivElement
	{
		var content:DivElement = Browser.document.createDivElement();
		content.className = "ui-layout-content";
		return content;
	}
}