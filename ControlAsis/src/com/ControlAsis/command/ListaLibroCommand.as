package com.ControlAsis.command
{	
	import cl.larrainvial.comun.componentes.AlertaCustom;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.ControlAsis.bussiness.*;
	import com.ControlAsis.vo.*;
	import com.ControlAsis.model.*;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	public class ListaLibroCommand implements ICommand, IResponder
	{
		[Bindable]
		private var model:ModelLocator = ModelLocator.getInstance();
		private var _Delegate:Delegate_ControlAsis= new Delegate_ControlAsis(this as IResponder);
		[Bindable]
		public var alerta:AlertaCustom;
		
/* ============================================================
	LLAMADA AL METODO DEL WEB SERVICE          
============================================================ */		
		
		public function execute(event:CairngormEvent) : void
		{	
			if(model.listaLibro)
				model.listaLibro.removeAll();
			else
				model.listaLibro = new ArrayCollection();	
				
					
			_Delegate.ListaLibro();
		}
		
/* ============================================================
	RESULTADO DE WEB SERVICE 
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
				
					var Libro:LibroVO;	
					for each(var nodeAge :XML in xmlResult..Resultado.Libro){
							Libro = new LibroVO();
							Libro.idLibro=nodeAge.@idLibro;
							Libro.Nemotecnico=nodeAge.@Nemotecnico;	
							Libro.NemoVisible=nodeAge.@NemoVisible;		
							Libro.Tipo=nodeAge.@Tipo;
							Libro.FechaDesde=nodeAge.@FechaDesde;
							Libro.FechaHasta=nodeAge.@FechaHasta;
							Libro.HoraHasta=nodeAge.@HoraHasta;
							Libro.TipoCV=nodeAge.@TipoCV;
							Libro.Mercado=nodeAge.@Mercado;	
							Libro.ValorRf=nodeAge.@ValorRf
							Libro.Limite=nodeAge.@Limite;
							Libro.ValorLimite=nodeAge.@ValorLimite
							Libro.Estado=nodeAge.@Estado;			
							model.listaLibro.addItem(Libro);		
					}
					
				}
				}catch(e :Error){
				alerta = new AlertaCustom();
				alerta.show("Error listando Libro","Client Error", AlertaCustom.FATAL, e.getStackTrace());
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
