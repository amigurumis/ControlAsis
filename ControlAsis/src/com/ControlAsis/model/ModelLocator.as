package com.ControlAsis.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class ModelLocator implements com.adobe.cairngorm.model.ModelLocator
	{
		private static var modelLocator : com.ControlAsis.model.ModelLocator;
//*****************************************************************************************************	
		public static function getInstance():com.ControlAsis.model.ModelLocator
		{
			if ( modelLocator == null )
				modelLocator = new com.ControlAsis.model.ModelLocator();
			return modelLocator;
		}
//*****************************************************************************************************	
		public function ModelLocator():void
		{
			if ( com.ControlAsis.model.ModelLocator.modelLocator != null )
			throw new Error('Solo se puede hacer una instancia al model por módulo');
		}
		

//*****************************************************************************************************		
		public var servicesCollection		:ArrayCollection=new ArrayCollection();
		public var userLog					: String; 
//*****************************************************************************************************			
		public var counter:int;	
		public var counterHora:int;

//*****************************************************************************************************	
		public var listaEstados 		:ArrayCollection = new ArrayCollection();
		public var listaAccion			:ArrayCollection = new ArrayCollection();
		public var listaMercado			:ArrayCollection = new ArrayCollection();
		public var listaTipoCV 			:ArrayCollection = new ArrayCollection();
		public var listaLibro 			:ArrayCollection = new ArrayCollection();
		public var listaInstrumento 	:ArrayCollection = new ArrayCollection();
		
		public var listaAlumnos 			:ArrayCollection = new ArrayCollection();
		public var listaEstablecimiento 	:ArrayCollection = new ArrayCollection();
		public var listaProfesores		 	:ArrayCollection = new ArrayCollection();
					
		
		
//*****************************************************************************************************				
		
		public var rutCliente:String;
		public var nomCliente:String;
		public var ejecCliente: String;
		public var nomEjecutivo:String;

		
//*****************************************************************************************************			
		
		
		
				
		//private var testXml:Class;		
			
		//private var xmlIn:XML = testXml.data as XML;
		

		//public var xmlExport :String;	
					
		
		
/* 		public var ConsultaTipoInformeArray:ArrayCollection=new ArrayCollection();
		public var ConsultaDetallePortafolio1Array:ArrayCollection=new ArrayCollection();
		public var ConsultaDatosClienteArray:ArrayCollection=new ArrayCollection();
		public var ConsultaRelPortafolioFondoArray:ArrayCollection=new ArrayCollection();
		public var ConsultaPortafoliosArray:ArrayCollection=new ArrayCollection();
		public var ConsultaPropuestasPortafolioArray:ArrayCollection=new ArrayCollection();
		public var ConsultaRentabilidadPortafolioArray:ArrayCollection=new ArrayCollection();
		public var ConsultaComposicionGraficoPortafolioArray:ArrayCollection=new ArrayCollection();
		public var ConsultaDatosAgenteArray:ArrayCollection=new ArrayCollection(); */
		
//		public var AppSubMenu: int;
//		public var AppMenu: int;
//		public var AppUsuario: String;
//		
//		public var Descripcion: String;
//		public var CriterioInversion: String;
//		public var Riesgo: String;
//		public var CodigoAgenteUsuario: String;
//		public var NombreUsuario: String;
//		public var EsSupervisorUsuario: String = "0"; // 0 = No
//		
//		public var RutCli: String;
//		public var NombreCli: String;
//		public var CodigoAgente: String;
//		public var NombreAgente: String;
//		public var MailAgente: String;
//		public var CodigoAgenteCliente: String;
//		public var NombreAgenteCliente: String;
		
		//public var Portafolio_id: String = "4"; // Perfil Muy Conservador
		//public var NomPortafolio: String = "Muy Conservador"; // Perfil Muy Conservador
/* 		
		public var VarReVaCh: String;
		public var VarVaEm: String;
		public var VarVaDe: String;
		public var VarDeUSD: String;
		public var VarDePe: String;
		public var VarDeUF: String;
		public var VarYTD: String;
		public var Var1m: String;
		public var Var2m: String;
		public var Var3m: String;
		public var Var6m: String;
		public var Var1a: String;
		public var Var3a: String;
		public var Var5a: String;
		 */
		/* public var PortafolioAgresivo: String;
		public var PortafolioBalanceado: String;
		public var PortafolioConservador: String;
		public var PortafolioCrecimiento: String; */
		
		/*===[ Variables Globales ]===*/				
		
		//public var URLExportarExcel: String = "http://webservices.desarrollo.larrainvial.com/WSGenericReport/ExportBinaryStream.aspx";
		//public var Expotar: String;
		//public var URLExportarPDF: String = xmlIn..URLExportaPDF.@URL;
		
		//public var MinRentabilidadNormalizado: Number = -0.001;
		//public var MaxRentabilidadNormalizado: Number = 0.001;
	//	public var FechaDatos: String = "";
	
		
		/*===[ FIN - Variables Globales ]===*/
				
		
	}
}



