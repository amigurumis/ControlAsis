package com.ControlAsis.command
{
	import cl.larrainvial.comun.componentes.AlertaCustom;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.ControlAsis.bussiness.*;
	import com.ControlAsis.model.*;
	import com.ControlAsis.vo.*;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class IngModEliLibrosCommand implements IResponder, ICommand
	{
		public var model:ModelLocator=ModelLocator.getInstance();
		public var alerta:AlertaCustom;		
		public var _delegate :Delegate_ControlAsis=new Delegate_ControlAsis(this as IResponder);
		
/* ============================================================
	LLAMADA AL METODO DEL WEB SERVICE          
============================================================ */		
		
		public function execute(event:CairngormEvent):void
		
		{
			 _delegate.IngModEliLibros(event.data.toString());
			
		}
		
/* ============================================================
	RESULTADO DESDE WEB SERVICE        
============================================================ */				
		
		public function result(data:Object):void
		{
			try{
				var xmlResult :XML = XML(data.result);
				
				if(Number(xmlResult.Error.@Status) != 0){
					var error :ErrorVO = new ErrorVO();
                    var xmlError :XML = <Error/>;
                    xmlError.appendChild("<resumen>Error</resumen>");
                    xmlError.appendChild("<detalle>" + xmlResult.Error.@Detalle + "</detalle>");
                    error.fill = xmlError;
                    Alert.show("Error generando archivo. /n" + "RESUMEN: " + error.resumen + "\n\nDETALLE: " + error.detalle, "Server Error", AlertaCustom.FATAL);

				}else{
					
					var Mensaje: String;
					
					for each(var nodeAge :XML in xmlResult..Resultado.Detalle)
					{
						Mensaje= nodeAge.@Mensaje;						
						
						if (Mensaje == 'OKG'){
						Alert.show("Apertura de Libro Generada", "Atención");
						}else{
						if (Mensaje != 'OKE'){
						Alert.show(Mensaje, "Atención");}
						}
						
						if (Mensaje == 'OKE'){
						Alert.show("Libro Cerrado", "Atención");
						}else{
							if (Mensaje != 'OKG'){
						Alert.show(Mensaje, "Atención");}
						}
						
					}
					
					}
				
				}catch(e :Error){
				alerta = new AlertaCustom();
				alerta.show("Error en generar la solicitud","Client Error", AlertaCustom.FATAL, e.getStackTrace());
			}finally{
			model.counter--;
			}
		}
		
//*****************************************************************************************************				
		public function fault(info:Object):void
		{	model.counter--;
			alerta = new AlertaCustom();
				alerta.show("Error en Operación","Client Error", AlertaCustom.FATAL, info.toString());
		}
		
		
		
	}
}