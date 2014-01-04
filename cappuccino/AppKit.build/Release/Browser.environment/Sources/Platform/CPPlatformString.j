@STATIC;1.0;I;21;Foundation/CPObject.jt;3768;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"CPBasePlatformString"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("bootstrap"),function(_3,_4){
with(_3){
}
}),new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"),function(_5,_6,_7,_8,_9){
with(_5){
return {width:0,height:0};
}
})]);
var _a=nil,_b=nil,_c=nil,_d=nil,_e=nil,_f=nil;
var _1=objj_allocateClassPair(CPBasePlatformString,"CPPlatformString"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_10,_11){
with(_10){
if(_10!==objj_msgSend(CPPlatformString,"class")){
return;
}
_f=objj_msgSend(CPFont,"systemFontOfSize:",CPFontCurrentSystemSize);
}
}),new objj_method(sel_getUid("bootstrap"),function(_12,_13){
with(_12){
objj_msgSend(_12,"createDOMElements");
}
}),new objj_method(sel_getUid("createDOMElements"),function(_14,_15){
with(_14){
var _16,_17=objj_msgSend(CPPlatform,"mainBodyElement");
_b=document.createElement("span");
_b.className="cpdontremove";
_16=_b.style;
_16.position="absolute";
_16.left="-100000px";
_16.zIndex=-100000;
_16.visibility="visible";
_16.padding="0px";
_16.margin="0px";
_16.whiteSpace="pre";
_a=document.createElement("span");
_a.className="cpdontremove";
_16=_a.style;
_16.display="block";
_16.position="absolute";
_16.left="-100000px";
_16.zIndex=-10000;
_16.visibility="visible";
_16.padding="0px";
_16.margin="0px";
_16.width="1px";
_16.wordWrap="break-word";
try{
_16.whiteSpace="pre";
_16.whiteSpace="-o-pre-wrap";
_16.whiteSpace="-pre-wrap";
_16.whiteSpace="-moz-pre-wrap";
_16.whiteSpace="pre-wrap";
}
catch(e){
_16.whiteSpace="pre";
}
_17.appendChild(_b);
_17.appendChild(_a);
}
}),new objj_method(sel_getUid("createDOMMetricsElements"),function(_18,_19){
with(_18){
var _1a,_1b=objj_msgSend(CPPlatform,"mainBodyElement");
_c=document.createElement("div");
_c.className="cpdontremove";
_c.style.position="absolute";
_c.style.left="-10000px";
_c.style.zIndex=-10000;
_c.style.width="100000px";
_1b.appendChild(_c);
_d=document.createElement("span");
_d.className="cpdontremove";
_d.innerHTML="x";
_1a=_d.style;
_1a.position="absolute";
_1a.left="-10000px";
_1a.zIndex=-10000;
_1a.visibility="visible";
_1a.padding="0px";
_1a.margin="0px";
_1a.whiteSpace="pre";
var _1c=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPView,"class")),"pathForResource:","empty.png");
_e=document.createElement("img");
_e.className="cpdontremove";
_e.setAttribute("src",_1c);
_e.setAttribute("width","1");
_e.setAttribute("height","1");
_e.setAttribute("alt","");
_1a=_e.style;
_1a.position="absolute";
_1a.left="-10000px";
_1a.zIndex=-10000;
_1a.visibility="visible";
_1a.padding="0px";
_1a.margin="0px";
_1a.border="none";
_1a.verticalAlign="baseline";
_c.appendChild(_d);
_c.appendChild(_e);
}
}),new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
if(!_a){
objj_msgSend(_1d,"createDOMElements");
}
var _22;
if(!_21){
_22=_b;
}else{
_22=_a;
_22.style.width=ROUND(_21)+"px";
}
_22.style.font=objj_msgSend((_20||_f),"cssString");
if(CPFeatureIsCompatible(CPJavaScriptInnerTextFeature)){
_22.innerText=_1f;
}else{
if(CPFeatureIsCompatible(CPJavaScriptTextContentFeature)){
_22.textContent=_1f;
}
}
return {width:_22.clientWidth,height:_22.clientHeight};
}
}),new objj_method(sel_getUid("metricsOfFont:"),function(_23,_24,_25){
with(_23){
if(!_c){
objj_msgSend(_23,"createDOMMetricsElements");
}
_c.style.font=objj_msgSend((_25||_f),"cssString");
var _26=_e.offsetTop-_d.offsetTop+_e.offsetHeight,_27=_26-_d.offsetHeight,_28=_d.offsetHeight;
return objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_26,"ascender",_27,"descender",_28,"lineHeight");
}
})]);
