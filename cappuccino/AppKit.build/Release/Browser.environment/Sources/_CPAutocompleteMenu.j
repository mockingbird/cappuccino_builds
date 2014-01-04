@STATIC;1.0;I;21;Foundation/CPObject.ji;13;CPTextField.ji;15;_CPMenuWindow.jt;7915;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPTextField.j",YES);
objj_executeFile("_CPMenuWindow.j",YES);
var _1=307;
var _2=objj_allocateClassPair(CPObject,"_CPAutocompleteMenu"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("textField"),new objj_ivar("contentArray"),new objj_ivar("widestItemWidth"),new objj_ivar("_menuWindow"),new objj_ivar("scrollView"),new objj_ivar("tableView"),new objj_ivar("_showCompletionsTimer")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("textField"),function(_4,_5){
with(_4){
return textField;
}
}),new objj_method(sel_getUid("setTextField:"),function(_6,_7,_8){
with(_6){
textField=_8;
}
}),new objj_method(sel_getUid("contentArray"),function(_9,_a){
with(_9){
return contentArray;
}
}),new objj_method(sel_getUid("setContentArray:"),function(_b,_c,_d){
with(_b){
contentArray=_d;
}
}),new objj_method(sel_getUid("initWithTextField:"),function(_e,_f,_10){
with(_e){
if(_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("_CPAutocompleteMenu").super_class},"init")){
textField=_10;
_menuWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,100,100),CPBorderlessWindowMask);
objj_msgSend(_menuWindow,"setLevel:",CPPopUpMenuWindowLevel);
objj_msgSend(_menuWindow,"setHasShadow:",YES);
objj_msgSend(_menuWindow,"setShadowStyle:",CPMenuWindowShadowStyle);
objj_msgSend(_menuWindow,"setAcceptsMouseMovedEvents:",NO);
objj_msgSend(_menuWindow,"setBackgroundColor:",objj_msgSend(_CPMenuWindow,"backgroundColorForBackgroundStyle:",_CPMenuWindowPopUpBackgroundStyle));
var _11=objj_msgSend(_menuWindow,"contentView");
scrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(scrollView,"setAutohidesScrollers:",YES);
objj_msgSend(scrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(_11,"addSubview:",scrollView);
tableView=objj_msgSend(objj_msgSend(_CPNonFirstResponderTableView,"alloc"),"initWithFrame:",CPRectMakeZero());
var _12=objj_msgSend(CPTableColumn,"new");
objj_msgSend(_12,"setResizingMask:",CPTableColumnAutoresizingMask);
objj_msgSend(tableView,"addTableColumn:",_12);
objj_msgSend(tableView,"setDataSource:",_e);
objj_msgSend(tableView,"setDelegate:",_e);
objj_msgSend(tableView,"setAllowsMultipleSelection:",NO);
objj_msgSend(tableView,"setHeaderView:",nil);
objj_msgSend(tableView,"setCornerView:",nil);
objj_msgSend(tableView,"setRowHeight:",24);
objj_msgSend(tableView,"setGridStyleMask:",CPTableViewSolidHorizontalGridLineMask);
objj_msgSend(tableView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(tableView,"setGridColor:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",242/255,243/255,245/255,1));
objj_msgSend(scrollView,"setDocumentView:",tableView);
}
return _e;
}
}),new objj_method(sel_getUid("setContentArray:"),function(_13,_14,_15){
with(_13){
if(contentArray===_15||objj_msgSend(contentArray,"isEqualToArray:",_15)){
return;
}
contentArray=objj_msgSend(_15,"copy");
if(!objj_msgSend(contentArray,"count")){
objj_msgSend(_13,"_hideCompletions");
}
widestItemWidth=CPNotFound;
objj_msgSend(tableView,"reloadData");
objj_msgSend(_13,"layoutSubviews");
}
}),new objj_method(sel_getUid("setIndexOfSelectedItem:"),function(_16,_17,_18){
with(_16){
objj_msgSend(tableView,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_18),NO);
objj_msgSend(tableView,"scrollRowToVisible:",_18);
}
}),new objj_method(sel_getUid("indexOfSelectedItem"),function(_19,_1a){
with(_19){
return objj_msgSend(tableView,"selectedRow");
}
}),new objj_method(sel_getUid("selectedItem"),function(_1b,_1c){
with(_1b){
return contentArray?contentArray[objj_msgSend(tableView,"selectedRow")]:nil;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(textField,"frame"),_20=_1f.origin,_21=objj_msgSend(objj_msgSend(tableView,"tableColumns"),"firstObject");
if(objj_msgSend(textField,"respondsToSelector:",sel_getUid("_completionOrigin:"))){
_20=objj_msgSend(textField,"_completionOrigin:",_1d);
}
if(widestItemWidth===CPNotFound){
var _22=objj_msgSend(_21,"dataView"),_23=objj_msgSend(_22,"valueForThemeAttribute:inState:","font",CPThemeStateTableDataView),_24=objj_msgSend(_22,"valueForThemeAttribute:inState:","font",CPThemeStateTableDataView|CPThemeStateSelectedTableDataView),_25=objj_msgSend(_22,"valueForThemeAttribute:inState:","content-inset",CPThemeStateTableDataView),_26=objj_msgSend(_22,"valueForThemeAttribute:inState:","content-inset",CPThemeStateTableDataView|CPThemeStateSelectedTableDataView);
var _27=contentArray.join("\n");
widestItemWidth=MAX(objj_msgSend(_27,"sizeWithFont:",_23).width+_25.left+_25.right,objj_msgSend(_27,"sizeWithFont:",_24).width+_26.left+_26.right)+objj_msgSend(tableView,"intercellSpacing").width+2+5;
}
var _28=objj_msgSend(textField,"convertPoint:toView:",_20,nil),_29=objj_msgSend((objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(_menuWindow,"platformWindow"):objj_msgSend(_menuWindow,"screen")),"visibleFrame").size,_2a=_29.width-_28.x,_2b=_29.height-_28.y,_2c=MIN(widestItemWidth,_2a),_2d=objj_msgSend(tableView,"intercellSpacing").height,_2e=MIN(MIN(_2d+objj_msgSend(contentArray,"count")*(objj_msgSend(tableView,"rowHeight")+_2d),_1),_2b),_2f=CGRectMake(_28.x,_28.y,_2c,_2e);
_2f=objj_msgSend(_menuWindow,"frameRectForContentRect:",_2f);
objj_msgSend(_menuWindow,"setFrame:",_2f);
var _30=CGRectInset(objj_msgSend(objj_msgSend(_menuWindow,"contentView"),"bounds"),1,1);
objj_msgSend(scrollView,"setFrame:",_30);
objj_msgSend(_21,"setWidth:",objj_msgSend(objj_msgSend(scrollView,"contentView"),"frame").size.width);
}
}),new objj_method(sel_getUid("_showCompletions:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_31,"indexOfSelectedItem");
objj_msgSend(_31,"setContentArray:",objj_msgSend(textField,"_completionsForSubstring:indexOfToken:indexOfSelectedItem:",objj_msgSend(textField,"_inputElement").value,0,_34));
if(!objj_msgSend(contentArray,"count")){
return;
}
objj_msgSend(_31,"setIndexOfSelectedItem:",_34);
objj_msgSend(textField,"setThemeState:",CPThemeStateAutocompleting);
objj_msgSend(_menuWindow,"orderFront:",_31);
objj_msgSend(_31,"layoutSubviews");
}
}),new objj_method(sel_getUid("_delayedShowCompletions"),function(_35,_36){
with(_35){
var _37=0.5;
if(objj_msgSend(textField,"respondsToSelector:",sel_getUid("completionDelay"))){
_37=objj_msgSend(textField,"completionDelay");
}
_showCompletionsTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_37,_35,sel_getUid("_showCompletions:"),nil,NO);
}
}),new objj_method(sel_getUid("_hideCompletions"),function(_38,_39){
with(_38){
objj_msgSend(_showCompletionsTimer,"invalidate");
_showCompletionsTimer=nil;
objj_msgSend(textField,"unsetThemeState:",CPThemeStateAutocompleting);
objj_msgSend(_menuWindow,"orderOut:",_38);
objj_msgSend(_38,"layoutSubviews");
}
}),new objj_method(sel_getUid("selectNext"),function(_3a,_3b){
with(_3a){
var _3c=objj_msgSend(_3a,"indexOfSelectedItem")+1;
if(_3c>=objj_msgSend(contentArray,"count")){
return;
}
objj_msgSend(_3a,"setIndexOfSelectedItem:",_3c);
}
}),new objj_method(sel_getUid("selectPrevious"),function(_3d,_3e){
with(_3d){
var _3f=objj_msgSend(_3d,"indexOfSelectedItem")-1;
if(_3f<0){
return;
}
objj_msgSend(_3d,"setIndexOfSelectedItem:",_3f);
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_40,_41,_42){
with(_40){
return objj_msgSend(contentArray,"count");
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_43,_44,_45,_46,row){
with(_43){
return objj_msgSend(contentArray,"objectAtIndex:",row);
}
})]);
var _2=objj_allocateClassPair(CPTableView,"_CPNonFirstResponderTableView"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("acceptsFirstResponder"),function(_47,_48){
with(_47){
return NO;
}
})]);
