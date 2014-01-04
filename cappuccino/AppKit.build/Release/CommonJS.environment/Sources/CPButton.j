@STATIC;1.0;i;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.ji;17;CPStringDrawing.ji;12;CPCheckBox.ji;9;CPRadio.jt;24983;
objj_executeFile("_CPImageAndTextView.j",YES);
objj_executeFile("CGGeometry.j",YES);
objj_executeFile("CPControl.j",YES);
objj_executeFile("CPStringDrawing.j",YES);
CPRoundedBezelStyle=1;
CPRegularSquareBezelStyle=2;
CPThickSquareBezelStyle=3;
CPThickerSquareBezelStyle=4;
CPDisclosureBezelStyle=5;
CPShadowlessSquareBezelStyle=6;
CPCircularBezelStyle=7;
CPTexturedSquareBezelStyle=8;
CPHelpButtonBezelStyle=9;
CPSmallSquareBezelStyle=10;
CPTexturedRoundedBezelStyle=11;
CPRoundRectBezelStyle=12;
CPRecessedBezelStyle=13;
CPRoundedDisclosureBezelStyle=14;
CPHUDBezelStyle=-1;
CPMomentaryLightButton=0;
CPPushOnPushOffButton=1;
CPToggleButton=2;
CPSwitchButton=3;
CPRadioButton=4;
CPMomentaryChangeButton=5;
CPOnOffButton=6;
CPMomentaryPushInButton=7;
CPMomentaryPushButton=0;
CPMomentaryLight=7;
CPNoButtonMask=0;
CPContentsButtonMask=1;
CPPushInButtonMask=2;
CPGrayButtonMask=4;
CPBackgroundButtonMask=8;
CPNoCellMask=CPNoButtonMask;
CPContentsCellMask=CPContentsButtonMask;
CPPushInCellMask=CPPushInButtonMask;
CPChangeGrayCellMask=CPGrayButtonMask;
CPChangeBackgroundCellMask=CPBackgroundButtonMask;
CPButtonStateMixed=CPThemeState("mixed");
CPButtonStateBezelStyleRounded=CPThemeState("rounded");
var _1=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPButtonStateBezelStyleRounded,nil],[CPRoundedBezelStyle,CPRoundRectBezelStyle]);
CPButtonDefaultHeight=24;
CPButtonImageOffset=3;
var _2=objj_allocateClassPair(CPControl,"CPButton"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_allowsMixedState"),new objj_ivar("_title"),new objj_ivar("_alternateTitle"),new objj_ivar("_showsStateBy"),new objj_ivar("_highlightsBy"),new objj_ivar("_imageDimsWhenDisabled"),new objj_ivar("_bezelStyle"),new objj_ivar("_controlSize"),new objj_ivar("_keyEquivalent"),new objj_ivar("_keyEquivalentModifierMask"),new objj_ivar("_continuousDelayTimer"),new objj_ivar("_continuousTimer"),new objj_ivar("_periodicDelay"),new objj_ivar("_periodicInterval"),new objj_ivar("_isTracking")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPButton").super_class},"initWithFrame:",_6);
if(_4){
objj_msgSend(_4,"setValue:forThemeAttribute:",CPCenterTextAlignment,"alignment");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPCenterVerticalTextAlignment,"vertical-alignment");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPImageLeft,"image-position");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPImageScaleNone,"image-scaling");
objj_msgSend(_4,"setBezelStyle:",CPRoundRectBezelStyle);
objj_msgSend(_4,"setBordered:",YES);
objj_msgSend(_4,"_init");
}
return _4;
}
}),new objj_method(sel_getUid("_init"),function(_7,_8){
with(_7){
_controlSize=CPRegularControlSize;
_keyEquivalent="";
_keyEquivalentModifierMask=0;
_periodicInterval=0.05;
_periodicDelay=0.5;
objj_msgSend(_7,"setButtonType:",CPMomentaryPushInButton);
}
}),new objj_method(sel_getUid("allowsMixedState"),function(_9,_a){
with(_9){
return _allowsMixedState;
}
}),new objj_method(sel_getUid("setAllowsMixedState:"),function(_b,_c,_d){
with(_b){
_d=!!_d;
if(_allowsMixedState===_d){
return;
}
_allowsMixedState=_d;
if(!_allowsMixedState&&objj_msgSend(_b,"state")===CPMixedState){
objj_msgSend(_b,"setState:",CPOnState);
}
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_e,_f,_10){
with(_e){
if(!_10||_10===""||(objj_msgSend(_10,"intValue")===0)){
_10=CPOffState;
}else{
if(!objj_msgSend(_10,"isKindOfClass:",objj_msgSend(CPNumber,"class"))){
_10=CPOnState;
}else{
if(_10>=CPOnState){
_10=CPOnState;
}else{
if(_10<CPOffState){
if(objj_msgSend(_e,"allowsMixedState")){
_10=CPMixedState;
}else{
_10=CPOnState;
}
}
}
}
}
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPButton").super_class},"setObjectValue:",_10);
switch(objj_msgSend(_e,"objectValue")){
case CPMixedState:
objj_msgSend(_e,"unsetThemeState:",CPThemeStateSelected);
objj_msgSend(_e,"setThemeState:",CPButtonStateMixed);
if(_showsStateBy&(CPChangeGrayCellMask|CPChangeBackgroundCellMask)){
objj_msgSend(_e,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_e,"unsetThemeState:",CPThemeStateHighlighted);
}
break;
case CPOnState:
objj_msgSend(_e,"unsetThemeState:",CPButtonStateMixed);
objj_msgSend(_e,"setThemeState:",CPThemeStateSelected);
if(_showsStateBy&(CPChangeGrayCellMask|CPChangeBackgroundCellMask)){
objj_msgSend(_e,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_e,"unsetThemeState:",CPThemeStateHighlighted);
}
break;
case CPOffState:
objj_msgSend(_e,"unsetThemeState:",CPThemeStateSelected|CPButtonStateMixed|CPThemeStateHighlighted);
}
}
}),new objj_method(sel_getUid("nextState"),function(_11,_12){
with(_11){
if(objj_msgSend(_11,"allowsMixedState")){
var _13=objj_msgSend(_11,"state");
return _13-((_13===-1)?-2:1);
}
return 1-objj_msgSend(_11,"state");
}
}),new objj_method(sel_getUid("setNextState"),function(_14,_15){
with(_14){
if(objj_msgSend(_14,"infoForBinding:",CPValueBinding)){
objj_msgSend(_14,"setAllowsMixedState:",NO);
}
objj_msgSend(_14,"setState:",objj_msgSend(_14,"nextState"));
}
}),new objj_method(sel_getUid("setState:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_16,"setIntValue:",_18);
}
}),new objj_method(sel_getUid("state"),function(_19,_1a){
with(_19){
return objj_msgSend(_19,"intValue");
}
}),new objj_method(sel_getUid("setTitle:"),function(_1b,_1c,_1d){
with(_1b){
if(_title===_1d){
return;
}
_title=_1d;
objj_msgSend(_1b,"setNeedsLayout");
objj_msgSend(_1b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("title"),function(_1e,_1f){
with(_1e){
return _title;
}
}),new objj_method(sel_getUid("setAlternateTitle:"),function(_20,_21,_22){
with(_20){
if(_alternateTitle===_22){
return;
}
_alternateTitle=_22;
objj_msgSend(_20,"setNeedsLayout");
objj_msgSend(_20,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateTitle"),function(_23,_24){
with(_23){
return _alternateTitle;
}
}),new objj_method(sel_getUid("setImage:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"setValue:forThemeAttribute:",_27,"image");
}
}),new objj_method(sel_getUid("image"),function(_28,_29){
with(_28){
return objj_msgSend(_28,"valueForThemeAttribute:inState:","image",CPThemeStateNormal);
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"setValue:forThemeAttribute:inState:",_2c,"image",CPThemeStateHighlighted);
}
}),new objj_method(sel_getUid("alternateImage"),function(_2d,_2e){
with(_2d){
return objj_msgSend(_2d,"valueForThemeAttribute:inState:","image",CPThemeStateHighlighted);
}
}),new objj_method(sel_getUid("setImageOffset:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(_2f,"setValue:forThemeAttribute:",_31,"image-offset");
}
}),new objj_method(sel_getUid("imageOffset"),function(_32,_33){
with(_32){
return objj_msgSend(_32,"valueForThemeAttribute:","image-offset");
}
}),new objj_method(sel_getUid("setShowsStateBy:"),function(_34,_35,_36){
with(_34){
_36&=~CPPushInCellMask;
if(_showsStateBy===_36){
return;
}
_showsStateBy=_36;
if(_showsStateBy&(CPChangeGrayCellMask|CPChangeBackgroundCellMask)&&objj_msgSend(_34,"state")!=CPOffState){
objj_msgSend(_34,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_34,"unsetThemeState:",CPThemeStateHighlighted);
}
objj_msgSend(_34,"setNeedsDisplay:",YES);
objj_msgSend(_34,"setNeedsLayout");
}
}),new objj_method(sel_getUid("showsStateBy"),function(_37,_38){
with(_37){
return _showsStateBy;
}
}),new objj_method(sel_getUid("setHighlightsBy:"),function(_39,_3a,_3b){
with(_39){
if(_highlightsBy===_3b){
return;
}
_highlightsBy=_3b;
if(objj_msgSend(_39,"hasThemeState:",CPThemeStateHighlighted)){
objj_msgSend(_39,"setNeedsDisplay:",YES);
objj_msgSend(_39,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("highlightsBy"),function(_3c,_3d){
with(_3c){
return _highlightsBy;
}
}),new objj_method(sel_getUid("setButtonType:"),function(_3e,_3f,_40){
with(_3e){
switch(_40){
case CPMomentaryLightButton:
objj_msgSend(_3e,"setHighlightsBy:",CPChangeGrayCellMask|CPChangeBackgroundCellMask);
objj_msgSend(_3e,"setShowsStateBy:",CPNoCellMask);
break;
case CPMomentaryPushInButton:
objj_msgSend(_3e,"setHighlightsBy:",CPPushInCellMask|CPChangeGrayCellMask|CPChangeBackgroundCellMask);
objj_msgSend(_3e,"setShowsStateBy:",CPNoCellMask);
break;
case CPMomentaryChangeButton:
objj_msgSend(_3e,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_3e,"setShowsStateBy:",CPNoCellMask);
break;
case CPPushOnPushOffButton:
objj_msgSend(_3e,"setHighlightsBy:",CPPushInCellMask|CPChangeGrayCellMask|CPChangeBackgroundCellMask);
objj_msgSend(_3e,"setShowsStateBy:",CPChangeBackgroundCellMask|CPChangeGrayCellMask);
break;
case CPOnOffButton:
objj_msgSend(_3e,"setHighlightsBy:",CPChangeGrayCellMask|CPChangeBackgroundCellMask);
objj_msgSend(_3e,"setShowsStateBy:",CPChangeGrayCellMask|CPChangeBackgroundCellMask);
break;
case CPToggleButton:
objj_msgSend(_3e,"setHighlightsBy:",CPPushInCellMask|CPContentsCellMask);
objj_msgSend(_3e,"setShowsStateBy:",CPContentsCellMask);
break;
case CPSwitchButton:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The CPSwitchButton type is not supported in Cappuccino, use the CPCheckBox class instead.");
case CPRadioButton:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The CPRadioButton type is not supported in Cappuccino, use the CPRadio class instead.");
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unknown button type.");
}
objj_msgSend(_3e,"setImageDimsWhenDisabled:",YES);
}
}),new objj_method(sel_getUid("setImageDimsWhenDisabled:"),function(_41,_42,_43){
with(_41){
_43=!!_43;
if(_imageDimsWhenDisabled===_43){
return;
}
_imageDimsWhenDisabled=_43;
if(objj_msgSend(_41,"hasThemeState:",CPThemeStateDisabled)){
objj_msgSend(_41,"setNeedsDisplay:",YES);
objj_msgSend(_41,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("imageDimsWhenDisabled"),function(_44,_45){
with(_44){
return _imageDimsWhenDisabled;
}
}),new objj_method(sel_getUid("setPeriodicDelay:interval:"),function(_46,_47,_48,_49){
with(_46){
_periodicDelay=_48;
_periodicInterval=_49;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_4a,_4b,_4c){
with(_4a){
if(objj_msgSend(_4a,"isContinuous")){
_continuousDelayTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",_periodicDelay,function(){
if(!_continuousTimer){
_continuousTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_periodicInterval,_4a,sel_getUid("onContinousEvent:"),_4c,YES);
}
},NO);
}
objj_msgSendSuper({receiver:_4a,super_class:objj_getClass("CPButton").super_class},"mouseDown:",_4c);
}
}),new objj_method(sel_getUid("onContinousEvent:"),function(_4d,_4e,_4f){
with(_4d){
if(_target&&_action&&objj_msgSend(_target,"respondsToSelector:",_action)){
objj_msgSend(_target,"performSelector:withObject:",_action,_4d);
}
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_50,_51,_52){
with(_50){
_isTracking=YES;
var _53=objj_msgSendSuper({receiver:_50,super_class:objj_getClass("CPButton").super_class},"startTrackingAt:",_52);
if(_highlightsBy&(CPPushInCellMask|CPChangeGrayCellMask)){
if(_showsStateBy&(CPChangeGrayCellMask|CPChangeBackgroundCellMask)){
objj_msgSend(_50,"highlight:",objj_msgSend(_50,"state")==CPOffState);
}else{
objj_msgSend(_50,"highlight:",YES);
}
}else{
if(_showsStateBy&(CPChangeGrayCellMask|CPChangeBackgroundCellMask)){
objj_msgSend(_50,"highlight:",objj_msgSend(_50,"state")!=CPOffState);
}else{
objj_msgSend(_50,"highlight:",NO);
}
}
return _53;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_54,_55,_56,_57,_58){
with(_54){
_isTracking=NO;
if(_58&&CGRectContainsPoint(objj_msgSend(_54,"bounds"),_57)){
objj_msgSend(_54,"setNextState");
}else{
if(_showsStateBy&(CPChangeGrayCellMask|CPChangeBackgroundCellMask)){
objj_msgSend(_54,"highlight:",objj_msgSend(_54,"state")!=CPOffState);
}else{
objj_msgSend(_54,"highlight:",NO);
}
}
objj_msgSend(_54,"setNeedsLayout");
objj_msgSend(_54,"setNeedsDisplay:",YES);
objj_msgSend(_54,"invalidateTimers");
}
}),new objj_method(sel_getUid("invalidateTimers"),function(_59,_5a){
with(_59){
if(_continuousTimer){
objj_msgSend(_continuousTimer,"invalidate");
_continuousTimer=nil;
}
if(_continuousDelayTimer){
objj_msgSend(_continuousDelayTimer,"invalidate");
_continuousDelayTimer=nil;
}
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_5b,_5c,_5d){
with(_5b){
var _5e=objj_msgSend(_5b,"currentValueForThemeAttribute:","content-inset");
return {origin:{x:(_5d).origin.x+(_5e).left,y:(_5d).origin.y+(_5e).top},size:{width:(_5d).size.width-(_5e).left-(_5e).right,height:(_5d).size.height-(_5e).top-(_5e).bottom}};
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_5f,_60,_61){
with(_5f){
if(!objj_msgSend(_5f,"isBordered")){
return _61;
}
var _62=objj_msgSend(_5f,"currentValueForThemeAttribute:","bezel-inset");
return {origin:{x:(_61).origin.x+(_62).left,y:(_61).origin.y+(_62).top},size:{width:(_61).size.width-(_62).left-(_62).right,height:(_61).size.height-(_62).top-(_62).bottom}};
}
}),new objj_method(sel_getUid("_minimumFrameSize"),function(_63,_64){
with(_63){
var _65=CGSizeMakeZero(),_66=objj_msgSend(_63,"ephemeralSubviewNamed:","content-view");
if(_66){
objj_msgSend(_66,"sizeToFit");
_65=objj_msgSend(_66,"frameSize");
}else{
_65=objj_msgSend((objj_msgSend(_63,"title")||" "),"sizeWithFont:",objj_msgSend(_63,"currentValueForThemeAttribute:","font"));
}
var _67=objj_msgSend(_63,"currentValueForThemeAttribute:","content-inset"),_68=objj_msgSend(_63,"currentValueForThemeAttribute:","min-size"),_69=objj_msgSend(_63,"currentValueForThemeAttribute:","max-size");
_65.width=MAX(_65.width+_67.left+_67.right,_68.width);
_65.height=MAX(_65.height+_67.top+_67.bottom,_68.height);
if(_69.width>=0){
_65.width=MIN(_65.width,_69.width);
}
if(_69.height>=0){
_65.height=MIN(_65.height,_69.height);
}
return _65;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_6a,_6b){
with(_6a){
objj_msgSend(_6a,"layoutSubviews");
objj_msgSend(_6a,"setFrameSize:",objj_msgSend(_6a,"_minimumFrameSize"));
if(objj_msgSend(_6a,"ephemeralSubviewNamed:","content-view")){
objj_msgSend(_6a,"layoutSubviews");
}
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_6c,_6d,_6e){
with(_6c){
if(_6e==="bezel-view"){
return objj_msgSend(_6c,"bezelRectForBounds:",objj_msgSend(_6c,"bounds"));
}else{
if(_6e==="content-view"){
return objj_msgSend(_6c,"contentRectForBounds:",objj_msgSend(_6c,"bounds"));
}
}
return objj_msgSendSuper({receiver:_6c,super_class:objj_getClass("CPButton").super_class},"rectForEphemeralSubviewNamed:",_6e);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_6f,_70,_71){
with(_6f){
if(_71==="bezel-view"){
var _72=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_72,"setHitTests:",NO);
return _72;
}else{
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_73,_74){
with(_73){
var _75=objj_msgSend(_73,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
objj_msgSend(_75,"setBackgroundColor:",objj_msgSend(_73,"currentValueForThemeAttribute:","bezel-color"));
var _76=objj_msgSend(_73,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_76){
var _77=nil,_78=nil;
if(_isTracking){
if(_highlightsBy&CPContentsCellMask){
if(_showsStateBy&CPContentsCellMask){
_77=(objj_msgSend(_73,"state")==CPOffState&&_alternateTitle)?_alternateTitle:_title;
_78=(objj_msgSend(_73,"state")==CPOffState&&objj_msgSend(_73,"alternateImage"))?objj_msgSend(_73,"alternateImage"):objj_msgSend(_73,"image");
}else{
_77=objj_msgSend(_73,"alternateTitle");
_78=objj_msgSend(_73,"alternateImage");
}
}else{
if(_showsStateBy&CPContentsCellMask){
_77=(objj_msgSend(_73,"state")!=CPOffState&&_alternateTitle)?_alternateTitle:_title;
_78=(objj_msgSend(_73,"state")!=CPOffState&&objj_msgSend(_73,"alternateImage"))?objj_msgSend(_73,"alternateImage"):objj_msgSend(_73,"image");
}else{
_77=_title;
_78=objj_msgSend(_73,"image");
}
}
}else{
if(_showsStateBy&CPContentsCellMask){
_77=(objj_msgSend(_73,"state")!=CPOffState&&_alternateTitle)?_alternateTitle:_title;
_78=(objj_msgSend(_73,"state")!=CPOffState&&objj_msgSend(_73,"alternateImage"))?objj_msgSend(_73,"alternateImage"):objj_msgSend(_73,"image");
}else{
_77=_title;
_78=objj_msgSend(_73,"image");
}
}
objj_msgSend(_76,"setText:",_77);
objj_msgSend(_76,"setImage:",_78);
objj_msgSend(_76,"setImageOffset:",objj_msgSend(_73,"currentValueForThemeAttribute:","image-offset"));
objj_msgSend(_76,"setFont:",objj_msgSend(_73,"currentValueForThemeAttribute:","font"));
objj_msgSend(_76,"setTextColor:",objj_msgSend(_73,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_76,"setAlignment:",objj_msgSend(_73,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_76,"setVerticalAlignment:",objj_msgSend(_73,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_76,"setLineBreakMode:",objj_msgSend(_73,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_76,"setTextShadowColor:",objj_msgSend(_73,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_76,"setTextShadowOffset:",objj_msgSend(_73,"currentValueForThemeAttribute:","text-shadow-offset"));
objj_msgSend(_76,"setImagePosition:",objj_msgSend(_73,"currentValueForThemeAttribute:","image-position"));
objj_msgSend(_76,"setImageScaling:",objj_msgSend(_73,"currentValueForThemeAttribute:","image-scaling"));
objj_msgSend(_76,"setDimsImage:",objj_msgSend(_73,"hasThemeState:",CPThemeStateDisabled)&&_imageDimsWhenDisabled);
}
}
}),new objj_method(sel_getUid("setBordered:"),function(_79,_7a,_7b){
with(_79){
if(_7b){
objj_msgSend(_79,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_79,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_7c,_7d){
with(_7c){
return objj_msgSend(_7c,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("setKeyEquivalent:"),function(_7e,_7f,_80){
with(_7e){
_keyEquivalent=_80||"";
if(_80===CPNewlineCharacter||_80===CPCarriageReturnCharacter){
objj_msgSend(_7e,"setThemeState:",CPThemeStateDefault);
}else{
objj_msgSend(_7e,"unsetThemeState:",CPThemeStateDefault);
}
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_81,_82,_83){
with(_81){
var _84=objj_msgSend(_81,"window");
if(_84===_83||_83===nil){
return;
}
if(objj_msgSend(_84,"defaultButton")===_81){
objj_msgSend(_84,"setDefaultButton:",nil);
}
if(objj_msgSend(_81,"keyEquivalent")===CPNewlineCharacter||objj_msgSend(_81,"keyEquivalent")===CPCarriageReturnCharacter){
objj_msgSend(_83,"setDefaultButton:",_81);
}
}
}),new objj_method(sel_getUid("keyEquivalent"),function(_85,_86){
with(_85){
return _keyEquivalent;
}
}),new objj_method(sel_getUid("setKeyEquivalentModifierMask:"),function(_87,_88,_89){
with(_87){
_keyEquivalentModifierMask=_89;
}
}),new objj_method(sel_getUid("keyEquivalentModifierMask"),function(_8a,_8b){
with(_8a){
return _keyEquivalentModifierMask;
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_8c,_8d,_8e){
with(_8c){
if(objj_msgSend(objj_msgSend(_8c,"window"),"defaultButton")===_8c){
return NO;
}
if(!objj_msgSend(_8e,"_triggersKeyEquivalent:withModifierMask:",objj_msgSend(_8c,"keyEquivalent"),objj_msgSend(_8c,"keyEquivalentModifierMask"))){
return NO;
}
objj_msgSend(_8c,"performClick:",nil);
return YES;
}
}),new objj_method(sel_getUid("performClick:"),function(_8f,_90,_91){
with(_8f){
if(!objj_msgSend(_8f,"isEnabled")){
return;
}
objj_msgSend(_8f,"setState:",objj_msgSend(_8f,"nextState"));
var _92=NO;
if(_highlightsBy&(CPPushInCellMask|CPChangeGrayCellMask)){
if(_showsStateBy&(CPChangeGrayCellMask|CPChangeBackgroundCellMask)){
_92=objj_msgSend(_8f,"state")==CPOffState;
}else{
_92=YES;
}
}
objj_msgSend(_8f,"highlight:",_92);
try{
objj_msgSend(_8f,"sendAction:to:",objj_msgSend(_8f,"action"),objj_msgSend(_8f,"target"));
}
catch(e){
throw e;
}
finally{
if(_92){
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.1,_8f,sel_getUid("unhighlightButtonTimerDidFinish:"),nil,NO);
}
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("buttonWithTitle:"),function(_93,_94,_95){
with(_93){
return objj_msgSend(_93,"buttonWithTitle:theme:",_95,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("buttonWithTitle:theme:"),function(_96,_97,_98,_99){
with(_96){
var _9a=objj_msgSend(objj_msgSend(_96,"alloc"),"init");
objj_msgSend(_9a,"setTheme:",_99);
objj_msgSend(_9a,"setTitle:",_98);
objj_msgSend(_9a,"sizeToFit");
return _9a;
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(_9b,_9c){
with(_9b){
return "button";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_9d,_9e){
with(_9d){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(CPNull,"null"),0,{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},objj_msgSend(CPNull,"null")],["image","image-offset","bezel-inset","content-inset","bezel-color"]);
}
})]);
var _2=objj_getClass("CPButton");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("setBezelStyle:"),function(_9f,_a0,_a1){
with(_9f){
if(_a1===_bezelStyle){
return;
}
var _a2=objj_msgSend(_1,"objectForKey:",_bezelStyle),_a3=objj_msgSend(_1,"objectForKey:",_a1);
if(_a2){
objj_msgSend(_9f,"unsetThemeState:",_a2);
}
if(_a3){
objj_msgSend(_9f,"setThemeState:",_a3);
}
_bezelStyle=_a1;
}
}),new objj_method(sel_getUid("bezelStyle"),function(_a4,_a5){
with(_a4){
return _bezelStyle;
}
})]);
var _a6="CPButtonImageKey",_a7="CPButtonAlternateImageKey",_a8="CPButtonTitleKey",_a9="CPButtonAlternateTitleKey",_aa="CPButtonIsBorderedKey",_ab="CPButtonAllowsMixedStateKey",_ac="CPButtonImageDimsWhenDisabledKey",_ad="CPButtonImagePositionKey",_ae="CPButtonKeyEquivalentKey",_af="CPButtonKeyEquivalentMaskKey",_b0="CPButtonPeriodicDelayKey",_b1="CPButtonPeriodicIntervalKey",_b2="CPButtonHighlightsByKey",_b3="CPButtonShowsStateByKey";
var _2=objj_getClass("CPButton");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_b4,_b5,_b6){
with(_b4){
_b4=objj_msgSendSuper({receiver:_b4,super_class:objj_getClass("CPButton").super_class},"initWithCoder:",_b6);
if(_b4){
objj_msgSend(_b4,"_init");
_title=objj_msgSend(_b6,"decodeObjectForKey:",_a8);
_alternateTitle=objj_msgSend(_b6,"decodeObjectForKey:",_a9);
_allowsMixedState=objj_msgSend(_b6,"decodeBoolForKey:",_ab);
if(objj_msgSend(_b6,"containsValueForKey:",_b2)){
_highlightsBy=objj_msgSend(_b6,"decodeIntForKey:",_b2);
_showsStateBy=objj_msgSend(_b6,"decodeIntForKey:",_b3);
}else{
}
objj_msgSend(_b4,"setImageDimsWhenDisabled:",objj_msgSend(_b6,"decodeObjectForKey:",_ac));
if(objj_msgSend(_b6,"containsValueForKey:",_ad)){
objj_msgSend(_b4,"setImagePosition:",objj_msgSend(_b6,"decodeIntForKey:",_ad));
}
if(objj_msgSend(_b6,"containsValueForKey:",_ae)){
objj_msgSend(_b4,"setKeyEquivalent:",CFData.decodeBase64ToUtf16String(objj_msgSend(_b6,"decodeObjectForKey:",_ae)));
}
if(objj_msgSend(_b6,"containsValueForKey:",_b0)){
_periodicDelay=objj_msgSend(_b6,"decodeObjectForKey:",_b0);
}
if(objj_msgSend(_b6,"containsValueForKey:",_b1)){
_periodicInterval=objj_msgSend(_b6,"decodeObjectForKey:",_b1);
}
_keyEquivalentModifierMask=objj_msgSend(_b6,"decodeIntForKey:",_af);
objj_msgSend(_b4,"setNeedsLayout");
objj_msgSend(_b4,"setNeedsDisplay:",YES);
}
return _b4;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_b7,_b8,_b9){
with(_b7){
objj_msgSendSuper({receiver:_b7,super_class:objj_getClass("CPButton").super_class},"encodeWithCoder:",_b9);
objj_msgSend(_b7,"invalidateTimers");
objj_msgSend(_b9,"encodeObject:forKey:",_title,_a8);
objj_msgSend(_b9,"encodeObject:forKey:",_alternateTitle,_a9);
objj_msgSend(_b9,"encodeBool:forKey:",_allowsMixedState,_ab);
objj_msgSend(_b9,"encodeInt:forKey:",_highlightsBy,_b2);
objj_msgSend(_b9,"encodeInt:forKey:",_showsStateBy,_b3);
objj_msgSend(_b9,"encodeBool:forKey:",objj_msgSend(_b7,"imageDimsWhenDisabled"),_ac);
objj_msgSend(_b9,"encodeInt:forKey:",objj_msgSend(_b7,"imagePosition"),_ad);
if(_keyEquivalent){
objj_msgSend(_b9,"encodeObject:forKey:",CFData.encodeBase64Utf16String(_keyEquivalent),_ae);
}
objj_msgSend(_b9,"encodeInt:forKey:",_keyEquivalentModifierMask,_af);
objj_msgSend(_b9,"encodeObject:forKey:",_periodicDelay,_b0);
objj_msgSend(_b9,"encodeObject:forKey:",_periodicInterval,_b1);
}
})]);
objj_executeFile("CPCheckBox.j",YES);
objj_executeFile("CPRadio.j",YES);
