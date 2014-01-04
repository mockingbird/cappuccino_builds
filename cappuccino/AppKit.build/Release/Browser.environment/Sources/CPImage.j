@STATIC;1.0;I;21;Foundation/CPBundle.jI;23;Foundation/CPGeometry.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;21;Foundation/CPString.jt;11169;
objj_executeFile("Foundation/CPBundle.j",NO);
objj_executeFile("Foundation/CPGeometry.j",NO);
objj_executeFile("Foundation/CPNotificationCenter.j",NO);
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPRunLoop.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
CPImageLoadStatusInitialized=0;
CPImageLoadStatusLoading=1;
CPImageLoadStatusCompleted=2;
CPImageLoadStatusCancelled=3;
CPImageLoadStatusInvalidData=4;
CPImageLoadStatusUnexpectedEOF=5;
CPImageLoadStatusReadError=6;
CPImageDidLoadNotification="CPImageDidLoadNotification";
CPImageNameColorPanel="CPImageNameColorPanel";
CPImageNameColorPanelHighlighted="CPImageNameColorPanelHighlighted";
var _1={},_2={},_3="%s {\n   filename: \"%s\",\n   size: { width:%f, height:%f }\n}";
_2[CPImageNameColorPanel]=CGSizeMake(26,29);
_2[CPImageNameColorPanelHighlighted]=CGSizeMake(26,29);
CPImageInBundle=function(_4,_5,_6){
if(!_6){
_6=objj_msgSend(CPBundle,"mainBundle");
}
if(_5){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6,"pathForResource:",_4),_5);
}
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_6,"pathForResource:",_4));
};
CPAppKitImage=function(_7,_8){
return CPImageInBundle(_7,_8,objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPView,"class")));
};
var _9=objj_allocateClassPair(CPObject,"CPImage"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_size"),new objj_ivar("_filename"),new objj_ivar("_name"),new objj_ivar("_delegate"),new objj_ivar("_loadStatus"),new objj_ivar("_image")]);
objj_registerClassPair(_9);
class_addMethods(_9,[new objj_method(sel_getUid("init"),function(_b,_c){
with(_b){
return objj_msgSend(_b,"initByReferencingFile:size:","",CGSizeMake(-1,-1));
}
}),new objj_method(sel_getUid("initByReferencingFile:size:"),function(_d,_e,_f,_10){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPImage").super_class},"init");
if(_d){
_size=CPSizeCreateCopy(_10);
_filename=_f;
_loadStatus=CPImageLoadStatusInitialized;
}
return _d;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:size:"),function(_11,_12,_13,_14){
with(_11){
_11=objj_msgSend(_11,"initByReferencingFile:size:",_13,_14);
if(_11){
objj_msgSend(_11,"load");
}
return _11;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:"),function(_15,_16,_17){
with(_15){
_15=objj_msgSend(_15,"initByReferencingFile:size:",_17,CGSizeMake(-1,-1));
if(_15){
objj_msgSend(_15,"load");
}
return _15;
}
}),new objj_method(sel_getUid("initWithData:"),function(_18,_19,_1a){
with(_18){
var _1b=objj_msgSend(_1a,"base64"),_1c=objj_msgSend(_1b,"hasPrefix:","/9j/4AAQSkZJRgABAQEASABIAAD/")?"jpg":"png",_1d="data:image/"+_1c+";base64,"+_1b;
return objj_msgSend(_18,"initWithContentsOfFile:",_1d);
}
}),new objj_method(sel_getUid("filename"),function(_1e,_1f){
with(_1e){
return _filename;
}
}),new objj_method(sel_getUid("data"),function(_20,_21){
with(_20){
var _22;
if(objj_msgSend(_filename,"hasPrefix:","data:image")){
_22=_filename;
}else{
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
var _23=document.createElement("canvas"),ctx=_23.getContext("2d");
_23.width=_image.width,_23.height=_image.height;
ctx.drawImage(_image,0,0);
_22=_23.toDataURL("image/png");
}else{
return nil;
}
}
var _24=_22.replace(/^data:image\/png;base64,/,"");
return objj_msgSend(CPData,"dataWithBase64:",_24);
}
}),new objj_method(sel_getUid("setSize:"),function(_25,_26,_27){
with(_25){
_size=CGSizeMakeCopy(_27);
}
}),new objj_method(sel_getUid("size"),function(_28,_29){
with(_28){
return _size;
}
}),new objj_method(sel_getUid("setName:"),function(_2a,_2b,_2c){
with(_2a){
if(_name===_2c){
return YES;
}
if(_1[_2c]){
return NO;
}
_name=_2c;
_1[_2c]=_2a;
return YES;
}
}),new objj_method(sel_getUid("name"),function(_2d,_2e){
with(_2d){
return _name;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_2f,_30,_31){
with(_2f){
_delegate=_31;
}
}),new objj_method(sel_getUid("delegate"),function(_32,_33){
with(_32){
return _delegate;
}
}),new objj_method(sel_getUid("loadStatus"),function(_34,_35){
with(_34){
return _loadStatus;
}
}),new objj_method(sel_getUid("load"),function(_36,_37){
with(_36){
if(_loadStatus==CPImageLoadStatusLoading||_loadStatus==CPImageLoadStatusCompleted){
return;
}
_loadStatus=CPImageLoadStatusLoading;
_image=new Image();
var _38=YES;
_image.onload=function(){
if(_38){
window.setTimeout(function(){
objj_msgSend(_36,"_imageDidLoad");
},0);
}else{
objj_msgSend(_36,"_imageDidLoad");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_36,"_derefFromImage");
};
_image.onerror=function(){
if(_38){
window.setTimeout(function(){
objj_msgSend(_36,"_imageDidError");
},0);
}else{
objj_msgSend(_36,"_imageDidError");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_36,"_derefFromImage");
};
_image.onabort=function(){
if(_38){
window.setTimeout(function(){
objj_msgSend(_36,"_imageDidAbort");
},0);
}else{
objj_msgSend(_36,"_imageDidAbort");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_36,"_derefFromImage");
};
_image.src=_filename;
window.setTimeout(function(){
_38=NO;
},0);
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_39,_3a){
with(_39){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_3b,_3c){
with(_3b){
return NO;
}
}),new objj_method(sel_getUid("description"),function(_3d,_3e){
with(_3d){
var _3f=objj_msgSend(_3d,"filename"),_40=objj_msgSend(_3d,"size");
if(_3f.indexOf("data:")===0){
var _41=_3f.indexOf(",");
if(_41>0){
_3f=objj_msgSend(CPString,"stringWithFormat:","%s,%s...%s",_3f.substr(0,_41),_3f.substr(_41+1,10),_3f.substr(_3f.length-10));
}else{
_3f="data:<unknown type>";
}
}
return objj_msgSend(CPString,"stringWithFormat:",_3,objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("CPImage").super_class},"description"),_3f,_40.width,_40.height);
}
}),new objj_method(sel_getUid("_derefFromImage"),function(_42,_43){
with(_42){
_image.onload=null;
_image.onerror=null;
_image.onabort=null;
}
}),new objj_method(sel_getUid("_imageDidLoad"),function(_44,_45){
with(_44){
_loadStatus=CPImageLoadStatusCompleted;
if(!_size||(_size.width==-1&&_size.height==-1)){
_size=CGSizeMake(_image.width,_image.height);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPImageDidLoadNotification,_44);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidLoad:"))){
objj_msgSend(_delegate,"imageDidLoad:",_44);
}
}
}),new objj_method(sel_getUid("_imageDidError"),function(_46,_47){
with(_46){
_loadStatus=CPImageLoadStatusReadError;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidError:"))){
objj_msgSend(_delegate,"imageDidError:",_46);
}
}
}),new objj_method(sel_getUid("_imageDidAbort"),function(_48,_49){
with(_48){
_loadStatus=CPImageLoadStatusCancelled;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidAbort:"))){
objj_msgSend(_delegate,"imageDidAbort:",_48);
}
}
})]);
class_addMethods(_a,[new objj_method(sel_getUid("imageNamed:"),function(_4a,_4b,_4c){
with(_4a){
var _4d=_1[_4c];
if(_4d){
return _4d;
}
var _4e=_2[_4c];
if(!_4e){
return nil;
}
if(!_4e.isa){
_4e=CPAppKitImage("CPImage/"+_4c+".png",_4e);
objj_msgSend(_4e,"setName:",_4c);
_2[_4c]=_4e;
}
return _4e;
}
})]);
var _9=objj_getClass("CPImage");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPImage\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("initWithCoder:"),function(_4f,_50,_51){
with(_4f){
return objj_msgSend(_4f,"initWithContentsOfFile:size:",objj_msgSend(_51,"decodeObjectForKey:","CPFilename"),objj_msgSend(_51,"decodeSizeForKey:","CPSize"));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_54,"encodeObject:forKey:",_filename,"CPFilename");
objj_msgSend(_54,"encodeSize:forKey:",_size,"CPSize");
}
})]);
var _9=objj_allocateClassPair(CPObject,"CPThreePartImage"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_imageSlices"),new objj_ivar("_isVertical")]);
objj_registerClassPair(_9);
class_addMethods(_9,[new objj_method(sel_getUid("initWithImageSlices:isVertical:"),function(_55,_56,_57,_58){
with(_55){
_55=objj_msgSendSuper({receiver:_55,super_class:objj_getClass("CPThreePartImage").super_class},"init");
if(_55){
_imageSlices=_57;
_isVertical=_58;
}
return _55;
}
}),new objj_method(sel_getUid("filename"),function(_59,_5a){
with(_59){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_5b,_5c){
with(_5b){
return _imageSlices;
}
}),new objj_method(sel_getUid("isVertical"),function(_5d,_5e){
with(_5d){
return _isVertical;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_5f,_60){
with(_5f){
return YES;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_61,_62){
with(_61){
return NO;
}
})]);
var _63="CPThreePartImageImageSlicesKey",_64="CPThreePartImageIsVerticalKey";
var _9=objj_getClass("CPThreePartImage");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPThreePartImage\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("initWithCoder:"),function(_65,_66,_67){
with(_65){
_65=objj_msgSendSuper({receiver:_65,super_class:objj_getClass("CPThreePartImage").super_class},"init");
if(_65){
_imageSlices=objj_msgSend(_67,"decodeObjectForKey:",_63);
_isVertical=objj_msgSend(_67,"decodeBoolForKey:",_64);
}
return _65;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_68,_69,_6a){
with(_68){
objj_msgSend(_6a,"encodeObject:forKey:",_imageSlices,_63);
objj_msgSend(_6a,"encodeBool:forKey:",_isVertical,_64);
}
})]);
var _9=objj_allocateClassPair(CPObject,"CPNinePartImage"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_imageSlices")]);
objj_registerClassPair(_9);
class_addMethods(_9,[new objj_method(sel_getUid("initWithImageSlices:"),function(_6b,_6c,_6d){
with(_6b){
_6b=objj_msgSendSuper({receiver:_6b,super_class:objj_getClass("CPNinePartImage").super_class},"init");
if(_6b){
_imageSlices=_6d;
}
return _6b;
}
}),new objj_method(sel_getUid("filename"),function(_6e,_6f){
with(_6e){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_70,_71){
with(_70){
return _imageSlices;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_72,_73){
with(_72){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_74,_75){
with(_74){
return YES;
}
})]);
var _76="CPNinePartImageImageSlicesKey";
var _9=objj_getClass("CPNinePartImage");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPNinePartImage\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("initWithCoder:"),function(_77,_78,_79){
with(_77){
_77=objj_msgSendSuper({receiver:_77,super_class:objj_getClass("CPNinePartImage").super_class},"init");
if(_77){
_imageSlices=objj_msgSend(_79,"decodeObjectForKey:",_76);
}
return _77;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7a,_7b,_7c){
with(_7a){
objj_msgSend(_7c,"encodeObject:forKey:",_imageSlices,_76);
}
})]);
