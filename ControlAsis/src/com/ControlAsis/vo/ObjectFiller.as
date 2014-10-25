package com.ControlAsis.vo
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	
	import mx.rpc.xml.SimpleXMLEncoder;

	public class ObjectFiller extends Object implements IValueObject
	{
		public function set fill(xml:XML):void
		{
		   for each (var i :XML in xml.elements())
		   {
		   		this[i.localName()] = i;
		   }
		}
		public function set fillAttributes(xml:XML):void
		{
		   for each (var i :XML in xml.attributes())
		   {
		   		this[i.localName()] = i;
		   }
		}		
		public  function toXML(strRoot:String):XML 
		{
	       var qName:QName = new QName(strRoot);
           var xmlDocument:XMLDocument = new XMLDocument();
           var simpleXMLEncoder:SimpleXMLEncoder = new SimpleXMLEncoder(xmlDocument);
           var xmlNode:XMLNode = simpleXMLEncoder.encodeValue(this, qName, xmlDocument);
           var xml:XML = new XML(xmlDocument.toString());
           return xml;
		}
	}
}