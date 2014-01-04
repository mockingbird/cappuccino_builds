@STATIC;1.0;i;11;CPControl.jt;21677;
objj_executeFile("CPControl.j",YES);
CPScrollerNoPart=0;
CPScrollerDecrementPage=1;
CPScrollerKnob=2;
CPScrollerIncrementPage=3;
CPScrollerDecrementLine=4;
CPScrollerIncrementLine=5;
CPScrollerKnobSlot=6;
CPScrollerIncrementArrow=0;
CPScrollerDecrementArrow=1;
CPNoScrollerParts=0;
CPOnlyScrollerArrows=1;
CPAllScrollerParts=2;
var _1=[CPScrollerKnobSlot,CPScrollerDecrementLine,CPScrollerIncrementLine,CPScrollerKnob],_2={},_3={};
_2[CPScrollerDecrementLine]="decrement-line";
_2[CPScrollerIncrementLine]="increment-line";
_2[CPScrollerKnobSlot]="knob-slot";
_2[CPScrollerKnob]="knob";
CPScrollerStyleLegacy=0;
CPScrollerStyleOverlay=1;
CPScrollerKnobStyleDefault=0;
CPScrollerKnobStyleDark=1;
CPScrollerKnobStyleLight=2;
CPThemeStateScrollViewLegacy=CPThemeState("scroller-style-legacy");
CPThemeStateScrollerKnobLight=CPThemeState("scroller-knob-light");
CPThemeStateScrollerKnobDark=CPThemeState("scroller-knob-dark");
var _4=objj_allocateClassPair(CPControl,"CPScroller"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_controlSize"),new objj_ivar("_usableParts"),new objj_ivar("_partRects"),new objj_ivar("_isVertical"),new objj_ivar("_knobProportion"),new objj_ivar("_hitPart"),new objj_ivar("_trackingPart"),new objj_ivar("_trackingFloatValue"),new objj_ivar("_trackingStartPoint"),new objj_ivar("_animationScroller"),new objj_ivar("_allowFadingOut"),new objj_ivar("_style"),new objj_ivar("_timerFadeOut"),new objj_ivar("_isMouseOver")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("isVertical"),function(_6,_7){
with(_6){
return _isVertical;
}
}),new objj_method(sel_getUid("allowFadingOut"),function(_8,_9){
with(_8){
return _allowFadingOut;
}
}),new objj_method(sel_getUid("_setAllowFadingOut:"),function(_a,_b,_c){
with(_a){
_allowFadingOut=_c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPScroller").super_class},"initWithFrame:",_f)){
_controlSize=CPRegularControlSize;
_partRects=[];
objj_msgSend(_d,"setFloatValue:",0);
objj_msgSend(_d,"setKnobProportion:",1);
_hitPart=CPScrollerNoPart;
_allowFadingOut=YES;
_isMouseOver=NO;
_style=CPScrollerStyleOverlay;
var _10=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_d,CPViewAnimationFadeOutEffect],[CPViewAnimationTargetKey,CPViewAnimationEffectKey]);
_animationScroller=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithDuration:animationCurve:",0.2,CPAnimationEaseInOut);
objj_msgSend(_animationScroller,"setViewAnimations:",[_10]);
objj_msgSend(_animationScroller,"setDelegate:",_d);
objj_msgSend(_d,"setAlphaValue:",0);
objj_msgSend(_d,"_calculateIsVertical");
}
return _d;
}
}),new objj_method(sel_getUid("style"),function(_11,_12){
with(_11){
return _style;
}
}),new objj_method(sel_getUid("setStyle:"),function(_13,_14,_15){
with(_13){
if(_style!=nil&&_style===_15){
return;
}
_style=_15;
if(_style===CPScrollerStyleLegacy){
objj_msgSend(_13,"fadeIn");
objj_msgSend(_13,"setThemeState:",CPThemeStateScrollViewLegacy);
}else{
_allowFadingOut=YES;
objj_msgSend(_13,"unsetThemeState:",CPThemeStateScrollViewLegacy);
}
objj_msgSend(_13,"_adjustScrollerSize");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_16,_17,_18){
with(_16){
objj_msgSendSuper({receiver:_16,super_class:objj_getClass("CPScroller").super_class},"setObjectValue:",MIN(1,MAX(0,+_18)));
}
}),new objj_method(sel_getUid("controlSize"),function(_19,_1a){
with(_19){
return _controlSize;
}
}),new objj_method(sel_getUid("setControlSize:"),function(_1b,_1c,_1d){
with(_1b){
if(_controlSize==_1d){
return;
}
_controlSize=_1d;
objj_msgSend(_1b,"setNeedsLayout");
objj_msgSend(_1b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("knobProportion"),function(_1e,_1f){
with(_1e){
return _knobProportion;
}
}),new objj_method(sel_getUid("setKnobProportion:"),function(_20,_21,_22){
with(_20){
if(!(!isNaN(parseFloat(_22))&&isFinite(_22))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"aProportion must be numeric");
}
_knobProportion=MIN(1,MAX(0.0001,_22));
objj_msgSend(_20,"setNeedsDisplay:",YES);
objj_msgSend(_20,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_adjustScrollerSize"),function(_23,_24){
with(_23){
var _25=objj_msgSend(_23,"frame"),_26=objj_msgSend(_23,"currentValueForThemeAttribute:","scroller-width");
if(objj_msgSend(_23,"isVertical")&&CGRectGetWidth(_25)!==_26){
_25.size.width=_26;
}
if(!objj_msgSend(_23,"isVertical")&&CGRectGetHeight(_25)!==_26){
_25.size.height=_26;
}
objj_msgSend(_23,"setFrame:",_25);
}
}),new objj_method(sel_getUid("_performFadeOut:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_27,"fadeOut");
_timerFadeOut=nil;
}
}),new objj_method(sel_getUid("rectForPart:"),function(_2a,_2b,_2c){
with(_2a){
if(_2c==CPScrollerNoPart){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
return _partRects[_2c];
}
}),new objj_method(sel_getUid("testPart:"),function(_2d,_2e,_2f){
with(_2d){
_2f=objj_msgSend(_2d,"convertPoint:fromView:",_2f,nil);
if(!objj_msgSend(_2d,"hasThemeState:",CPThemeStateSelected)){
return CPScrollerNoPart;
}
if(CGRectContainsPoint(objj_msgSend(_2d,"rectForPart:",CPScrollerKnob),_2f)){
return CPScrollerKnob;
}
if(CGRectContainsPoint(objj_msgSend(_2d,"rectForPart:",CPScrollerDecrementPage),_2f)){
return CPScrollerDecrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_2d,"rectForPart:",CPScrollerIncrementPage),_2f)){
return CPScrollerIncrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_2d,"rectForPart:",CPScrollerDecrementLine),_2f)){
return CPScrollerDecrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_2d,"rectForPart:",CPScrollerIncrementLine),_2f)){
return CPScrollerIncrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_2d,"rectForPart:",CPScrollerKnobSlot),_2f)){
return CPScrollerKnobSlot;
}
return CPScrollerNoPart;
}
}),new objj_method(sel_getUid("checkSpaceForParts"),function(_30,_31){
with(_30){
var _32=objj_msgSend(_30,"bounds");
if(_knobProportion===1){
_usableParts=CPNoScrollerParts;
_partRects[CPScrollerDecrementPage]=CGRectMakeZero();
_partRects[CPScrollerKnob]=CGRectMakeZero();
_partRects[CPScrollerIncrementPage]=CGRectMakeZero();
_partRects[CPScrollerDecrementLine]=CGRectMakeZero();
_partRects[CPScrollerIncrementLine]=CGRectMakeZero();
_partRects[CPScrollerKnobSlot]=CGRectMakeCopy(_32);
return;
}
_usableParts=CPAllScrollerParts;
var _33=objj_msgSend(_30,"currentValueForThemeAttribute:","knob-inset"),_34=objj_msgSend(_30,"currentValueForThemeAttribute:","track-inset"),_35=(_32.size.width),_36=(_32.size.height);
if(objj_msgSend(_30,"isVertical")){
var _37=objj_msgSend(_30,"currentValueForThemeAttribute:","decrement-line-size"),_38=objj_msgSend(_30,"currentValueForThemeAttribute:","increment-line-size"),_39=_37.height+_34.top,_3a=_38.height+_34.bottom,_3b=_36-_39-_3a,_3c=objj_msgSend(_30,"currentValueForThemeAttribute:","minimum-knob-length"),_3d=_35-_33.left-_33.right,_3e=MAX(_3c,(_3b*_knobProportion)),_3f=_39+(_3b-_3e)*objj_msgSend(_30,"floatValue");
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:_39},size:{width:_35,height:_3f-_39}};
_partRects[CPScrollerKnob]={origin:{x:_33.left,y:_3f},size:{width:_3d,height:_3e}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:_3f+_3e},size:{width:_35,height:_36-(_3f+_3e)-_3a}};
_partRects[CPScrollerKnobSlot]={origin:{x:_34.left,y:_39},size:{width:_35-_34.left-_34.right,height:_3b}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_37.width,height:_37.height}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:_36-_38.height},size:{width:_38.width,height:_38.height}};
if(_36<_3e+_37.height+_38.height+_34.top+_34.bottom){
_partRects[CPScrollerKnob]={origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_36<_37.height+_38.height-2){
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnobSlot]={origin:{x:_34.left,y:0},size:{width:_35-_34.left-_34.right,height:_36}};
}
}else{
var _37=objj_msgSend(_30,"currentValueForThemeAttribute:","decrement-line-size"),_38=objj_msgSend(_30,"currentValueForThemeAttribute:","increment-line-size"),_40=_37.width+_34.left,_41=_38.width+_34.right,_3b=_35-_40-_41,_3c=objj_msgSend(_30,"currentValueForThemeAttribute:","minimum-knob-length"),_3d=MAX(_3c,(_3b*_knobProportion)),_3e=_36-_33.top-_33.bottom,_3f=_40+(_3b-_3d)*objj_msgSend(_30,"floatValue");
_partRects[CPScrollerDecrementPage]={origin:{x:_40,y:0},size:{width:_3f-_40,height:_36}};
_partRects[CPScrollerKnob]={origin:{x:_3f,y:_33.top},size:{width:_3d,height:_3e}};
_partRects[CPScrollerIncrementPage]={origin:{x:_3f+_3d,y:0},size:{width:_35-(_3f+_3d)-_41,height:_36}};
_partRects[CPScrollerKnobSlot]={origin:{x:_40,y:_34.top},size:{width:_3b,height:_36-_34.top-_34.bottom}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_37.width,height:_37.height}};
_partRects[CPScrollerIncrementLine]={origin:{x:_35-_38.width,y:0},size:{width:_38.width,height:_38.height}};
if(_35<_3d+_37.width+_38.width+_34.left+_34.right){
_partRects[CPScrollerKnob]={origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_35<_37.width+_38.width-2){
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnobSlot]={origin:{x:0,y:0},size:{width:_35,height:_3b}};
}
}
}
}),new objj_method(sel_getUid("usableParts"),function(_42,_43){
with(_42){
return _usableParts;
}
}),new objj_method(sel_getUid("fadeIn"),function(_44,_45){
with(_44){
if(_isMouseOver&&_knobProportion!=1){
objj_msgSend(_44,"setThemeState:",CPThemeStateSelected);
}
if(_timerFadeOut){
objj_msgSend(_timerFadeOut,"invalidate");
}
objj_msgSend(_44,"setAlphaValue:",1);
}
}),new objj_method(sel_getUid("fadeOut"),function(_46,_47){
with(_46){
if(objj_msgSend(_46,"hasThemeState:",CPThemeStateScrollViewLegacy)){
return;
}
objj_msgSend(_animationScroller,"startAnimation");
}
}),new objj_method(sel_getUid("drawArrow:highlight:"),function(_48,_49,_4a,_4b){
with(_48){
}
}),new objj_method(sel_getUid("drawKnob"),function(_4c,_4d){
with(_4c){
}
}),new objj_method(sel_getUid("drawKnobSlot"),function(_4e,_4f){
with(_4e){
}
}),new objj_method(sel_getUid("createViewForPart:"),function(_50,_51,_52){
with(_50){
var _53=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_53,"setHitTests:",NO);
return _53;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_54,_55,_56){
with(_54){
return _partRects[_56];
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_57,_58,_59){
with(_57){
var _5a=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_5a,"setHitTests:",NO);
return _5a;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_5b,_5c){
with(_5b){
objj_msgSend(_5b,"checkSpaceForParts");
var _5d=0,_5e=_1.length,_5f;
for(;_5d<_5e;++_5d){
var _60=_1[_5d];
if(_5d===0){
_5f=objj_msgSend(_5b,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:",_60,CPWindowBelow,_1[_5d+1]);
}else{
_5f=objj_msgSend(_5b,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:",_60,CPWindowAbove,_1[_5d-1]);
}
if(_5f){
objj_msgSend(_5f,"setBackgroundColor:",objj_msgSend(_5b,"currentValueForThemeAttribute:",_2[_60]+"-color"));
}
}
}
}),new objj_method(sel_getUid("drawParts"),function(_61,_62){
with(_61){
objj_msgSend(_61,"drawKnobSlot");
objj_msgSend(_61,"drawKnob");
objj_msgSend(_61,"drawArrow:highlight:",CPScrollerDecrementArrow,NO);
objj_msgSend(_61,"drawArrow:highlight:",CPScrollerIncrementArrow,NO);
}
}),new objj_method(sel_getUid("hitPart"),function(_63,_64){
with(_63){
return _hitPart;
}
}),new objj_method(sel_getUid("trackKnob:"),function(_65,_66,_67){
with(_65){
var _68=objj_msgSend(_67,"type");
if(_68===CPLeftMouseUp){
_hitPart=CPScrollerNoPart;
return;
}
if(_68===CPLeftMouseDown){
_trackingFloatValue=objj_msgSend(_65,"floatValue");
_trackingStartPoint=objj_msgSend(_65,"convertPoint:fromView:",objj_msgSend(_67,"locationInWindow"),nil);
}else{
if(_68===CPLeftMouseDragged){
var _69=objj_msgSend(_65,"rectForPart:",CPScrollerKnob),_6a=objj_msgSend(_65,"rectForPart:",CPScrollerKnobSlot),_6b=!objj_msgSend(_65,"isVertical")?((_6a.size.width)-(_69.size.width)):((_6a.size.height)-(_69.size.height));
if(_6b<=0){
objj_msgSend(_65,"setFloatValue:",0);
}else{
var _6c=objj_msgSend(_65,"convertPoint:fromView:",objj_msgSend(_67,"locationInWindow"),nil),_6d=!objj_msgSend(_65,"isVertical")?_6c.x-_trackingStartPoint.x:_6c.y-_trackingStartPoint.y;
objj_msgSend(_65,"setFloatValue:",_trackingFloatValue+_6d/_6b);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_65,sel_getUid("trackKnob:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
if(_68===CPLeftMouseDragged){
objj_msgSend(_65,"sendAction:to:",objj_msgSend(_65,"action"),objj_msgSend(_65,"target"));
}
}
}),new objj_method(sel_getUid("trackScrollButtons:"),function(_6e,_6f,_70){
with(_6e){
var _71=objj_msgSend(_70,"type");
if(_71===CPLeftMouseUp){
objj_msgSend(_6e,"highlight:",NO);
objj_msgSend(CPEvent,"stopPeriodicEvents");
_hitPart=CPScrollerNoPart;
return;
}
if(_71===CPLeftMouseDown){
_trackingPart=objj_msgSend(_6e,"hitPart");
_trackingStartPoint=objj_msgSend(_6e,"convertPoint:fromView:",objj_msgSend(_70,"locationInWindow"),nil);
if(objj_msgSend(_70,"modifierFlags")&CPAlternateKeyMask){
if(_trackingPart==CPScrollerDecrementLine){
_hitPart=CPScrollerDecrementPage;
}else{
if(_trackingPart==CPScrollerIncrementLine){
_hitPart=CPScrollerIncrementPage;
}else{
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _72=objj_msgSend(_6e,"rectForPart:",CPScrollerKnob),_73=!objj_msgSend(_6e,"isVertical")?(_72.size.width):(_72.size.height),_74=objj_msgSend(_6e,"rectForPart:",CPScrollerKnobSlot),_75=(!objj_msgSend(_6e,"isVertical")?(_74.size.width):(_74.size.height))-_73;
objj_msgSend(_6e,"setFloatValue:",((!objj_msgSend(_6e,"isVertical")?_trackingStartPoint.x-(_74.origin.x):_trackingStartPoint.y-(_74.origin.y))-_73/2)/_75);
_hitPart=CPScrollerKnob;
objj_msgSend(_6e,"sendAction:to:",objj_msgSend(_6e,"action"),objj_msgSend(_6e,"target"));
return objj_msgSend(_6e,"trackKnob:",_70);
}
}
}
}
objj_msgSend(_6e,"highlight:",YES);
objj_msgSend(_6e,"sendAction:to:",objj_msgSend(_6e,"action"),objj_msgSend(_6e,"target"));
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0.5,0.04);
}else{
if(_71===CPLeftMouseDragged){
_trackingStartPoint=objj_msgSend(_6e,"convertPoint:fromView:",objj_msgSend(_70,"locationInWindow"),nil);
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _76=objj_msgSend(_6e,"testPart:",objj_msgSend(_70,"locationInWindow"));
if(_76==CPScrollerDecrementPage||_76==CPScrollerIncrementPage){
_trackingPart=_76;
_hitPart=_76;
}
}
objj_msgSend(_6e,"highlight:",CGRectContainsPoint(objj_msgSend(_6e,"rectForPart:",_trackingPart),_trackingStartPoint));
}else{
if(_71==CPPeriodic&&CGRectContainsPoint(objj_msgSend(_6e,"rectForPart:",_trackingPart),_trackingStartPoint)){
objj_msgSend(_6e,"sendAction:to:",objj_msgSend(_6e,"action"),objj_msgSend(_6e,"target"));
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_6e,sel_getUid("trackScrollButtons:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_calculateIsVertical"),function(_77,_78){
with(_77){
var _79=objj_msgSend(_77,"bounds"),_7a=(_79.size.width),_7b=(_79.size.height);
_isVertical=_7a<_7b?1:(_7a>_7b?0:-1);
if(_isVertical===1){
objj_msgSend(_77,"setThemeState:",CPThemeStateVertical);
}else{
if(_isVertical===0){
objj_msgSend(_77,"unsetThemeState:",CPThemeStateVertical);
}
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_7c,_7d,_7e){
with(_7c){
objj_msgSendSuper({receiver:_7c,super_class:objj_getClass("CPScroller").super_class},"setFrameSize:",_7e);
objj_msgSend(_7c,"checkSpaceForParts");
objj_msgSend(_7c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(_7f,_80,_81){
with(_7f){
var _82=_themeState;
if(_2[_hitPart]+"-color"!==_81){
_82&=~CPThemeStateHighlighted;
}
return objj_msgSend(_7f,"valueForThemeAttribute:inState:",_81,_82);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_83,_84,_85){
with(_83){
if(!objj_msgSend(_83,"isEnabled")){
return;
}
_hitPart=objj_msgSend(_83,"testPart:",objj_msgSend(_85,"locationInWindow"));
switch(_hitPart){
case CPScrollerKnob:
return objj_msgSend(_83,"trackKnob:",_85);
case CPScrollerDecrementLine:
case CPScrollerIncrementLine:
case CPScrollerDecrementPage:
case CPScrollerIncrementPage:
return objj_msgSend(_83,"trackScrollButtons:",_85);
}
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_86,_87,_88){
with(_86){
objj_msgSendSuper({receiver:_86,super_class:objj_getClass("CPScroller").super_class},"mouseEntered:",_88);
if(_timerFadeOut){
objj_msgSend(_timerFadeOut,"invalidate");
}
if(!objj_msgSend(_86,"isEnabled")){
return;
}
_allowFadingOut=NO;
_isMouseOver=YES;
if(objj_msgSend(_86,"alphaValue")>0&&_knobProportion!=1){
objj_msgSend(_86,"setThemeState:",CPThemeStateSelected);
}
}
}),new objj_method(sel_getUid("mouseExited:"),function(_89,_8a,_8b){
with(_89){
objj_msgSendSuper({receiver:_89,super_class:objj_getClass("CPScroller").super_class},"mouseExited:",_8b);
if(objj_msgSend(_89,"isHidden")||!objj_msgSend(_89,"isEnabled")||!_isMouseOver){
return;
}
_allowFadingOut=YES;
_isMouseOver=NO;
if(_timerFadeOut){
objj_msgSend(_timerFadeOut,"invalidate");
}
_timerFadeOut=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",1.2,_89,sel_getUid("_performFadeOut:"),nil,NO);
}
}),new objj_method(sel_getUid("animationDidEnd:"),function(_8c,_8d,_8e){
with(_8c){
objj_msgSend(_8c,"unsetThemeState:",CPThemeStateSelected);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("defaultThemeClass"),function(_8f,_90){
with(_8f){
return "scroller";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_91,_92){
with(_91){
return objj_msgSend(CPDictionary,"dictionaryWithJSObject:",{"scroller-width":7,"knob-slot-color":objj_msgSend(CPNull,"null"),"decrement-line-color":objj_msgSend(CPNull,"null"),"increment-line-color":objj_msgSend(CPNull,"null"),"knob-color":objj_msgSend(CPNull,"null"),"decrement-line-size":{width:0,height:0},"increment-line-size":{width:0,height:0},"track-inset":{top:(0),right:(0),bottom:(0),left:(0)},"knob-inset":{top:(0),right:(0),bottom:(0),left:(0)},"minimum-knob-length":21,"track-border-overlay":9});
}
}),new objj_method(sel_getUid("scrollerWidth"),function(_93,_94){
with(_93){
return objj_msgSend(_93,"scrollerWidthInStyle:",CPScrollerStyleLegacy);
}
}),new objj_method(sel_getUid("scrollerWidthInStyle:"),function(_95,_96,_97){
with(_95){
var _98=objj_msgSend(objj_msgSend(_95,"alloc"),"init");
if(_97==CPScrollerStyleLegacy){
return objj_msgSend(_98,"valueForThemeAttribute:inState:","scroller-width",CPThemeStateScrollViewLegacy);
}
return objj_msgSend(_98,"currentValueForThemeAttribute:","scroller-width");
}
}),new objj_method(sel_getUid("scrollerOverlay"),function(_99,_9a){
with(_99){
return objj_msgSend(objj_msgSend(objj_msgSend(_99,"alloc"),"init"),"currentValueForThemeAttribute:","track-border-overlay");
}
}),new objj_method(sel_getUid("scrollerWidthForControlSize:"),function(_9b,_9c,_9d){
with(_9b){
return objj_msgSend(_9b,"scrollerWidth");
}
})]);
var _9e="CPScrollerControlSize",_9f="CPScrollerKnobProportion",_a0="CPScrollerStyleKey";
var _4=objj_getClass("CPScroller");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"CPScroller\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_a1,_a2,_a3){
with(_a1){
if(_a1=objj_msgSendSuper({receiver:_a1,super_class:objj_getClass("CPScroller").super_class},"initWithCoder:",_a3)){
_controlSize=CPRegularControlSize;
if(objj_msgSend(_a3,"containsValueForKey:",_9e)){
_controlSize=objj_msgSend(_a3,"decodeIntForKey:",_9e);
}
_knobProportion=1;
if(objj_msgSend(_a3,"containsValueForKey:",_9f)){
_knobProportion=objj_msgSend(_a3,"decodeFloatForKey:",_9f);
}
_partRects=[];
_hitPart=CPScrollerNoPart;
_allowFadingOut=YES;
_isMouseOver=NO;
var _a4=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_a1,CPViewAnimationFadeOutEffect],[CPViewAnimationTargetKey,CPViewAnimationEffectKey]);
_animationScroller=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithDuration:animationCurve:",0.2,CPAnimationEaseInOut);
objj_msgSend(_animationScroller,"setViewAnimations:",[_a4]);
objj_msgSend(_animationScroller,"setDelegate:",_a1);
objj_msgSend(_a1,"setAlphaValue:",0);
objj_msgSend(_a1,"_calculateIsVertical");
objj_msgSend(_a1,"setStyle:",objj_msgSend(_a3,"decodeIntForKey:",_a0));
}
return _a1;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a5,_a6,_a7){
with(_a5){
objj_msgSendSuper({receiver:_a5,super_class:objj_getClass("CPScroller").super_class},"encodeWithCoder:",_a7);
objj_msgSend(_a7,"encodeInt:forKey:",_controlSize,_9e);
objj_msgSend(_a7,"encodeFloat:forKey:",_knobProportion,_9f);
objj_msgSend(_a7,"encodeInt:forKey:",_style,_a0);
}
})]);
var _4=objj_getClass("CPScroller");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"CPScroller\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("setFloatValue:knobProportion:"),function(_a8,_a9,_aa,_ab){
with(_a8){
objj_msgSend(_a8,"setFloatValue:",_aa);
objj_msgSend(_a8,"setKnobProportion:",_ab);
}
})]);
