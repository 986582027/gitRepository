 /**
  * @author [sina]zhangping1@
  * @version v1.1.3
  * Date:2006-9-8 2006-12-15
  */

if(typeof(sina)!="object"){var sina={}}
sina.$=function(objId){if(!objId){throw new Error("sina.$(String objId)�������")}
if(document.getElementById){return eval('document.getElementById("'+objId+'")')}else if(document.layers){return eval("document.layers['"+objId+"']")}else{return eval('document.all.'+objId)}}
sinaFlash=function(C,v,x,V,c,X,i,O,I,l,o){var z=this;if(!document.createElement||!document.getElementById){return}
z.id=v?v:"";z.classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000";z.codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version="+(c?c:"7")+",0,0,0";z.width=x;z.height=V;z.movie=C;z.bgcolor=X?X:null;z.quality=O?O:"high";z.src=z.movie;z.pluginspage="http://www.macromedia.com/go/getflashplayer";z.type="application/x-shockwave-flash";z.useExpressInstall=i?i:null;z.xir=(I)?I:window.location;z.redirectUrl=l?l:null;z.detectKey=o?o:null;z.escapeIs=false;z.objAttrs={};z.params={};z.flashVars=[];z.flashVarsStr="";z.embedAttrs={};z.forSetAttribute("id",z.id);z.objAttrs["classid"]=z.classid;z.forSetAttribute("codebase",z.codebase);z.forSetAttribute("width",z.width);z.forSetAttribute("height",z.height);z.forSetAttribute("movie",z.movie);z.forSetAttribute("quality",z.quality);z.forSetAttribute("pluginspage",z.pluginspage);z.forSetAttribute("type",z.type);z.forSetAttribute("bgcolor",z.bgcolor)}
sinaFlash.prototype={getFlashHtml:function(){var I=this,i='<object ';for(var l in I.objAttrs){i+=l+'="'+I.objAttrs[l]+'" '}
i+='>';for(var l in I.params){i+='<param name="'+l+'" value="'+I.params[l]+'" /> '}
if(I.flashVarsStr!=""){i+='<param name="FlashVars" value="'+I.flashVarsStr+'" /> '}
i+='<embed ';for(var l in I.embedAttrs){i+=l+'="'+I.embedAttrs[l]+'" '} 
i+=' ></embed></object>';return i},forSetAttribute:function(I,i){var l=this;I=I.toLowerCase();switch(I){case "classid":break;case "pluginspage":l.embedAttrs["pluginspage"]=i;break;case "src":l.embedAttrs["src"]=i;l.params["movie"]=i;break;case "movie":l.params["movie"]=i;l.embedAttrs["src"]=i;break;case "onafterupdate":case "onbeforeupdate":case "onblur":case "oncellchange":case "onclick":case "ondblClick":case "ondrag":case "ondragend":case "ondragenter":case "ondragleave":case "ondragover":case "ondrop":case "onfinish":case "onfocus":case "onhelp":case "onmousedown":case "onmouseup":case "onmouseover":case "onmousemove":case "onmouseout":case "onkeypress":case "onkeydown":case "onkeyup":case "onload":case "onlosecapture":case "onpropertychange":case "onreadystatechange":case "onrowsdelete":case "onrowenter":case "onrowexit":case "onrowsinserted":case "onstart":case "onscroll":case "onbeforeeditfocus":case "onactivate":case "onbeforedeactivate":case "ondeactivate":case "type":l.embedAttrs["type"]=i;break;case "codebase":l.objAttrs["codebase"]=i;break;case "width":l.objAttrs["width"]=i;l.embedAttrs["width"]=i;break;case "height":l.objAttrs["height"]=i;l.embedAttrs["height"]=i;break;case "align":l.objAttrs["align"]=i;l.embedAttrs["align"]=i;break;case "vspace":l.objAttrs["vspace"]=i;l.embedAttrs["vspace"]=i;break;case "hspace":l.objAttrs["hspace"]=i;l.embedAttrs["hspace"]=i;break;case "class":l.objAttrs["class"]=i;l.embedAttrs["class"]=i;break;case "title":l.objAttrs["title"]=i;break;case "accesskey":l.objAttrs["accesskey"]=i;break;case "name":l.objAttrs["name"]=i;l.embedAttrs["name"]=i;break;case "id":l.objAttrs["id"]=i;l.embedAttrs["name"]=i;break;case "tabindex":l.objAttrs["tabindex"]=i;break;default:l.params[I]=l.embedAttrs[I]=i}},forGetAttribute:function(i){var I=this;i=i.toLowerCase();if(I.objAttrs[i]!=undefined){return I.objAttrs[i]}else if(I.embedAttrs[i]!=undefined){return I.embedAttrs[i]}else if(I.embedAttrs!=undefined){return I.embedAttrs[i]}else{return null}},setAttribute:function(I,i){this.forSetAttribute(I,i)},getAttribute:function(i){return this.forGetAttribute(i)},addVariable:function(I,i){var l=this;if(l.escapeIs){I=escape(I);i=escape(i)}
if(l.flashVarsStr==""){l.flashVarsStr=I+"="+i}else{l.flashVarsStr+="&"+I+"="+i}
l.embedAttrs["FlashVars"]=l.flashVarsStr},getVariable:function(I){var o=this,i=o.flashVarsStr;if(o.escapeIs){I=escape(I)}
var l=new RegExp(I+"=([^\\&]*)(\\&?)","i").exec(i);if(o.escapeIs){return unescape(RegExp.$1)}
return RegExp.$1},addParam:function(I,i){this.forSetAttribute(I,i)},getParam:function(){return this.forGetAttribute(name)},write:function(i){var I=this;if(typeof i=="string"){sina.$(i).innerHTML=I.getFlashHtml()}else if(typeof i=="object"){i.innerHTML=I.getFlashHtml()}}}






function setPic(thePics,theLinks,theTexts,pic_width,pic_height,displayObjId){
   
	var text_height=20;
	var focus_width=pic_width;
	var focus_height = pic_height+text_height;	
	
	var FocusFlash = new sinaFlash("/petsns/js/dynamicImage.swf", "focusflash", focus_width, focus_height, "7", "#ffffff", false, "High");
	FocusFlash.addParam("allowScriptAccess", "sameDomain");
	FocusFlash.addParam("menu", "false");
	FocusFlash.addParam("wmode", "opaque");

	FocusFlash.addVariable("pics", thePics);
	FocusFlash.addVariable("links", theLinks);
	FocusFlash.addVariable("texts", theTexts);
	FocusFlash.addVariable("borderwidth", pic_width);
	FocusFlash.addVariable("borderheight", pic_height);
	FocusFlash.addVariable("textheight", text_height);
	FocusFlash.write(displayObjId);

}