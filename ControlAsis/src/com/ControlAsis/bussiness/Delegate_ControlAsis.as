package com.ControlAsis.bussiness
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.ControlAsis.model.ModelLocator;	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	[Bindable]
	public class Delegate_ControlAsis

	{
		private var responder : IResponder;
		private var service : Object;
		private var model : ModelLocator = ModelLocator.getInstance();
		private var resultHandler:Function;
		
/* ============================================================
	INSTANCIA AL WEB SERVICE      
============================================================ */		
		public function Delegate_ControlAsis( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "WSControlAsis" );
			this.responder = responder;
		}
/* ============================================================
LISTAS
============================================================ */		
	
		 public function ListaAccion():void
		{
			var token : AsyncToken = service.WS_ListaAccion(); 
			token.addResponder(responder);
		}
		
		
			 public function ListaEstados():void
		{
			var token : AsyncToken = service.WS_ListaEstados(); 
			token.addResponder(responder);
		}
		
		
			 public function ListaMercado():void
		{
			var token : AsyncToken = service.WS_ListaMercado(); 
			token.addResponder(responder);
		}
		
	
			
			 public function ListaTipoCV():void
		{
			var token : AsyncToken = service.WS_ListaTipoCV(); 
			token.addResponder(responder);
		}
	
	
			 public function ListaLibro():void
		{
			var token : AsyncToken = service.WS_ListaLibros(); 
			token.addResponder(responder);
		}
/* ============================================================
INGRESO-ELIMINACION-MODIFICACION
============================================================ */				
	
	
	public function IngModEliLibros(oXMLParametro:String):void
		{
			var token : AsyncToken = service.Ws_IngModEliLibros(oXMLParametro); 
			token.addResponder(responder);
		}
	
	
	
	
	
	
	
	
	}
		
	
}