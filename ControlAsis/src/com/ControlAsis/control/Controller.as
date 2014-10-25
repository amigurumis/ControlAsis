package com.ControlAsis.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.ControlAsis.command.*;
		
	public class Controller extends FrontController
	{
				
		public function Controller()
		{
			initializeCommands();
		}	
		
		
		public static const EVENT_LISTAACCION				:String ="ListaAccionEvent";
		public static const EVENT_LISTALIBRO				:String ="ListaLibroEvent";	
		public static const EVENT_INGMODELILIBROS			:String ="IngModEliLibrosEvent";
		
	
		
		public function initializeCommands ():void
		{
		
			
			addCommand(EVENT_LISTAACCION,ListaAccionCommand);
			addCommand(EVENT_LISTALIBRO,ListaLibroCommand);		
			addCommand(EVENT_INGMODELILIBROS,IngModEliLibrosCommand);
			
			
		
			
		} 
		
		
	
	}
}

