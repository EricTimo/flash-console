/*
* 
* Copyright (c) 2008-2010 Lu Aye Oo
* 
* @author 		Lu Aye Oo
* 
* http://code.google.com/p/flash-console/
* 
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
* 
*/
package com.junkbyte.console.core 
{
	import com.junkbyte.console.Console;
	import com.junkbyte.console.ConsoleConfig;
	import com.junkbyte.console.interfaces.IConsoleModule;
	import com.junkbyte.console.interfaces.IDependentConsoleModule;
	import com.junkbyte.console.modules.remoting.IRemoter;
	import com.junkbyte.console.view.ConsoleLayer;
	import com.junkbyte.console.vos.ConsoleModuleMatch;
	
	import flash.events.EventDispatcher;

	public class ConsoleModule extends EventDispatcher implements IConsoleModule, IDependentConsoleModule
	{
		protected var _central:ConsoleModules;
		
		public function ConsoleModule(c:ConsoleModules = null)
		{
			_central = c;
		}
		
		protected function get remoter():IRemoter
		{
			return _central.remoter;
		}
		
		protected function get console():Console
		{
			return _central.console;
		}
		
		protected function get config():ConsoleConfig
		{
			return _central.config;
		}
		
		public function get display():ConsoleLayer
		{
			return _central.display;
		}
		
		public function report(obj:* = "", priority:int = 0, skipSafe:Boolean = true, ch:String = null):void
		{
			_central.report(obj, priority, skipSafe, ch);
		}
		
		public function getModuleName():String
		{
			return null;
		}
		
		public function registeredToConsole(console:Console):void
		{
			_central = console.modules;
			
		}
		
		public function unregisteredFromConsole(console:Console):void
		{
			_central = null;
		}
		
		public function getDependentModules():Vector.<ConsoleModuleMatch>
		{
			return new Vector.<ConsoleModuleMatch>();
		}
		
		public function dependentModuleRegistered(module:IConsoleModule):void
		{
			
		}
		
		public function dependentModuleUnregistered(module:IConsoleModule):void
		{
			
		}
	}
}