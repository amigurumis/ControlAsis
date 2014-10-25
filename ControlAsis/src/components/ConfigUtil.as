package components
{
	//import cl.larrainvial.comun.componentes.AlertaCustom;
	
	import com.larrainvial.AperturaLibro.model.ModelLocator;
	import com.larrainvial.AperturaLibro.vo.ConfigVO;
	
	public class ConfigUtil
	{
		public static var model :ModelLocator = ModelLocator.getInstance();
		 
		/**
		 * @id Nodo Id del xmlConfig.
		 * @tipoRuta Valores posibles --> "wsdl" o "uri".
		 * return Devuelve la ruta pedida para la key pasada por parametro.
		 */
		public static function buscarRuta(id :String, tipoRuta :String="wsdl") :String
		{
			//var alerta :AlertaCustom;
			var ruta :String = new String();
			try{
				if(model.servicesCollection && model.servicesCollection.length > 0){
					if(tipoRuta == "wsdl" || tipoRuta == "uri"){
						for each(var nodeRuta :ConfigVO in model.servicesCollection){
							if(nodeRuta.id == id){
								ruta = nodeRuta[tipoRuta];
								break;
							}
						}
					}else{
					//	alerta = new AlertaCustom();
					//	alerta.show("El Tipo de ruta no es válido, debe solicitar un 'wsdl' o una 'uri'", "Atención", AlertaCustom.INFO);
					}
				}else{
					//alerta = new AlertaCustom();
					//alerta.show("No hay rutas especificadas en la configuración", "Atención", AlertaCustom.INFO);
				}
			}catch(e :Error){
				//alerta = new AlertaCustom();
				//alerta.show("Ha ocurrido un error buscando una ruta en la configuración", "Client Error", AlertaCustom.FATAL, e.getStackTrace());
			}finally{
				return ruta;
			}
		}

	}
}