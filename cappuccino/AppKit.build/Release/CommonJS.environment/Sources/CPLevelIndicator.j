@STATIC;1.0;i;11;CPControl.jt;13207;
objj_executeFile("CPControl.j",YES);
CPTickMarkBelow=0;
CPTickMarkAbove=1;
CPTickMarkLeft=CPTickMarkAbove;
CPTickMarkRight=CPTickMarkBelow;
CPRelevancyLevelIndicatorStyle=0;
CPContinuousCapacityLevelIndicatorStyle=1;
CPDiscreteCapacityLevelIndicatorStyle=2;
CPRatingLevelIndicatorStyle=3;
var _1=nil,_2=nil,_3=nil,_4=nil,_5=nil,_6=1;
var _7=objj_allocateClassPair(CPControl,"CPLevelIndicator"),_8=_7.isa;
class_addIvars(_7,[new objj_ivar("_levelIndicatorStyle"),new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_warningValue"),new objj_ivar("_criticalValue"),new objj_ivar("_tickMarkPosition"),new objj_ivar("_numberOfTickMarks"),new objj_ivar("_numberOfMajorTickMarks"),new objj_ivar("_isEditable"),new objj_ivar("_isTracking")]);
objj_registerClassPair(_7);
class_addMethods(_7,[new objj_method(sel_getUid("levelIndicatorStyle"),function(_9,_a){
with(_9){
return _levelIndicatorStyle;
}
}),new objj_method(sel_getUid("setLevelIndicatorStyle:"),function(_b,_c,_d){
with(_b){
_levelIndicatorStyle=_d;
}
}),new objj_method(sel_getUid("minValue"),function(_e,_f){
with(_e){
return _minValue;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_10,_11,_12){
with(_10){
_minValue=_12;
}
}),new objj_method(sel_getUid("maxValue"),function(_13,_14){
with(_13){
return _maxValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_15,_16,_17){
with(_15){
_maxValue=_17;
}
}),new objj_method(sel_getUid("warningValue"),function(_18,_19){
with(_18){
return _warningValue;
}
}),new objj_method(sel_getUid("setWarningValue:"),function(_1a,_1b,_1c){
with(_1a){
_warningValue=_1c;
}
}),new objj_method(sel_getUid("criticalValue"),function(_1d,_1e){
with(_1d){
return _criticalValue;
}
}),new objj_method(sel_getUid("setCriticalValue:"),function(_1f,_20,_21){
with(_1f){
_criticalValue=_21;
}
}),new objj_method(sel_getUid("tickMarkPosition"),function(_22,_23){
with(_22){
return _tickMarkPosition;
}
}),new objj_method(sel_getUid("setTickMarkPosition:"),function(_24,_25,_26){
with(_24){
_tickMarkPosition=_26;
}
}),new objj_method(sel_getUid("numberOfTickMarks"),function(_27,_28){
with(_27){
return _numberOfTickMarks;
}
}),new objj_method(sel_getUid("setNumberOfTickMarks:"),function(_29,_2a,_2b){
with(_29){
_numberOfTickMarks=_2b;
}
}),new objj_method(sel_getUid("numberOfMajorTickMarks"),function(_2c,_2d){
with(_2c){
return _numberOfMajorTickMarks;
}
}),new objj_method(sel_getUid("setNumberOfMajorTickMarks:"),function(_2e,_2f,_30){
with(_2e){
_numberOfMajorTickMarks=_30;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_31,_32,_33){
with(_31){
_31=objj_msgSendSuper({receiver:_31,super_class:objj_getClass("CPLevelIndicator").super_class},"initWithFrame:",_33);
if(_31){
_levelIndicatorStyle=CPDiscreteCapacityLevelIndicatorStyle;
_maxValue=2;
_warningValue=2;
_criticalValue=2;
objj_msgSend(_31,"_init");
}
return _31;
}
}),new objj_method(sel_getUid("_init"),function(_34,_35){
with(_34){
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_36,_37){
with(_36){
var _38=objj_msgSend(_36,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel",CPWindowBelow,nil);
objj_msgSend(_38,"setBackgroundColor:",_1);
var _39=_maxValue-_minValue;
if(_39<=0){
return;
}
var _3a=_3,_3b=objj_msgSend(_36,"doubleValue");
if(_3b<=_criticalValue){
_3a=_5;
}else{
if(_3b<=_warningValue){
_3a=_4;
}
}
for(var i=0;i<_39;i++){
var _3c=objj_msgSend(_36,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","segment-bezel-"+i,CPWindowAbove,_38);
objj_msgSend(_3c,"setBackgroundColor:",(_minValue+i)<_3b?_3a:_2);
}
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_3d,_3e,_3f){
with(_3d){
return objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_40,_41,_42){
with(_40){
var _43=18,_44=17,_45={origin:{x:objj_msgSend(_40,"bounds").origin.x,y:objj_msgSend(_40,"bounds").origin.y},size:{width:objj_msgSend(_40,"bounds").size.width,height:objj_msgSend(_40,"bounds").size.height}};
if(_42=="bezel"){
_45.origin.y=((_45.size.height)-_43)/2;
_45.size.height=_43;
return _45;
}else{
if(_42.indexOf("segment-bezel")===0){
var _46=parseInt(_42.substring("segment-bezel-".length),10),_47=_maxValue-_minValue;
if(_46>=_47){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _48=_45.size.width/_47,_49=CGRectCreateCopy(objj_msgSend(_40,"bounds"));
_49.origin.y=((_45.size.height)-_43)/2;
_49.origin.x=FLOOR(_46*_48);
_49.size.width=(_46==_47-1)?_45.size.width-_49.origin.x:FLOOR(((_46+1)*_48))-FLOOR((_46*_48))-_6;
_49.size.height=_44;
return _49;
}
}
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("setEditable:"),function(_4a,_4b,_4c){
with(_4a){
if(_isEditable===_4c){
return;
}
_isEditable=_4c;
}
}),new objj_method(sel_getUid("isEditable"),function(_4d,_4e){
with(_4d){
return _isEditable;
}
}),new objj_method(sel_getUid("hitTest:"),function(_4f,_50,_51){
with(_4f){
if(!objj_msgSend(_4f,"isEditable")){
return nil;
}
return objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("CPLevelIndicator").super_class},"hitTest:",_51);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_52,_53,_54){
with(_52){
if(!objj_msgSend(_52,"isEditable")||!objj_msgSend(_52,"isEnabled")){
return;
}
objj_msgSend(_52,"_trackMouse:",_54);
}
}),new objj_method(sel_getUid("_trackMouse:"),function(_55,_56,_57){
with(_55){
var _58=objj_msgSend(_57,"type");
if(_58==CPLeftMouseDown||_58==CPLeftMouseDragged){
var _59=_maxValue-_minValue;
if(_59<=0){
return;
}
var _5a=objj_msgSend(_55,"convertPoint:fromView:",objj_msgSend(_57,"locationInWindow"),nil),_5b=objj_msgSend(_55,"bounds"),_5c=objj_msgSend(_55,"doubleValue"),_5d=_5c;
if(_58==CPLeftMouseDragged&&_5a.x<0){
_5d=_minValue;
}else{
if(_58==CPLeftMouseDragged&&_5a.x>_5b.size.width){
_5d=_maxValue;
}else{
for(var i=0;i<_59;i++){
var _5e=objj_msgSend(_55,"rectForEphemeralSubviewNamed:","segment-bezel-"+i);
if(_5a.x>=CGRectGetMinX(_5e)&&_5a.x<CGRectGetMaxX(_5e)){
_5d=(_minValue+i+1);
break;
}
}
}
}
if(_5d!=_5c){
objj_msgSend(_55,"setDoubleValue:",_5d);
}
_isTracking=YES;
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_55,sel_getUid("_trackMouse:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
if(objj_msgSend(_55,"isContinuous")){
objj_msgSend(_55,"sendAction:to:",objj_msgSend(_55,"action"),objj_msgSend(_55,"target"));
}
}else{
if(_isTracking){
_isTracking=NO;
objj_msgSend(_55,"sendAction:to:",objj_msgSend(_55,"action"),objj_msgSend(_55,"target"));
}
}
}
}),new objj_method(sel_getUid("setMinValue:"),function(_5f,_60,_61){
with(_5f){
if(_minValue===_61){
return;
}
_minValue=_61;
objj_msgSend(_5f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_62,_63,_64){
with(_62){
if(_maxValue===_64){
return;
}
_maxValue=_64;
objj_msgSend(_62,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setWarningValue:"),function(_65,_66,_67){
with(_65){
if(_warningValue===_67){
return;
}
_warningValue=_67;
objj_msgSend(_65,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setCriticalValue:"),function(_68,_69,_6a){
with(_68){
if(_criticalValue===_6a){
return;
}
_criticalValue=_6a;
objj_msgSend(_68,"setNeedsLayout");
}
})]);
class_addMethods(_8,[new objj_method(sel_getUid("initialize"),function(_6b,_6c){
with(_6b){
if(_6b!==objj_msgSend(CPLevelIndicator,"class")){
return;
}
var _6d=objj_msgSend(CPBundle,"bundleForClass:",CPLevelIndicator);
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-bezel-left.png"),CGSizeMake(3,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-bezel-center.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-bezel-right.png"),CGSizeMake(3,18))],NO));
_2=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-empty-left.png"),CGSizeMake(3,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-empty-center.png"),CGSizeMake(1,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-empty-right.png"),CGSizeMake(3,17))],NO));
_3=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-normal-left.png"),CGSizeMake(3,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-normal-center.png"),CGSizeMake(1,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-normal-right.png"),CGSizeMake(3,17))],NO));
_4=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-warning-left.png"),CGSizeMake(3,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-warning-center.png"),CGSizeMake(1,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-warning-right.png"),CGSizeMake(3,17))],NO));
_5=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-critical-left.png"),CGSizeMake(3,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-critical-center.png"),CGSizeMake(1,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6d,"pathForResource:","CPLevelIndicator/level-indicator-segment-critical-right.png"),CGSizeMake(3,17))],NO));
}
})]);
var _6e="CPLevelIndicatorStyleKey",_6f="CPLevelIndicatorMinValueKey",_70="CPLevelIndicatorMaxValueKey",_71="CPLevelIndicatorWarningValueKey",_72="CPLevelIndicatorCriticalValueKey",_73="CPLevelIndicatorTickMarkPositionKey",_74="CPLevelIndicatorNumberOfTickMarksKey",_75="CPLevelIndicatorNumberOfMajorTickMarksKey",_76="CPLevelIndicatorIsEditableKey";
var _7=objj_getClass("CPLevelIndicator");
if(!_7){
throw new SyntaxError("*** Could not find definition for class \"CPLevelIndicator\"");
}
var _8=_7.isa;
class_addMethods(_7,[new objj_method(sel_getUid("initWithCoder:"),function(_77,_78,_79){
with(_77){
_77=objj_msgSendSuper({receiver:_77,super_class:objj_getClass("CPLevelIndicator").super_class},"initWithCoder:",_79);
if(_77){
_levelIndicatorStyle=objj_msgSend(_79,"decodeIntForKey:",_6e);
_minValue=objj_msgSend(_79,"decodeDoubleForKey:",_6f);
_maxValue=objj_msgSend(_79,"decodeDoubleForKey:",_70);
_warningValue=objj_msgSend(_79,"decodeDoubleForKey:",_71);
_criticalValue=objj_msgSend(_79,"decodeDoubleForKey:",_72);
_tickMarkPosition=objj_msgSend(_79,"decodeIntForKey:",_73);
_numberOfTickMarks=objj_msgSend(_79,"decodeIntForKey:",_74);
_numberOfMajorTickMarks=objj_msgSend(_79,"decodeIntForKey:",_75);
_isEditable=objj_msgSend(_79,"decodeBoolForKey:",_76);
objj_msgSend(_77,"_init");
objj_msgSend(_77,"setNeedsLayout");
objj_msgSend(_77,"setNeedsDisplay:",YES);
}
return _77;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7a,_7b,_7c){
with(_7a){
objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("CPLevelIndicator").super_class},"encodeWithCoder:",_7c);
objj_msgSend(_7c,"encodeInt:forKey:",_levelIndicatorStyle,_6e);
objj_msgSend(_7c,"encodeDouble:forKey:",_minValue,_6f);
objj_msgSend(_7c,"encodeDouble:forKey:",_maxValue,_70);
objj_msgSend(_7c,"encodeDouble:forKey:",_warningValue,_71);
objj_msgSend(_7c,"encodeDouble:forKey:",_criticalValue,_72);
objj_msgSend(_7c,"encodeInt:forKey:",_tickMarkPosition,_73);
objj_msgSend(_7c,"encodeInt:forKey:",_numberOfTickMarks,_74);
objj_msgSend(_7c,"encodeInt:forKey:",_numberOfMajorTickMarks,_75);
objj_msgSend(_7c,"encodeBool:forKey:",_isEditable,_76);
}
})]);
