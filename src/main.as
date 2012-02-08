import flash.display.*;
import flash.text.*;
import flash.utils.*;
import flash.system.Security;
import mx.core.*;
import mx.controls.*;
import mx.events.*;
import mx.collections.ArrayCollection;
import libs.clsTxtf;
import libs.clsFont;
import libs.clsNet;
import libs.clsApp;
private var _clsNets:clsNet;
private var _fontslist:Array;

private function Init():void 
{
	try {
		Security.allowDomain("*");
		var clsFonts:clsFont = new clsFont();
		_clsNets = new clsNet();
		_fontslist = clsFonts.getFontsList();
		_clsNets._SetasListener("asListener", asListener);
		if (clsApp.getKeyFlag('viewmode')) {
			var fontscmb:ComboBox = new ComboBox();
			setFontCmb(fontscmb, _fontslist);
			fontscmb.addEventListener(mx.events.ListEvent.CHANGE, changeFonts);			
			this.addEventListener(ResizeEvent.RESIZE, setAppView);
			this.dispatchEvent(new ResizeEvent(ResizeEvent.RESIZE));	
			fontscmb.dispatchEvent(new ListEvent(ListEvent.CHANGE));	
		}
	} 
	catch(e:*){
		Alert.show(e);
	}
}

public function asListener(arg:String):void {
	_clsNets._CallJs("jsListener",_fontslist.join(','));
}

private function setFontCmb(cmb:ComboBox, fontslist:Array):void
{
	cmb.dataProvider = new ArrayCollection();
	for each (var fonts:String in fontslist)
	{
		var option:Object = new Object();
		option.label = fonts;
		option.data = fonts;
		cmb.dataProvider.addItem(option);
	}
	addChild(cmb);
}

private function setAppView(evt:ResizeEvent):void
{
	cvs.height = this.height;
	cvs.width = this.width;
	cvs.x = 0;
	cvs.y = 0;
}

private function changeFonts(e:mx.events.ListEvent=null):void
{
	var selectFont:String = "";
	if (e != null) {
		clearCvs();
		selectFont = ComboBox(e.target).selectedItem.data;
		var clsTxtfs:clsTxtf = new clsTxtf();
		clsTxtfs.setFormat(selectFont,60);
		clsTxtfs.setText(selectFont, false, cvs.width, cvs.height, flash.text.TextFormatAlign.CENTER, "middle");
		cvs.addChild(clsTxtfs);
	}
}

private function clearCvs():void {
	var cntobj:Number = this.cvs.numChildren;
	for ( var i:Number = (cntobj-1); i >= 0; i--) {
		cvs.removeChildAt(i);
	}
}
