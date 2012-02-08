package libs 
{
	/**
	 * @author : kuippa
	 */
    import flash.external.*
    import flash.net.*;
    import flash.display.*;
    import flash.system.System;
	import flash.utils.Timer;
	import flash.events.*;
	import mx.core.*;
	import mx.controls.*;
	
	public class clsNet 
	{
		private var _isReady:Boolean = false;
		private var _isAvailable:Boolean = false;
		private var _tmrCnt:Number = 0;

		public function clsNet() 
		{
			ExternalInterface.marshallExceptions = false;
			_isAvailable = ExternalInterface.available;
			if (!_isAvailable) {
				return;
			}
			if (!checkJavaScriptReady()) {
				readyTimer();
			}
		}
		
		public function _CallJs(calljsFunction:String, args:Object):Boolean 
		{
			var retval:Boolean = false;
			if (_isAvailable && _isReady) {
				retval = ExternalInterface.call(calljsFunction,args);
			}
			return retval;
		}

        public function _SetasListener(callFuctionName:String, callFunction:Function):void 
		{
			if (_isAvailable) {
				ExternalInterface.addCallback(callFuctionName, callFunction);
			}
        }

        private function checkJavaScriptReady():Boolean 
		{
			_isReady = ExternalInterface.call("isReady");
            return _isReady;
        }
		
		private function readyTimer():void
		{
			var readyTimer:Timer = new Timer(100, 0);
			readyTimer.addEventListener(TimerEvent.TIMER, timerHandler);
			readyTimer.start();
		}

        private function timerHandler(event:TimerEvent):void
		{
			_tmrCnt++;
            var isReady:Boolean = checkJavaScriptReady();
            if (isReady || _tmrCnt > 1000) {
                Timer(event.target).stop();
            }
        }	
		
	}

}