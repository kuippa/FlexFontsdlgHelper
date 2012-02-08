package libs 
{
	/**
	 * @author kuippa
	 */
	import mx.core.*;
	
	public class clsApp 
	{
		
		public function clsApp() 
		{
			
		}

		public static function getKeyFlag(keycd:String):Boolean
		{
			var retBln:Boolean = false;
			var flvparam:Object = FlexGlobals.topLevelApplication.parameters;
			for (var keys:String in flvparam) {
				if (keys == keycd) {
					if (flvparam[keys] != 0) {
						retBln = true;
					}
				}
			}	
			return retBln;
		}

		public static function getKeyParams(keycd:String):Array
		{
			var AryID:Array = new Array();
			var flvparam:Object = FlexGlobals.topLevelApplication.parameters;
			var arySplit:Array = new Array();
			for (var keys:String in flvparam) {
				if (keys == keycd) {
					arySplit = flvparam[keys].split(",");
				}
			}	
			for (var i:Number = 0; i < arySplit.length ; i++ ) {
				AryID.push(arySplit[i]);
				//if (AryID.length > 13) {
					//break;
				//}
			}
			return AryID;
		}
		
	}
}