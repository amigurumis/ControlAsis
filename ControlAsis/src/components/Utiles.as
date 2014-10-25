package components
{
	import flash.events.TextEvent;
	
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.controls.TextInput;
	import mx.formatters.DateFormatter;
	import mx.formatters.NumberFormatter;
	
	public class Utiles
	{
		public static var FECHA_FORMATO_DDMMAAAA : String = "DDMMAAAA";
		public static var FECHA_FORMATO_MMDDAAAA : String = "MMDDAAAA";
		public static var FECHA_FORMATO_AAAADDMM : String = "AAAADDMM";
		public static var FECHA_FORMATO_AAAAMMDD : String = "AAAAMMDD";
		public static var HORA_FORMATO_HHMM : String = "HHMM";
		
		public static var FECHA_SEPARADOR_BARRA : String = "/";
		public static var FECHA_SEPARADOR_GUION : String = "-";
		
		
		/** Retorna un string de fecha usando el formato pasado por parámetro **/
		public static function retornarDateString(fecha:Date, formato:String, separador:String):String
		{
			var df : DateFormatter = new DateFormatter();
			var fechaString : String;
			
			switch(formato) {
				case FECHA_FORMATO_AAAAMMDD:
					df.formatString = "YYYY"+separador+"MM"+separador+"DD";
					break;
				case FECHA_FORMATO_DDMMAAAA:
					df.formatString = "DD"+separador+"MM"+separador+"YYYY";
					break;
				case HORA_FORMATO_HHMM:
					df.formatString = "JJ:NN";
					break;
			}
			
			return df.format(fecha);
		}
		
		
		/**
		 * Retorna la fecha en String con el formato "YYYY-MM-DD" utilizado 
		 * por MOL en la mayoria de los xml de entrada a los webservice.
		 **/ 
		public static function retornarFechaStringMOL(fecha:Date):String
		{
			if (fecha==null)
				return "";
			
			return retornarDateString(fecha, FECHA_FORMATO_AAAAMMDD, FECHA_SEPARADOR_GUION);
		}
		
		
		/**
		 * Retorna la hora en String con el formato "HH:MM" utilizado 
		 * por MOL en la mayoria de los xml de entrada a los webservice.
		 **/
		public static function retornarHoraStringMOL(fecha:Date):String
		{
			if (fecha==null)
				return "";
			
			return retornarDateString(fecha, HORA_FORMATO_HHMM, null);
		}
		
		/** Retorna la fecha con la hora agregada. **/
		public static function retornarFechayHora(fecha:Date):String
		{
			if (fecha==null)
				return "";
			
			var df : DateFormatter = new DateFormatter();
			df.formatString = "DD-MM-YYYY JJ:NN";
			var retorno : String = df.format(fecha);
			return retorno;
		}
		
		/** Retorna la fecha con la hora agregada. **/
		public static function retornarFechayHoraArchivo(fecha:Date):String
		{
			if (fecha==null)
				return "";
			
			var df : DateFormatter = new DateFormatter();
			df.formatString = "DD-MM-YYYY_JJ_NN";
			var retorno : String = df.format(fecha);
			return retorno;
		}
		public static function retornarFechaEsp(fecha:Date):String
		{
		
	        var daym:String = String(fecha.getDate()) ;
			var month:Number = fecha.getMonth();
		    var day:Number = fecha.getDay();
		    var year:String = String(fecha.getFullYear());
		    var dayarray:Array = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
            var montharray:Array = new Array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
            return dayarray[day] + ", " + daym + " de " + montharray[month] + " del " + year;

		   
		}
		/**
		 * Valida el rut introducido en un TextInput
		 */
		public static function validarRUTTextInput(rutTextInput:TextInput):Boolean
		{
			var reg : RegExp = /\./gi;
			var rut :String = rutTextInput.text.replace(reg,"");
			var numRUT : String;
        	var dvRUT : String = rut.substr(rut.length-1);
        	
        	//var formato : NumberFormatter = new NumberFormatter();
        	//formato.precision = 0;
        	//formato.useThousandsSeparator = true;
        	//formato.decimalSeparatorTo = ",";
        	//formato.thousandsSeparatorTo = ".";
        	
        	var indGuion:int = rut.indexOf("-");
        	if (indGuion==-1 && rut.length<=9) {
        		//No hay guion.  Lo agrego en el TextInput
        		numRUT = rut.substr(0, rut.length-1);
        		//rutTextInput.text = formato.format(Number(numRUT))+"-"+dvRUT;
        		rutTextInput.text = numRUT+"-"+dvRUT;
        	}else if (indGuion==rut.length-2) {
        		//Hay guion y esta en la posicion debida
        		numRUT = rut.substr(0, rut.length-2);
        		//rutTextInput.text = formato.format(Number(numRUT))+"-"+dvRUT;
        		rutTextInput.text = numRUT+"-"+dvRUT;
        	}else {
        		//El guion no es el penultimo caracter
        		return false;
        	}
        	
        	return Utiles.validarRUT(numRUT, dvRUT);
		}
		/**
		 * Parsea un String a un Date
		 */
		public static function devolverFecha(fech:String,form:String) : Date
		{
		  var date:Date = DateField.stringToDate(fech,form)
		  return date;
		}
		public static function formatRUT(rut : String): String
		{
			var reg : RegExp = /\./gi;
			var rut :String = rut.replace(reg,"");
			var numRUT : String;
        	var dvRUT : String = rut.substr(rut.length-1);
        	
        	var formato : NumberFormatter = new NumberFormatter();
        	formato.precision = 0;
        	formato.useThousandsSeparator = true;
        	formato.decimalSeparatorTo = ",";
        	formato.thousandsSeparatorTo = ".";
        	
        	var indGuion:int = rut.indexOf("-");
        	
    		//No hay guion.  Lo agrego
    		numRUT = rut.substr(0, rut.length-1);
    		rut = formato.format(Number(numRUT))+"-"+dvRUT;
    		return rut;
		}
		/**
		 * Verifica la validez de un RUT a partir del número y el dígito 
		 * verificador pasados por parámetro.
		 */
		public static function validarRUT(rut:String , dvRut:String):Boolean
		{
			// Expresión Regular para validar formato de rut:   
			//        ^\d{1,2}\d{6}[-][0-9kK]{1}$
			
			var count : int = 0;
			var count2 : int = 0;
			var factor : int = 2;
			var suma : int = 0;
			var sum : int = 0;
			var digito : String = "";
			count2 = rut.length-1;
			
			while(count < rut.length)
			{
				sum = factor * int(rut.substr(count2,1)),
				suma += sum
				sum = 0;
				count++;
				count2--;
				factor ++;
				if (factor>7)
				{
					factor = 2;
				}
			}
							
			digito = (11 - (suma % 11)).toString();
			if (digito == "11")
			{
				digito = "0";
			}
			if(digito == "10")
			{
				digito = "K"
			}
			
			if(digito == dvRut.toUpperCase())
			{
				return true;
			}
			else
			{
				return false;
			}				
		}
		
		public static function calcularDVRut(rut : String) : String
		{
			var count : int = 0;
			var count2 : int = 0;
			var factor : int = 2;
			var suma : int = 0;
			var sum : int = 0;
			var digito : String = "";
			count2 = rut.length-1;
			
			while(count < rut.length)
			{
				sum = factor * int(rut.substr(count2,1)),
				suma += sum
				sum = 0;
				count++;
				count2--;
				factor ++;
				if (factor>7)
				{
					factor = 2;
				}
			}
							
			digito = (11 - (suma % 11)).toString();
			if (digito == "11")
			{
				digito = "0";
			}
			if(digito == "10")
			{
				digito = "K"
			}
			
			return digito;
		}
		
		public static function obtenerMensajeErrorWS(mensajeBruto : String) : String
		{
			var partesMsjBruto : Array = mensajeBruto.split(":");
			
			partesMsjBruto[1] = String(partesMsjBruto[1]).split("--->")[0];
			
			partesMsjBruto[3] = String(partesMsjBruto[3]).replace("\n"," ");
			
			partesMsjBruto[4] = String(partesMsjBruto[4]).split("\n")[0];
			
			return partesMsjBruto[1] + "\n" + partesMsjBruto[3] + "\n\t" + partesMsjBruto[4];
		}
		
		public static function trimString(str:String):String
    	{
        var startIndex:int = 0;
        while (str.indexOf(' ', startIndex) == startIndex)
            ++startIndex;

        var endIndex:int = str.length - 1;
        while (str.lastIndexOf(' ', endIndex) == endIndex)
            --endIndex;

        return endIndex >= startIndex ?
               str.slice(startIndex, endIndex + 1) :
               "";
    	}
    	
    	public static function splitString(msg : String): Array
    	{
    		var msgParts : Array = new Array();
    		
    		
    		if (msg.length > 1200)
    		{
    			var long : int = msg.length;
    			var aux : int = 0;
    			while ( aux < msg.length)
    			{
    				if ((aux + 1200) < msg.length)
    				{
    					msgParts.push(msg.substring(aux, aux + 1200));
	    				aux = aux + 1200;
    				}
    				else break;    				
    				
    			}
    			if (aux != (msg.length -1))
    			{
    				msgParts.push(msg.substring(aux , msg.length ));
    				
    			}
    		}
    		else msgParts.push(msg);
    		
    		return msgParts;    		
    	}
		
		//Se encarga de aceptar los valores numericos el un text
		public static function onlyNumber(e:TextEvent):void
		{
			if(!(Utiles.isNum(e.text)))
			{
				e.preventDefault();
			}
			
		}
		public static function onlyChar(e : TextEvent):void
		{   
			if (!(Utiles.isSimbol(e.text)))
			{
				e.preventDefault();
			}
		}
		public static function onlyCharDos(e : TextEvent):void
		{   
			if ( Utiles.isNum2(e.text))
			{
				e.preventDefault();
			}
			if (!(Utiles.isSimbol(e.text)))
			{
				
				e.preventDefault();
			}
		}
		
		public static function onlyNum2(e : TextEvent): void
		{
			var val : String = e.text;
			if (!(Utiles.isSimbol(val)))
			{
				
				e.preventDefault();
			}
			if (!(Utiles.isNum(val)))
			{
				e.preventDefault();
			}
		}
		private static function isNum2(num:String):Boolean {
	            var strCaps:String = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz ";
	            if(strCaps.indexOf(num,0)==-1){
	            	return true;
	            }
	            return false;
		}
	    private static function isNum(num:String):Boolean {
	            var strCaps:String = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz";
	            if(strCaps.indexOf(num,0)==-1){
	            	return true;
	            }
	            return false;
		}
		private static function isSimbol(val : String): Boolean
		{
			    var strCaps:String = "\\\·$%&/()=?¿!@ªº-:;.,><|#¡[]{}Ç*€¬~\"";
	            if(strCaps.indexOf(val,0)==-1){
	            	return true;
	            }
	            return false;
		}
		
		public static function soloNumero(e : TextEvent):void
		{
			var nros : String = "1234567890.,";
			var ingresado : String = e.text;
			if(nros.indexOf(ingresado,0) < 0)
			{
				e.preventDefault();
			}	
		}
		
		public static function letraYNumero(e : TextEvent):void
		{
			var nros : String = "1234567890ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzñ ";
			var ingresado : String = e.text;
			if(nros.indexOf(ingresado,0) < 0)
				e.preventDefault();
		}
		
		public static function formatNumeric(num:String, precision : Number = 0):String
		{
			if (num == "") return "";
			var number : Number = Number(num);
			var formater : NumberFormatter = new NumberFormatter();
			formater.useThousandsSeparator = true;
			formater.precision = precision;
			formater.thousandsSeparatorTo = ".";
			formater.decimalSeparatorTo = ",";
			return formater.format(number);
		}
		
		public static function toNumber(num:String):String
		{
			var pat : RegExp = /\./gi;
			num = num.replace(pat,"").replace(",",".");
			return num;
		}
		
		/** Devuelve una fecha ignorando la zona horaria. **/
		public static function fechaZonaHoraria(fecha : Date):Date
		{
			return new Date(fecha.fullYearUTC,fecha.monthUTC,fecha.dateUTC,fecha.hoursUTC,fecha.minutesUTC);
		}
		
		public static function stringToDate(valueString:String, inputFormat:String):Date
	    {
	        var mask:String
	        var temp:String;
	        var dateString:String = "";
	        var monthString:String = "";
	        var yearString:String = "";
	        var j:int = 0;
	
	        var n:int = inputFormat.length;
	        for (var i:int = 0; i < n; i++,j++)
	        {
	            temp = "" + valueString.charAt(j);
	            mask = "" + inputFormat.charAt(i);
	
	            if (mask == "M")
	            {
	                if (isNaN(Number(temp)) || temp == " ")
	                    j--;
	                else
	                    monthString += temp;
	            }
	            else if (mask == "D")
	            {
	                if (isNaN(Number(temp)) || temp == " ")
	                    j--;
	                else
	                    dateString += temp;
	            }
	            else if (mask == "Y")
	            {
	                yearString += temp;
	            }
	            else if (!isNaN(Number(temp)) && temp != " ")
	            {
	                return null;
	            }
	        }
	
	        temp = "" + valueString.charAt(inputFormat.length - i + j);
	        if (!(temp == "") && (temp != " "))
	            return null;
	
	        var monthNum:Number = Number(monthString);
	        var dayNum:Number = Number(dateString);
	        var yearNum:Number = Number(yearString);
	
	        if (isNaN(yearNum) || isNaN(monthNum) || isNaN(dayNum))
	            return null;
	
	        if (yearString.length == 2)
	            yearNum+=2000;
	
	        var newDate:Date = new Date(yearNum, monthNum - 1, dayNum);
	
	        if (dayNum != newDate.getDate() || (monthNum - 1) != newDate.getMonth())
	            return null;
	
	        return newDate;
	    } 

		
		
//**********************************************************************************************************************		
	}// FIN DE LA CLASE
	
}
