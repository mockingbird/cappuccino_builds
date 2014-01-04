@STATIC;1.0;I;21;Foundation/CPBundle.jI;23;Foundation/CPGeometry.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;21;Foundation/CPString.jt;9768;
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
}
}),new objj_method(sel_getUid("setSize:"),function(_22,_23,_24){
with(_22){
_size=CGSizeMakeCopy(_24);
}
}),new objj_method(sel_getUid("size"),function(_25,_26){
with(_25){
return _size;
}
}),new objj_method(sel_getUid("setName:"),function(_27,_28,_29){
with(_27){
if(_name===_29){
return YES;
}
if(_1[_29]){
return NO;
}
_name=_29;
_1[_29]=_27;
return YES;
}
}),new objj_method(sel_getUid("name"),function(_2a,_2b){
with(_2a){
return _name;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_2c,_2d,_2e){
with(_2c){
_delegate=_2e;
}
}),new objj_method(sel_getUid("delegate"),function(_2f,_30){
with(_2f){
return _delegate;
}
}),new objj_method(sel_getUid("loadStatus"),function(_31,_32){
with(_31){
return _loadStatus;
}
}),new objj_method(sel_getUid("load"),function(_33,_34){
with(_33){
if(_loadStatus==CPImageLoadStatusLoading||_loadStatus==CPImageLoadStatusCompleted){
return;
}
_loadStatus=CPImageLoadStatusLoading;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_35,_36){
with(_35){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_37,_38){
with(_37){
return NO;
}
}),new objj_method(sel_getUid("description"),function(_39,_3a){
with(_39){
var _3b=objj_msgSend(_39,"filename"),_3c=objj_msgSend(_39,"size");
if(_3b.indexOf("data:")===0){
var _3d=_3b.indexOf(",");
if(_3d>0){
_3b=objj_msgSend(CPString,"stringWithFormat:","%s,%s...%s",_3b.substr(0,_3d),_3b.substr(_3d+1,10),_3b.substr(_3b.length-10));
}else{
_3b="data:<unknown type>";
}
}
return objj_msgSend(CPString,"stringWithFormat:",_3,objj_msgSendSuper({receiver:_39,super_class:objj_getClass("CPImage").super_class},"description"),_3b,_3c.width,_3c.height);
}
}),new objj_method(sel_getUid("_derefFromImage"),function(_3e,_3f){
with(_3e){
_image.onload=null;
_image.onerror=null;
_image.onabort=null;
}
}),new objj_method(sel_getUid("_imageDidLoad"),function(_40,_41){
with(_40){
_loadStatus=CPImageLoadStatusCompleted;
if(!_size||(_size.width==-1&&_size.height==-1)){
_size=CGSizeMake(_image.width,_image.height);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPImageDidLoadNotification,_40);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidLoad:"))){
objj_msgSend(_delegate,"imageDidLoad:",_40);
}
}
}),new objj_method(sel_getUid("_imageDidError"),function(_42,_43){
with(_42){
_loadStatus=CPImageLoadStatusReadError;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidError:"))){
objj_msgSend(_delegate,"imageDidError:",_42);
}
}
}),new objj_method(sel_getUid("_imageDidAbort"),function(_44,_45){
with(_44){
_loadStatus=CPImageLoadStatusCancelled;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidAbort:"))){
objj_msgSend(_delegate,"imageDidAbort:",_44);
}
}
})]);
class_addMethods(_a,[new objj_method(sel_getUid("imageNamed:"),function(_46,_47,_48){
with(_46){
var _49=_1[_48];
if(_49){
return _49;
}
var _4a=_2[_48];
if(!_4a){
return nil;
}
if(!_4a.isa){
_4a=CPAppKitImage("CPImage/"+_48+".png",_4a);
objj_msgSend(_4a,"setName:",_48);
_2[_48]=_4a;
}
return _4a;
}
})]);
var _9=objj_getClass("CPImage");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPImage\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("initWithCoder:"),function(_4b,_4c,_4d){
with(_4b){
return objj_msgSend(_4b,"initWithContentsOfFile:size:",objj_msgSend(_4d,"decodeObjectForKey:","CPFilename"),objj_msgSend(_4d,"decodeSizeForKey:","CPSize"));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSend(_50,"encodeObject:forKey:",_filename,"CPFilename");
objj_msgSend(_50,"encodeSize:forKey:",_size,"CPSize");
}
})]);
var _9=objj_allocateClassPair(CPObject,"CPThreePartImage"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_imageSlices"),new objj_ivar("_isVertical")]);
objj_registerClassPair(_9);
class_addMethods(_9,[new objj_method(sel_getUid("initWithImageSlices:isVertical:"),function(_51,_52,_53,_54){
with(_51){
_51=objj_msgSendSuper({receiver:_51,super_class:objj_getClass("CPThreePartImage").super_class},"init");
if(_51){
_imageSlices=_53;
_isVertical=_54;
}
return _51;
}
}),new objj_method(sel_getUid("filename"),function(_55,_56){
with(_55){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_57,_58){
with(_57){
return _imageSlices;
}
}),new objj_method(sel_getUid("isVertical"),function(_59,_5a){
with(_59){
return _isVertical;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_5b,_5c){
with(_5b){
return YES;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_5d,_5e){
with(_5d){
return NO;
}
})]);
var _5f="CPThreePartImageImageSlicesKey",_60="CPThreePartImageIsVerticalKey";
var _9=objj_getClass("CPThreePartImage");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPThreePartImage\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("initWithCoder:"),function(_61,_62,_63){
with(_61){
_61=objj_msgSendSuper({receiver:_61,super_class:objj_getClass("CPThreePartImage").super_class},"init");
if(_61){
_imageSlices=objj_msgSend(_63,"decodeObjectForKey:",_5f);
_isVertical=objj_msgSend(_63,"decodeBoolForKey:",_60);
}
return _61;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_64,_65,_66){
with(_64){
objj_msgSend(_66,"encodeObject:forKey:",_imageSlices,_5f);
objj_msgSend(_66,"encodeBool:forKey:",_isVertical,_60);
}
})]);
var _9=objj_allocateClassPair(CPObject,"CPNinePartImage"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_imageSlices")]);
objj_registerClassPair(_9);
class_addMethods(_9,[new objj_method(sel_getUid("initWithImageSlices:"),function(_67,_68,_69){
with(_67){
_67=objj_msgSendSuper({receiver:_67,super_class:objj_getClass("CPNinePartImage").super_class},"init");
if(_67){
_imageSlices=_69;
}
return _67;
}
}),new objj_method(sel_getUid("filename"),function(_6a,_6b){
with(_6a){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_6c,_6d){
with(_6c){
return _imageSlices;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_6e,_6f){
with(_6e){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_70,_71){
with(_70){
return YES;
}
})]);
var _72="CPNinePartImageImageSlicesKey";
var _9=objj_getClass("CPNinePartImage");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPNinePartImage\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("initWithCoder:"),function(_73,_74,_75){
with(_73){
_73=objj_msgSendSuper({receiver:_73,super_class:objj_getClass("CPNinePartImage").super_class},"init");
if(_73){
_imageSlices=objj_msgSend(_75,"decodeObjectForKey:",_72);
}
return _73;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_76,_77,_78){
with(_76){
objj_msgSend(_78,"encodeObject:forKey:",_imageSlices,_72);
}
})]);
