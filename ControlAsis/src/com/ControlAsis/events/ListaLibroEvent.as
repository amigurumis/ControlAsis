package com.ControlAsis.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.ControlAsis.control.Controller;
	
	public class ListaLibroEvent extends CairngormEvent
	{
		public function ListaLibroEvent()
		{
			super(Controller.EVENT_LISTALIBRO)
			this.data = new Object();
		}
	}
}
