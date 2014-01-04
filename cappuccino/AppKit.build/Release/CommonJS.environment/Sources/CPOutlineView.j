@STATIC;1.0;i;15;CPTableColumn.ji;13;CPTableView.jt;48304;
objj_executeFile("CPTableColumn.j",YES);
objj_executeFile("CPTableView.j",YES);
CPOutlineViewColumnDidMoveNotification="CPOutlineViewColumnDidMoveNotification";
CPOutlineViewColumnDidResizeNotification="CPOutlineViewColumnDidResizeNotification";
CPOutlineViewItemDidCollapseNotification="CPOutlineViewItemDidCollapseNotification";
CPOutlineViewItemDidExpandNotification="CPOutlineViewItemDidExpandNotification";
CPOutlineViewItemWillCollapseNotification="CPOutlineViewItemWillCollapseNotification";
CPOutlineViewItemWillExpandNotification="CPOutlineViewItemWillExpandNotification";
CPOutlineViewSelectionDidChangeNotification="CPOutlineViewSelectionDidChangeNotification";
CPOutlineViewSelectionIsChangingNotification="CPOutlineViewSelectionIsChangingNotification";
var _1=1<<1,_2=1<<2,_3=1<<3,_4=1<<4,_5=1<<5,_6=1<<6,_7=1<<7,_8=1<<8,_9=1<<9,_a=1<<10;
var _b=1<<1,_c=1<<2,_d=1<<3,_e=1<<4,_f=1<<5,_10=1<<6,_11=1<<7,_12=1<<8,_13=1<<9,_14=1<<10,_15=1<<11,_16=1<<12,_17=1<<13,_18=1<<14,_19=1<<15,_1a=1<<16,_1b=1<<17,_1c=1<<18,_1d=1<<19,_1e=1<<20,_1f=1<<21,_20=1<<22,_21=1<<23,_22=1<<24,_23=1<<25;
CPOutlineViewDropOnItemIndex=-1;
var _24=0,_25=1,_26=2;
var _27=objj_allocateClassPair(CPTableView,"CPOutlineView"),_28=_27.isa;
class_addIvars(_27,[new objj_ivar("_outlineViewDataSource"),new objj_ivar("_outlineViewDelegate"),new objj_ivar("_outlineTableColumn"),new objj_ivar("_indentationPerLevel"),new objj_ivar("_indentationMarkerFollowsDataView"),new objj_ivar("_implementedOutlineViewDataSourceMethods"),new objj_ivar("_implementedOutlineViewDelegateMethods"),new objj_ivar("_rootItemInfo"),new objj_ivar("_itemsForRows"),new objj_ivar("_itemInfosForItems"),new objj_ivar("_disclosureControlPrototype"),new objj_ivar("_disclosureControlsForRows"),new objj_ivar("_disclosureControlData"),new objj_ivar("_disclosureControlQueue"),new objj_ivar("_shouldRetargetItem"),new objj_ivar("_retargetedItem"),new objj_ivar("_shouldRetargetChildIndex"),new objj_ivar("_retargedChildIndex"),new objj_ivar("_dragHoverTimer"),new objj_ivar("_dropItem"),new objj_ivar("_coalesceSelectionNotificationState")]);
objj_registerClassPair(_27);
class_addMethods(_27,[new objj_method(sel_getUid("initWithFrame:"),function(_29,_2a,_2b){
with(_29){
_29=objj_msgSendSuper({receiver:_29,super_class:objj_getClass("CPOutlineView").super_class},"initWithFrame:",_2b);
if(_29){
_selectionHighlightStyle=CPTableViewSelectionHighlightStyleSourceList;
_rootItemInfo={isExpanded:YES,isExpandable:NO,shouldShowOutlineDisclosureControl:NO,level:-1,row:-1,children:[],weight:0};
_itemsForRows=[];
_itemInfosForItems={};
_disclosureControlsForRows=[];
_retargetedItem=nil;
_shouldRetargetItem=NO;
_retargedChildIndex=nil;
_shouldRetargetChildIndex=NO;
objj_msgSend(_29,"setIndentationPerLevel:",16);
objj_msgSend(_29,"setIndentationMarkerFollowsDataView:",YES);
objj_msgSendSuper({receiver:_29,super_class:objj_getClass("CPOutlineView").super_class},"setDataSource:",objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDataSource,"alloc"),"initWithOutlineView:",_29));
objj_msgSendSuper({receiver:_29,super_class:objj_getClass("CPOutlineView").super_class},"setDelegate:",objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDelegate,"alloc"),"initWithOutlineView:",_29));
objj_msgSend(_29,"setDisclosureControlPrototype:",objj_msgSend(objj_msgSend(CPDisclosureButton,"alloc"),"initWithFrame:",CGRectMake(0,0,10,10)));
}
return _29;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_2c,_2d,_2e){
with(_2c){
if(_outlineViewDataSource===_2e){
return;
}
if(!objj_msgSend(_2e,"respondsToSelector:",sel_getUid("outlineView:child:ofItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:child:ofItem:'");
}
if(!objj_msgSend(_2e,"respondsToSelector:",sel_getUid("outlineView:isItemExpandable:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:isItemExpandable:'");
}
if(!objj_msgSend(_2e,"respondsToSelector:",sel_getUid("outlineView:numberOfChildrenOfItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:numberOfChildrenOfItem:'");
}
if(!objj_msgSend(_2e,"respondsToSelector:",sel_getUid("outlineView:objectValueForTableColumn:byItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:objectValueForTableColumn:byItem:'");
}
_outlineViewDataSource=_2e;
_implementedOutlineViewDataSourceMethods=0;
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:setObjectValue:forTableColumn:byItem:"))){
_implementedOutlineViewDataSourceMethods|=_1;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:shouldDeferDisplayingChildrenOfItem:"))){
_implementedOutlineViewDataSourceMethods|=_2;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:acceptDrop:item:childIndex:"))){
_implementedOutlineViewDataSourceMethods|=_3;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:validateDrop:proposedItem:proposedChildIndex:"))){
_implementedOutlineViewDataSourceMethods|=_4;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedOutlineViewDataSourceMethods|=_5;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:namesOfPromisedFilesDroppedAtDestination:forDraggedItems:"))){
_implementedOutlineViewDataSourceMethods|=_6;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:itemForPersistentObject:"))){
_implementedOutlineViewDataSourceMethods|=_7;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:persistentObjectForItem:"))){
_implementedOutlineViewDataSourceMethods|=_8;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:writeItems:toPasteboard:"))){
_implementedOutlineViewDataSourceMethods|=_9;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:sortDescriptorsDidChange:"))){
_implementedOutlineViewDataSourceMethods|=_a;
}
objj_msgSend(_2c,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_2f,_30){
with(_2f){
return _outlineViewDataSource;
}
}),new objj_method(sel_getUid("isExpandable:"),function(_31,_32,_33){
with(_31){
if(!_33){
return YES;
}
var _34=_itemInfosForItems[objj_msgSend(_33,"UID")];
if(!_34){
return NO;
}
return _34.isExpandable;
}
}),new objj_method(sel_getUid("_shouldShowOutlineDisclosureControlForItem:"),function(_35,_36,_37){
with(_35){
if(!_37){
return YES;
}
var _38=_itemInfosForItems[objj_msgSend(_37,"UID")];
if(!_38){
return YES;
}
return _38.shouldShowOutlineDisclosureControl;
}
}),new objj_method(sel_getUid("isItemExpanded:"),function(_39,_3a,_3b){
with(_39){
if(!_3b){
return YES;
}
var _3c=_itemInfosForItems[objj_msgSend(_3b,"UID")];
if(!_3c){
return NO;
}
return _3c.isExpanded;
}
}),new objj_method(sel_getUid("expandItem:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSend(_3d,"expandItem:expandChildren:",_3f,NO);
}
}),new objj_method(sel_getUid("expandItem:expandChildren:"),function(_40,_41,_42,_43){
with(_40){
var _44=null;
if(!_42){
_44=_rootItemInfo;
}else{
_44=_itemInfosForItems[objj_msgSend(_42,"UID")];
}
if(!_44){
return;
}
var _45=NO;
if(!_coalesceSelectionNotificationState){
_45=YES;
_coalesceSelectionNotificationState=_25;
}
if(!_44.isExpanded){
objj_msgSend(_40,"_noteItemWillExpand:",_42);
var _46=objj_msgSend(_40,"numberOfRows");
_44.isExpanded=YES;
objj_msgSend(_40,"reloadItem:reloadChildren:",_42,YES);
objj_msgSend(_40,"_noteItemDidExpand:",_42);
var _47=objj_msgSend(_40,"numberOfRows")-_46;
if(_47){
var _48=objj_msgSend(_40,"selectedRowIndexes"),_49=objj_msgSend(_40,"rowForItem:",_42)+1;
if(objj_msgSend(_48,"intersectsIndexesInRange:",CPMakeRange(_49,_itemsForRows.length))){
objj_msgSend(_40,"_noteSelectionIsChanging");
objj_msgSend(_48,"shiftIndexesStartingAtIndex:by:",_49,_47);
objj_msgSend(_40,"_setSelectedRowIndexes:",_48);
}
}
}
if(_43){
var _4a=_44.children,_4b=_4a.length;
while(_4b--){
objj_msgSend(_40,"expandItem:expandChildren:",_4a[_4b],YES);
}
}
if(_45){
var r=_coalesceSelectionNotificationState;
_coalesceSelectionNotificationState=_24;
if(r===_26){
objj_msgSend(_40,"_noteSelectionDidChange");
}
}
}
}),new objj_method(sel_getUid("collapseItem:"),function(_4c,_4d,_4e){
with(_4c){
if(!_4e){
return;
}
var _4f=_itemInfosForItems[objj_msgSend(_4e,"UID")];
if(!_4f){
return;
}
if(!_4f.isExpanded){
return;
}
_coalesceSelectionNotificationState=_25;
objj_msgSend(_4c,"_noteItemWillCollapse:",_4e);
var _50=objj_msgSend(_4c,"rowForItem:",_4e),_51=objj_msgSend(_4c,"levelForRow:",_50),_52=_50;
while(_52+1<_itemsForRows.length&&objj_msgSend(_4c,"levelForRow:",_52+1)>_51){
_52++;
}
var _53=CPMakeRange(_50+1,_52-_50);
if(_53.length){
var _54=objj_msgSend(_4c,"selectedRowIndexes");
if(objj_msgSend(_54,"intersectsIndexesInRange:",_53)){
objj_msgSend(_4c,"_noteSelectionIsChanging");
objj_msgSend(_54,"removeIndexesInRange:",_53);
objj_msgSend(_4c,"_setSelectedRowIndexes:",_54);
}
if(objj_msgSend(_54,"intersectsIndexesInRange:",CPMakeRange(_52+1,_itemsForRows.length))){
objj_msgSend(_4c,"_noteSelectionIsChanging");
objj_msgSend(_54,"shiftIndexesStartingAtIndex:by:",_52+1,-_53.length);
objj_msgSend(_4c,"_setSelectedRowIndexes:",_54);
}
}
_4f.isExpanded=NO;
objj_msgSend(_4c,"reloadItem:reloadChildren:",_4e,YES);
objj_msgSend(_4c,"_noteItemDidCollapse:",_4e);
var r=_coalesceSelectionNotificationState;
_coalesceSelectionNotificationState=_24;
if(r===_26){
objj_msgSend(_4c,"_noteSelectionDidChange");
}
}
}),new objj_method(sel_getUid("reloadItem:"),function(_55,_56,_57){
with(_55){
objj_msgSend(_55,"reloadItem:reloadChildren:",_57,NO);
}
}),new objj_method(sel_getUid("reloadItem:reloadChildren:"),function(_58,_59,_5a,_5b){
with(_58){
if(!!_5b||!_5a){
_5c(_58,_5a);
}else{
_5d(_58,_5a);
}
objj_msgSendSuper({receiver:_58,super_class:objj_getClass("CPOutlineView").super_class},"reloadData");
}
}),new objj_method(sel_getUid("itemAtRow:"),function(_5e,_5f,_60){
with(_5e){
return _itemsForRows[_60]||nil;
}
}),new objj_method(sel_getUid("rowForItem:"),function(_61,_62,_63){
with(_61){
if(!_63){
return _rootItemInfo.row;
}
var _64=_itemInfosForItems[objj_msgSend(_63,"UID")];
if(!_64){
return CPNotFound;
}
return _64.row;
}
}),new objj_method(sel_getUid("setOutlineTableColumn:"),function(_65,_66,_67){
with(_65){
if(_outlineTableColumn===_67){
return;
}
_outlineTableColumn=_67;
objj_msgSend(_65,"reloadData");
}
}),new objj_method(sel_getUid("outlineTableColumn"),function(_68,_69){
with(_68){
return _outlineTableColumn;
}
}),new objj_method(sel_getUid("levelForItem:"),function(_6a,_6b,_6c){
with(_6a){
if(!_6c){
return _rootItemInfo.level;
}
var _6d=_itemInfosForItems[objj_msgSend(_6c,"UID")];
if(!_6d){
return CPNotFound;
}
return _6d.level;
}
}),new objj_method(sel_getUid("levelForRow:"),function(_6e,_6f,_70){
with(_6e){
return objj_msgSend(_6e,"levelForItem:",objj_msgSend(_6e,"itemAtRow:",_70));
}
}),new objj_method(sel_getUid("setIndentationPerLevel:"),function(_71,_72,_73){
with(_71){
if(_indentationPerLevel===_73){
return;
}
_indentationPerLevel=_73;
objj_msgSend(_71,"reloadData");
}
}),new objj_method(sel_getUid("indentationPerLevel"),function(_74,_75){
with(_74){
return _indentationPerLevel;
}
}),new objj_method(sel_getUid("setIndentationMarkerFollowsDataView:"),function(_76,_77,_78){
with(_76){
if(_indentationMarkerFollowsDataView===_78){
return;
}
_indentationMarkerFollowsDataView=_78;
objj_msgSend(_76,"reloadData");
}
}),new objj_method(sel_getUid("indentationMarkerFollowsDataView"),function(_79,_7a){
with(_79){
return _indentationMarkerFollowsDataView;
}
}),new objj_method(sel_getUid("parentForItem:"),function(_7b,_7c,_7d){
with(_7b){
if(!_7d){
return nil;
}
var _7e=_itemInfosForItems[objj_msgSend(_7d,"UID")];
if(!_7e){
return nil;
}
var _7f=_7e.parent;
if(_7e[objj_msgSend(_7f,"UID")]===_rootItemInfo){
_7f=nil;
}
return _7f;
}
}),new objj_method(sel_getUid("_frameOfOutlineDataViewAtRow:"),function(_80,_81,_82){
with(_80){
var _83=objj_msgSend(objj_msgSend(_80,"tableColumns"),"indexOfObject:",_outlineTableColumn),_84=objj_msgSendSuper({receiver:_80,super_class:objj_getClass("CPOutlineView").super_class},"frameOfDataViewAtColumn:row:",_83,_82),_85=(objj_msgSend(_80,"levelForRow:",_82)+1)*objj_msgSend(_80,"indentationPerLevel");
_84.origin.x+=_85;
_84.size.width-=_85;
return _84;
}
}),new objj_method(sel_getUid("frameOfOutlineDisclosureControlAtRow:"),function(_86,_87,_88){
with(_86){
var _89=objj_msgSend(_86,"itemAtRow:",_88);
if(!objj_msgSend(_86,"isExpandable:",_89)||!objj_msgSend(_86,"_shouldShowOutlineDisclosureControlForItem:",_89)){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _8a=objj_msgSend(_86,"_frameOfOutlineDataViewAtRow:",_88),_8b=(objj_msgSend(_disclosureControlPrototype,"frame").size.width),_8c={origin:{x:(_8a.origin.x)-_8b,y:(_8a.origin.y)},size:{width:_8b,height:(_8a.size.height)}};
return _8c;
}
}),new objj_method(sel_getUid("_performSelection:forRow:context:"),function(_8d,_8e,_8f,_90,_91){
with(_8d){
objj_msgSendSuper({receiver:_8d,super_class:objj_getClass("CPOutlineView").super_class},"_performSelection:forRow:context:",_8f,_90,_91);
var _92=_disclosureControlsForRows[_90],_93=_8f?"setThemeState:":"unsetThemeState:";
objj_msgSend(_92,"performSelector:withObject:",CPSelectorFromString(_93),CPThemeStateSelected);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_94,_95,_96){
with(_94){
if(_outlineViewDelegate===_96){
return;
}
var _97=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_outlineViewDelegate){
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidMove:"))){
objj_msgSend(_97,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewColumnDidMoveNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidResize:"))){
objj_msgSend(_97,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewColumnDidResizeNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionDidChange:"))){
objj_msgSend(_97,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewSelectionDidChangeNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionIsChanging:"))){
objj_msgSend(_97,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewSelectionIsChangingNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewItemWillExpand:"))){
objj_msgSend(_97,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewItemWillExpandNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewItemDidExpand:"))){
objj_msgSend(_97,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewItemDidExpandNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewItemWillCollapse:"))){
objj_msgSend(_97,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewItemWillCollapseNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewItemDidCollapse:"))){
objj_msgSend(_97,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewItemDidCollapseNotification,_94);
}
}
_outlineViewDelegate=_96;
_implementedOutlineViewDelegateMethods=0;
var _98=[_b,sel_getUid("outlineView:dataViewForTableColumn:item:"),_c,sel_getUid("outlineView:didClickTableColumn:"),_d,sel_getUid("outlineView:didDragTableColumn:"),_e,sel_getUid("outlineView:heightOfRowByItem:"),_f,sel_getUid("outlineView:isGroupItem:"),_10,sel_getUid("outlineView:mouseDownInHeaderOfTableColumn:"),_11,sel_getUid("outlineView:nextTypeSelectMatchFromItem:toItem:forString:"),_12,sel_getUid("outlineView:selectionIndexesForProposedSelection:"),_13,sel_getUid("outlineView:shouldCollapseItem:"),_14,sel_getUid("outlineView:shouldEditTableColumn:item:"),_15,sel_getUid("outlineView:shouldExpandItem:"),_16,sel_getUid("outlineView:shouldReorderColumn:toColumn:"),_17,sel_getUid("outlineView:shouldSelectItem:"),_18,sel_getUid("outlineView:shouldSelectTableColumn:"),_19,sel_getUid("outlineView:shouldShowOutlineDisclosureControlForItem:"),_1a,sel_getUid("outlineView:shouldShowViewExpansionForTableColumn:item:"),_1b,sel_getUid("outlineView:shouldTrackView:forTableColumn:item:"),_1c,sel_getUid("outlineView:shouldTypeSelectForEvent:withCurrentSearchString:"),_1d,sel_getUid("outlineView:sizeToFitWidthOfColumn:"),_1e,sel_getUid("outlineView:toolTipForView:rect:tableColumn:item:mouseLocation:"),_1f,sel_getUid("outlineView:typeSelectStringForTableColumn:item:"),_20,sel_getUid("outlineView:willDisplayOutlineView:forTableColumn:item:"),_21,sel_getUid("outlineView:willDisplayView:forTableColumn:item:"),_22,sel_getUid("selectionShouldChangeInOutlineView:"),_23,sel_getUid("outlineView:menuForTableColumn:item:")],_99=objj_msgSend(_98,"count");
for(var i=0;i<_99;i+=2){
var _9a=_98[i],_9b=_98[i+1];
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",_9b)){
_implementedOutlineViewDelegateMethods|=_9a;
}
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidMove:"))){
objj_msgSend(_97,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewColumnDidMove:"),CPOutlineViewColumnDidMoveNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidResize:"))){
objj_msgSend(_97,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewColumnDidMove:"),CPOutlineViewColumnDidResizeNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionDidChange:"))){
objj_msgSend(_97,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewSelectionDidChange:"),CPOutlineViewSelectionDidChangeNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionIsChanging:"))){
objj_msgSend(_97,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewSelectionIsChanging:"),CPOutlineViewSelectionIsChangingNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewItemWillExpand:"))){
objj_msgSend(_97,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewItemWillExpand:"),CPOutlineViewItemWillExpandNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewItemDidExpand:"))){
objj_msgSend(_97,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewItemDidExpand:"),CPOutlineViewItemDidExpandNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewItemWillCollapse:"))){
objj_msgSend(_97,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewItemWillCollapse:"),CPOutlineViewItemWillCollapseNotification,_94);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewItemDidCollapse:"))){
objj_msgSend(_97,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewItemDidCollapse:"),CPOutlineViewItemDidCollapseNotification,_94);
}
}
}),new objj_method(sel_getUid("_sendDelegateDeleteKeyPressed"),function(_9c,_9d){
with(_9c){
if(objj_msgSend(objj_msgSend(_9c,"delegate"),"respondsToSelector:",sel_getUid("outlineViewDeleteKeyPressed:"))){
objj_msgSend(objj_msgSend(_9c,"delegate"),"outlineViewDeleteKeyPressed:",_9c);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("delegate"),function(_9e,_9f){
with(_9e){
return _outlineViewDelegate;
}
}),new objj_method(sel_getUid("setDisclosureControlPrototype:"),function(_a0,_a1,_a2){
with(_a0){
_disclosureControlPrototype=_a2;
_disclosureControlData=nil;
_disclosureControlQueue=[];
objj_msgSend(_a0,"reloadData");
}
}),new objj_method(sel_getUid("reloadData"),function(_a3,_a4){
with(_a3){
objj_msgSend(_a3,"reloadItem:reloadChildren:",nil,YES);
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_a5,_a6,_a7){
with(_a5){
objj_msgSendSuper({receiver:_a5,super_class:objj_getClass("CPOutlineView").super_class},"addTableColumn:",_a7);
if(objj_msgSend(_a5,"numberOfColumns")===1){
_outlineTableColumn=_a7;
}
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_a8,_a9,_aa){
with(_a8){
if(_aa===objj_msgSend(_a8,"outlineTableColumn")){
CPLog("CPOutlineView cannot remove outlineTableColumn with removeTableColumn:. User setOutlineTableColumn: instead.");
}else{
objj_msgSendSuper({receiver:_a8,super_class:objj_getClass("CPOutlineView").super_class},"removeTableColumn:",_aa);
}
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_ab,_ac,_ad,_ae){
with(_ab){
var _af=objj_msgSend(_ab,"tableColumns")[_ad];
if(_af===_outlineTableColumn){
return objj_msgSend(_ab,"_frameOfOutlineDataViewAtRow:",_ae);
}
return objj_msgSendSuper({receiver:_ab,super_class:objj_getClass("CPOutlineView").super_class},"frameOfDataViewAtColumn:row:",_ad,_ae);
}
}),new objj_method(sel_getUid("_dragViewForColumn:event:offset:"),function(_b0,_b1,_b2,_b3,_b4){
with(_b0){
var _b5=objj_msgSend(objj_msgSend(_CPColumnDragView,"alloc"),"initWithLineColor:",objj_msgSend(_b0,"gridColor")),_b6=objj_msgSend(objj_msgSend(_b0,"tableColumns"),"objectAtIndex:",_b2),_b7={origin:{x:0,y:0},size:{width:objj_msgSend(_b6,"width"),height:(objj_msgSend(_b0,"exposedRect").size.height)+23}},_b8=objj_msgSend(_b0,"rectOfColumn:",_b2),_b9=objj_msgSend(_b6,"headerView"),row=objj_msgSend(_exposedRows,"firstIndex");
while(row!==CPNotFound){
var _ba=objj_msgSend(_b0,"_newDataViewForRow:tableColumn:",row,_b6),_bb=objj_msgSend(_b0,"frameOfDataViewAtColumn:row:",_b2,row);
_bb.origin.x=0;
_bb.origin.y=((_bb.origin.y)-(objj_msgSend(_b0,"exposedRect").origin.y))+23;
objj_msgSend(_ba,"setFrame:",_bb);
objj_msgSend(_ba,"setObjectValue:",objj_msgSend(_b0,"_objectValueForTableColumn:row:",_b6,row));
if(_b6===_outlineTableColumn){
var _bc=(objj_msgSend(_b0,"levelForRow:",row)+1)*objj_msgSend(_b0,"indentationPerLevel");
_bb.origin.x+=_bc;
_bb.size.width-=_bc;
objj_msgSend(_ba,"setFrame:",_bb);
}
objj_msgSend(_b5,"addSubview:",_ba);
row=objj_msgSend(_exposedRows,"indexGreaterThanIndex:",row);
}
var _bd=objj_msgSend(_b9,"frame");
_bd.origin={x:0,y:0};
var _be=objj_msgSend(objj_msgSend(_CPTableColumnHeaderView,"alloc"),"initWithFrame:",_bd);
objj_msgSend(_be,"setStringValue:",objj_msgSend(_b9,"stringValue"));
objj_msgSend(_be,"setThemeState:",objj_msgSend(_b9,"themeState"));
objj_msgSend(_b5,"addSubview:",_be);
objj_msgSend(_b5,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_b5,"setAlphaValue:",0.7);
objj_msgSend(_b5,"setFrame:",_b7);
return _b5;
}
}),new objj_method(sel_getUid("setDropItem:dropChildIndex:"),function(_bf,_c0,_c1,_c2){
with(_bf){
if(_dropItem!==_c1&&_c2<0&&objj_msgSend(_bf,"isExpandable:",_c1)&&!objj_msgSend(_bf,"isItemExpanded:",_c1)){
if(_dragHoverTimer){
objj_msgSend(_dragHoverTimer,"invalidate");
}
var _c3=function(){
if(_dropItem){
objj_msgSend(_dropOperationFeedbackView,"blink");
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",0.3,objj_msgSend(_bf,"expandItem:",_dropItem),NO);
}
};
_dragHoverTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",0.8,_c3,NO);
}
if(_c2>=0){
objj_msgSend(_dragHoverTimer,"invalidate");
_dragHoverTimer=nil;
}
_dropItem=_c1;
_retargetedItem=_c1;
_shouldRetargetItem=YES;
_retargedChildIndex=_c2;
_shouldRetargetChildIndex=YES;
var _c4=(_retargetedItem!==nil)?_itemInfosForItems[objj_msgSend(_retargetedItem,"UID")]:_rootItemInfo;
if(_retargedChildIndex===objj_msgSend(_c4.children,"count")){
var _c5=objj_msgSend(_c4.children,"lastObject");
_retargetedDropRow=objj_msgSend(_bf,"rowForItem:",_c5)+1;
}else{
var _c5=(_retargedChildIndex!==CPOutlineViewDropOnItemIndex)?_c4.children[_retargedChildIndex]:_retargetedItem;
_retargetedDropRow=objj_msgSend(_bf,"rowForItem:",_c5);
}
}
}),new objj_method(sel_getUid("_draggingEnded"),function(_c6,_c7){
with(_c6){
objj_msgSendSuper({receiver:_c6,super_class:objj_getClass("CPOutlineView").super_class},"_draggingEnded");
_dropItem=nil;
objj_msgSend(_dragHoverTimer,"invalidate");
_dragHoverTimer=nil;
}
}),new objj_method(sel_getUid("_parentItemForUpperRow:andLowerRow:atMouseOffset:"),function(_c8,_c9,_ca,_cb,_cc){
with(_c8){
if(_shouldRetargetItem){
return _retargetedItem;
}
var _cd=objj_msgSend(_c8,"levelForRow:",_cb),_ce=objj_msgSend(_c8,"itemAtRow:",_ca),_cf=objj_msgSend(_c8,"levelForItem:",_ce);
while(_cf>_cd){
_cf=objj_msgSend(_c8,"levelForItem:",_ce);
if(_cc.x>(_cf+1)*objj_msgSend(_c8,"indentationPerLevel")){
return objj_msgSend(_c8,"parentForItem:",_ce);
}
_ce=objj_msgSend(_c8,"parentForItem:",_ce);
}
return objj_msgSend(_c8,"parentForItem:",objj_msgSend(_c8,"itemAtRow:",_cb));
}
}),new objj_method(sel_getUid("_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:"),function(_d0,_d1,_d2,_d3,_d4){
with(_d0){
var _d5=objj_msgSendSuper({receiver:_d0,super_class:objj_getClass("CPOutlineView").super_class},"_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:",_d2,_d3,_d4),_d6=objj_msgSend(_d0,"_parentItemForUpperRow:andLowerRow:atMouseOffset:",_d2,_d3,_d4),_d7=objj_msgSend(_d0,"levelForItem:",_d6);
_d5.origin.x=(_d7+1)*objj_msgSend(_d0,"indentationPerLevel");
_d5.size.width-=_d5.origin.x;
return _d5;
}
}),new objj_method(sel_getUid("_layoutDataViewsInRows:columns:"),function(_d8,_d9,_da,_db){
with(_d8){
var _dc=[],_dd=[];
objj_msgSend(_da,"getIndexes:maxCount:inIndexRange:",_dc,-1,nil);
objj_msgSend(_db,"getIndexes:maxCount:inIndexRange:",_dd,-1,nil);
var _de=0,_df=_dd.length;
for(;_de<_df;++_de){
var _e0=_dd[_de],_e1=_tableColumns[_e0],_e2=objj_msgSend(_e1,"UID"),_e3=_dataViewsForTableColumns[_e2],_e4=0,_e5=_dc.length;
for(;_e4<_e5;++_e4){
var row=_dc[_e4],_e6=_e3[row],_e7=objj_msgSend(_d8,"frameOfDataViewAtColumn:row:",_e0,row);
objj_msgSend(_e6,"setFrame:",_e7);
if(_e1===_outlineTableColumn){
var _e8=_disclosureControlsForRows[row],_e9=objj_msgSend(_d8,"frameOfOutlineDisclosureControlAtRow:",row);
objj_msgSend(_e8,"setFrame:",_e9);
}
}
}
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(_ea,_eb,_ec,_ed){
with(_ea){
objj_msgSendSuper({receiver:_ea,super_class:objj_getClass("CPOutlineView").super_class},"_loadDataViewsInRows:columns:",_ec,_ed);
var _ee=objj_msgSend(objj_msgSend(_ea,"tableColumns"),"indexOfObjectIdenticalTo:",objj_msgSend(_ea,"outlineTableColumn"));
if(!objj_msgSend(_ed,"containsIndex:",_ee)||objj_msgSend(_ea,"outlineTableColumn")===_draggedColumn){
return;
}
var _ef=[];
objj_msgSend(_ec,"getIndexes:maxCount:inIndexRange:",_ef,-1,nil);
var _f0=0,_f1=_ef.length;
for(;_f0<_f1;++_f0){
var row=_ef[_f0],_f2=_itemsForRows[row],_f3=objj_msgSend(_ea,"isExpandable:",_f2);
if(!_f3){
continue;
}
var _f4=objj_msgSend(_ea,"frameOfOutlineDisclosureControlAtRow:",row);
if((_f4.size.width<=0||_f4.size.height<=0)){
continue;
}
var _f5=objj_msgSend(_ea,"_dequeueDisclosureControl");
_disclosureControlsForRows[row]=_f5;
objj_msgSend(_f5,"setState:",objj_msgSend(_ea,"isItemExpanded:",_f2)?CPOnState:CPOffState);
var _f6=objj_msgSend(_ea,"isRowSelected:",row)?"setThemeState:":"unsetThemeState:";
objj_msgSend(_f5,"performSelector:withObject:",CPSelectorFromString(_f6),CPThemeStateSelected);
objj_msgSend(_f5,"setFrame:",_f4);
objj_msgSend(_ea,"addSubview:",_f5);
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(_f7,_f8,_f9,_fa){
with(_f7){
objj_msgSendSuper({receiver:_f7,super_class:objj_getClass("CPOutlineView").super_class},"_unloadDataViewsInRows:columns:",_f9,_fa);
var _fb=objj_msgSend(objj_msgSend(_f7,"tableColumns"),"indexOfObjectIdenticalTo:",objj_msgSend(_f7,"outlineTableColumn"));
if(!objj_msgSend(_fa,"containsIndex:",_fb)){
return;
}
var _fc=[];
objj_msgSend(_f9,"getIndexes:maxCount:inIndexRange:",_fc,-1,nil);
var _fd=0,_fe=_fc.length;
for(;_fd<_fe;++_fd){
var row=_fc[_fd],_ff=_disclosureControlsForRows[row];
if(!_ff){
continue;
}
objj_msgSend(_ff,"removeFromSuperview");
objj_msgSend(_f7,"_enqueueDisclosureControl:",_ff);
_disclosureControlsForRows[row]=nil;
}
}
}),new objj_method(sel_getUid("_toggleFromDisclosureControl:"),function(self,_100,_101){
with(self){
var _102=objj_msgSend(_101,"frame"),item=objj_msgSend(self,"itemAtRow:",objj_msgSend(self,"rowAtPoint:",{x:(_102.origin.x),y:(_102.origin.y+(_102.size.height)/2)}));
if(objj_msgSend(self,"isItemExpanded:",item)){
objj_msgSend(self,"collapseItem:",item);
}else{
objj_msgSend(self,"expandItem:expandChildren:",item,(objj_msgSend(objj_msgSend(CPApp,"currentEvent"),"modifierFlags")&CPAlternateKeyMask));
}
}
}),new objj_method(sel_getUid("_enqueueDisclosureControl:"),function(self,_103,_104){
with(self){
_disclosureControlQueue.push(_104);
}
}),new objj_method(sel_getUid("_dequeueDisclosureControl"),function(self,_105){
with(self){
if(_disclosureControlQueue.length){
return _disclosureControlQueue.pop();
}
if(!_disclosureControlData){
if(!_disclosureControlPrototype){
return nil;
}else{
_disclosureControlData=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_disclosureControlPrototype);
}
}
var _106=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_disclosureControlData);
objj_msgSend(_106,"setTarget:",self);
objj_msgSend(_106,"setAction:",sel_getUid("_toggleFromDisclosureControl:"));
return _106;
}
}),new objj_method(sel_getUid("_noteSelectionIsChanging"),function(self,_107){
with(self){
if(!_coalesceSelectionNotificationState||_coalesceSelectionNotificationState===_25){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewSelectionIsChangingNotification,self,nil);
}
if(_coalesceSelectionNotificationState===_25){
_coalesceSelectionNotificationState=_26;
}
}
}),new objj_method(sel_getUid("_noteSelectionDidChange"),function(self,_108){
with(self){
if(!_coalesceSelectionNotificationState){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewSelectionDidChangeNotification,self,nil);
}
if(_coalesceSelectionNotificationState===_25){
_coalesceSelectionNotificationState=_26;
}
}
}),new objj_method(sel_getUid("_noteItemWillExpand:"),function(self,_109,item){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewItemWillExpandNotification,self,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",item,"CPObject"));
}
}),new objj_method(sel_getUid("_noteItemDidExpand:"),function(self,_10a,item){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewItemDidExpandNotification,self,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",item,"CPObject"));
}
}),new objj_method(sel_getUid("_noteItemWillCollapse:"),function(self,_10b,item){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewItemWillCollapseNotification,self,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",item,"CPObject"));
}
}),new objj_method(sel_getUid("_noteItemDidCollapse:"),function(self,_10c,item){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewItemDidCollapseNotification,self,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",item,"CPObject"));
}
}),new objj_method(sel_getUid("keyDown:"),function(self,_10d,_10e){
with(self){
var _10f=objj_msgSend(_10e,"charactersIgnoringModifiers"),_110=objj_msgSend(_10e,"modifierFlags");
if(_10f!==CPRightArrowFunctionKey&&_10f!==CPLeftArrowFunctionKey){
return objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPOutlineView").super_class},"keyDown:",_10e);
}
var rows=objj_msgSend(self,"selectedRowIndexes"),_111=[],_112=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_111,-1,nil);
var i=0,c=objj_msgSend(_111,"count");
for(;i<c;i++){
_112.push(objj_msgSend(self,"itemAtRow:",_111[i]));
}
if(_10f===CPRightArrowFunctionKey){
for(var i=0;i<c;i++){
objj_msgSend(self,"expandItem:",_112[i]);
}
}else{
if(_10f===CPLeftArrowFunctionKey){
if(c==1){
var _113=_112[0];
if(!objj_msgSend(self,"isItemExpanded:",_113)){
var _114=objj_msgSend(self,"parentForItem:",_113),_115=_114&&(!((self)._implementedOutlineViewDelegateMethods&_22)||objj_msgSend((self)._outlineViewDelegate,"selectionShouldChangeInOutlineView:",(self)))&&(!((self)._implementedOutlineViewDelegateMethods&_17)||objj_msgSend((self)._outlineViewDelegate,"outlineView:shouldSelectItem:",(self),(_114)));
if(_115){
var _116=objj_msgSend(self,"rowForItem:",_114);
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_116),NO);
objj_msgSend(self,"scrollRowToVisible:",_116);
return;
}
}
}
for(var i=0;i<c;i++){
objj_msgSend(self,"collapseItem:",_112[i]);
}
}
}
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPOutlineView").super_class},"keyDown:",_10e);
}
})]);
var _5d=function(_117,_118){
if(!_118){
return;
}
with(_117){
var _119=_itemInfosForItems,_11a=_outlineViewDataSource,_11b=objj_msgSend(_118,"UID"),_11c=_119[_11b];
if(!_11c){
return [];
}
var _11d=_11c.parent,_11e=_11d?_119[objj_msgSend(_11d,"UID")]:_rootItemInfo,_11f=_11e.children,_120=objj_msgSend(_11f,"indexOfObjectIdenticalTo:",_118),_121=objj_msgSend(_11a,"outlineView:child:ofItem:",_117,_120,_11d);
if(_118!==_121){
_119[objj_msgSend(_118,"UID")]=nil;
_119[objj_msgSend(_121,"UID")]=_11c;
_11f[_120]=_121;
_itemsForRows[_11c.row]=_121;
}
_11c.isExpandable=objj_msgSend(_11a,"outlineView:isItemExpandable:",_117,_121);
_11c.isExpanded=_11c.isExpandable&&_11c.isExpanded;
_11c.shouldShowOutlineDisclosureControl=!(_implementedOutlineViewDelegateMethods&_19)||objj_msgSend(_outlineViewDelegate,"outlineView:shouldShowOutlineDisclosureControlForItem:",self,_121);
}
};
var _5c=function(_122,_123,_124){
with(_122){
var _125=_itemInfosForItems,_126=_outlineViewDataSource;
if(!_123){
var _127=_rootItemInfo;
}else{
var _128=objj_msgSend(_123,"UID"),_127=_125[_128];
if(!_127){
return [];
}
_127.isExpandable=objj_msgSend(_126,"outlineView:isItemExpandable:",_122,_123);
_127.shouldShowOutlineDisclosureControl=!(_implementedOutlineViewDelegateMethods&_19)||objj_msgSend(_outlineViewDelegate,"outlineView:shouldShowOutlineDisclosureControlForItem:",self,_123);
if(!_127.isExpandable&&_127.isExpanded){
_127.isExpanded=NO;
_127.children=[];
}
}
var _129=_127.weight,_12a=_123?[_123]:[];
if(_127.isExpanded&&(!(_implementedOutlineViewDataSourceMethods&_2)||!objj_msgSend(_126,"outlineView:shouldDeferDisplayingChildrenOfItem:",_122,_123))){
var _12b=0,_12c=objj_msgSend(_126,"outlineView:numberOfChildrenOfItem:",_122,_123),_12d=_127.level+1;
_127.children=[];
for(;_12b<_12c;++_12b){
var _12e=objj_msgSend(_126,"outlineView:child:ofItem:",_122,_12b,_123),_12f=_125[objj_msgSend(_12e,"UID")];
if(!_12f){
_12f={isExpanded:NO,isExpandable:NO,shouldShowOutlineDisclosureControl:YES,children:[],weight:1};
_125[objj_msgSend(_12e,"UID")]=_12f;
}
_127.children[_12b]=_12e;
var _130=_5c(_122,_12e,YES);
_12f.parent=_123;
_12f.level=_12d;
_12a=_12a.concat(_130);
}
}
_127.weight=_12a.length;
if(!_124){
var _12b=MAX(_127.row,0),_131=_itemsForRows;
_12a.unshift(_12b,_129);
_131.splice.apply(_131,_12a);
var _12c=_131.length;
for(;_12b<_12c;++_12b){
_125[objj_msgSend(_131[_12b],"UID")].row=_12b;
}
var _132=_127.weight-_129;
if(_132!==0){
var _133=_127.parent;
while(_133){
var _134=_125[objj_msgSend(_133,"UID")];
_134.weight+=_132;
_133=_134.parent;
}
if(_123){
_rootItemInfo.weight+=_132;
}
}
}
}
return _12a;
};
var _27=objj_allocateClassPair(CPObject,"_CPOutlineViewTableViewDataSource"),_28=_27.isa;
class_addIvars(_27,[new objj_ivar("_outlineView")]);
objj_registerClassPair(_27);
class_addMethods(_27,[new objj_method(sel_getUid("initWithOutlineView:"),function(self,_135,_136){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPOutlineViewTableViewDataSource").super_class},"init");
if(self){
_outlineView=_136;
}
return self;
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(self,_137,_138){
with(self){
return _outlineView._itemsForRows.length;
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(self,_139,_13a,_13b,aRow){
with(self){
return objj_msgSend(_outlineView._outlineViewDataSource,"outlineView:objectValueForTableColumn:byItem:",_outlineView,_13b,_outlineView._itemsForRows[aRow]);
}
}),new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"),function(self,_13c,_13d,_13e,_13f,aRow){
with(self){
if(!(_outlineView._implementedOutlineViewDataSourceMethods&_1)){
return;
}
objj_msgSend(_outlineView._outlineViewDataSource,"outlineView:setObjectValue:forTableColumn:byItem:",_outlineView,_13e,_13f,_outlineView._itemsForRows[aRow]);
}
}),new objj_method(sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"),function(self,_140,_141,_142,_143){
with(self){
if(!(_outlineView._implementedOutlineViewDataSourceMethods&_9)){
return NO;
}
var _144=[],_145=objj_msgSend(_142,"firstIndex");
while(_145!==CPNotFound){
objj_msgSend(_144,"addObject:",objj_msgSend(_outlineView,"itemAtRow:",_145));
_145=objj_msgSend(_142,"indexGreaterThanIndex:",_145);
}
return objj_msgSend(_outlineView._outlineViewDataSource,"outlineView:writeItems:toPasteboard:",_outlineView,_144,_143);
}
}),new objj_method(sel_getUid("_childIndexForDropOperation:row:offset:"),function(self,_146,_147,_148,_149){
with(self){
if(_outlineView._shouldRetargetChildIndex){
return _outlineView._retargedChildIndex;
}
var _14a=CPNotFound;
if(_147===CPTableViewDropAbove){
var _14b=objj_msgSend(_outlineView,"_parentItemForUpperRow:andLowerRow:atMouseOffset:",_148-1,_148,_149),_14c=(_14b!==nil)?_outlineView._itemInfosForItems[objj_msgSend(_14b,"UID")]:_outlineView._rootItemInfo,_14d=_14c.children;
_14a=objj_msgSend(_14d,"indexOfObject:",objj_msgSend(_outlineView,"itemAtRow:",_148));
if(_14a===CPNotFound){
_14a=_14d.length;
}
}else{
if(_147===CPTableViewDropOn){
_14a=-1;
}
}
return _14a;
}
}),new objj_method(sel_getUid("_parentItemForDropOperation:row:offset:"),function(self,_14e,_14f,_150,_151){
with(self){
if(_14f===CPTableViewDropAbove){
return objj_msgSend(_outlineView,"_parentItemForUpperRow:andLowerRow:atMouseOffset:",_150-1,_150,_151);
}
return objj_msgSend(_outlineView,"itemAtRow:",_150);
}
}),new objj_method(sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"),function(self,_152,_153,_154,_155,_156){
with(self){
if(!(_outlineView._implementedOutlineViewDataSourceMethods&_4)){
return CPDragOperationNone;
}
_outlineView._retargetedItem=nil;
_outlineView._shouldRetargetItem=NO;
_outlineView._retargedChildIndex=nil;
_outlineView._shouldRetargetChildIndex=NO;
var _157=objj_msgSend(_outlineView,"convertPoint:fromView:",objj_msgSend(_154,"draggingLocation"),nil),_158=objj_msgSend(self,"_parentItemForDropOperation:row:offset:",_156,_155,_157),_159=objj_msgSend(self,"_childIndexForDropOperation:row:offset:",_156,_155,_157);
return objj_msgSend(_outlineView._outlineViewDataSource,"outlineView:validateDrop:proposedItem:proposedChildIndex:",_outlineView,_154,_158,_159);
}
}),new objj_method(sel_getUid("tableView:acceptDrop:row:dropOperation:"),function(self,_15a,_15b,_15c,_15d,_15e){
with(self){
if(!(_outlineView._implementedOutlineViewDataSourceMethods&_3)){
return NO;
}
var _15f=objj_msgSend(_outlineView,"convertPoint:fromView:",objj_msgSend(_15c,"draggingLocation"),nil),_160=objj_msgSend(self,"_parentItemForDropOperation:row:offset:",_15e,_15d,_15f),_161=objj_msgSend(self,"_childIndexForDropOperation:row:offset:",_15e,_15d,_15f);
_outlineView._retargetedItem=nil;
_outlineView._shouldRetargetItem=NO;
_outlineView._retargedChildIndex=nil;
_outlineView._shouldRetargetChildIndex=NO;
return objj_msgSend(_outlineView._outlineViewDataSource,"outlineView:acceptDrop:item:childIndex:",_outlineView,_15c,_160,_161);
}
}),new objj_method(sel_getUid("tableView:sortDescriptorsDidChange:"),function(self,_162,_163,_164){
with(self){
if((_outlineView._implementedOutlineViewDataSourceMethods&_a)){
objj_msgSend(objj_msgSend(_outlineView,"dataSource"),"outlineView:sortDescriptorsDidChange:",_outlineView,_164);
}
}
})]);
var _27=objj_allocateClassPair(CPObject,"_CPOutlineViewTableViewDelegate"),_28=_27.isa;
class_addIvars(_27,[new objj_ivar("_outlineView")]);
objj_registerClassPair(_27);
class_addMethods(_27,[new objj_method(sel_getUid("initWithOutlineView:"),function(self,_165,_166){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPOutlineViewTableViewDelegate").super_class},"init");
if(self){
_outlineView=_166;
}
return self;
}
}),new objj_method(sel_getUid("tableView:dataViewForTableColumn:row:"),function(self,_167,_168,_169,_16a){
with(self){
var _16b=nil;
if((_outlineView._implementedOutlineViewDelegateMethods&_b)){
_16b=objj_msgSend(_outlineView._outlineViewDelegate,"outlineView:dataViewForTableColumn:item:",_outlineView,_169,objj_msgSend(_outlineView,"itemAtRow:",_16a));
}
if(!_16b){
_16b=objj_msgSend(_169,"dataViewForRow:",_16a);
}
return _16b;
}
}),new objj_method(sel_getUid("tableView:shouldSelectRow:"),function(self,_16c,_16d,_16e){
with(self){
return (!((_outlineView)._implementedOutlineViewDelegateMethods&_17)||objj_msgSend((_outlineView)._outlineViewDelegate,"outlineView:shouldSelectItem:",(_outlineView),(objj_msgSend(_outlineView,"itemAtRow:",_16e))));
}
}),new objj_method(sel_getUid("selectionShouldChangeInTableView:"),function(self,_16f,_170){
with(self){
return (!((_outlineView)._implementedOutlineViewDelegateMethods&_22)||objj_msgSend((_outlineView)._outlineViewDelegate,"selectionShouldChangeInOutlineView:",(_outlineView)));
}
}),new objj_method(sel_getUid("tableView:shouldEditTableColumn:row:"),function(self,_171,_172,_173,aRow){
with(self){
if((_outlineView._implementedOutlineViewDelegateMethods&_14)){
return objj_msgSend(_outlineView._outlineViewDelegate,"outlineView:shouldEditTableColumn:item:",_outlineView,_173,objj_msgSend(_outlineView,"itemAtRow:",aRow));
}
return NO;
}
}),new objj_method(sel_getUid("tableView:heightOfRow:"),function(self,_174,_175,_176){
with(self){
if((_outlineView._implementedOutlineViewDelegateMethods&_e)){
return objj_msgSend(_outlineView._outlineViewDelegate,"outlineView:heightOfRowByItem:",_outlineView,objj_msgSend(_outlineView,"itemAtRow:",_176));
}
return objj_msgSend(_175,"rowHeight");
}
}),new objj_method(sel_getUid("tableView:willDisplayView:forTableColumn:row:"),function(self,_177,_178,_179,_17a,_17b){
with(self){
if((_outlineView._implementedOutlineViewDelegateMethods&_21)){
var item=objj_msgSend(_outlineView,"itemAtRow:",_17b);
objj_msgSend(_outlineView._outlineViewDelegate,"outlineView:willDisplayView:forTableColumn:item:",_outlineView,_179,_17a,item);
}
}
}),new objj_method(sel_getUid("tableView:isGroupRow:"),function(self,_17c,_17d,aRow){
with(self){
if((_outlineView._implementedOutlineViewDelegateMethods&_f)){
return objj_msgSend(_outlineView._outlineViewDelegate,"outlineView:isGroupItem:",_outlineView,objj_msgSend(_outlineView,"itemAtRow:",aRow));
}
return NO;
}
}),new objj_method(sel_getUid("tableView:menuForTableColumn:row:"),function(self,_17e,_17f,_180,aRow){
with(self){
if((_outlineView._implementedOutlineViewDelegateMethods&_23)){
var item=objj_msgSend(_outlineView,"itemAtRow:",aRow);
return objj_msgSend(_outlineView._outlineViewDelegate,"outlineView:menuForTableColumn:item:",_outlineView,_180,item);
}
return objj_msgSend(_outlineView,"menu")||objj_msgSend(objj_msgSend(_outlineView,"class"),"defaultMenu");
}
})]);
var _27=objj_allocateClassPair(CPButton,"CPDisclosureButton"),_28=_27.isa;
class_addIvars(_27,[new objj_ivar("_angle")]);
objj_registerClassPair(_27);
class_addMethods(_27,[new objj_method(sel_getUid("initWithFrame:"),function(self,_181,_182){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPDisclosureButton").super_class},"initWithFrame:",_182);
if(self){
objj_msgSend(self,"setBordered:",NO);
}
return self;
}
}),new objj_method(sel_getUid("setState:"),function(self,_183,_184){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPDisclosureButton").super_class},"setState:",_184);
if(objj_msgSend(self,"state")===CPOnState){
_angle=0;
}else{
_angle=-PI_2;
}
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_185,_186){
with(self){
var _187=objj_msgSend(self,"bounds"),_188=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_189=(_187.size.width),_18a=(_187.size.height);
CGContextBeginPath(_188);
if(_angle){
var _18b={x:FLOOR(_189/2),y:FLOOR(_18a/2)};
CGContextTranslateCTM(_188,_18b.x,_18b.y);
CGContextRotateCTM(_188,_angle);
CGContextTranslateCTM(_188,-_18b.x,-_18b.y);
}
CGContextTranslateCTM(_188,FLOOR((_189-9)/2),FLOOR((_18a-8)/2));
CGContextMoveToPoint(_188,0,0);
CGContextAddLineToPoint(_188,9,0);
CGContextAddLineToPoint(_188,4.5,8);
CGContextAddLineToPoint(_188,0,0);
CGContextClosePath(_188);
CGContextSetFillColor(_188,_18c(objj_msgSend(self,"hasThemeState:",CPThemeStateSelected),objj_msgSend(self,"hasThemeState:",CPThemeStateHighlighted)));
CGContextFillPath(_188);
CGContextBeginPath(_188);
CGContextMoveToPoint(_188,0,0);
CGContextAddLineToPoint(_188,4.5,8);
if(_angle===0){
CGContextAddLineToPoint(_188,9,0);
}
CGContextSetStrokeColor(_188,objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1,0.7));
CGContextStrokePath(_188);
}
})]);
var _18d="CPOutlineViewIndentationPerLevelKey",_18e="CPOutlineViewOutlineTableColumnKey",_18f="CPOutlineViewDataSourceKey",_190="CPOutlineViewDelegateKey";
var _27=objj_getClass("CPOutlineView");
if(!_27){
throw new SyntaxError("*** Could not find definition for class \"CPOutlineView\"");
}
var _28=_27.isa;
class_addMethods(_27,[new objj_method(sel_getUid("initWithCoder:"),function(self,_191,_192){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPOutlineView").super_class},"initWithCoder:",_192);
if(self){
_rootItemInfo={isExpanded:YES,isExpandable:NO,level:-1,row:-1,children:[],weight:0};
_itemsForRows=[];
_itemInfosForItems={};
_disclosureControlsForRows=[];
objj_msgSend(self,"setIndentationMarkerFollowsDataView:",YES);
objj_msgSend(self,"setDisclosureControlPrototype:",objj_msgSend(objj_msgSend(CPDisclosureButton,"alloc"),"initWithFrame:",CGRectMake(0,0,10,10)));
_outlineTableColumn=objj_msgSend(_192,"decodeObjectForKey:",_18e);
_indentationPerLevel=objj_msgSend(_192,"decodeFloatForKey:",_18d);
_outlineViewDataSource=objj_msgSend(_192,"decodeObjectForKey:",_18f);
_outlineViewDelegate=objj_msgSend(_192,"decodeObjectForKey:",_190);
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPOutlineView").super_class},"setDataSource:",objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDataSource,"alloc"),"initWithOutlineView:",self));
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPOutlineView").super_class},"setDelegate:",objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDelegate,"alloc"),"initWithOutlineView:",self));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_193,_194){
with(self){
var _195=_delegate,_196=_dataSource;
_delegate=nil;
_dataSource=nil;
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPOutlineView").super_class},"encodeWithCoder:",_194);
_delegate=_195;
_dataSource=_196;
objj_msgSend(_194,"encodeObject:forKey:",_outlineTableColumn,_18e);
objj_msgSend(_194,"encodeFloat:forKey:",_indentationPerLevel,_18d);
objj_msgSend(_194,"encodeObject:forKey:",_outlineViewDataSource,_18f);
objj_msgSend(_194,"encodeObject:forKey:",_outlineViewDelegate,_190);
}
})]);
var _18c=function(_197,_198){
return _197?(_198?objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.9,1):objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1,1)):(_198?objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.4,1):objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.5,1));
};
