@STATIC;1.0;i;13;CPTableView.ji;24;_CPPopUpListDataSource.jt;17949;
objj_executeFile("CPTableView.j",YES);
objj_executeFile("_CPPopUpListDataSource.j",YES);
_CPPopUpListWillPopUpNotification="_CPPopUpListWillPopUpNotification";
_CPPopUpListWillDismissNotification="_CPPopUpListWillDismissNotification";
_CPPopUpListDidDismissNotification="_CPPopUpListDidDismissNotification";
_CPPopUpListItemWasClickedNotification="_CPPopUpListItemWasClickedNotification";
var _1=3;
var _2="1";
var _3=objj_allocateClassPair(CPObject,"_CPPopUpList"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_dataSource"),new objj_ivar("_itemWasClicked"),new objj_ivar("_listWasClicked"),new objj_ivar("_listWidth"),new objj_ivar("_panel"),new objj_ivar("_scrollView"),new objj_ivar("_tableView"),new objj_ivar("_tableColumn")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithDataSource:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("_CPPopUpList").super_class},"init");
if(_5){
objj_msgSend(_5,"setDataSource:",_7);
_itemWasClicked=NO;
_listWasClicked=NO;
_listWidth=0;
_tableView=objj_msgSend(_5,"makeTableView");
var _8=CGRectMake(0,0,200,200);
_tableColumn=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:",_2);
objj_msgSend(_tableColumn,"setWidth:",CGRectGetWidth(_8)-objj_msgSend(CPScroller,"scrollerWidth"));
objj_msgSend(_tableColumn,"setResizingMask:",CPTableColumnAutoresizingMask);
objj_msgSend(_tableView,"addTableColumn:",_tableColumn);
_scrollView=objj_msgSend(_5,"makeScrollViewWithFrame:",CGRectMake(0,0,CGRectGetWidth(_8),CGRectGetHeight(_8)));
objj_msgSend(_scrollView,"setDocumentView:",_tableView);
objj_msgSend(_tableView,"setHeaderView:",nil);
_panel=objj_msgSend(_5,"makeListPanelWithFrame:",_8);
objj_msgSend(objj_msgSend(_panel,"contentView"),"addSubview:",_scrollView);
objj_msgSend(_panel,"setInitialFirstResponder:",_tableView);
if(objj_msgSend(_dataSource,"numberOfItemsInList:",_5)>0){
objj_msgSend(_tableView,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",0),NO);
}else{
objj_msgSend(_tableView,"setEnabled:",NO);
}
objj_msgSend(_scrollView,"scrollToBeginningOfDocument:",nil);
}
return _5;
}
}),new objj_method(sel_getUid("makeListPanelWithFrame:"),function(_9,_a,_b){
with(_9){
var _c=objj_msgSend(objj_msgSend(_CPPopUpPanel,"alloc"),"initWithContentRect:styleMask:",_b,CPBorderlessWindowMask);
objj_msgSend(_c,"setTitle:","");
objj_msgSend(_c,"setFloatingPanel:",YES);
objj_msgSend(_c,"setBecomesKeyOnlyIfNeeded:",YES);
objj_msgSend(_c,"setLevel:",CPPopUpMenuWindowLevel);
objj_msgSend(_c,"setHasShadow:",YES);
objj_msgSend(_c,"setShadowStyle:",CPMenuWindowShadowStyle);
objj_msgSend(_c,"setDelegate:",_9);
return _c;
}
}),new objj_method(sel_getUid("makeTableView"),function(_d,_e){
with(_d){
objj_msgSend(_d,"removeTableViewObservers");
var _f=objj_msgSend(objj_msgSend(_CPPopUpTableView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_f,"setDelegate:",_d);
objj_msgSend(_f,"setDataSource:",_d);
objj_msgSend(_f,"setColumnAutoresizingStyle:",CPTableViewLastColumnOnlyAutoresizingStyle);
objj_msgSend(_f,"setUsesAlternatingRowBackgroundColors:",NO);
objj_msgSend(_f,"setAllowsMultipleSelection:",NO);
objj_msgSend(_f,"setIntercellSpacing:",CGSizeMake(3,2));
objj_msgSend(_f,"setTarget:",_d);
objj_msgSend(_f,"setDoubleAction:",sel_getUid("tableViewClickAction:"));
objj_msgSend(_f,"setAction:",sel_getUid("tableViewClickAction:"));
objj_msgSend(_f,"setRowHeight:",objj_msgSend(_d,"rowHeightForTableView:",_f));
return _f;
}
}),new objj_method(sel_getUid("removeTableViewObservers"),function(_10,_11){
with(_10){
if(_tableView){
var _12=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_12,"removeObserver:name:object:",_10,CPTableViewSelectionIsChangingNotification,_tableView);
objj_msgSend(_12,"removeObserver:name:object:",_10,CPTableViewSelectionDidChangeNotification,_tableView);
}
}
}),new objj_method(sel_getUid("makeScrollViewWithFrame:"),function(_13,_14,_15){
with(_13){
var _16=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",_15);
objj_msgSend(_16,"setBorderType:",CPLineBorder);
objj_msgSend(_16,"setAutohidesScrollers:",NO);
objj_msgSend(_16,"setHasVerticalScroller:",YES);
objj_msgSend(_16,"setHasHorizontalScroller:",NO);
objj_msgSend(_16,"setLineScroll:",objj_msgSend(_tableView,"rowHeight"));
objj_msgSend(_16,"setVerticalPageScroll:",0);
return _16;
}
}),new objj_method(sel_getUid("popUpRelativeToRect:view:offset:"),function(_17,_18,_19,_1a,_1b){
with(_17){
if(objj_msgSend(_panel,"isVisible")){
return;
}
var _1c=objj_msgSend(_tableView,"rectOfRow:",objj_msgSend(_17,"numberOfRowsInTableView:",_tableView)-1),_1d=CGRectMake(0,0,MAX(_listWidth,CGRectGetWidth(_19)),CGRectGetMaxY(_1c));
_1d=objj_msgSend(_17,"constrain:relativeToRect:view:offset:",_1d,_19,_1a,_1b);
objj_msgSend(_panel,"setFrame:",_1d);
objj_msgSend(_scrollView,"setFrameSize:",CGSizeMakeCopy(_1d.size));
objj_msgSend(_tableView,"setEnabled:",objj_msgSend(_dataSource,"numberOfItemsInList:",_17)>0);
objj_msgSend(_17,"scrollItemAtIndexToTop:",objj_msgSend(_tableView,"selectedRow"));
objj_msgSend(_17,"listWillPopUp");
objj_msgSend(_panel,"orderFront:",nil);
}
}),new objj_method(sel_getUid("listWidth"),function(_1e,_1f){
with(_1e){
return _listWidth;
}
}),new objj_method(sel_getUid("setListWidth:"),function(_20,_21,_22){
with(_20){
_listWidth=_22;
}
}),new objj_method(sel_getUid("setFont:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_tableColumn,"dataView"),_27=objj_msgSend(CPTextField,"new");
objj_msgSend(_27,"setFont:",_25);
objj_msgSend(_27,"setAlignment:",objj_msgSend(_26,"alignment"));
objj_msgSend(_tableColumn,"setDataView:",_27);
objj_msgSend(_tableView,"reloadData");
}
}),new objj_method(sel_getUid("setAlignment:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(_tableColumn,"dataView"),_2c=objj_msgSend(CPTextField,"new");
objj_msgSend(_2c,"setAlignment:",_2a);
objj_msgSend(_2c,"setFont:",objj_msgSend(_2b,"font"));
objj_msgSend(_tableColumn,"setDataView:",_2c);
objj_msgSend(_tableView,"reloadData");
}
}),new objj_method(sel_getUid("isVisible"),function(_2d,_2e){
with(_2d){
return objj_msgSend(_panel,"isVisible");
}
}),new objj_method(sel_getUid("rowHeightForTableView:"),function(_2f,_30,_31){
with(_2f){
return objj_msgSend(_31,"rowHeight");
}
}),new objj_method(sel_getUid("tableView"),function(_32,_33){
with(_32){
return _tableView;
}
}),new objj_method(sel_getUid("tableColumn"),function(_34,_35){
with(_34){
return _tableColumn;
}
}),new objj_method(sel_getUid("scrollView"),function(_36,_37){
with(_36){
return _scrollView;
}
}),new objj_method(sel_getUid("panel"),function(_38,_39){
with(_38){
return _panel;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_3a,_3b,_3c){
with(_3a){
if(_dataSource===_3c){
return;
}
if(!objj_msgSend(_CPPopUpListDataSource,"protocolIsImplementedByObject:",_3c)){
CPLog.warn("Illegal %s data source (%s). Must implement the methods in _CPPopUpListDataSource.",objj_msgSend(_3a,"className"),objj_msgSend(_3c,"description"));
}else{
_dataSource=_3c;
}
}
}),new objj_method(sel_getUid("dataSource"),function(_3d,_3e){
with(_3d){
return _dataSource;
}
}),new objj_method(sel_getUid("selectNextItem"),function(_3f,_40){
with(_3f){
if(!objj_msgSend(_tableView,"isEnabled")){
return NO;
}
var row=objj_msgSend(_tableView,"selectedRow");
if(row<(objj_msgSend(_dataSource,"numberOfItemsInList:",_3f)-1)){
return objj_msgSend(_3f,"selectRow:",++row);
}else{
return NO;
}
}
}),new objj_method(sel_getUid("selectPreviousItem"),function(_41,_42){
with(_41){
if(!objj_msgSend(_tableView,"isEnabled")){
return NO;
}
var row=objj_msgSend(_tableView,"selectedRow");
if(row>0){
return objj_msgSend(_41,"selectRow:",--row);
}else{
return NO;
}
}
}),new objj_method(sel_getUid("selectedObjectValue"),function(_43,_44){
with(_43){
var row=objj_msgSend(_tableView,"selectedRow");
return (row>=0)?objj_msgSend(_dataSource,"list:objectValueForItemAtIndex:",_43,row):nil;
}
}),new objj_method(sel_getUid("selectedStringValue"),function(_45,_46){
with(_45){
var _47=objj_msgSend(_45,"selectedObjectValue");
return _47!==nil?objj_msgSend(_dataSource,"list:stringValueForObjectValue:",_45,_47):nil;
}
}),new objj_method(sel_getUid("selectedRow"),function(_48,_49){
with(_48){
return objj_msgSend(_tableView,"selectedRow");
}
}),new objj_method(sel_getUid("selectRow:"),function(_4a,_4b,row){
with(_4a){
if(row===objj_msgSend(_tableView,"selectedRow")){
return NO;
}
var _4c=(row>=0&&row<objj_msgSend(_4a,"numberOfRowsInTableView:",_tableView)),_4d=_4c?objj_msgSend(CPIndexSet,"indexSetWithIndex:",row):objj_msgSend(CPIndexSet,"indexSet");
objj_msgSend(_tableView,"selectRowIndexes:byExtendingSelection:",_4d,NO);
if(_4c){
objj_msgSend(_tableView,"scrollRowToVisible:",row);
return YES;
}else{
return NO;
}
}
}),new objj_method(sel_getUid("scrollPageDown"),function(_4e,_4f){
with(_4e){
objj_msgSend(_scrollView,"scrollPageDown:",nil);
}
}),new objj_method(sel_getUid("scrollPageUp"),function(_50,_51){
with(_50){
objj_msgSend(_scrollView,"scrollPageUp:",nil);
}
}),new objj_method(sel_getUid("scrollToTop"),function(_52,_53){
with(_52){
objj_msgSend(_scrollView,"scrollToBeginningOfDocument:",nil);
}
}),new objj_method(sel_getUid("scrollToBottom"),function(_54,_55){
with(_54){
objj_msgSend(_scrollView,"scrollToEndOfDocument:",nil);
}
}),new objj_method(sel_getUid("scrollItemAtIndexToTop:"),function(_56,_57,row){
with(_56){
var _58=objj_msgSend(_tableView,"rectOfRow:",row);
objj_msgSend(objj_msgSend(_tableView,"superview"),"scrollToPoint:",_58.origin);
}
}),new objj_method(sel_getUid("close"),function(_59,_5a){
with(_59){
if(!objj_msgSend(_panel,"isVisible")){
return;
}
if(objj_msgSend(_59,"listWasClicked")){
objj_msgSend(_59,"setListWasClicked:",NO);
if(objj_msgSend(_59,"itemWasClicked")){
objj_msgSend(_59,"setItemWasClicked:",NO);
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.1,_59,sel_getUid("closeListAfterItemClick"),nil,NO);
return;
}
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_CPPopUpListWillDismissNotification,_59);
objj_msgSend(_panel,"close");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_CPPopUpListDidDismissNotification,_59);
}
}),new objj_method(sel_getUid("closeListAfterItemClick"),function(_5b,_5c){
with(_5b){
objj_msgSend(_5b,"close");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_CPPopUpListItemWasClickedNotification,_5b);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_5d,_5e,_5f){
with(_5d){
var key=objj_msgSend(_5f,"charactersIgnoringModifiers");
switch(key){
case CPDownArrowFunctionKey:
if(objj_msgSend(_5d,"isVisible")){
objj_msgSend(_5d,"selectNextItem");
return YES;
}
break;
case CPUpArrowFunctionKey:
if(objj_msgSend(_5d,"isVisible")){
objj_msgSend(_5d,"selectPreviousItem");
return YES;
}
break;
case CPEscapeFunctionKey:
if(objj_msgSend(_5d,"isVisible")){
objj_msgSend(_5d,"close");
return YES;
}
break;
case CPPageUpFunctionKey:
if(objj_msgSend(_5d,"isVisible")){
objj_msgSend(_5d,"scrollPageUp");
return YES;
}
break;
case CPPageDownFunctionKey:
if(objj_msgSend(_5d,"isVisible")){
objj_msgSend(_5d,"scrollPageDown");
return YES;
}
break;
case CPHomeFunctionKey:
if(objj_msgSend(_5d,"isVisible")){
objj_msgSend(_5d,"scrollToTop");
return YES;
}
break;
case CPEndFunctionKey:
if(objj_msgSend(_5d,"isVisible")){
objj_msgSend(_5d,"scrollToBottom");
return YES;
}
break;
case CPCarriageReturnCharacter:
if(objj_msgSend(_5d,"isVisible")){
objj_msgSend(_5d,"closeListAfterItemClick");
return YES;
}
break;
}
return NO;
}
}),new objj_method(sel_getUid("itemWasClicked"),function(_60,_61){
with(_60){
return _itemWasClicked&&(objj_msgSend(_dataSource,"numberOfItemsInList:",_60)>0);
}
}),new objj_method(sel_getUid("setItemWasClicked:"),function(_62,_63,_64){
with(_62){
_itemWasClicked=(objj_msgSend(_dataSource,"numberOfItemsInList:",_62)>0)&&_64;
}
}),new objj_method(sel_getUid("listWasClicked"),function(_65,_66){
with(_65){
return _listWasClicked&&(objj_msgSend(_dataSource,"numberOfItemsInList:",_65)>0);
}
}),new objj_method(sel_getUid("setListWasClicked:"),function(_67,_68,_69){
with(_67){
_listWasClicked=(objj_msgSend(_dataSource,"numberOfItemsInList:",_67)>0)&&_69;
}
}),new objj_method(sel_getUid("controllingViewShouldResign"),function(_6a,_6b){
with(_6a){
if(objj_msgSend(_6a,"listWasClicked")){
if(objj_msgSend(_6a,"listWasClicked")&&!objj_msgSend(_6a,"itemWasClicked")){
objj_msgSend(_6a,"setListWasClicked:",NO);
}
return NO;
}else{
return YES;
}
}
}),new objj_method(sel_getUid("listWillPopUp"),function(_6c,_6d){
with(_6c){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_CPPopUpListWillPopUpNotification,_6c);
}
}),new objj_method(sel_getUid("constrain:relativeToRect:view:offset:"),function(_6e,_6f,_70,_71,_72,_73){
with(_6e){
var _74=objj_msgSend(_72,"convertPointToBase:",_71.origin),_75=objj_msgSend(objj_msgSend(_72,"window"),"convertBaseToPlatformWindow:",_74),_76=objj_msgSend(_6e,"rowHeightForTableView:",_tableView)+objj_msgSend(_tableView,"intercellSpacing").height,_77=MIN(objj_msgSend(_6e,"numberOfRowsInTableView:",_tableView),objj_msgSend(_dataSource,"numberOfVisibleItemsInList:",_6e)),_78=CGRectMake(_75.x,_75.y+CGRectGetHeight(_71)+_73,MAX(_listWidth,CGRectGetWidth(_70)),(_76*_77)+2),_79=CGRectMakeCopy(_78),_7a=CGRectGetMaxY(_79),_7b=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame"),_7c=CGRectGetMaxY(_7b),_7d=_77;
while(_7a>_7c&&_7d>=_1){
_7a-=_76;
_79.size.height-=_76;
--_7d;
}
if(_7a>=_7c||_7d<_1){
var _7e=CGRectMakeCopy(_78);
_7e.origin.y=_75.y-_73-CGRectGetHeight(_7e);
var _7f=CGRectGetMinY(_7b),_80=_77;
while(_7e.origin.y<=_7f&&_80>=_1){
_7e.origin.y+=_76;
_7e.size.height-=_76;
--_80;
}
if((_7e.origin.y>_7f&&_80>=_1)||_80>_7d){
_78=_7e;
}else{
_78=_79;
}
}else{
_78=_79;
}
return _78;
}
}),new objj_method(sel_getUid("tableViewClickAction:"),function(_81,_82,_83){
with(_81){
objj_msgSend(_81,"close");
}
})]);
var _84="_CPPopUpListDataSourceKey",_85="_CPPopUpListListWidthKey",_86="_CPPopUpListListPanelKey",_87="_CPPopUpListScrollViewKey",_88="_CPPopUpListTableViewKey";
var _3=objj_getClass("_CPPopUpList");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"_CPPopUpList\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_89,_8a,_8b){
with(_89){
_89=objj_msgSendSuper({receiver:_89,super_class:objj_getClass("_CPPopUpList").super_class},"initWithCoder:",_8b);
if(_89){
_listWasClicked=NO;
_itemWasClicked=NO;
_dataSource=objj_msgSend(_8b,"decodeObjectForKey:",_84);
_listWidth=objj_msgSend(_8b,"decodeIntForKey:",_85);
_panel=objj_msgSend(_8b,"decodeObjectForKey:",_86);
_scrollView=objj_msgSend(_8b,"decodeObjectForKey:",_87);
_tableView=objj_msgSend(_8b,"decodeObjectForKey:",_88);
_tableColumn=objj_msgSend(_tableView,"tableColumnWithIdentifier:",_2);
objj_msgSend(_scrollView,"setDocumentView:",_tableView);
}
return _89;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_8c,_8d,_8e){
with(_8c){
objj_msgSendSuper({receiver:_8c,super_class:objj_getClass("_CPPopUpList").super_class},"encodeWithCoder:",_8e);
objj_msgSend(_8e,"encodeObject:forKey:",_dataSource,_84);
objj_msgSend(_8e,"encodeObject:forKey:",_listWidth,_85);
objj_msgSend(_8e,"encodeObject:forKey:",_panel,_86);
objj_msgSend(_8e,"encodeObject:forKey:",_scrollView,_87);
objj_msgSend(_8e,"encodeObject:forKey:",_tableView,_88);
}
})]);
var _3=objj_getClass("_CPPopUpList");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"_CPPopUpList\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_8f,_90,_91){
with(_8f){
return MAX(objj_msgSend(_dataSource,"numberOfItemsInList:",_8f),1);
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_92,_93,_94,_95,_96){
with(_92){
return objj_msgSend(_dataSource,"list:displayValueForObjectValue:",_92,objj_msgSend(_dataSource,"list:objectValueForItemAtIndex:",_92,_96));
}
})]);
var _3=objj_allocateClassPair(CPTableView,"_CPPopUpTableView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_acceptFirstResponder")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_97,_98,_99){
with(_97){
if(_97=objj_msgSendSuper({receiver:_97,super_class:objj_getClass("_CPPopUpTableView").super_class},"initWithFrame:",_99)){
_acceptFirstResponder=NO;
}
return _97;
}
}),new objj_method(sel_getUid("trackMouse:"),function(_9a,_9b,_9c){
with(_9a){
if(!objj_msgSend(_9a,"isEnabled")){
return;
}
objj_msgSend(objj_msgSend(_9a,"delegate"),"setItemWasClicked:",YES);
_acceptFirstResponder=YES;
objj_msgSend(objj_msgSend(_9a,"window"),"makeFirstResponder:",_9a);
objj_msgSendSuper({receiver:_9a,super_class:objj_getClass("_CPPopUpTableView").super_class},"trackMouse:",_9c);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_9d,_9e,_9f,_a0,_a1){
with(_9d){
_acceptFirstResponder=NO;
objj_msgSendSuper({receiver:_9d,super_class:objj_getClass("_CPPopUpTableView").super_class},"stopTracking:at:mouseIsUp:",_9f,_a0,_a1);
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_a2,_a3){
with(_a2){
return _acceptFirstResponder;
}
}),new objj_method(sel_getUid("listColumn"),function(_a4,_a5){
with(_a4){
return _tableColumn;
}
})]);
var _3=objj_allocateClassPair(CPPanel,"_CPPopUpPanel"),_4=_3.isa;
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("sendEvent:"),function(_a6,_a7,_a8){
with(_a6){
var _a9=objj_msgSend(_a8,"type");
if(_a9===CPLeftMouseDown||_a9===CPRightMouseDown){
objj_msgSend(objj_msgSend(_a6,"delegate"),"setListWasClicked:",YES);
}
return objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("_CPPopUpPanel").super_class},"sendEvent:",_a8);
}
})]);
