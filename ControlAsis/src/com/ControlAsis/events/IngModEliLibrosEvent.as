package com.ControlAsis.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.ControlAsis.control.Controller;
	
	public class IngModEliLibrosEvent extends CairngormEvent
	{
		public function IngModEliLibrosEvent(xml:String)
		{
			super(Controller.EVENT_INGMODELILIBROS)
			this.data=xml;
		}
	}
}
