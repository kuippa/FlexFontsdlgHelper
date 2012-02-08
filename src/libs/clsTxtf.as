package libs
{
	/**
	 * @author : kuippa
	 * sometime I was battle with fontformat.I feels some strage about flexfont at Japanse....Help me!
	 */
	import flash.display.*;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import mx.core.UIComponent;

	public class clsTxtf extends UIComponent
	{
		
		private var _format:TextFormat = new TextFormat();
		private var _txtf:TextField = new TextField();
		
		public function clsTxtf() :void
		{
			with (_txtf)
			{
				background = false;
				border = false;
				wordWrap = false;
				mouseEnabled  = false;
				tabEnabled = false;
				x = 0;
				y = 0;
			}
		}

		public function setFormat(setfont:String = null,setsize:Object = 10.5,setcolor:Object=0x000000,setalign:String=flash.text.TextFormatAlign.LEFT,setspacing:Object=0):void 
		{
			with (_format) {
				font = setfont;
				size = setsize;
				color = setcolor;
				align = setalign;
				letterSpacing = setspacing;
				underline = false;
			}
			_txtf.defaultTextFormat = _format;
		}

		public function setText(settxt:String, setwordWrap:Boolean = false , setwidth:Number = 0, setheight:Number = 0
			, setalign:String = flash.text.TextFormatAlign.LEFT ,setvalign:String = "top" ):void 
		{
			var numFix:Number = 0;
			with (_txtf)
			{
				if (setwidth != 0 && setheight != 0)  {
					width = setwidth;
					height = setheight;
				}
				wordWrap = setwordWrap;
				_format.align = setalign;
				defaultTextFormat = _format; // set for calc
				embedFonts = false;	// It's need since Flex4 埋め込みフォント使用せず
				text = settxt;
				//	_format.align = flash.text.TextFormatAlign.JUSTIFY;	// It's was not well work.
				if (text.length > 1 && setalign == flash.text.TextFormatAlign.JUSTIFY)
				{
					numFix = (width - textWidth) / (text.length - 1);
					_format.letterSpacing = Math.floor(numFix.toFixed(3));
				}

				if (setvalign == "middle")
				{
					y = y + Math.floor((height - textHeight) / 2);
				} else if (setvalign == "bottom")
				{
					y = y + height - textHeight;
				}
				defaultTextFormat = _format; // set again
				text = settxt;
			}
            addChild(_txtf);
		}		
		
	}

}