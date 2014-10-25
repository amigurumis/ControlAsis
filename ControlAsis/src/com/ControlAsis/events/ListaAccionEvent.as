package com.ControlAsis.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.ControlAsis.control.Controller;
	
	public class ListaAccionEvent extends CairngormEvent
	{
		public function ListaAccionEvent()
		{
			super(Controller.EVENT_LISTAACCION)
			this.data = new Object();
		}
	}
}
