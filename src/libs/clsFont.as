package libs
{
	/**
	 * @author : kuippa
	 */
	import flash.display.*;
	import flash.text.TextFormat;
	import flash.text.*;
	import mx.controls.*; 
	import mx.core.*;
 
	public class clsFont extends UIComponent
	{
		public function clsFont() :void
		{
		}
		
		public function getFontsList():Array
		{
			var fontslist:Array = new Array();
			var allFonts:Array = Font.enumerateFonts(true);
			for each (var myFonts:Font in allFonts)
			{
				fontslist.push(myFonts.fontName);
			}
			return fontslist;
		}
	}

}