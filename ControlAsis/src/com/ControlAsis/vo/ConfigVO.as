package com.ControlAsis.vo
{
	import com.adobe.cairngorm.vo.IValueObject;

	[Bindable]
	public class ConfigVO extends ObjectFiller implements IValueObject
	{
		public var id :String;
		public var wsdl :String;
		public var uri :String;
	}
}