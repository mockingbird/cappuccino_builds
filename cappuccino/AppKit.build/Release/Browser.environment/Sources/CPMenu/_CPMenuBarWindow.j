@STATIC;1.0;i;9;CPPanel.ji;15;_CPMenuWindow.jt;13330;
objj_executeFile("CPPanel.j",YES);
objj_executeFile("_CPMenuWindow.j",YES);
var _1=28,_2=10,_3=10,_4=10;
var _5=nil,_6=nil;
var _7=objj_allocateClassPair(CPPanel,"_CPMenuBarWindow"),_8=_7.isa;
class_addIvars(_7,[new objj_ivar("_menu"),new objj_ivar("_highlightView"),new objj_ivar("_menuItemViews"),new objj_ivar("_trackingMenuItem"),new objj_ivar("_iconImageView"),new objj_ivar("_titleField"),new objj_ivar("_textColor"),new objj_ivar("_titleColor"),new objj_ivar("_textShadowColor"),new objj_ivar("_titleShadowColor"),new objj_ivar("_highlightColor"),new objj_ivar("_highlightTextColor"),new objj_ivar("_highlightTextShadowColor")]);
objj_registerClassPair(_7);
class_addMethods(_7,[new objj_method(sel_getUid("init"),function(_9,_a){
with(_9){
var _b=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds");
_b.size.height=_1;
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("_CPMenuBarWindow").super_class},"initWithContentRect:styleMask:",_b,CPBorderlessWindowMask);
if(_9){
objj_msgSend(_9,"setLevel:",CPMainMenuWindowLevel);
objj_msgSend(_9,"setAutoresizingMask:",CPWindowWidthSizable);
var _c=objj_msgSend(_9,"contentView");
objj_msgSend(_c,"setAutoresizesSubviews:",NO);
objj_msgSend(_9,"setBecomesKeyOnlyIfNeeded:",YES);
_iconImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,16,16));
objj_msgSend(_c,"addSubview:",_iconImageView);
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",objj_msgSend(CPFont,"systemFontSize")+1));
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_c,"addSubview:",_titleField);
}
return _9;
}
}),new objj_method(sel_getUid("setTitle:"),function(_d,_e,_f){
with(_d){
var _10=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPBundleName");
if(!objj_msgSend(_10,"length")){
document.title=_f;
}else{
if(objj_msgSend(_f,"length")){
document.title=_f+" - "+_10;
}else{
document.title=_10;
}
}
objj_msgSend(_titleField,"setStringValue:",_f);
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(_d,"tile");
}
}),new objj_method(sel_getUid("setIconImage:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_iconImageView,"setImage:",_13);
objj_msgSend(_iconImageView,"setHidden:",_13==nil);
objj_msgSend(_11,"tile");
}
}),new objj_method(sel_getUid("setIconImageAlphaValue:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_iconImageView,"setAlphaValue:",_16);
}
}),new objj_method(sel_getUid("setColor:"),function(_17,_18,_19){
with(_17){
if(!_19){
if(!_5){
_5=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPMenuBarWindow,"class")),"pathForResource:","_CPMenuBarWindow/_CPMenuBarWindowBackground.png"),CGSizeMake(1,28)));
}
objj_msgSend(objj_msgSend(_17,"contentView"),"setBackgroundColor:",_5);
}else{
objj_msgSend(objj_msgSend(_17,"contentView"),"setBackgroundColor:",_19);
}
}
}),new objj_method(sel_getUid("setTextColor:"),function(_1a,_1b,_1c){
with(_1a){
if(_textColor==_1c){
return;
}
_textColor=_1c;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextColor:"),_textColor);
}
}),new objj_method(sel_getUid("setTitleColor:"),function(_1d,_1e,_1f){
with(_1d){
if(_titleColor==_1f){
return;
}
_titleColor=_1f;
objj_msgSend(_titleField,"setTextColor:",_1f?_1f:objj_msgSend(CPColor,"blackColor"));
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_20,_21,_22){
with(_20){
if(_textShadowColor==_22){
return;
}
_textShadowColor=_22;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextShadowColor:"),_textShadowColor);
}
}),new objj_method(sel_getUid("setTitleShadowColor:"),function(_23,_24,_25){
with(_23){
if(_titleShadowColor==_25){
return;
}
_titleShadowColor=_25;
objj_msgSend(_titleField,"setTextShadowColor:",_25?_25:objj_msgSend(CPColor,"whiteColor"));
}
}),new objj_method(sel_getUid("setHighlightColor:"),function(_26,_27,_28){
with(_26){
if(_highlightColor==_28){
return;
}
_highlightColor=_28;
}
}),new objj_method(sel_getUid("setHighlightTextColor:"),function(_29,_2a,_2b){
with(_29){
if(_highlightTextColor==_2b){
return;
}
_highlightTextColor=_2b;
}
}),new objj_method(sel_getUid("setHighlightTextShadowColor:"),function(_2c,_2d,_2e){
with(_2c){
if(_highlightTextShadowColor==_2e){
return;
}
_highlightTextShadowColor=_2e;
}
}),new objj_method(sel_getUid("setMenu:"),function(_2f,_30,_31){
with(_2f){
if(_menu==_31){
return;
}
var _32=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_32,"removeObserver:name:object:",_2f,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_32,"removeObserver:name:object:",_2f,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_32,"removeObserver:name:object:",_2f,CPMenuDidRemoveItemNotification,_menu);
var _33=objj_msgSend(_menu,"itemArray"),_34=_33.length;
while(_34--){
objj_msgSend(objj_msgSend(_33[_34],"_menuItemView"),"removeFromSuperview");
}
}
_menu=_31;
if(_menu){
objj_msgSend(_32,"addObserver:selector:name:object:",_2f,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_32,"addObserver:selector:name:object:",_2f,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_32,"addObserver:selector:name:object:",_2f,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
_menuItemViews=[];
var _35=objj_msgSend(_2f,"contentView"),_33=objj_msgSend(_menu,"itemArray"),_34=_33.length;
for(var _36=0;_36<_34;++_36){
var _37=_33[_36],_38=objj_msgSend(_37,"_menuItemView");
_menuItemViews.push(_38);
objj_msgSend(_38,"setTextColor:",_textColor);
objj_msgSend(_38,"setHidden:",objj_msgSend(_37,"isHidden"));
objj_msgSend(_38,"synchronizeWithMenuItem");
objj_msgSend(_35,"addSubview:",_38);
}
objj_msgSend(_2f,"tile");
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(objj_msgSend(_3b,"userInfo"),"objectForKey:","CPMenuItemIndex")),_3d=objj_msgSend(_3c,"_menuItemView");
objj_msgSend(_3d,"setHidden:",objj_msgSend(_3c,"isHidden"));
objj_msgSend(_3d,"synchronizeWithMenuItem");
objj_msgSend(_39,"tile");
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(_3e,_3f,_40){
with(_3e){
var _41=objj_msgSend(objj_msgSend(_40,"userInfo"),"objectForKey:","CPMenuItemIndex"),_42=objj_msgSend(_menu,"itemAtIndex:",_41),_43=objj_msgSend(_42,"_menuItemView");
objj_msgSend(_menuItemViews,"insertObject:atIndex:",_43,_41);
objj_msgSend(_43,"setTextColor:",_textColor);
objj_msgSend(_43,"setHidden:",objj_msgSend(_42,"isHidden"));
objj_msgSend(_43,"synchronizeWithMenuItem");
objj_msgSend(objj_msgSend(_3e,"contentView"),"addSubview:",_43);
objj_msgSend(_3e,"tile");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(_44,_45,_46){
with(_44){
var _47=objj_msgSend(objj_msgSend(_46,"userInfo"),"objectForKey:","CPMenuItemIndex"),_48=objj_msgSend(_menuItemViews,"objectAtIndex:",_47);
objj_msgSend(_menuItemViews,"removeObjectAtIndex:",_47);
objj_msgSend(_48,"removeFromSuperview");
objj_msgSend(_44,"tile");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_49,_4a,_4b){
with(_49){
var _4c=CGRectInset(objj_msgSend(objj_msgSend(_49,"platformWindow"),"visibleFrame"),5,0);
_4c.size.height-=5;
objj_msgSend(objj_msgSend(_CPMenuManager,"sharedMenuManager"),"beginTracking:menuContainer:constraintRect:callback:",_4b,_49,_4c,function(_4d,_4e){
objj_msgSend(_4e,"_performActionOfHighlightedItemChain");
objj_msgSend(_4e,"_highlightItemAtIndex:",CPNotFound);
});
}
}),new objj_method(sel_getUid("font"),function(_4f,_50){
with(_4f){
objj_msgSend(CPFont,"systemFontOfSize:",objj_msgSend(CPFont,"systemFontSize"));
}
}),new objj_method(sel_getUid("tile"),function(_51,_52){
with(_51){
var _53=objj_msgSend(_menu,"itemArray"),_54=0,_55=_53.length,x=_3,y=0,_56=YES;
for(;_54<_55;++_54){
var _57=_53[_54];
if(objj_msgSend(_57,"isSeparatorItem")){
x=CGRectGetWidth(objj_msgSend(_51,"frame"))-_4;
_56=NO;
continue;
}
if(objj_msgSend(_57,"isHidden")){
continue;
}
var _58=objj_msgSend(_57,"_menuItemView"),_59=objj_msgSend(_58,"frame");
if(_56){
objj_msgSend(_58,"setFrame:",CGRectMake(x,0,CGRectGetWidth(_59),_1));
x+=CGRectGetWidth(objj_msgSend(_58,"frame"));
}else{
objj_msgSend(_58,"setFrame:",CGRectMake(x-CGRectGetWidth(_59),0,CGRectGetWidth(_59),_1));
x=CGRectGetMinX(objj_msgSend(_58,"frame"));
}
}
var _5a=objj_msgSend(objj_msgSend(_51,"contentView"),"bounds"),_5b=objj_msgSend(_titleField,"frame");
if(objj_msgSend(_iconImageView,"isHidden")){
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_5a)-CGRectGetWidth(_5b))/2,(CGRectGetHeight(_5a)-CGRectGetHeight(_5b))/2));
}else{
var _5c=objj_msgSend(_iconImageView,"frame"),_5d=CGRectGetWidth(_5c),_5e=_5d+CGRectGetWidth(_5b);
objj_msgSend(_iconImageView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_5a)-_5e)/2,(CGRectGetHeight(_5a)-CGRectGetHeight(_5c))/2));
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_5a)-_5e)/2+_5d,(CGRectGetHeight(_5a)-CGRectGetHeight(_5b))/2));
}
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(_5f,_60,_61,_62,_63){
with(_5f){
var _64=objj_msgSend(_5f,"frame").size;
objj_msgSendSuper({receiver:_5f,super_class:objj_getClass("_CPMenuBarWindow").super_class},"setFrame:display:animate:",_61,_62,_63);
if(!(_64.width==_61.size.width&&_64.height==_61.size.height)){
objj_msgSend(_5f,"tile");
}
}
})]);
class_addMethods(_8,[new objj_method(sel_getUid("initialize"),function(_65,_66){
with(_65){
if(_65!==objj_msgSend(_CPMenuBarWindow,"class")){
return;
}
var _67=objj_msgSend(CPBundle,"bundleForClass:",_65);
_6=objj_msgSend(CPFont,"boldSystemFontOfSize:",objj_msgSend(CPFont,"systemFontSize"));
}
}),new objj_method(sel_getUid("font"),function(_68,_69){
with(_68){
return _6;
}
})]);
var _7=objj_getClass("_CPMenuBarWindow");
if(!_7){
throw new SyntaxError("*** Could not find definition for class \"_CPMenuBarWindow\"");
}
var _8=_7.isa;
class_addMethods(_7,[new objj_method(sel_getUid("isMenuBar"),function(_6a,_6b){
with(_6a){
return YES;
}
}),new objj_method(sel_getUid("globalFrame"),function(_6c,_6d){
with(_6c){
return objj_msgSend(_6c,"frame");
}
}),new objj_method(sel_getUid("scrollingStateForPoint:"),function(_6e,_6f,_70){
with(_6e){
return _CPMenuManagerScrollingStateNone;
}
}),new objj_method(sel_getUid("itemIndexAtPoint:"),function(_71,_72,_73){
with(_71){
var _74=objj_msgSend(_menu,"itemArray"),_75=_74.length;
while(_75--){
var _76=_74[_75];
if(objj_msgSend(_76,"isHidden")||objj_msgSend(_76,"isSeparatorItem")){
continue;
}
if(CGRectContainsPoint(objj_msgSend(_71,"rectForItemAtIndex:",_75),_73)){
return _75;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(_77,_78,_79){
with(_77){
var _7a=objj_msgSend(_menu,"itemAtIndex:",_79===CPNotFound?0:_79);
return objj_msgSend(objj_msgSend(_7a,"_menuItemView"),"frame");
}
})]);
var _7=objj_allocateClassPair(_CPMenuView,"_CPMenuBarView"),_8=_7.isa;
objj_registerClassPair(_7);
class_addMethods(_7,[new objj_method(sel_getUid("rectForItemAtIndex:"),function(_7b,_7c,_7d){
with(_7b){
return objj_msgSend(_menuItemViews[_7d===CPNotFound?0:_7d],"frame");
}
}),new objj_method(sel_getUid("itemIndexAtPoint:"),function(_7e,_7f,_80){
with(_7e){
var _81=objj_msgSend(_7e,"bounds");
if(!CGRectContainsPoint(_81,_80)){
return CPNotFound;
}
var x=_80.x,low=0,_82=_visibleMenuItemInfos.length-1;
while(low<=_82){
var _83=FLOOR(low+(_82-low)/2),_84=_visibleMenuItemInfos[_83],_85=objj_msgSend(_84.view,"frame");
if(x<CGRectGetMinX(_85)){
_82=_83-1;
}else{
if(x>CGRectGetMaxX(_85)){
low=_83+1;
}else{
return _84.index;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("tile"),function(_86,_87){
with(_86){
var _88=objj_msgSend(_menu,"itemArray"),_89=0,_8a=_88.length,x=_3,y=0,_8b=YES;
for(;_89<_8a;++_89){
var _8c=_88[_89];
if(objj_msgSend(_8c,"isSeparatorItem")){
x=CGRectGetWidth(objj_msgSend(_86,"frame"))-_4;
_8b=NO;
continue;
}
if(objj_msgSend(_8c,"isHidden")){
continue;
}
var _8d=objj_msgSend(_8c,"_menuItemView"),_8e=objj_msgSend(_8d,"frame");
if(_8b){
objj_msgSend(_8d,"setFrameOrigin:",CGPointMake(x,(_1-1-CGRectGetHeight(_8e))/2));
x+=CGRectGetWidth(objj_msgSend(_8d,"frame"))+_2;
}else{
objj_msgSend(_8d,"setFrameOrigin:",CGPointMake(x-CGRectGetWidth(_8e),(_1-1-CGRectGetHeight(_8e))/2));
x=CGRectGetMinX(objj_msgSend(_8d,"frame"))-_2;
}
}
var _8f=objj_msgSend(objj_msgSend(_86,"contentView"),"bounds"),_90=objj_msgSend(_titleField,"frame");
if(objj_msgSend(_iconImageView,"isHidden")){
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_8f)-CGRectGetWidth(_90))/2,(CGRectGetHeight(_8f)-CGRectGetHeight(_90))/2));
}else{
var _91=objj_msgSend(_iconImageView,"frame"),_92=CGRectGetWidth(_91),_93=_92+CGRectGetWidth(_90);
objj_msgSend(_iconImageView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_8f)-_93)/2,(CGRectGetHeight(_8f)-CGRectGetHeight(_91))/2));
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_8f)-_93)/2+_92,(CGRectGetHeight(_8f)-CGRectGetHeight(_90))/2));
}
}
})]);
