@STATIC;1.0;I;21;Foundation/CPObject.ji;8;CPView.jt;9036;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPView.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_panel"),new objj_ivar("_mask")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_3,_4,_5,_6){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPColorPicker").super_class},"init")){
_panel=_6;
_mask=_5;
}
return _3;
}
}),new objj_method(sel_getUid("colorPanel"),function(_7,_8){
with(_7){
return _panel;
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_9,_a){
with(_9){
return nil;
}
}),new objj_method(sel_getUid("setMode:"),function(_b,_c,_d){
with(_b){
}
}),new objj_method(sel_getUid("setColor:"),function(_e,_f,_10){
with(_e){
}
})]);
var _1=objj_allocateClassPair(CPColorPicker,"CPColorWheelColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_pickerView"),new objj_ivar("_brightnessSlider"),new objj_ivar("_hueSaturationView"),new objj_ivar("_cachedColor")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_11,_12,_13,_14){
with(_11){
return objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPColorWheelColorPicker").super_class},"initWithPickerMask:colorPanel:",_13,_14);
}
}),new objj_method(sel_getUid("initView"),function(_15,_16){
with(_15){
var _17={origin:{x:0,y:0},size:{width:CPColorPickerViewWidth,height:CPColorPickerViewHeight}};
_pickerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_17);
objj_msgSend(_pickerView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_brightnessSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",{origin:{x:0,y:(_17.size.height-34)},size:{width:_17.size.width,height:15}});
objj_msgSend(_brightnessSlider,"setValue:forThemeAttribute:",15,"track-width");
objj_msgSend(_brightnessSlider,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPColorPicker,"class")),"pathForResource:","brightness_bar.png"))),"track-color");
objj_msgSend(_brightnessSlider,"setMinValue:",0);
objj_msgSend(_brightnessSlider,"setMaxValue:",100);
objj_msgSend(_brightnessSlider,"setFloatValue:",100);
objj_msgSend(_brightnessSlider,"setTarget:",_15);
objj_msgSend(_brightnessSlider,"setAction:",sel_getUid("brightnessSliderDidChange:"));
objj_msgSend(_brightnessSlider,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
_hueSaturationView=objj_msgSend(objj_msgSend(__CPColorWheel,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:_17.size.width,height:_17.size.height-38}});
objj_msgSend(_hueSaturationView,"setDelegate:",_15);
objj_msgSend(_hueSaturationView,"setAutoresizingMask:",(CPViewWidthSizable|CPViewHeightSizable));
objj_msgSend(_pickerView,"addSubview:",_hueSaturationView);
objj_msgSend(_pickerView,"addSubview:",_brightnessSlider);
}
}),new objj_method(sel_getUid("brightnessSliderDidChange:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_18,"updateColor");
}
}),new objj_method(sel_getUid("colorWheelDidChange:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"updateColor");
}
}),new objj_method(sel_getUid("updateColor"),function(_1e,_1f){
with(_1e){
var hue=objj_msgSend(_hueSaturationView,"angle"),_20=objj_msgSend(_hueSaturationView,"distance"),_21=objj_msgSend(_brightnessSlider,"floatValue");
objj_msgSend(_hueSaturationView,"setWheelBrightness:",_21/100);
objj_msgSend(_brightnessSlider,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHue:saturation:brightness:",hue,_20,100));
var _22=objj_msgSend(_1e,"colorPanel"),_23=objj_msgSend(_22,"opacity");
_cachedColor=objj_msgSend(CPColor,"colorWithHue:saturation:brightness:alpha:",hue,_20,_21,_23);
objj_msgSend(objj_msgSend(_1e,"colorPanel"),"setColor:",_cachedColor);
}
}),new objj_method(sel_getUid("supportsMode:"),function(_24,_25,_26){
with(_24){
return (_26==CPWheelColorPickerMode)?YES:NO;
}
}),new objj_method(sel_getUid("currentMode"),function(_27,_28){
with(_27){
return CPWheelColorPickerMode;
}
}),new objj_method(sel_getUid("provideNewView:"),function(_29,_2a,_2b){
with(_29){
if(_2b){
objj_msgSend(_29,"initView");
}
return _pickerView;
}
}),new objj_method(sel_getUid("setColor:"),function(_2c,_2d,_2e){
with(_2c){
if(objj_msgSend(_2e,"isEqual:",_cachedColor)){
return;
}
var hsb=objj_msgSend(_2e,"hsbComponents");
objj_msgSend(_hueSaturationView,"setPositionToColor:",_2e);
objj_msgSend(_brightnessSlider,"setFloatValue:",hsb[2]);
objj_msgSend(_hueSaturationView,"setWheelBrightness:",hsb[2]/100);
objj_msgSend(_brightnessSlider,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHue:saturation:brightness:",hsb[0],hsb[1],100));
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_2f,_30){
with(_2f){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_button.png"),CGSizeMake(32,32));
}
}),new objj_method(sel_getUid("provideNewAlternateButtonImage"),function(_31,_32){
with(_31){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_button_h.png"),CGSizeMake(32,32));
}
})]);
var _1=objj_allocateClassPair(CPView,"__CPColorWheel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_wheelImage"),new objj_ivar("_blackWheelImage"),new objj_ivar("_crosshair"),new objj_ivar("_delegate"),new objj_ivar("_angle"),new objj_ivar("_distance"),new objj_ivar("_radius")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_33,_34,_35){
with(_33){
if(_33=objj_msgSendSuper({receiver:_33,super_class:objj_getClass("__CPColorWheel").super_class},"initWithFrame:",_35)){
objj_msgSend(_33,"setWheelSize:",_35.size);
_crosshair=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(_radius-2,_radius-2,4,4));
objj_msgSend(_crosshair,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
var _36=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_crosshair,"bounds"),1,1));
objj_msgSend(_36,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_crosshair,"addSubview:",_36);
objj_msgSend(_33,"addSubview:",_crosshair);
}
return _33;
}
}),new objj_method(sel_getUid("setWheelBrightness:"),function(_37,_38,_39){
with(_37){
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSendSuper({receiver:_3a,super_class:objj_getClass("__CPColorWheel").super_class},"setFrameSize:",_3c);
objj_msgSend(_3a,"setWheelSize:",_3c);
}
}),new objj_method(sel_getUid("setWheelSize:"),function(_3d,_3e,_3f){
with(_3d){
var min=MIN(_3f.width,_3f.height);
_radius=min/2;
objj_msgSend(_3d,"setAngle:distance:",objj_msgSend(_3d,"degreesToRadians:",_angle),(_distance/100)*_radius);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_40,_41,_42){
with(_40){
_delegate=_42;
}
}),new objj_method(sel_getUid("delegate"),function(_43,_44){
with(_43){
return _delegate;
}
}),new objj_method(sel_getUid("angle"),function(_45,_46){
with(_45){
return _angle;
}
}),new objj_method(sel_getUid("distance"),function(_47,_48){
with(_47){
return _distance;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_49,_4a,_4b){
with(_49){
objj_msgSend(_49,"reposition:",_4b);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4c,"reposition:",_4e);
}
}),new objj_method(sel_getUid("reposition:"),function(_4f,_50,_51){
with(_4f){
var _52=objj_msgSend(_4f,"bounds"),_53=objj_msgSend(_4f,"convertPoint:fromView:",objj_msgSend(_51,"locationInWindow"),nil),_54=CGRectGetMidX(_52),_55=CGRectGetMidY(_52),_56=MIN(SQRT((_53.x-_54)*(_53.x-_54)+(_53.y-_55)*(_53.y-_55)),_radius),_57=ATAN2(_53.y-_55,_53.x-_54);
objj_msgSend(_4f,"setAngle:distance:",_57,_56);
objj_msgSend(_delegate,"colorWheelDidChange:",_4f);
}
}),new objj_method(sel_getUid("setAngle:distance:"),function(_58,_59,_5a,_5b){
with(_58){
var _5c=objj_msgSend(_58,"bounds"),_5d=CGRectGetMidX(_5c),_5e=CGRectGetMidY(_5c);
_angle=objj_msgSend(_58,"radiansToDegrees:",_5a);
_distance=(_5b/_radius)*100;
objj_msgSend(_crosshair,"setFrameOrigin:",CPPointMake(COS(_5a)*_5b+_5d-2,SIN(_5a)*_5b+_5e-2));
}
}),new objj_method(sel_getUid("setPositionToColor:"),function(_5f,_60,_61){
with(_5f){
var hsb=objj_msgSend(_61,"hsbComponents"),_62=objj_msgSend(_5f,"bounds"),_63=objj_msgSend(_5f,"degreesToRadians:",hsb[0]),_64=(hsb[1]/100)*_radius;
objj_msgSend(_5f,"setAngle:distance:",_63,_64);
}
}),new objj_method(sel_getUid("radiansToDegrees:"),function(_65,_66,_67){
with(_65){
return ((-_67/PI)*180+360)%360;
}
}),new objj_method(sel_getUid("degreesToRadians:"),function(_68,_69,_6a){
with(_68){
return -(((_6a-360)/180)*PI);
}
})]);
