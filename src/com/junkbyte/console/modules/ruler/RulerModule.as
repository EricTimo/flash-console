package com.junkbyte.console.modules.ruler {
	import com.junkbyte.console.Console;
	import com.junkbyte.console.core.ConsoleCore;
	import com.junkbyte.console.vos.ConsoleMenuItem;

	import flash.events.Event;
	/**
	 * @author LuAye
	 */
	public class RulerModule extends ConsoleCore{
		
		public static const NAME:String = "ruler";
		
		protected var menu:ConsoleMenuItem;
		protected var _ruler:Ruler;
		
		
		public function RulerModule()
		{
			menu = new ConsoleMenuItem("RL", start, null, "Screen Ruler::Measure the distance and angle between two points on screen.");
		}
		
		override public function registerConsole(console:Console):void
		{
			super.registerConsole(console);
			_central.mainPanelMenu.addMenu(menu);
		}
		
		override public function unregisterConsole(console:Console):void
		{
			_central.mainPanelMenu.removeMenu(menu);
			super.unregisterConsole(console);
		}
		
		override public function getModuleName() : String 
		{
			return NAME;
		}
		
		private function start():void
		{
			_ruler = new Ruler(_central);
			_ruler.addEventListener(Event.CLOSE, onExit, false, 0, true);
			_central.display.addChild(_ruler);
			menu.active = true;
			menu.announceChanged();
		}
		
		protected function onExit(event:Event):void
		{
			if(_ruler && _central.display.contains(_ruler))
			{
				_central.display.removeChild(_ruler);
			}
			_ruler = null;
			menu.active = false;
			menu.announceChanged();
		}
	}
}