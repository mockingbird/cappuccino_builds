@STATIC;1.0;I;21;Foundation/CPObject.ji;9;CGColor.ji;17;CPCompatibility.ji;9;CPImage.jt;14201;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CGColor.j",YES);
objj_executeFile("CPCompatibility.j",YES);
objj_executeFile("CPImage.j",YES);
var _1=0,_2=1,_3=2,_4=3;
var _5=0,_6=1,_7=2;
var _8,_9,_a,_b,_c,_d,_e,_f,_10,_11,_12,_13,_14,_15,_16,_17;
CPColorPatternIsVertical=YES;
CPColorPatternIsHorizontal=NO;
CPColorWithImages=function(){
if(arguments.length<3){
var _18=arguments[0],_19=[];
for(var i=0;i<_18.length;++i){
var _1a=_18[i];
_19.push(_1a?CPImageInBundle(_1a[0],CGSizeMake(_1a[1],_1a[2]),_1a[3]):nil);
}
if(_19.length===3){
return objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",_19,arguments[1]||CPColorPatternIsHorizontal));
}else{
return objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",_19));
}
}else{
if(arguments.length===3||arguments.length===4){
return objj_msgSend(CPColor,"colorWithPatternImage:",CPImageInBundle(arguments[0],CGSizeMake(arguments[1],arguments[2]),arguments[3]));
}else{
return nil;
}
}
};
var _1b=objj_allocateClassPair(CPObject,"CPColor"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_components"),new objj_ivar("_patternImage"),new objj_ivar("_cssString")]);
objj_registerClassPair(_1b);
class_addMethods(_1b,[new objj_method(sel_getUid("_initWithCSSString:"),function(_1d,_1e,_1f){
with(_1d){
if(_1f.indexOf("rgb")==CPNotFound){
return nil;
}
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPColor").super_class},"init");
var _20=_1f.indexOf("("),_21=_1f.substring(_20+1).split(",");
_components=[parseInt(_21[0],10)/255,parseInt(_21[1],10)/255,parseInt(_21[2],10)/255,_21[3]?parseFloat(_21[3],10):1];
objj_msgSend(_1d,"_initCSSStringFromComponents");
return _1d;
}
}),new objj_method(sel_getUid("_initWithRGBA:"),function(_22,_23,_24){
with(_22){
_22=objj_msgSendSuper({receiver:_22,super_class:objj_getClass("CPColor").super_class},"init");
if(_22){
_components=_24;
objj_msgSend(_22,"_initCSSStringFromComponents");
}
return _22;
}
}),new objj_method(sel_getUid("_initCSSStringFromComponents"),function(_25,_26){
with(_25){
var _27=CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1;
_cssString=(_27?"rgba(":"rgb(")+parseInt(_components[0]*255)+", "+parseInt(_components[1]*255)+", "+parseInt(_components[2]*255)+(_27?(", "+_components[3]):"")+")";
}
}),new objj_method(sel_getUid("_initWithPatternImage:"),function(_28,_29,_2a){
with(_28){
_28=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("CPColor").super_class},"init");
if(_28){
_patternImage=_2a;
_cssString="url(\""+objj_msgSend(_patternImage,"filename")+"\")";
_components=[0,0,0,1];
}
return _28;
}
}),new objj_method(sel_getUid("patternImage"),function(_2b,_2c){
with(_2b){
return _patternImage;
}
}),new objj_method(sel_getUid("alphaComponent"),function(_2d,_2e){
with(_2d){
return _components[3];
}
}),new objj_method(sel_getUid("blueComponent"),function(_2f,_30){
with(_2f){
return _components[2];
}
}),new objj_method(sel_getUid("greenComponent"),function(_31,_32){
with(_31){
return _components[1];
}
}),new objj_method(sel_getUid("redComponent"),function(_33,_34){
with(_33){
return _components[0];
}
}),new objj_method(sel_getUid("components"),function(_35,_36){
with(_35){
return _components;
}
}),new objj_method(sel_getUid("colorWithAlphaComponent:"),function(_37,_38,_39){
with(_37){
var _3a=_components.slice();
_3a[_3a.length-1]=_39;
return objj_msgSend(objj_msgSend(objj_msgSend(_37,"class"),"alloc"),"_initWithRGBA:",_3a);
}
}),new objj_method(sel_getUid("hsbComponents"),function(_3b,_3c){
with(_3b){
var red=ROUND(_components[_1]*255),_3d=ROUND(_components[_2]*255),_3e=ROUND(_components[_3]*255);
var max=MAX(red,_3d,_3e),min=MIN(red,_3d,_3e),_3f=max-min;
var _40=max/255,_41=(max!=0)?_3f/max:0;
var hue;
if(_41==0){
hue=0;
}else{
var rr=(max-red)/_3f,gr=(max-_3d)/_3f,br=(max-_3e)/_3f;
if(red==max){
hue=br-gr;
}else{
if(_3d==max){
hue=2+rr-br;
}else{
hue=4+gr-rr;
}
}
hue/=6;
if(hue<0){
hue++;
}
}
return [ROUND(hue*360),ROUND(_41*100),ROUND(_40*100)];
}
}),new objj_method(sel_getUid("cssString"),function(_42,_43){
with(_42){
return _cssString;
}
}),new objj_method(sel_getUid("hexString"),function(_44,_45){
with(_44){
return _46(objj_msgSend(_44,"redComponent"),objj_msgSend(_44,"greenComponent"),objj_msgSend(_44,"blueComponent"));
}
}),new objj_method(sel_getUid("isEqual:"),function(_47,_48,_49){
with(_47){
if(!_49){
return NO;
}
if(_49===_47){
return YES;
}
if(!objj_msgSend(_49,"isKindOfClass:",CPColor)){
return NO;
}
if(_patternImage||objj_msgSend(_49,"patternImage")){
return objj_msgSend(_patternImage,"isEqual:",objj_msgSend(_49,"patternImage"));
}
return ROUND(objj_msgSend(_47,"redComponent")*255)==ROUND(objj_msgSend(_49,"redComponent")*255)&&ROUND(objj_msgSend(_47,"greenComponent")*255)==ROUND(objj_msgSend(_49,"greenComponent")*255)&&ROUND(objj_msgSend(_47,"blueComponent")*255)==ROUND(objj_msgSend(_49,"blueComponent")*255)&&objj_msgSend(_47,"alphaComponent")==objj_msgSend(_49,"alphaComponent");
}
}),new objj_method(sel_getUid("description"),function(_4a,_4b){
with(_4a){
var _4c=objj_msgSendSuper({receiver:_4a,super_class:objj_getClass("CPColor").super_class},"description"),_4d=objj_msgSend(_4a,"patternImage");
if(!_4d){
return _4c+" "+objj_msgSend(_4a,"cssString");
}
_4c+=" {\n";
if(objj_msgSend(_4d,"isThreePartImage")||objj_msgSend(_4d,"isNinePartImage")){
var _4e=objj_msgSend(_4d,"imageSlices");
if(objj_msgSend(_4d,"isThreePartImage")){
_4c+="    orientation: "+(objj_msgSend(_4d,"isVertical")?"vertical":"horizontal")+",\n";
}
_4c+="    patternImage ("+_4e.length+" part): [\n";
for(var i=0;i<_4e.length;++i){
var _4f=objj_msgSend(_4e[i],"description");
_4c+=_4f.replace(/^/mg,"        ")+",\n";
}
_4c=_4c.substr(0,_4c.length-2)+"\n    ]\n}";
}else{
_4c+=objj_msgSend(_4d,"description").replace(/^/mg,"    ")+"\n}";
}
return _4c;
}
})]);
class_addMethods(_1c,[new objj_method(sel_getUid("colorWithRed:green:blue:alpha:"),function(_50,_51,red,_52,_53,_54){
with(_50){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[MAX(0,MIN(1,red)),MAX(0,MIN(1,_52)),MAX(0,MIN(1,_53)),MAX(0,MIN(1,_54))]);
}
}),new objj_method(sel_getUid("colorWithCalibratedRed:green:blue:alpha:"),function(_55,_56,red,_57,_58,_59){
with(_55){
return objj_msgSend(_55,"colorWithRed:green:blue:alpha:",red,_57,_58,_59);
}
}),new objj_method(sel_getUid("colorWithWhite:alpha:"),function(_5a,_5b,_5c,_5d){
with(_5a){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[_5c,_5c,_5c,_5d]);
}
}),new objj_method(sel_getUid("colorWithCalibratedWhite:alpha:"),function(_5e,_5f,_60,_61){
with(_5e){
return objj_msgSend(_5e,"colorWithWhite:alpha:",_60,_61);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:"),function(_62,_63,hue,_64,_65){
with(_62){
return objj_msgSend(_62,"colorWithHue:saturation:brightness:alpha:",hue,_64,_65,1);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:alpha:"),function(_66,_67,hue,_68,_69,_6a){
with(_66){
if(_68===0){
return objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",_69/100,_6a);
}
var f=hue%60,p=(_69*(100-_68))/10000,q=(_69*(6000-_68*f))/600000,t=(_69*(6000-_68*(60-f)))/600000,b=_69/100;
switch(FLOOR(hue/60)){
case 0:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,t,p,_6a);
case 1:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",q,b,p,_6a);
case 2:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,b,t,_6a);
case 3:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,q,b,_6a);
case 4:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",t,p,b,_6a);
case 5:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,p,q,_6a);
}
}
}),new objj_method(sel_getUid("colorWithHexString:"),function(_6b,_6c,hex){
with(_6b){
var _6d=_6e(hex);
return _6d?objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",_6d):null;
}
}),new objj_method(sel_getUid("colorWithSRGBRed:green:blue:alpha:"),function(_6f,_70,red,_71,_72,_73){
with(_6f){
return objj_msgSend(_6f,"colorWithRed:green:blue:alpha:",red,_71,_72,_73);
}
}),new objj_method(sel_getUid("blackColor"),function(_74,_75){
with(_74){
if(!_8){
_8=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1]);
}
return _8;
}
}),new objj_method(sel_getUid("blueColor"),function(_76,_77){
with(_76){
if(!_b){
_b=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,1,1]);
}
return _b;
}
}),new objj_method(sel_getUid("darkGrayColor"),function(_78,_79){
with(_78){
if(!_f){
_f=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1/3,1);
}
return _f;
}
}),new objj_method(sel_getUid("grayColor"),function(_7a,_7b){
with(_7a){
if(!_d){
_d=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.5,1);
}
return _d;
}
}),new objj_method(sel_getUid("greenColor"),function(_7c,_7d){
with(_7c){
if(!_a){
_a=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,1,0,1]);
}
return _a;
}
}),new objj_method(sel_getUid("lightGrayColor"),function(_7e,_7f){
with(_7e){
if(!_e){
_e=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",2/3,1);
}
return _e;
}
}),new objj_method(sel_getUid("redColor"),function(_80,_81){
with(_80){
if(!_9){
_9=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0,0,1]);
}
return _9;
}
}),new objj_method(sel_getUid("whiteColor"),function(_82,_83){
with(_82){
if(!_10){
_10=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,1,1]);
}
return _10;
}
}),new objj_method(sel_getUid("yellowColor"),function(_84,_85){
with(_84){
if(!_c){
_c=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,0,1]);
}
return _c;
}
}),new objj_method(sel_getUid("brownColor"),function(_86,_87){
with(_86){
if(!_11){
_11=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.6,0.4,0.2,1]);
}
return _11;
}
}),new objj_method(sel_getUid("cyanColor"),function(_88,_89){
with(_88){
if(!_12){
_12=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,1,1,1]);
}
return _12;
}
}),new objj_method(sel_getUid("magentaColor"),function(_8a,_8b){
with(_8a){
if(!_13){
_13=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0,1,1]);
}
return _13;
}
}),new objj_method(sel_getUid("orangeColor"),function(_8c,_8d){
with(_8c){
if(!_14){
_14=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0.5,0,1]);
}
return _14;
}
}),new objj_method(sel_getUid("purpleColor"),function(_8e,_8f){
with(_8e){
if(!_15){
_15=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.5,0,0.5,1]);
}
return _15;
}
}),new objj_method(sel_getUid("shadowColor"),function(_90,_91){
with(_90){
if(!_16){
_16=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1/3]);
}
return _16;
}
}),new objj_method(sel_getUid("clearColor"),function(_92,_93){
with(_92){
if(!_17){
_17=objj_msgSend(_92,"colorWithCalibratedWhite:alpha:",0,0);
}
return _17;
}
}),new objj_method(sel_getUid("alternateSelectedControlColor"),function(_94,_95){
with(_94){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.22,0.46,0.84,1]);
}
}),new objj_method(sel_getUid("secondarySelectedControlColor"),function(_96,_97){
with(_96){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.83,0.83,0.83,1]);
}
}),new objj_method(sel_getUid("colorWithPatternImage:"),function(_98,_99,_9a){
with(_98){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithPatternImage:",_9a);
}
}),new objj_method(sel_getUid("colorWithCSSString:"),function(_9b,_9c,_9d){
with(_9b){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithCSSString:",_9d);
}
})]);
var _1b=objj_getClass("CPColor");
if(!_1b){
throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
}
var _1c=_1b.isa;
class_addMethods(_1b,[new objj_method(sel_getUid("set"),function(_9e,_9f){
with(_9e){
objj_msgSend(_9e,"setFill");
objj_msgSend(_9e,"setStroke");
}
}),new objj_method(sel_getUid("setFill"),function(_a0,_a1){
with(_a0){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetFillColor(ctx,_a0);
}
}),new objj_method(sel_getUid("setStroke"),function(_a2,_a3){
with(_a2){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(ctx,_a2);
}
})]);
var _1b=objj_getClass("CPColor");
if(!_1b){
throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
}
var _1c=_1b.isa;
class_addMethods(_1c,[new objj_method(sel_getUid("randomColor"),function(_a4,_a5){
with(_a4){
return objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",RAND(),RAND(),RAND(),1);
}
})]);
var _a6="CPColorComponentsKey",_a7="CPColorPatternImageKey";
var _1b=objj_getClass("CPColor");
if(!_1b){
throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
}
var _1c=_1b.isa;
class_addMethods(_1b,[new objj_method(sel_getUid("initWithCoder:"),function(_a8,_a9,_aa){
with(_a8){
if(objj_msgSend(_aa,"containsValueForKey:",_a7)){
return objj_msgSend(_a8,"_initWithPatternImage:",objj_msgSend(_aa,"decodeObjectForKey:",_a7));
}
return objj_msgSend(_a8,"_initWithRGBA:",objj_msgSend(_aa,"decodeObjectForKey:",_a6));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_ab,_ac,_ad){
with(_ab){
if(_patternImage){
objj_msgSend(_ad,"encodeObject:forKey:",_patternImage,_a7);
}else{
objj_msgSend(_ad,"encodeObject:forKey:",_components,_a6);
}
}
})]);
var _ae="0123456789ABCDEF";
var _6e=function(hex){
if(hex.length==3){
hex=hex.charAt(0)+hex.charAt(0)+hex.charAt(1)+hex.charAt(1)+hex.charAt(2)+hex.charAt(2);
}
if(hex.length!=6){
return null;
}
hex=hex.toUpperCase();
for(var i=0;i<hex.length;i++){
if(_ae.indexOf(hex.charAt(i))==-1){
return null;
}
}
var red=(_ae.indexOf(hex.charAt(0))*16+_ae.indexOf(hex.charAt(1)))/255,_af=(_ae.indexOf(hex.charAt(2))*16+_ae.indexOf(hex.charAt(3)))/255,_b0=(_ae.indexOf(hex.charAt(4))*16+_ae.indexOf(hex.charAt(5)))/255;
return [red,_af,_b0,1];
};
var _46=function(r,g,b){
return _b1(r)+_b1(g)+_b1(b);
};
var _b1=function(n){
if(!n||isNaN(n)){
return "00";
}
n=FLOOR(MIN(255,MAX(0,256*n)));
return _ae.charAt((n-n%16)/16)+_ae.charAt(n%16);
};
