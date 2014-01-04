@STATIC;1.0;I;20;Foundation/CPArray.jI;23;Foundation/CPIndexSet.ji;12;CGGradient.ji;11;CPControl.ji;15;CPTableColumn.ji;15;_CPCornerView.ji;12;CPScroller.ji;17;CPCompatibility.jt;113154;
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPIndexSet.j",NO);
objj_executeFile("CGGradient.j",YES);
objj_executeFile("CPControl.j",YES);
objj_executeFile("CPTableColumn.j",YES);
objj_executeFile("_CPCornerView.j",YES);
objj_executeFile("CPScroller.j",YES);
objj_executeFile("CPCompatibility.j",YES);
CPTableViewColumnDidMoveNotification="CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification="CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification="CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification="CPTableViewSelectionIsChangingNotification";
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4,_6=1<<5,_7=1<<6,_8=1<<7;
var _9=1<<0,_a=1<<1,_b=1<<2,_c=1<<3,_d=1<<4,_e=1<<5,_f=1<<6,_10=1<<7,_11=1<<8,_12=1<<9,_13=1<<10,_14=1<<11,_15=1<<12,_16=1<<13,_17=1<<14,_18=1<<15,_19=1<<16,_1a=1<<17,_1b=1<<18,_1c=1<<19,_1d=1<<20;
CPTableViewDraggingDestinationFeedbackStyleNone=-1;
CPTableViewDraggingDestinationFeedbackStyleRegular=0;
CPTableViewDraggingDestinationFeedbackStyleSourceList=1;
CPTableViewDropOn=0;
CPTableViewDropAbove=1;
CPSourceListGradient="CPSourceListGradient";
CPSourceListTopLineColor="CPSourceListTopLineColor";
CPSourceListBottomLineColor="CPSourceListBottomLineColor";
CPTableViewSelectionHighlightStyleNone=-1;
CPTableViewSelectionHighlightStyleRegular=0;
CPTableViewSelectionHighlightStyleSourceList=1;
CPTableViewGridNone=0;
CPTableViewSolidVerticalGridLineMask=1<<0;
CPTableViewSolidHorizontalGridLineMask=1<<1;
CPTableViewNoColumnAutoresizing=0;
CPTableViewUniformColumnAutoresizingStyle=1;
CPTableViewSequentialColumnAutoresizingStyle=2;
CPTableViewReverseSequentialColumnAutoresizingStyle=3;
CPTableViewLastColumnOnlyAutoresizingStyle=4;
CPTableViewFirstColumnOnlyAutoresizingStyle=5;
var _1e=objj_allocateClassPair(CPView,"_CPTableDrawView"),_1f=_1e.isa;
class_addIvars(_1e,[new objj_ivar("_tableView")]);
objj_registerClassPair(_1e);
class_addMethods(_1e,[new objj_method(sel_getUid("initWithTableView:"),function(_20,_21,_22){
with(_20){
_20=objj_msgSendSuper({receiver:_20,super_class:objj_getClass("_CPTableDrawView").super_class},"init");
if(_20){
_tableView=_22;
}
return _20;
}
}),new objj_method(sel_getUid("drawRect:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_23,"frame"),_27=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextTranslateCTM(_27,-(_26.origin.x),-(_26.origin.y));
objj_msgSend(_tableView,"_drawRect:",_25);
}
})]);
var _1e=objj_allocateClassPair(CPControl,"CPTableView"),_1f=_1e.isa;
class_addIvars(_1e,[new objj_ivar("_dataSource"),new objj_ivar("_implementedDataSourceMethods"),new objj_ivar("_delegate"),new objj_ivar("_implementedDelegateMethods"),new objj_ivar("_tableColumns"),new objj_ivar("_tableColumnRanges"),new objj_ivar("_dirtyTableColumnRangeIndex"),new objj_ivar("_numberOfHiddenColumns"),new objj_ivar("_reloadAllRows"),new objj_ivar("_objectValues"),new objj_ivar("_exposedRect"),new objj_ivar("_exposedRows"),new objj_ivar("_exposedColumns"),new objj_ivar("_dataViewsForTableColumns"),new objj_ivar("_cachedDataViews"),new objj_ivar("_allowsColumnReordering"),new objj_ivar("_allowsColumnResizing"),new objj_ivar("_allowsColumnSelection"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_sortDescriptors"),new objj_ivar("_intercellSpacing"),new objj_ivar("_rowHeight"),new objj_ivar("_usesAlternatingRowBackgroundColors"),new objj_ivar("_alternatingRowBackgroundColors"),new objj_ivar("_selectionHighlightStyle"),new objj_ivar("_currentHighlightedTableColumn"),new objj_ivar("_gridStyleMask"),new objj_ivar("_numberOfRows"),new objj_ivar("_groupRows"),new objj_ivar("_cachedRowHeights"),new objj_ivar("_autosaveName"),new objj_ivar("_autosaveTableColumns"),new objj_ivar("_headerView"),new objj_ivar("_cornerView"),new objj_ivar("_selectedColumnIndexes"),new objj_ivar("_selectedRowIndexes"),new objj_ivar("_selectionAnchorRow"),new objj_ivar("_lastSelectedRow"),new objj_ivar("_previouslySelectedRowIndexes"),new objj_ivar("_startTrackingPoint"),new objj_ivar("_startTrackingTimestamp"),new objj_ivar("_trackingPointMovedOutOfClickSlop"),new objj_ivar("_editingCellIndex"),new objj_ivar("_tableDrawView"),new objj_ivar("_doubleAction"),new objj_ivar("_clickedRow"),new objj_ivar("_columnAutoResizingStyle"),new objj_ivar("_lastTrackedRowIndex"),new objj_ivar("_originalMouseDownPoint"),new objj_ivar("_verticalMotionCanDrag"),new objj_ivar("_destinationDragStyle"),new objj_ivar("_isSelectingSession"),new objj_ivar("_draggedRowIndexes"),new objj_ivar("_wasSelectionBroken"),new objj_ivar("_dropOperationFeedbackView"),new objj_ivar("_dragOperationDefaultMask"),new objj_ivar("_retargetedDropRow"),new objj_ivar("_retargetedDropOperation"),new objj_ivar("_disableAutomaticResizing"),new objj_ivar("_lastColumnShouldSnap"),new objj_ivar("_implementsCustomDrawRow"),new objj_ivar("_contentBindingExpicitelySet"),new objj_ivar("_draggedColumn"),new objj_ivar("_differedColumnDataToRemove")]);
objj_registerClassPair(_1e);
class_addMethods(_1e,[new objj_method(sel_getUid("disableAutomaticResizing"),function(_28,_29){
with(_28){
return _disableAutomaticResizing;
}
}),new objj_method(sel_getUid("setDisableAutomaticResizing:"),function(_2a,_2b,_2c){
with(_2a){
_disableAutomaticResizing=_2c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_2d,_2e,_2f){
with(_2d){
_2d=objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("CPTableView").super_class},"initWithFrame:",_2f);
if(_2d){
_allowsColumnReordering=YES;
_allowsColumnResizing=YES;
_allowsMultipleSelection=NO;
_allowsEmptySelection=YES;
_allowsColumnSelection=NO;
_disableAutomaticResizing=NO;
_selectionHighlightStyle=CPTableViewSelectionHighlightStyleRegular;
objj_msgSend(_2d,"setUsesAlternatingRowBackgroundColors:",NO);
objj_msgSend(_2d,"setAlternatingRowBackgroundColors:",[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",245/255,249/255,252/255,1)]);
_tableColumns=[];
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=CPNotFound;
_numberOfHiddenColumns=0;
_intercellSpacing={width:3,height:2};
_rowHeight=23;
objj_msgSend(_2d,"setGridColor:",objj_msgSend(CPColor,"colorWithHexString:","dce0e2"));
objj_msgSend(_2d,"setGridStyleMask:",CPTableViewGridNone);
objj_msgSend(_2d,"setHeaderView:",objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:objj_msgSend(_2d,"bounds").size.width,height:_rowHeight}}));
objj_msgSend(_2d,"setCornerView:",objj_msgSend(objj_msgSend(_CPCornerView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:objj_msgSend(CPScroller,"scrollerWidth"),height:(objj_msgSend(_headerView,"frame").size.height)}}));
_currentHighlightedTableColumn=nil;
_draggedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
_verticalMotionCanDrag=YES;
_isSelectingSession=NO;
_retargetedDropRow=nil;
_retargetedDropOperation=nil;
_dragOperationDefaultMask=nil;
_destinationDragStyle=CPTableViewDraggingDestinationFeedbackStyleRegular;
_contentBindingExpicitelySet=NO;
objj_msgSend(_2d,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_2d,"_init");
}
return _2d;
}
}),new objj_method(sel_getUid("_init"),function(_30,_31){
with(_30){
_lastSelectedRow=-1;
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
_dropOperationFeedbackView=objj_msgSend(objj_msgSend(_CPDropOperationDrawingView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_dropOperationFeedbackView,"setTableView:",_30);
_lastColumnShouldSnap=NO;
if(!_alternatingRowBackgroundColors){
_alternatingRowBackgroundColors=[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithHexString:","e4e7ff")];
}
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=0;
_numberOfHiddenColumns=0;
_objectValues={};
_dataViewsForTableColumns={};
_numberOfRows=0;
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_cachedDataViews={};
_cachedRowHeights=[];
_groupRows=objj_msgSend(CPIndexSet,"indexSet");
_tableDrawView=objj_msgSend(objj_msgSend(_CPTableDrawView,"alloc"),"initWithTableView:",_30);
objj_msgSend(_tableDrawView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_30,"addSubview:",_tableDrawView);
_draggedColumn=nil;
_differedColumnDataToRemove=[];
_implementsCustomDrawRow=objj_msgSend(_30,"implementsSelector:",sel_getUid("drawRow:clipRect:"));
if(!_sortDescriptors){
_sortDescriptors=[];
}
}
}),new objj_method(sel_getUid("setDataSource:"),function(_32,_33,_34){
with(_32){
if(_dataSource===_34){
return;
}
_dataSource=_34;
_implementedDataSourceMethods=0;
if(!_dataSource){
return;
}
var _35=!!objj_msgSend(_32,"infoForBinding:","content");
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("numberOfRowsInTableView:"))){
_implementedDataSourceMethods|=_1;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:objectValueForTableColumn:row:"))){
_implementedDataSourceMethods|=_2;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_3;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:acceptDrop:row:dropOperation:"))){
_implementedDataSourceMethods|=_4;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:"))){
_implementedDataSourceMethods|=_5;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedDataSourceMethods|=_6;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"))){
_implementedDataSourceMethods|=_7;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:sortDescriptorsDidChange:"))){
_implementedDataSourceMethods|=_8;
}
objj_msgSend(_32,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_36,_37){
with(_36){
return _dataSource;
}
}),new objj_method(sel_getUid("reloadDataForRowIndexes:columnIndexes:"),function(_38,_39,_3a,_3b){
with(_38){
objj_msgSend(_38,"reloadData");
}
}),new objj_method(sel_getUid("reloadData"),function(_3c,_3d){
with(_3c){
_reloadAllRows=YES;
_objectValues={};
_cachedRowHeights=[];
objj_msgSend(_groupRows,"removeAllIndexes");
objj_msgSend(_3c,"noteNumberOfRowsChanged");
objj_msgSend(_3c,"setNeedsLayout");
objj_msgSend(_3c,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_3e,_3f,_40){
with(_3e){
_doubleAction=_40;
}
}),new objj_method(sel_getUid("doubleAction"),function(_41,_42){
with(_41){
return _doubleAction;
}
}),new objj_method(sel_getUid("clickedRow"),function(_43,_44){
with(_43){
return _clickedRow;
}
}),new objj_method(sel_getUid("setAllowsColumnReordering:"),function(_45,_46,_47){
with(_45){
_allowsColumnReordering=!!_47;
}
}),new objj_method(sel_getUid("allowsColumnReordering"),function(_48,_49){
with(_48){
return _allowsColumnReordering;
}
}),new objj_method(sel_getUid("setAllowsColumnResizing:"),function(_4a,_4b,_4c){
with(_4a){
_allowsColumnResizing=!!_4c;
}
}),new objj_method(sel_getUid("allowsColumnResizing"),function(_4d,_4e){
with(_4d){
return _allowsColumnResizing;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_4f,_50,_51){
with(_4f){
_allowsMultipleSelection=!!_51;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_52,_53){
with(_52){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_54,_55,_56){
with(_54){
_allowsEmptySelection=!!_56;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_57,_58){
with(_57){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsColumnSelection:"),function(_59,_5a,_5b){
with(_59){
_allowsColumnSelection=!!_5b;
}
}),new objj_method(sel_getUid("allowsColumnSelection"),function(_5c,_5d){
with(_5c){
return _allowsColumnSelection;
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_5e,_5f,_60){
with(_5e){
if((_intercellSpacing.width==_60.width&&_intercellSpacing.height==_60.height)){
return;
}
_intercellSpacing={width:_60.width,height:_60.height};
_dirtyTableColumnRangeIndex=0;
objj_msgSend(_5e,"_recalculateTableColumnRanges");
objj_msgSend(_5e,"setNeedsLayout");
objj_msgSend(_headerView,"setNeedsDisplay:",YES);
objj_msgSend(_headerView,"setNeedsLayout");
objj_msgSend(_5e,"reloadData");
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_61,_62){
with(_61){
return {width:_intercellSpacing.width,height:_intercellSpacing.height};
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_63,_64,_65){
with(_63){
_65=+_65;
if(_rowHeight===_65){
return;
}
_rowHeight=MAX(0,_65);
objj_msgSend(_63,"setNeedsLayout");
}
}),new objj_method(sel_getUid("rowHeight"),function(_66,_67){
with(_66){
return _rowHeight;
}
}),new objj_method(sel_getUid("setUsesAlternatingRowBackgroundColors:"),function(_68,_69,_6a){
with(_68){
_usesAlternatingRowBackgroundColors=_6a;
}
}),new objj_method(sel_getUid("usesAlternatingRowBackgroundColors"),function(_6b,_6c){
with(_6b){
return _usesAlternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("setAlternatingRowBackgroundColors:"),function(_6d,_6e,_6f){
with(_6d){
objj_msgSend(_6d,"setValue:forThemeAttribute:",_6f,"alternating-row-colors");
objj_msgSend(_6d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternatingRowBackgroundColors"),function(_70,_71){
with(_70){
return objj_msgSend(_70,"currentValueForThemeAttribute:","alternating-row-colors");
}
}),new objj_method(sel_getUid("selectionHighlightStyle"),function(_72,_73){
with(_72){
return _selectionHighlightStyle;
}
}),new objj_method(sel_getUid("setSelectionHighlightStyle:"),function(_74,_75,_76){
with(_74){
_selectionHighlightStyle=_76;
objj_msgSend(_74,"setNeedsDisplay:",YES);
if(_76===CPTableViewSelectionHighlightStyleSourceList){
_destinationDragStyle=CPTableViewDraggingDestinationFeedbackStyleSourceList;
}else{
_destinationDragStyle=CPTableViewDraggingDestinationFeedbackStyleRegular;
}
}
}),new objj_method(sel_getUid("setSelectionHighlightColor:"),function(_77,_78,_79){
with(_77){
objj_msgSend(_77,"setValue:forThemeAttribute:",_79,"selection-color");
objj_msgSend(_77,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("selectionHighlightColor"),function(_7a,_7b){
with(_7a){
return objj_msgSend(_7a,"currentValueForThemeAttribute:","selection-color");
}
}),new objj_method(sel_getUid("setSelectionGradientColors:"),function(_7c,_7d,_7e){
with(_7c){
objj_msgSend(_7c,"setValue:forThemeAttribute:",_7e,"sourcelist-selection-color");
objj_msgSend(_7c,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("selectionGradientColors"),function(_7f,_80){
with(_7f){
return objj_msgSend(_7f,"currentValueForThemeAttribute:","sourcelist-selection-color");
}
}),new objj_method(sel_getUid("setGridColor:"),function(_81,_82,_83){
with(_81){
objj_msgSend(_81,"setValue:forThemeAttribute:",_83,"grid-color");
objj_msgSend(_81,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridColor"),function(_84,_85){
with(_84){
return objj_msgSend(_84,"currentValueForThemeAttribute:","grid-color");
}
}),new objj_method(sel_getUid("setGridStyleMask:"),function(_86,_87,_88){
with(_86){
if(_gridStyleMask===_88){
return;
}
_gridStyleMask=_88;
objj_msgSend(_86,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridStyleMask"),function(_89,_8a){
with(_89){
return _gridStyleMask;
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_8b,_8c,_8d){
with(_8b){
objj_msgSend(_tableColumns,"addObject:",_8d);
objj_msgSend(_8d,"setTableView:",_8b);
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=(_tableColumns.length)-1;
}else{
_dirtyTableColumnRangeIndex=MIN((_tableColumns.length)-1,_dirtyTableColumnRangeIndex);
}
if(objj_msgSend(objj_msgSend(_8b,"sortDescriptors"),"count")>0){
var _8e=objj_msgSend(objj_msgSend(_8b,"sortDescriptors"),"objectAtIndex:",0);
if(_8d===objj_msgSend(_8b,"_tableColumnForSortDescriptor:",_8e)){
var _8f=objj_msgSend(_8e,"ascending")?objj_msgSend(_8b,"_tableHeaderSortImage"):objj_msgSend(_8b,"_tableHeaderReverseSortImage");
objj_msgSend(_8b,"setIndicatorImage:inTableColumn:",_8f,_8d);
}
}
objj_msgSend(_8b,"tile");
objj_msgSend(_8b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_90,_91,_92){
with(_90){
if(objj_msgSend(_92,"tableView")!==_90){
return;
}
var _93=objj_msgSend(_tableColumns,"indexOfObjectIdenticalTo:",_92);
if(_93===CPNotFound){
return;
}
objj_msgSend(_differedColumnDataToRemove,"addObject:",{"column":_92,"shouldBeHidden":objj_msgSend(_92,"isHidden")});
objj_msgSend(_92,"setHidden:",YES);
objj_msgSend(_92,"setTableView:",nil);
var _94=objj_msgSend(_92,"UID");
if(_objectValues[_94]){
_objectValues[_94]=nil;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=_93;
}else{
_dirtyTableColumnRangeIndex=MIN(_93,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_90,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_setDraggedColumn:"),function(_95,_96,_97){
with(_95){
if(_draggedColumn===_97){
return;
}
_draggedColumn=_97;
objj_msgSend(_95,"reloadDataForRowIndexes:columnIndexes:",_exposedRows,objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_tableColumns,"indexOfObject:",_97)));
}
}),new objj_method(sel_getUid("_moveColumn:toColumn:"),function(_98,_99,_9a,_9b){
with(_98){
_9a=+_9a;
_9b=+_9b;
if(_9a===_9b){
return;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=MIN(_9a,_9b);
}else{
_dirtyTableColumnRangeIndex=MIN(_9a,_9b,_dirtyTableColumnRangeIndex);
}
var _9c=_tableColumns[_9a];
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_9a);
objj_msgSend(_tableColumns,"insertObject:atIndex:",_9c,_9b);
objj_msgSend(objj_msgSend(_98,"headerView"),"setNeedsLayout");
objj_msgSend(objj_msgSend(_98,"headerView"),"setNeedsDisplay:",YES);
var _9d=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_98,"numberOfRows"))),_9e=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_9a,_9b));
objj_msgSend(_98,"reloadDataForRowIndexes:columnIndexes:",_9d,_9e);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewColumnDidMoveNotification,_98,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_9a,_9b],["CPOldColumn","CPNewColumn"]));
}
}),new objj_method(sel_getUid("moveColumn:toColumn:"),function(_9f,_a0,_a1,_a2){
with(_9f){
objj_msgSend(_9f,"_moveColumn:toColumn:",_a1,_a2);
objj_msgSend(_9f,"_autosave");
}
}),new objj_method(sel_getUid("_tableColumnVisibilityDidChange:"),function(_a3,_a4,_a5){
with(_a3){
var _a6=objj_msgSend(objj_msgSend(_a3,"tableColumns"),"indexOfObjectIdenticalTo:",_a5);
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=_a6;
}else{
_dirtyTableColumnRangeIndex=MIN(_a6,_dirtyTableColumnRangeIndex);
}
objj_msgSend(objj_msgSend(_a3,"headerView"),"setNeedsLayout");
objj_msgSend(objj_msgSend(_a3,"headerView"),"setNeedsDisplay:",YES);
var _a7=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_a3,"numberOfRows")));
objj_msgSend(_a3,"reloadDataForRowIndexes:columnIndexes:",_a7,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_a6));
}
}),new objj_method(sel_getUid("tableColumns"),function(_a8,_a9){
with(_a8){
return _tableColumns;
}
}),new objj_method(sel_getUid("columnWithIdentifier:"),function(_aa,_ab,_ac){
with(_aa){
var _ad=0,_ae=(_tableColumns.length);
for(;_ad<_ae;++_ad){
if(objj_msgSend(_tableColumns[_ad],"identifier")===_ac){
return _ad;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("tableColumnWithIdentifier:"),function(_af,_b0,_b1){
with(_af){
var _b2=objj_msgSend(_af,"columnWithIdentifier:",_b1);
if(_b2===CPNotFound){
return nil;
}
return _tableColumns[_b2];
}
}),new objj_method(sel_getUid("_didResizeTableColumn:"),function(_b3,_b4,_b5){
with(_b3){
objj_msgSend(_b3,"_autosave");
}
}),new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"),function(_b6,_b7,_b8,_b9){
with(_b6){
if((objj_msgSend(_b8,"firstIndex")!=CPNotFound&&objj_msgSend(_b8,"firstIndex")<0)||objj_msgSend(_b8,"lastIndex")>=objj_msgSend(_b6,"numberOfColumns")){
return;
}
if(objj_msgSend(_selectedRowIndexes,"count")>0){
objj_msgSend(_b6,"_updateHighlightWithOldRows:newRows:",_selectedRowIndexes,objj_msgSend(CPIndexSet,"indexSet"));
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
}
var _ba=objj_msgSend(_selectedColumnIndexes,"copy");
if(_b9){
objj_msgSend(_selectedColumnIndexes,"addIndexes:",_b8);
}else{
_selectedColumnIndexes=objj_msgSend(_b8,"copy");
}
objj_msgSend(_b6,"_updateHighlightWithOldColumns:newColumns:",_ba,_selectedColumnIndexes);
objj_msgSend(_b6,"setNeedsDisplay:",YES);
if(_headerView){
objj_msgSend(_headerView,"setNeedsDisplay:",YES);
}
objj_msgSend(_b6,"_noteSelectionDidChange");
}
}),new objj_method(sel_getUid("_setSelectedRowIndexes:"),function(_bb,_bc,_bd){
with(_bb){
if(objj_msgSend(_selectedRowIndexes,"isEqualToIndexSet:",_bd)){
return;
}
var _be=_selectedRowIndexes;
_lastSelectedRow=(objj_msgSend(_bd,"count")>0)?objj_msgSend(_bd,"lastIndex"):-1;
_selectedRowIndexes=objj_msgSend(_bd,"copy");
objj_msgSend(_bb,"_updateHighlightWithOldRows:newRows:",_be,_selectedRowIndexes);
objj_msgSend(_bb,"setNeedsDisplay:",YES);
var _bf=objj_msgSend(objj_msgSend(_bb,"class"),"_binderClassForBinding:","selectionIndexes");
objj_msgSend(objj_msgSend(_bf,"getBinding:forObject:","selectionIndexes",_bb),"reverseSetValueFor:","selectedRowIndexes");
objj_msgSend(_bb,"_noteSelectionDidChange");
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_c0,_c1,_c2,_c3){
with(_c0){
if(objj_msgSend(_c2,"isEqualToIndexSet:",_selectedRowIndexes)||((objj_msgSend(_c2,"firstIndex")!=CPNotFound&&objj_msgSend(_c2,"firstIndex")<0)||objj_msgSend(_c2,"lastIndex")>=objj_msgSend(_c0,"numberOfRows"))){
return;
}
if(objj_msgSend(_selectedColumnIndexes,"count")>0){
objj_msgSend(_c0,"_updateHighlightWithOldColumns:newColumns:",_selectedColumnIndexes,objj_msgSend(CPIndexSet,"indexSet"));
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_headerView){
objj_msgSend(_headerView,"setNeedsDisplay:",YES);
}
}
var _c4;
if(_c3){
_c4=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(_c4,"addIndexes:",_c2);
}else{
_c4=objj_msgSend(_c2,"copy");
}
objj_msgSend(_c0,"_setSelectedRowIndexes:",_c4);
}
}),new objj_method(sel_getUid("_updateHighlightWithOldRows:newRows:"),function(_c5,_c6,_c7,_c8){
with(_c5){
var _c9=objj_msgSend(_exposedRows,"firstIndex"),_ca=objj_msgSend(_exposedRows,"lastIndex")-_c9+1,_cb=[],_cc=[],_cd=objj_msgSend(_c7,"copy"),_ce=objj_msgSend(_c8,"copy");
objj_msgSend(_cd,"removeMatches:",_ce);
objj_msgSend(_cd,"getIndexes:maxCount:inIndexRange:",_cb,-1,CPMakeRange(_c9,_ca));
objj_msgSend(_ce,"getIndexes:maxCount:inIndexRange:",_cc,-1,CPMakeRange(_c9,_ca));
for(var _cf in _dataViewsForTableColumns){
var _d0=_dataViewsForTableColumns[_cf],_d1=_cb.length;
while(_d1--){
objj_msgSend(_c5,"_performSelection:forRow:context:",NO,_cb[_d1],_d0);
}
_d1=_cc.length;
while(_d1--){
objj_msgSend(_c5,"_performSelection:forRow:context:",YES,_cc[_d1],_d0);
}
}
}
}),new objj_method(sel_getUid("_performSelection:forRow:context:"),function(_d2,_d3,_d4,_d5,_d6){
with(_d2){
var _d7=_d6[_d5],_d8=_d4?"setThemeState:":"unsetThemeState:";
objj_msgSend(_d7,"performSelector:withObject:",CPSelectorFromString(_d8),CPThemeStateSelectedDataView);
}
}),new objj_method(sel_getUid("_updateHighlightWithOldColumns:newColumns:"),function(_d9,_da,_db,_dc){
with(_d9){
var _dd=objj_msgSend(_exposedColumns,"firstIndex"),_de=objj_msgSend(_exposedColumns,"lastIndex")-_dd+1,_df=[],_e0=[],_e1=objj_msgSend(_db,"copy"),_e2=objj_msgSend(_dc,"copy"),_e3=[];
objj_msgSend(_e1,"removeMatches:",_e2);
objj_msgSend(_e1,"getIndexes:maxCount:inIndexRange:",_df,-1,CPMakeRange(_dd,_de));
objj_msgSend(_e2,"getIndexes:maxCount:inIndexRange:",_e0,-1,CPMakeRange(_dd,_de));
objj_msgSend(_exposedRows,"getIndexes:maxCount:inIndexRange:",_e3,-1,nil);
var _e4=_e3.length,_e5=_df.length;
while(_e5--){
var _e6=_df[_e5],_e7=objj_msgSend(_tableColumns[_e6],"UID"),_e8=_dataViewsForTableColumns[_e7];
for(var i=0;i<_e4;i++){
var _e9=_e3[i],_ea=_e8[_e9];
objj_msgSend(_ea,"unsetThemeState:",CPThemeStateSelectedDataView);
}
if(_headerView){
var _eb=objj_msgSend(_tableColumns[_e6],"headerView");
objj_msgSend(_eb,"unsetThemeState:",CPThemeStateSelected);
}
}
_e5=_e0.length;
while(_e5--){
var _e6=_e0[_e5],_e7=objj_msgSend(_tableColumns[_e6],"UID"),_e8=_dataViewsForTableColumns[_e7];
for(var i=0;i<_e4;i++){
var _e9=_e3[i],_ea=_e8[_e9];
objj_msgSend(_ea,"setThemeState:",CPThemeStateSelectedDataView);
}
if(_headerView){
var _eb=objj_msgSend(_tableColumns[_e6],"headerView");
objj_msgSend(_eb,"setThemeState:",CPThemeStateSelected);
}
}
}
}),new objj_method(sel_getUid("selectedColumn"),function(_ec,_ed){
with(_ec){
return objj_msgSend(_selectedColumnIndexes,"lastIndex");
}
}),new objj_method(sel_getUid("selectedColumnIndexes"),function(_ee,_ef){
with(_ee){
return _selectedColumnIndexes;
}
}),new objj_method(sel_getUid("selectedRow"),function(_f0,_f1){
with(_f0){
return _lastSelectedRow;
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_f2,_f3){
with(_f2){
return objj_msgSend(_selectedRowIndexes,"copy");
}
}),new objj_method(sel_getUid("deselectColumn:"),function(_f4,_f5,_f6){
with(_f4){
var _f7=objj_msgSend(_selectedColumnIndexes,"copy");
objj_msgSend(_f7,"removeIndex:",_f6);
objj_msgSend(_f4,"selectColumnIndexes:byExtendingSelection:",_f7,NO);
objj_msgSend(_f4,"_noteSelectionDidChange");
}
}),new objj_method(sel_getUid("deselectRow:"),function(_f8,_f9,_fa){
with(_f8){
var _fb=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(_fb,"removeIndex:",_fa);
objj_msgSend(_f8,"selectRowIndexes:byExtendingSelection:",_fb,NO);
objj_msgSend(_f8,"_noteSelectionDidChange");
}
}),new objj_method(sel_getUid("numberOfSelectedColumns"),function(_fc,_fd){
with(_fc){
return objj_msgSend(_selectedColumnIndexes,"count");
}
}),new objj_method(sel_getUid("numberOfSelectedRows"),function(_fe,_ff){
with(_fe){
return objj_msgSend(_selectedRowIndexes,"count");
}
}),new objj_method(sel_getUid("isColumnSelected:"),function(self,_100,_101){
with(self){
return objj_msgSend(_selectedColumnIndexes,"containsIndex:",_101);
}
}),new objj_method(sel_getUid("isRowSelected:"),function(self,_102,aRow){
with(self){
return objj_msgSend(_selectedRowIndexes,"containsIndex:",aRow);
}
}),new objj_method(sel_getUid("deselectAll"),function(self,_103){
with(self){
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSet"),NO);
objj_msgSend(self,"selectColumnIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSet"),NO);
}
}),new objj_method(sel_getUid("numberOfColumns"),function(self,_104){
with(self){
return (_tableColumns.length);
}
}),new objj_method(sel_getUid("numberOfRows"),function(self,_105){
with(self){
if(_numberOfRows!==nil){
return _numberOfRows;
}
var _106=objj_msgSend(self,"infoForBinding:","content");
if(_106){
var _107=objj_msgSend(_106,"objectForKey:",CPObservedObjectKey),_108=objj_msgSend(_106,"objectForKey:",CPObservedKeyPathKey);
_numberOfRows=objj_msgSend(objj_msgSend(_107,"valueForKeyPath:",_108),"count");
}else{
if(_dataSource&&(_implementedDataSourceMethods&_1)){
_numberOfRows=objj_msgSend(_dataSource,"numberOfRowsInTableView:",self)||0;
}else{
if(_dataSource){
CPLog("no content binding established and data source "+objj_msgSend(_dataSource,"description")+" does not implement numberOfRowsInTableView:");
}
_numberOfRows=0;
}
}
return _numberOfRows;
}
}),new objj_method(sel_getUid("editColumn:row:withEvent:select:"),function(self,_109,_10a,_10b,_10c,flag){
with(self){
if(!objj_msgSend(self,"isRowSelected:",_10b)){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:","Error","Attempt to edit row="+_10b+" when not selected.",nil),"raise");
}
objj_msgSend(self,"scrollRowToVisible:",_10b);
objj_msgSend(self,"scrollColumnToVisible:",_10a);
_editingCellIndex=CGPointMake(_10a,_10b);
_editingCellIndex._shouldSelect=flag;
objj_msgSend(self,"reloadDataForRowIndexes:columnIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_10b),objj_msgSend(CPIndexSet,"indexSetWithIndex:",_10a));
}
}),new objj_method(sel_getUid("editedColumn"),function(self,_10d){
with(self){
if(!_editingCellIndex){
return CPNotFound;
}
return _editingCellIndex.x;
}
}),new objj_method(sel_getUid("editedRow"),function(self,_10e){
with(self){
if(!_editingCellIndex){
return CPNotFound;
}
return _editingCellIndex.y;
}
}),new objj_method(sel_getUid("cornerView"),function(self,_10f){
with(self){
return _cornerView;
}
}),new objj_method(sel_getUid("setCornerView:"),function(self,_110,_111){
with(self){
if(_cornerView===_111){
return;
}
_cornerView=_111;
var _112=objj_msgSend(self,"enclosingScrollView");
if(objj_msgSend(_112,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))&&objj_msgSend(_112,"documentView")===self){
objj_msgSend(_112,"_updateCornerAndHeaderView");
}
}
}),new objj_method(sel_getUid("headerView"),function(self,_113){
with(self){
return _headerView;
}
}),new objj_method(sel_getUid("setHeaderView:"),function(self,_114,_115){
with(self){
if(_headerView===_115){
return;
}
objj_msgSend(_headerView,"setTableView:",nil);
_headerView=_115;
if(_headerView){
objj_msgSend(_headerView,"setTableView:",self);
objj_msgSend(_headerView,"setFrameSize:",{width:(objj_msgSend(self,"frame").size.width),height:(objj_msgSend(_headerView,"frame").size.height)});
}else{
objj_msgSend(_cornerView,"removeFromSuperview");
_cornerView=nil;
}
var _116=objj_msgSend(self,"enclosingScrollView");
if(objj_msgSend(_116,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))&&objj_msgSend(_116,"documentView")===self){
objj_msgSend(_116,"_updateCornerAndHeaderView");
}
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_recalculateTableColumnRanges"),function(self,_117){
with(self){
if(_dirtyTableColumnRangeIndex<0){
return;
}
_numberOfHiddenColumns=0;
var _118=_dirtyTableColumnRangeIndex,_119=(_tableColumns.length),x=_118===0?0:CPMaxRange(_tableColumnRanges[_118-1]);
for(;_118<_119;++_118){
var _11a=_tableColumns[_118];
if(objj_msgSend(_11a,"isHidden")){
_numberOfHiddenColumns+=1;
_tableColumnRanges[_118]=CPMakeRange(x,0);
}else{
var _11b=objj_msgSend(_tableColumns[_118],"width")+_intercellSpacing.width;
_tableColumnRanges[_118]=CPMakeRange(x,_11b);
x+=_11b;
}
}
_tableColumnRanges.length=_119;
_dirtyTableColumnRangeIndex=CPNotFound;
}
}),new objj_method(sel_getUid("rectOfColumn:"),function(self,_11c,_11d){
with(self){
_11d=+_11d;
if(_11d<0||_11d>=(_tableColumns.length)){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _11e=objj_msgSend(objj_msgSend(self,"tableColumns"),"objectAtIndex:",_11d);
if(objj_msgSend(_11e,"isHidden")){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var _11f=_tableColumnRanges[_11d];
return {origin:{x:_11f.location,y:0},size:{width:_11f.length,height:(objj_msgSend(self,"bounds").size.height)}};
}
}),new objj_method(sel_getUid("_rectOfRow:checkRange:"),function(self,_120,_121,_122){
with(self){
var _123=objj_msgSend(self,"numberOfRows")-1;
if(_122&&(_121>_123||_121<0)){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_implementedDelegateMethods&_d){
var _124=MIN(_121,_123);
if(_124!==CPNotFound){
var y=_cachedRowHeights[_124].heightAboveRow,_125=_cachedRowHeights[_124].height+_intercellSpacing.height,_126=_121-_124;
}else{
y=_121*(_rowHeight+_intercellSpacing.height);
_125=_rowHeight+_intercellSpacing.height;
}
if(_126>0){
y+=_126*(_rowHeight+_intercellSpacing.height);
_125=_rowHeight+_intercellSpacing.height;
}
}else{
var y=_121*(_rowHeight+_intercellSpacing.height),_125=_rowHeight+_intercellSpacing.height;
}
return {origin:{x:0,y:y},size:{width:(objj_msgSend(self,"bounds").size.width),height:_125}};
}
}),new objj_method(sel_getUid("rectOfRow:"),function(self,_127,_128){
with(self){
return objj_msgSend(self,"_rectOfRow:checkRange:",_128,YES);
}
}),new objj_method(sel_getUid("rowsInRect:"),function(self,_129,_12a){
with(self){
if(_numberOfRows<=0){
return CPMakeRange(0,0);
}
var _12b=objj_msgSend(self,"bounds");
if(!CGRectIntersectsRect(_12a,_12b)){
return CPMakeRange(0,0);
}
var _12c=objj_msgSend(self,"rowAtPoint:",_12a.origin);
if(_12c<0){
_12c=0;
}
var _12d=objj_msgSend(self,"rowAtPoint:",{x:0,y:(_12a.origin.y+_12a.size.height)});
if(_12d<0){
_12d=_numberOfRows-1;
}
return CPMakeRange(_12c,_12d-_12c+1);
}
}),new objj_method(sel_getUid("_unboundedRowsInRect:"),function(self,_12e,_12f){
with(self){
var _130=objj_msgSend(self,"rowsInRect:",_12f),_131=CPMaxRange(_130),_132=objj_msgSend(self,"_rectOfRow:checkRange:",_131,NO),_133=(_12f.origin.y+_12f.size.height),_134=(_132.origin.y+_132.size.height);
if(_133<=_134){
return _130;
}
var _135=CEIL(_133-_134)/(objj_msgSend(self,"rowHeight")+_intercellSpacing.height);
_130.length+=_135+1;
return _130;
}
}),new objj_method(sel_getUid("columnIndexesInRect:"),function(self,_136,_137){
with(self){
var _138=MAX(0,objj_msgSend(self,"columnAtPoint:",{x:_137.origin.x,y:0})),_139=objj_msgSend(self,"columnAtPoint:",{x:(_137.origin.x+_137.size.width),y:0});
if(_139===CPNotFound){
_139=(_tableColumns.length)-1;
}
if(_numberOfHiddenColumns<=0){
return objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_138,_139-_138+1));
}
var _13a=objj_msgSend(CPIndexSet,"indexSet");
for(;_138<=_139;++_138){
var _13b=_tableColumns[_138];
if(!objj_msgSend(_13b,"isHidden")){
objj_msgSend(_13a,"addIndex:",_138);
}
}
return _13a;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(self,_13c,_13d){
with(self){
var _13e=objj_msgSend(self,"bounds");
if(!(_13d.x>=(_13e.origin.x)&&_13d.y>=(_13e.origin.y)&&_13d.x<(_13e.origin.x+_13e.size.width)&&_13d.y<(_13e.origin.y+_13e.size.height))){
return CPNotFound;
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var x=_13d.x,low=0,high=_tableColumnRanges.length-1;
while(low<=high){
var _13f=FLOOR(low+(high-low)/2),_140=_tableColumnRanges[_13f];
if(x<_140.location){
high=_13f-1;
}else{
if(x>=CPMaxRange(_140)){
low=_13f+1;
}else{
var _141=_tableColumnRanges.length;
while(_13f<_141&&objj_msgSend(_tableColumns[_13f],"isHidden")){
++_13f;
}
if(_13f<_141){
return _13f;
}
return CPNotFound;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("rowAtPoint:"),function(self,_142,_143){
with(self){
if(_implementedDelegateMethods&_d){
return objj_msgSend(_cachedRowHeights,"indexOfObject:inSortedRange:options:usingComparator:",_143,nil,0,function(_144,_145){
var _146=_145.heightAboveRow;
if(_144.y<_146){
return CPOrderedAscending;
}
if(_144.y>_146+_145.height+_intercellSpacing.height){
return CPOrderedDescending;
}
return CPOrderedSame;
});
}
var y=_143.y,row=FLOOR(y/(_rowHeight+_intercellSpacing.height));
if(row>=_numberOfRows){
return CPNotFound;
}
return row;
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(self,_147,_148,aRow){
with(self){
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
if(_148>objj_msgSend(self,"numberOfColumns")||aRow>objj_msgSend(self,"numberOfRows")){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _149=_tableColumnRanges[_148],_14a=objj_msgSend(self,"rectOfRow:",aRow),_14b=FLOOR(_intercellSpacing.width/2),_14c=FLOOR(_intercellSpacing.height/2);
return {origin:{x:_149.location+_14b,y:(_14a.origin.y)+_14c},size:{width:_149.length-_intercellSpacing.width,height:(_14a.size.height)-_intercellSpacing.height}};
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(self,_14d,_14e){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"resizeWithOldSuperviewSize:",_14e);
if(_disableAutomaticResizing){
return;
}
var mask=_columnAutoResizingStyle;
if(!_lastColumnShouldSnap){
var _14f=objj_msgSend(self,"superview");
if(!_14f||!objj_msgSend(_14f,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return;
}
var _150=objj_msgSend(_14f,"bounds").size.width,_151=(objj_msgSend(self,"rectOfColumn:",objj_msgSend(self,"numberOfColumns")-1).origin.x+objj_msgSend(self,"rectOfColumn:",objj_msgSend(self,"numberOfColumns")-1).size.width);
if(_151>=_150&&_151<=_14e.width||_151<=_150&&_151>=_14e.width){
_lastColumnShouldSnap=YES;
}else{
if(mask===CPTableViewUniformColumnAutoresizingStyle){
return;
}
}
}
if(mask===CPTableViewUniformColumnAutoresizingStyle){
objj_msgSend(self,"_resizeAllColumnUniformlyWithOldSize:",_14e);
}else{
if(mask===CPTableViewLastColumnOnlyAutoresizingStyle){
objj_msgSend(self,"sizeLastColumnToFit");
}else{
if(mask===CPTableViewFirstColumnOnlyAutoresizingStyle){
objj_msgSend(self,"_autoResizeFirstColumn");
}
}
}
}
}),new objj_method(sel_getUid("_autoResizeFirstColumn"),function(self,_152){
with(self){
var _153=objj_msgSend(self,"superview");
if(!_153){
return;
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var _154=(_tableColumns.length),_155=nil,_156=0,i=0;
for(;i<_154;i++){
var _157=_tableColumns[i];
if(!objj_msgSend(_157,"isHidden")){
if(!_155){
_155=_157;
}
_156+=objj_msgSend(_157,"width")+_intercellSpacing.width;
}
}
if(_155){
var _158=objj_msgSend(_153,"bounds").size,_159=_158.width-_156;
_159+=objj_msgSend(_155,"width");
objj_msgSend(_155,"_tryToResizeToWidth:",_159);
}
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_resizeAllColumnUniformlyWithOldSize:"),function(self,_15a,_15b){
with(self){
var _15c=objj_msgSend(self,"superview");
if(!_15c||!objj_msgSend(_15c,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return;
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var _15d=objj_msgSend(_15c,"bounds").size.width,_15e=(_tableColumns.length),_15f=objj_msgSend(CPIndexSet,"indexSet"),_160=0,i=0;
for(;i<_15e;i++){
var _161=_tableColumns[i];
if(!objj_msgSend(_161,"isHidden")&&(objj_msgSend(_161,"resizingMask")&CPTableColumnAutoresizingMask)){
objj_msgSend(_15f,"addIndex:",i);
}
}
var _162=(objj_msgSend(self,"rectOfColumn:",objj_msgSend(_15f,"lastIndex")).origin.x+objj_msgSend(self,"rectOfColumn:",objj_msgSend(_15f,"lastIndex")).size.width),_160=_15d-_162,_163=objj_msgSend(_15f,"count"),_164=0;
while(_160&&_163){
_164+=_160/_163;
_160=0;
var _165=CPNotFound;
while((_165=objj_msgSend(_15f,"indexGreaterThanIndex:",_165))!==CPNotFound){
var item=_tableColumns[_165],_166=objj_msgSend(item,"width")+_164,_167=objj_msgSend(item,"_tryToResizeToWidth:",_166);
if(_167){
objj_msgSend(_15f,"removeIndex:",_165);
_160+=_167;
}
}
}
while(_15e--&&objj_msgSend(_tableColumns[_15e],"isHidden")){
}
var _168=_15d-(objj_msgSend(self,"rectOfColumn:",_15e).origin.x+objj_msgSend(self,"rectOfColumn:",_15e).size.width)-(objj_msgSend(self,"intercellSpacing").width||1),_169=objj_msgSend(item,"width")+_168;
objj_msgSend(item,"_tryToResizeToWidth:",_169);
}
}),new objj_method(sel_getUid("setColumnAutoresizingStyle:"),function(self,_16a,_16b){
with(self){
_columnAutoResizingStyle=_16b;
}
}),new objj_method(sel_getUid("columnAutoresizingStyle"),function(self,_16c){
with(self){
return _columnAutoResizingStyle;
}
}),new objj_method(sel_getUid("sizeLastColumnToFit"),function(self,_16d){
with(self){
_lastColumnShouldSnap=YES;
var _16e=objj_msgSend(self,"superview");
if(!_16e){
return;
}
var _16f=objj_msgSend(_16e,"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var _170=(_tableColumns.length);
while(_170--&&objj_msgSend(_tableColumns[_170],"isHidden")){
}
if(_170>=0){
var _171=_tableColumns[_170],_172=MAX(0,_16f.width-CGRectGetMinX(objj_msgSend(self,"rectOfColumn:",_170))-_intercellSpacing.width);
objj_msgSend(_171,"_tryToResizeToWidth:",_172);
}
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("noteNumberOfRowsChanged"),function(self,_173){
with(self){
var _174=_numberOfRows;
_numberOfRows=nil;
_cachedRowHeights=[];
objj_msgSend(self,"noteHeightOfRowsWithIndexesChanged:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(self,"numberOfRows"))));
var _175=_174-_numberOfRows;
if(_175>0){
var _176=objj_msgSend(_selectedRowIndexes,"count");
objj_msgSend(_selectedRowIndexes,"removeIndexesInRange:",CPMakeRange(_numberOfRows,_175));
if(!objj_msgSend(_selectedRowIndexes,"containsIndex:",objj_msgSend(self,"selectedRow"))){
_lastSelectedRow=CPNotFound;
}
if(_176>objj_msgSend(_selectedRowIndexes,"count")){
objj_msgSend(self,"_noteSelectionDidChange");
}
}
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("noteHeightOfRowsWithIndexesChanged:"),function(self,_177,_178){
with(self){
if(!(_implementedDelegateMethods&_d)){
return;
}
var i=objj_msgSend(_178,"firstIndex"),_179=_numberOfRows-i,_17a=(i>0)?_cachedRowHeights[i-1].height+_cachedRowHeights[i-1].heightAboveRow+_intercellSpacing.height:0;
for(;i<_179;i++){
if(objj_msgSend(_178,"containsIndex:",i)){
var _17b=objj_msgSend(_delegate,"tableView:heightOfRow:",self,i);
}
_cachedRowHeights[i]={"height":_17b,"heightAboveRow":_17a};
_17a+=_17b+_intercellSpacing.height;
}
}
}),new objj_method(sel_getUid("tile"),function(self,_17c){
with(self){
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var _17d=_tableColumnRanges.length>0?CPMaxRange(objj_msgSend(_tableColumnRanges,"lastObject")):0,_17e=objj_msgSend(self,"superview");
if(!(_implementedDelegateMethods&_d)){
var _17f=(_rowHeight+_intercellSpacing.height)*_numberOfRows;
}else{
if(objj_msgSend(self,"numberOfRows")===0){
var _17f=0;
}else{
if(objj_msgSend(self,"numberOfRows")!==_cachedRowHeights.length){
objj_msgSend(self,"noteHeightOfRowsWithIndexesChanged:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(self,"numberOfRows"))));
}
var _180=_cachedRowHeights[_cachedRowHeights.length-1],_17f=_180.heightAboveRow+_180.height+_intercellSpacing.height;
}
}
if(objj_msgSend(_17e,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
var _181=objj_msgSend(_17e,"bounds").size;
_17d=MAX(_181.width,_17d);
_17f=MAX(_181.height,_17f);
}
objj_msgSend(self,"setFrameSize:",{width:_17d,height:_17f});
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("scrollRowToVisible:"),function(self,_182,_183){
with(self){
var _184=objj_msgSend(self,"visibleRect"),_185=objj_msgSend(self,"rectOfRow:",_183);
_184.origin.y=_185.origin.y;
_184.size.height=_185.size.height;
objj_msgSend(self,"scrollRectToVisible:",_184);
}
}),new objj_method(sel_getUid("scrollColumnToVisible:"),function(self,_186,_187){
with(self){
var _188=objj_msgSend(self,"visibleRect"),_189=objj_msgSend(self,"rectOfColumn:",_187);
_188.origin.x=_189.origin.x;
_188.size.width=_189.size.width;
objj_msgSend(self,"scrollRectToVisible:",_188);
objj_msgSend(_headerView,"scrollRectToVisible:",_189);
}
}),new objj_method(sel_getUid("setAutosaveName:"),function(self,_18a,_18b){
with(self){
if(_autosaveName===_18b){
return;
}
_autosaveName=_18b;
objj_msgSend(self,"setAutosaveTableColumns:",!!_18b);
objj_msgSend(self,"_restoreFromAutosave");
}
}),new objj_method(sel_getUid("autosaveName"),function(self,_18c){
with(self){
return _autosaveName;
}
}),new objj_method(sel_getUid("setAutosaveTableColumns:"),function(self,_18d,_18e){
with(self){
_autosaveTableColumns=_18e;
}
}),new objj_method(sel_getUid("autosaveTableColumns"),function(self,_18f){
with(self){
return _autosaveTableColumns;
}
}),new objj_method(sel_getUid("_columnsKeyForAutosaveName:"),function(self,_190,_191){
with(self){
return "CPTableView Columns "+_191;
}
}),new objj_method(sel_getUid("_autosaveEnabled"),function(self,_192){
with(self){
return objj_msgSend(self,"autosaveName")&&objj_msgSend(self,"autosaveTableColumns");
}
}),new objj_method(sel_getUid("_autosave"),function(self,_193){
with(self){
if(!objj_msgSend(self,"_autosaveEnabled")){
return;
}
var _194=objj_msgSend(CPUserDefaults,"standardUserDefaults"),_195=objj_msgSend(self,"autosaveName");
var _196=objj_msgSend(self,"tableColumns"),_197=[];
for(var i=0;i<objj_msgSend(_196,"count");i++){
var _198=objj_msgSend(_196,"objectAtIndex:",i),_199=objj_msgSend(CPDictionary,"dictionaryWithJSObject:",{"identifier":objj_msgSend(_198,"identifier"),"width":objj_msgSend(_198,"width")});
objj_msgSend(_197,"addObject:",_199);
}
objj_msgSend(_194,"setObject:forKey:",_197,objj_msgSend(self,"_columnsKeyForAutosaveName:",_195));
}
}),new objj_method(sel_getUid("_restoreFromAutosave"),function(self,_19a){
with(self){
if(!objj_msgSend(self,"_autosaveEnabled")){
return;
}
var _19b=objj_msgSend(CPUserDefaults,"standardUserDefaults"),_19c=objj_msgSend(self,"autosaveName"),_19d=objj_msgSend(_19b,"objectForKey:",objj_msgSend(self,"_columnsKeyForAutosaveName:",_19c));
for(var i=0;i<objj_msgSend(_19d,"count");i++){
var _19e=objj_msgSend(_19d,"objectAtIndex:",i),_19f=objj_msgSend(_19e,"objectForKey:","identifier"),_1a0=objj_msgSend(self,"columnWithIdentifier:",_19f),_1a1=objj_msgSend(self,"tableColumnWithIdentifier:",_19f);
objj_msgSend(self,"_moveColumn:toColumn:",_1a0,i);
objj_msgSend(_1a1,"setWidth:",objj_msgSend(_19e,"objectForKey:","width"));
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(self,_1a2,_1a3){
with(self){
if(_delegate===_1a3){
return;
}
var _1a4=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_1a4,"removeObserver:name:object:",_delegate,CPTableViewColumnDidMoveNotification,self);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_1a4,"removeObserver:name:object:",_delegate,CPTableViewColumnDidResizeNotification,self);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_1a4,"removeObserver:name:object:",_delegate,CPTableViewSelectionDidChangeNotification,self);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_1a4,"removeObserver:name:object:",_delegate,CPTableViewSelectionIsChangingNotification,self);
}
}
_delegate=_1a3;
_implementedDelegateMethods=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("selectionShouldChangeInTableView:"))){
_implementedDelegateMethods|=_9;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:dataViewForTableColumn:row:"))){
_implementedDelegateMethods|=_a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didClickTableColumn:"))){
_implementedDelegateMethods|=_b;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didDragTableColumn:"))){
_implementedDelegateMethods|=_c;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:heightOfRow:"))){
_implementedDelegateMethods|=_d;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:isGroupRow:"))){
_implementedDelegateMethods|=_e;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:mouseDownInHeaderOfTableColumn:"))){
_implementedDelegateMethods|=_f;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:"))){
_implementedDelegateMethods|=_10;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:selectionIndexesForProposedSelection:"))){
_implementedDelegateMethods|=_11;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldEditTableColumn:row:"))){
_implementedDelegateMethods|=_12;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectRow:"))){
_implementedDelegateMethods|=_13;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectTableColumn:"))){
_implementedDelegateMethods|=_14;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:"))){
_implementedDelegateMethods|=_15;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTrackView:forTableColumn:row:"))){
_implementedDelegateMethods|=_16;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:"))){
_implementedDelegateMethods|=_17;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:"))){
_implementedDelegateMethods|=_18;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:typeSelectStringForTableColumn:row:"))){
_implementedDelegateMethods|=_19;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:willDisplayView:forTableColumn:row:"))){
_implementedDelegateMethods|=_1a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:menuForTableColumn:row:"))){
_implementedDelegateMethods|=_1d;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_1a4,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidMoveNotification,self);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_1a4,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidResize:"),CPTableViewColumnDidResizeNotification,self);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_1a4,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,self);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_1a4,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,self);
}
}
}),new objj_method(sel_getUid("delegate"),function(self,_1a5){
with(self){
return _delegate;
}
}),new objj_method(sel_getUid("_sendDelegateDidClickColumn:"),function(self,_1a6,_1a7){
with(self){
if(_implementedDelegateMethods&_b){
objj_msgSend(_delegate,"tableView:didClickTableColumn:",self,_tableColumns[_1a7]);
}
}
}),new objj_method(sel_getUid("_sendDelegateDidDragColumn:"),function(self,_1a8,_1a9){
with(self){
if(_implementedDelegateMethods&_c){
objj_msgSend(_delegate,"tableView:didDragTableColumn:",self,_tableColumns[_1a9]);
}
}
}),new objj_method(sel_getUid("_sendDelegateDidMouseDownInHeader:"),function(self,_1aa,_1ab){
with(self){
if(_implementedDelegateMethods&_f){
objj_msgSend(_delegate,"tableView:mouseDownInHeaderOfTableColumn:",self,_tableColumns[_1ab]);
}
}
}),new objj_method(sel_getUid("_sendDelegateDeleteKeyPressed"),function(self,_1ac){
with(self){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewDeleteKeyPressed:"))){
objj_msgSend(_delegate,"tableViewDeleteKeyPressed:",self);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("_sendDataSourceSortDescriptorsDidChange:"),function(self,_1ad,_1ae){
with(self){
if(_implementedDataSourceMethods&_8){
objj_msgSend(_dataSource,"tableView:sortDescriptorsDidChange:",self,_1ae);
}
}
}),new objj_method(sel_getUid("_didClickTableColumn:modifierFlags:"),function(self,_1af,_1b0,_1b1){
with(self){
objj_msgSend(self,"_sendDelegateDidClickColumn:",_1b0);
if(_allowsColumnSelection){
objj_msgSend(self,"_noteSelectionIsChanging");
if(_1b1&CPPlatformActionKeyMask){
if(objj_msgSend(self,"isColumnSelected:",_1b0)){
objj_msgSend(self,"deselectColumn:",_1b0);
}else{
if(objj_msgSend(self,"allowsMultipleSelection")==YES){
objj_msgSend(self,"selectColumnIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_1b0),YES);
}
}
return;
}else{
if(_1b1&CPShiftKeyMask){
var _1b2=MIN(_1b0,objj_msgSend(_selectedColumnIndexes,"lastIndex")),_1b3=MAX(_1b0,objj_msgSend(_selectedColumnIndexes,"firstIndex"));
objj_msgSend(self,"selectColumnIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_1b2,_1b3-_1b2+1)),YES);
return;
}else{
objj_msgSend(self,"selectColumnIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_1b0),NO);
}
}
}
objj_msgSend(self,"_changeSortDescriptorsForClickOnColumn:",_1b0);
}
}),new objj_method(sel_getUid("_changeSortDescriptorsForClickOnColumn:"),function(self,_1b4,_1b5){
with(self){
var _1b6=objj_msgSend(_tableColumns,"objectAtIndex:",_1b5),_1b7=objj_msgSend(_1b6,"sortDescriptorPrototype");
if(!_1b7){
return;
}
var _1b8=nil,_1b9=objj_msgSend(self,"sortDescriptors"),_1ba=objj_msgSend(CPArray,"arrayWithArray:",_1b9),e=objj_msgSend(_1ba,"objectEnumerator"),_1bb=nil,_1bc=objj_msgSend(CPArray,"array");
if(objj_msgSend(_sortDescriptors,"count")>0){
_1b8=objj_msgSend(objj_msgSend(self,"sortDescriptors"),"objectAtIndex:",0);
}
while((_1bb=objj_msgSend(e,"nextObject"))!==nil){
if(objj_msgSend(objj_msgSend(_1bb,"key"),"isEqual:",objj_msgSend(_1b7,"key"))){
objj_msgSend(_1bc,"addObject:",_1bb);
}
}
if(objj_msgSend(objj_msgSend(_1b7,"key"),"isEqual:",objj_msgSend(_1b8,"key"))){
_1b7=objj_msgSend(_1b8,"reversedSortDescriptor");
}
objj_msgSend(_1ba,"removeObjectsInArray:",_1bc);
objj_msgSend(_1ba,"insertObject:atIndex:",_1b7,0);
objj_msgSend(self,"setHighlightedTableColumn:",_1b6);
objj_msgSend(self,"setSortDescriptors:",_1ba);
}
}),new objj_method(sel_getUid("setIndicatorImage:inTableColumn:"),function(self,_1bd,_1be,_1bf){
with(self){
if(_1bf){
var _1c0=objj_msgSend(_1bf,"headerView");
if(objj_msgSend(_1c0,"respondsToSelector:",sel_getUid("_setIndicatorImage:"))){
objj_msgSend(_1c0,"_setIndicatorImage:",_1be);
}
}
}
}),new objj_method(sel_getUid("_tableHeaderSortImage"),function(self,_1c1){
with(self){
return objj_msgSend(self,"currentValueForThemeAttribute:","sort-image");
}
}),new objj_method(sel_getUid("_tableHeaderReverseSortImage"),function(self,_1c2){
with(self){
return objj_msgSend(self,"currentValueForThemeAttribute:","sort-image-reversed");
}
}),new objj_method(sel_getUid("highlightedTableColumn"),function(self,_1c3){
with(self){
return _currentHighlightedTableColumn;
}
}),new objj_method(sel_getUid("setHighlightedTableColumn:"),function(self,_1c4,_1c5){
with(self){
if(_currentHighlightedTableColumn==_1c5){
return;
}
if(_headerView){
if(_currentHighlightedTableColumn!=nil){
objj_msgSend(objj_msgSend(_currentHighlightedTableColumn,"headerView"),"unsetThemeState:",CPThemeStateSelected);
}
if(_1c5!=nil){
objj_msgSend(objj_msgSend(_1c5,"headerView"),"setThemeState:",CPThemeStateSelected);
}
}
_currentHighlightedTableColumn=_1c5;
}
}),new objj_method(sel_getUid("canDragRowsWithIndexes:atPoint:"),function(self,_1c6,_1c7,_1c8){
with(self){
return objj_msgSend(_1c7,"count")>0&&objj_msgSend(self,"numberOfRows")>0;
}
}),new objj_method(sel_getUid("dragImageForRowsWithIndexes:tableColumns:event:offset:"),function(self,_1c9,_1ca,_1cb,_1cc,_1cd){
with(self){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:","Frameworks/AppKit/Resources/GenericFile.png",CGSizeMake(32,32));
}
}),new objj_method(sel_getUid("dragViewForRowsWithIndexes:tableColumns:event:offset:"),function(self,_1ce,_1cf,_1d0,_1d1,_1d2){
with(self){
var _1d3=objj_msgSend(self,"bounds"),view=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_1d3);
objj_msgSend(view,"setAlphaValue:",0.7);
var _1d4=objj_msgSend(_1d0,"count");
while(_1d4--){
var _1d5=objj_msgSend(_1d0,"objectAtIndex:",_1d4),row=objj_msgSend(_1cf,"firstIndex");
while(row!==CPNotFound){
var _1d6=objj_msgSend(self,"_newDataViewForRow:tableColumn:",row,_1d5);
objj_msgSend(_1d6,"setFrame:",objj_msgSend(self,"frameOfDataViewAtColumn:row:",_1d4,row));
objj_msgSend(self,"_setObjectValueForTableColumn:row:forView:",_1d5,row,_1d6);
objj_msgSend(view,"addSubview:",_1d6);
row=objj_msgSend(_1cf,"indexGreaterThanIndex:",row);
}
}
var _1d7=objj_msgSend(self,"convertPoint:fromView:",objj_msgSend(_1d1,"locationInWindow"),nil);
_1d2.x=(_1d3.size.width)/2-_1d7.x;
_1d2.y=(_1d3.size.height)/2-_1d7.y;
return view;
}
}),new objj_method(sel_getUid("_dragViewForColumn:event:offset:"),function(self,_1d8,_1d9,_1da,_1db){
with(self){
var _1dc=objj_msgSend(objj_msgSend(_CPColumnDragView,"alloc"),"initWithLineColor:",objj_msgSend(self,"gridColor")),_1dd=objj_msgSend(objj_msgSend(self,"tableColumns"),"objectAtIndex:",_1d9),_1de={origin:{x:0,y:0},size:{width:objj_msgSend(_1dd,"width"),height:(objj_msgSend(self,"exposedRect").size.height)+23}},_1df=objj_msgSend(self,"rectOfColumn:",_1d9),_1e0=objj_msgSend(_1dd,"headerView"),row=objj_msgSend(_exposedRows,"firstIndex");
while(row!==CPNotFound){
var _1e1=objj_msgSend(self,"_newDataViewForRow:tableColumn:",row,_1dd),_1e2=objj_msgSend(self,"frameOfDataViewAtColumn:row:",_1d9,row);
_1e2.origin.x=0;
_1e2.origin.y=((_1e2.origin.y)-(objj_msgSend(self,"exposedRect").origin.y))+23;
objj_msgSend(_1e1,"setFrame:",_1e2);
objj_msgSend(self,"_setObjectValueForTableColumn:row:forView:",_1dd,row,_1e1);
objj_msgSend(_1dc,"addSubview:",_1e1);
row=objj_msgSend(_exposedRows,"indexGreaterThanIndex:",row);
}
var _1e3=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_1e0));
objj_msgSend(_1dc,"addSubview:",_1e3);
objj_msgSend(_1dc,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_1dc,"setAlphaValue:",0.7);
objj_msgSend(_1dc,"setFrame:",_1de);
return _1dc;
}
}),new objj_method(sel_getUid("setDraggingSourceOperationMask:forLocal:"),function(self,_1e4,mask,_1e5){
with(self){
_dragOperationDefaultMask=mask;
}
}),new objj_method(sel_getUid("setDropRow:dropOperation:"),function(self,_1e6,row,_1e7){
with(self){
if(row>objj_msgSend(self,"numberOfRows")&&_1e7===CPTableViewDropOn){
var _1e8=objj_msgSend(self,"numberOfRows")+1,_1e9="Attempt to set dropRow="+row+" dropOperation=CPTableViewDropOn when [0 - "+_1e8+"] is valid range of rows.";
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:","Error",_1e9,nil),"raise");
}
_retargetedDropRow=row;
_retargetedDropOperation=_1e7;
}
}),new objj_method(sel_getUid("setDraggingDestinationFeedbackStyle:"),function(self,_1ea,_1eb){
with(self){
_destinationDragStyle=_1eb;
}
}),new objj_method(sel_getUid("draggingDestinationFeedbackStyle"),function(self,_1ec){
with(self){
return _destinationDragStyle;
}
}),new objj_method(sel_getUid("setVerticalMotionCanBeginDrag:"),function(self,_1ed,_1ee){
with(self){
_verticalMotionCanDrag=_1ee;
}
}),new objj_method(sel_getUid("verticalMotionCanBeginDrag"),function(self,_1ef){
with(self){
return _verticalMotionCanDrag;
}
}),new objj_method(sel_getUid("_tableColumnForSortDescriptor:"),function(self,_1f0,_1f1){
with(self){
var _1f2=objj_msgSend(self,"tableColumns");
for(var i=0;i<objj_msgSend(_1f2,"count");i++){
var _1f3=objj_msgSend(_1f2,"objectAtIndex:",i),_1f4=objj_msgSend(_1f3,"sortDescriptorPrototype");
if(!_1f4){
continue;
}
if(objj_msgSend(_1f4,"key")===objj_msgSend(_1f1,"key")&&objj_msgSend(_1f4,"selector")===objj_msgSend(_1f1,"selector")){
return _1f3;
}
}
return nil;
}
}),new objj_method(sel_getUid("setSortDescriptors:"),function(self,_1f5,_1f6){
with(self){
var _1f7=objj_msgSend(objj_msgSend(self,"sortDescriptors"),"copy"),_1f8=nil;
if(_1f6==nil){
_1f8=objj_msgSend(CPArray,"array");
}else{
_1f8=objj_msgSend(CPArray,"arrayWithArray:",_1f6);
}
if(objj_msgSend(_1f8,"isEqual:",_1f7)){
return;
}
_sortDescriptors=_1f8;
var _1f9=nil,_1fa=nil;
if(objj_msgSend(_1f8,"count")>0){
var _1fb=objj_msgSend(_1f8,"objectAtIndex:",0);
_1fa=objj_msgSend(self,"_tableColumnForSortDescriptor:",_1fb);
}
if(objj_msgSend(_1f7,"count")>0){
var _1fc=objj_msgSend(_1f7,"objectAtIndex:",0);
_1f9=objj_msgSend(self,"_tableColumnForSortDescriptor:",_1fc);
}
var _1fd=objj_msgSend(_1fb,"ascending")?objj_msgSend(self,"_tableHeaderSortImage"):objj_msgSend(self,"_tableHeaderReverseSortImage");
objj_msgSend(self,"setIndicatorImage:inTableColumn:",nil,_1f9);
objj_msgSend(self,"setIndicatorImage:inTableColumn:",_1fd,_1fa);
objj_msgSend(self,"_sendDataSourceSortDescriptorsDidChange:",_1f7);
var _1fe=objj_msgSend(objj_msgSend(self,"class"),"_binderClassForBinding:","sortDescriptors");
objj_msgSend(objj_msgSend(_1fe,"getBinding:forObject:","sortDescriptors",self),"reverseSetValueFor:","sortDescriptors");
}
}),new objj_method(sel_getUid("sortDescriptors"),function(self,_1ff){
with(self){
return _sortDescriptors;
}
}),new objj_method(sel_getUid("_objectValueForTableColumn:row:"),function(self,_200,_201,_202){
with(self){
var _203=objj_msgSend(_201,"UID"),_204=_objectValues[_203];
if(!_204){
_204=[];
_objectValues[_203]=_204;
}
var _205=_204[_202];
if(_205===undefined){
if(_implementedDataSourceMethods&_2){
_205=objj_msgSend(_dataSource,"tableView:objectValueForTableColumn:row:",self,_201,_202);
_204[_202]=_205;
}else{
if(!objj_msgSend(self,"infoForBinding:","content")){
CPLog("no content binding established and data source "+objj_msgSend(_dataSource,"description")+" does not implement tableView:objectValueForTableColumn:row:");
}
}
}
return _205;
}
}),new objj_method(sel_getUid("exposedRect"),function(self,_206){
with(self){
if(!_exposedRect){
var _207=objj_msgSend(self,"superview");
if(objj_msgSend(_207,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
_exposedRect=objj_msgSend(_207,"bounds");
}else{
_exposedRect=objj_msgSend(self,"bounds");
}
}
return _exposedRect;
}
}),new objj_method(sel_getUid("load"),function(self,_208){
with(self){
if(_reloadAllRows){
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_exposedRows,_exposedColumns);
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_reloadAllRows=NO;
}
var _209=objj_msgSend(self,"exposedRect"),_20a=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_209)),_20b=objj_msgSend(self,"columnIndexesInRect:",_209),_20c=objj_msgSend(_exposedRows,"copy"),_20d=objj_msgSend(_exposedColumns,"copy");
objj_msgSend(_20c,"removeIndexes:",_20a);
objj_msgSend(_20d,"removeIndexes:",_20b);
var _20e=objj_msgSend(_20a,"copy"),_20f=objj_msgSend(_20b,"copy");
objj_msgSend(_20e,"removeIndexes:",_exposedRows);
objj_msgSend(_20f,"removeIndexes:",_exposedColumns);
var _210=objj_msgSend(_20a,"copy"),_211=objj_msgSend(_20b,"copy");
objj_msgSend(_210,"removeIndexes:",_20e);
objj_msgSend(_211,"removeIndexes:",_20f);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_210,_20d);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_20c,_211);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_20c,_20d);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_20e,_20f);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_210,_20f);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_20e,_211);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_20e,_20f);
_exposedRows=_20a;
_exposedColumns=_20b;
objj_msgSend(_tableDrawView,"setFrame:",_209);
objj_msgSend(self,"setNeedsDisplay:",YES);
for(var _212 in _cachedDataViews){
var _213=_cachedDataViews[_212],_214=_213.length;
while(_214--){
objj_msgSend(_213[_214],"removeFromSuperview");
}
}
if(objj_msgSend(_differedColumnDataToRemove,"count")){
for(var i=0;i<_differedColumnDataToRemove.length;i++){
var data=_differedColumnDataToRemove[i],_215=data.column;
objj_msgSend(_215,"setHidden:",data.shouldBeHidden);
objj_msgSend(_tableColumns,"removeObject:",_215);
}
objj_msgSend(_differedColumnDataToRemove,"removeAllObjects");
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(self,_216,rows,_217){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_217,"count")){
return;
}
var _218=[],_219=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_218,-1,nil);
objj_msgSend(_217,"getIndexes:maxCount:inIndexRange:",_219,-1,nil);
var _21a=0,_21b=_219.length;
for(;_21a<_21b;++_21a){
var _21c=_219[_21a],_21d=_tableColumns[_21c],_21e=objj_msgSend(_21d,"UID"),_21f=0,_220=_218.length;
for(;_21f<_220;++_21f){
var row=_218[_21f],_221=_dataViewsForTableColumns[_21e];
if(!_221||row>=_221.length){
continue;
}
var _222=objj_msgSend(_221,"objectAtIndex:",row);
objj_msgSend(_221,"replaceObjectAtIndex:withObject:",row,nil);
objj_msgSend(self,"_enqueueReusableDataView:",_222);
}
}
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(self,_223,rows,_224){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_224,"count")){
return;
}
var _225=[],_226=[],_227=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_225,-1,nil);
objj_msgSend(_224,"getIndexes:maxCount:inIndexRange:",_227,-1,nil);
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var _228=0,_229=_227.length;
for(;_228<_229;++_228){
var _22a=_227[_228],_22b=_tableColumns[_22a];
if(objj_msgSend(_22b,"isHidden")||_22b===_draggedColumn){
continue;
}
var _22c=objj_msgSend(_22b,"UID");
if(!_dataViewsForTableColumns[_22c]){
_dataViewsForTableColumns[_22c]=[];
}
var _22d=0,_22e=_225.length,_22f=objj_msgSend(_selectedColumnIndexes,"containsIndex:",_22a);
for(;_22d<_22e;++_22d){
var row=_225[_22d],_230=objj_msgSend(self,"_newDataViewForRow:tableColumn:",row,_22b),_231=objj_msgSend(_230,"isKindOfClass:",objj_msgSend(CPButton,"class")),_232=objj_msgSend(_230,"isKindOfClass:",objj_msgSend(CPTextField,"class"));
objj_msgSend(_230,"setFrame:",objj_msgSend(self,"frameOfDataViewAtColumn:row:",_22a,row));
objj_msgSend(self,"_setObjectValueForTableColumn:row:forView:",_22b,row,_230);
if(_22f||objj_msgSend(self,"isRowSelected:",row)){
objj_msgSend(_230,"setThemeState:",CPThemeStateSelectedDataView);
}else{
objj_msgSend(_230,"unsetThemeState:",CPThemeStateSelectedDataView);
}
if(_implementedDelegateMethods&_e){
if(objj_msgSend(_delegate,"tableView:isGroupRow:",self,row)){
objj_msgSend(_groupRows,"addIndex:",row);
objj_msgSend(_230,"setThemeState:",CPThemeStateGroupRow);
}else{
objj_msgSend(_groupRows,"removeIndexesInRange:",CPMakeRange(row,1));
objj_msgSend(_230,"unsetThemeState:",CPThemeStateGroupRow);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
}
if(_implementedDelegateMethods&_1a){
objj_msgSend(_delegate,"tableView:willDisplayView:forTableColumn:row:",self,_230,_22b,row);
}
if(objj_msgSend(_230,"superview")!==self){
objj_msgSend(self,"addSubview:",_230);
}
_dataViewsForTableColumns[_22c][row]=_230;
if(_231||(_editingCellIndex&&_editingCellIndex.x===_22a&&_editingCellIndex.y===row)){
if(_232){
objj_msgSend(_230,"setEditable:",YES);
objj_msgSend(_230,"setSendsActionOnEndEditing:",YES);
objj_msgSend(_230,"setSelectable:",YES);
objj_msgSend(_230,"selectText:",nil);
objj_msgSend(_230,"setBezeled:",YES);
objj_msgSend(_230,"setDelegate:",self);
}
objj_msgSend(_230,"setTarget:",self);
objj_msgSend(_230,"setAction:",sel_getUid("_commitDataViewObjectValue:"));
_230.tableViewEditedColumnObj=_22b;
_230.tableViewEditedRowIndex=row;
}else{
if(_232){
objj_msgSend(_230,"setEditable:",NO);
objj_msgSend(_230,"setSelectable:",NO);
}
}
}
}
}
}),new objj_method(sel_getUid("_setObjectValueForTableColumn:row:forView:"),function(self,_233,_234,aRow,_235){
with(self){
if(_implementedDataSourceMethods&_2){
objj_msgSend(_235,"setObjectValue:",objj_msgSend(self,"_objectValueForTableColumn:row:",_234,aRow));
}
if(_contentBindingExpicitelySet){
objj_msgSend(self,"_prepareContentBindedDataView:forRow:",_235,aRow);
}else{
objj_msgSend(_234,"_prepareDataView:forRow:",_235,aRow);
}
}
}),new objj_method(sel_getUid("_prepareContentBindedDataView:forRow:"),function(self,_236,_237,aRow){
with(self){
var _238=objj_msgSend(CPTableContentBinder,"getBinding:forObject:","content",self),_239=objj_msgSend(_238,"content"),_23a=objj_msgSend(_239,"objectAtIndex:",aRow);
objj_msgSend(_237,"setObjectValue:",_23a);
}
}),new objj_method(sel_getUid("_layoutDataViewsInRows:columns:"),function(self,_23b,rows,_23c){
with(self){
var _23d=[],_23e=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_23d,-1,nil);
objj_msgSend(_23c,"getIndexes:maxCount:inIndexRange:",_23e,-1,nil);
var _23f=0,_240=_23e.length;
for(;_23f<_240;++_23f){
var _241=_23e[_23f],_242=_tableColumns[_241],_243=objj_msgSend(_242,"UID"),_244=_dataViewsForTableColumns[_243],_245=0,_246=_23d.length;
for(;_245<_246;++_245){
var row=_23d[_245],_247=_244[row];
objj_msgSend(_247,"setFrame:",objj_msgSend(self,"frameOfDataViewAtColumn:row:",_241,row));
}
}
}
}),new objj_method(sel_getUid("_commitDataViewObjectValue:"),function(self,_248,_249){
with(self){
if(objj_msgSend(_249,"respondsToSelector:",sel_getUid("sendsActionOnEndEditing"))&&objj_msgSend(_249,"sendsActionOnEndEditing")&&_editingCellIndex===nil){
return;
}
_editingCellIndex=nil;
if(_implementedDataSourceMethods&_3){
objj_msgSend(_dataSource,"tableView:setObjectValue:forTableColumn:row:",self,objj_msgSend(_249,"objectValue"),_249.tableViewEditedColumnObj,_249.tableViewEditedRowIndex);
}
objj_msgSend(_249.tableViewEditedColumnObj,"_reverseSetDataView:forRow:",_249,_249.tableViewEditedRowIndex);
if(objj_msgSend(_249,"respondsToSelector:",sel_getUid("setEditable:"))){
objj_msgSend(_249,"setEditable:",NO);
}
if(objj_msgSend(_249,"respondsToSelector:",sel_getUid("setSelectable:"))){
objj_msgSend(_249,"setSelectable:",NO);
}
if(objj_msgSend(_249,"isKindOfClass:",objj_msgSend(CPTextField,"class"))){
objj_msgSend(_249,"setBezeled:",NO);
}
objj_msgSend(self,"reloadDataForRowIndexes:columnIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_249.tableViewEditedRowIndex),objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_tableColumns,"indexOfObject:",_249.tableViewEditedColumnObj)));
objj_msgSend(objj_msgSend(self,"window"),"makeFirstResponder:",self);
}
}),new objj_method(sel_getUid("controlTextDidBlur:"),function(self,_24a,_24b){
with(self){
var _24c=objj_msgSend(_24b,"object");
if(objj_msgSend(_24c,"respondsToSelector:",sel_getUid("setEditable:"))){
objj_msgSend(_24c,"setEditable:",NO);
}
if(objj_msgSend(_24c,"respondsToSelector:",sel_getUid("setSelectable:"))){
objj_msgSend(_24c,"setSelectable:",NO);
}
if(objj_msgSend(_24c,"isKindOfClass:",objj_msgSend(CPTextField,"class"))){
objj_msgSend(_24c,"setBezeled:",NO);
}
_editingCellIndex=nil;
}
}),new objj_method(sel_getUid("_newDataViewForRow:tableColumn:"),function(self,_24d,aRow,_24e){
with(self){
if((_implementedDelegateMethods&_a)){
var _24f=objj_msgSend(_delegate,"tableView:dataViewForTableColumn:row:",self,_24e,aRow);
objj_msgSend(_24e,"setDataView:",_24f);
}
return objj_msgSend(_24e,"_newDataViewForRow:",aRow);
}
}),new objj_method(sel_getUid("_enqueueReusableDataView:"),function(self,_250,_251){
with(self){
if(!_251){
return;
}
var _252=_251.identifier;
if(!_cachedDataViews[_252]){
_cachedDataViews[_252]=[_251];
}else{
_cachedDataViews[_252].push(_251);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_253,_254){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"setFrameSize:",_254);
if(_headerView){
objj_msgSend(_headerView,"setFrameSize:",{width:(objj_msgSend(self,"frame").size.width),height:(objj_msgSend(_headerView,"frame").size.height)});
}
_exposedRect=nil;
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(self,_255,_256){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"setFrameOrigin:",_256);
_exposedRect=nil;
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(self,_257,_258){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"setBoundsOrigin:",_258);
_exposedRect=nil;
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(self,_259,_25a){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"setBoundsSize:",_25a);
_exposedRect=nil;
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_25b,_25c){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"setNeedsDisplay:",_25c);
objj_msgSend(_tableDrawView,"setNeedsDisplay:",_25c);
objj_msgSend(objj_msgSend(self,"headerView"),"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(self,_25d){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"setNeedsLayout");
objj_msgSend(objj_msgSend(self,"headerView"),"setNeedsLayout");
}
}),new objj_method(sel_getUid("_drawRect:"),function(self,_25e,_25f){
with(self){
var _260=objj_msgSend(self,"exposedRect");
objj_msgSend(self,"drawBackgroundInClipRect:",_260);
objj_msgSend(self,"highlightSelectionInClipRect:",_260);
objj_msgSend(self,"drawGridInClipRect:",_260);
if(_implementsCustomDrawRow){
objj_msgSend(self,"_drawRows:clipRect:",_exposedRows,_260);
}
}
}),new objj_method(sel_getUid("drawBackgroundInClipRect:"),function(self,_261,_262){
with(self){
if(!_usesAlternatingRowBackgroundColors){
return;
}
var _263=objj_msgSend(self,"alternatingRowBackgroundColors"),_264=objj_msgSend(_263,"count");
if(_264===0){
return;
}
var _265=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
if(_264===1){
CGContextSetFillColor(_265,_263[0]);
CGContextFillRect(_265,_262);
return;
}
var _266=objj_msgSend(self,"_unboundedRowsInRect:",_262),_267=FLOOR(_266.location/_264)*_264,_268=CPMaxRange(_266),_269=0,_26a=[];
while(_269<_264){
CGContextBeginPath(_265);
for(var row=_267+_269;row<=_268;row+=_264){
if(!objj_msgSend(_groupRows,"containsIndex:",row)){
CGContextAddRect(_265,CGRectIntersection(_262,objj_msgSend(self,"_rectOfRow:checkRange:",row,NO)));
}else{
_26a.push(CGRectIntersection(_262,objj_msgSend(self,"_rectOfRow:checkRange:",row,NO)));
}
}
CGContextClosePath(_265);
CGContextSetFillColor(_265,_263[_269]);
CGContextFillPath(_265);
_269++;
}
objj_msgSend(self,"_drawGroupRowsForRects:",_26a);
}
}),new objj_method(sel_getUid("drawGridInClipRect:"),function(self,_26b,_26c){
with(self){
var _26d=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_26e=objj_msgSend(self,"gridStyleMask");
if(!(_26e&(CPTableViewSolidHorizontalGridLineMask|CPTableViewSolidVerticalGridLineMask))){
return;
}
CGContextBeginPath(_26d);
if(_26e&CPTableViewSolidHorizontalGridLineMask){
var _26f=objj_msgSend(self,"_unboundedRowsInRect:",_26c),row=_26f.location,_270=CPMaxRange(_26f)-1,rowY=-0.5,minX=(_26c.origin.x),maxX=(_26c.origin.x+_26c.size.width);
for(;row<=_270;++row){
var _271=objj_msgSend(self,"_rectOfRow:checkRange:",row,NO),rowY=(_271.origin.y+_271.size.height)-0.5;
CGContextMoveToPoint(_26d,minX,rowY);
CGContextAddLineToPoint(_26d,maxX,rowY);
}
if(_rowHeight>0){
var _272=_rowHeight+_intercellSpacing.height,_273=(_26c.origin.y+_26c.size.height);
while(rowY<_273){
rowY+=_272;
CGContextMoveToPoint(_26d,minX,rowY);
CGContextAddLineToPoint(_26d,maxX,rowY);
}
}
}
if(_26e&CPTableViewSolidVerticalGridLineMask){
var _274=objj_msgSend(self,"columnIndexesInRect:",_26c),_275=[];
objj_msgSend(_274,"getIndexes:maxCount:inIndexRange:",_275,-1,nil);
var _276=0,_277=_275.length,minY=(_26c.origin.y),maxY=(_26c.origin.y+_26c.size.height);
for(;_276<_277;++_276){
var _278=objj_msgSend(self,"rectOfColumn:",_275[_276]),_279=(_278.origin.x+_278.size.width)-0.5;
CGContextMoveToPoint(_26d,_279,minY);
CGContextAddLineToPoint(_26d,_279,maxY);
}
}
CGContextClosePath(_26d);
CGContextSetStrokeColor(_26d,objj_msgSend(self,"gridColor"));
CGContextStrokePath(_26d);
}
}),new objj_method(sel_getUid("highlightSelectionInClipRect:"),function(self,_27a,_27b){
with(self){
if(_selectionHighlightStyle===CPTableViewSelectionHighlightStyleNone){
return;
}
var _27c=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_27d=[],_27e=sel_getUid("rectOfRow:");
if(objj_msgSend(_selectedRowIndexes,"count")>=1){
var _27f=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_27b)),_280=objj_msgSend(_27f,"firstIndex"),_281=CPMakeRange(_280,objj_msgSend(_27f,"lastIndex")-_280+1);
objj_msgSend(_selectedRowIndexes,"getIndexes:maxCount:inIndexRange:",_27d,-1,_281);
}else{
if(objj_msgSend(_selectedColumnIndexes,"count")>=1){
_27e=sel_getUid("rectOfColumn:");
var _282=objj_msgSend(self,"columnIndexesInRect:",_27b),_283=objj_msgSend(_282,"firstIndex"),_281=CPMakeRange(_283,objj_msgSend(_282,"lastIndex")-_283+1);
objj_msgSend(_selectedColumnIndexes,"getIndexes:maxCount:inIndexRange:",_27d,-1,_281);
}
}
var _284,_285=_284=objj_msgSend(_27d,"count");
if(!_284){
return;
}
var _286=(CPFeatureIsCompatible(CPHTMLCanvasFeature)&&_selectionHighlightStyle===CPTableViewSelectionHighlightStyleSourceList&&objj_msgSend(_selectedRowIndexes,"count")>=1),_287=0.5*(_gridStyleMask&CPTableViewSolidHorizontalGridLineMask);
CGContextBeginPath(_27c);
if(_286){
var _288=objj_msgSend(self,"selectionGradientColors"),_289=objj_msgSend(_288,"objectForKey:",CPSourceListTopLineColor),_28a=objj_msgSend(_288,"objectForKey:",CPSourceListBottomLineColor),_28b=objj_msgSend(_288,"objectForKey:",CPSourceListGradient);
}
var _28c=objj_msgSend(self,"selectionHighlightColor");
if(objj_msgSend(_groupRows,"count")){
var _28d=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",212/255,1),_28e=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",185/255,1),_28f=CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(),[212/255,212/255,212/255,1,197/255,197/255,197/255,1],[0,1],2);
}
while(_284--){
var _290=_27d[_284],_291=CGRectIntersection(objj_msgSend(self,_27e,_290),_27b);
if(!_286){
var _292=objj_msgSend(_groupRows,"containsIndex:",_290);
}
if(_286||_292){
var minX=(_291.origin.x),minY=(_291.origin.y),maxX=(_291.origin.x+_291.size.width),maxY=(_291.origin.y+_291.size.height)-_287;
if(!_286){
objj_msgSend(_28c,"setFill");
CGContextClosePath(_27c);
CGContextFillPath(_27c);
CGContextBeginPath(_27c);
}
CGContextAddRect(_27c,_291);
CGContextDrawLinearGradient(_27c,(_292)?_28f:_28b,_291.origin,{x:minX,y:maxY},0);
CGContextClosePath(_27c);
CGContextBeginPath(_27c);
CGContextMoveToPoint(_27c,minX,minY+0.5);
CGContextAddLineToPoint(_27c,maxX,minY+0.5);
CGContextClosePath(_27c);
CGContextSetStrokeColor(_27c,(_292)?_28d:_289);
CGContextStrokePath(_27c);
CGContextBeginPath(_27c);
CGContextMoveToPoint(_27c,minX,maxY-0.5);
CGContextAddLineToPoint(_27c,maxX,maxY-0.5);
CGContextClosePath(_27c);
CGContextSetStrokeColor(_27c,(_292)?_28e:_28a);
CGContextStrokePath(_27c);
}else{
var _293=objj_msgSend(self,"currentValueForThemeAttribute:","selection-radius");
if(_293>0){
var minX=CGRectGetMinX(_291),maxX=CGRectGetMaxX(_291),minY=CGRectGetMinY(_291),maxY=CGRectGetMaxY(_291);
CGContextMoveToPoint(_27c,minX+_293,minY);
CGContextAddArcToPoint(_27c,maxX,minY,maxX,minY+_293,_293);
CGContextAddArcToPoint(_27c,maxX,maxY,maxX-_293,maxY,_293);
CGContextAddArcToPoint(_27c,minX,maxY,minX,maxY-_293,_293);
CGContextAddArcToPoint(_27c,minX,minY,minX+_293,minY,_293);
}else{
CGContextAddRect(_27c,_291);
}
}
}
CGContextClosePath(_27c);
if(!_286){
objj_msgSend(_28c,"setFill");
CGContextFillPath(_27c);
}
CGContextBeginPath(_27c);
var _294=objj_msgSend(self,"gridStyleMask");
for(var i=0;i<_285;i++){
var rect=objj_msgSend(self,_27e,_27d[i]),minX=(rect.origin.x)-0.5,maxX=(rect.origin.x+rect.size.width)-0.5,minY=(rect.origin.y)-0.5,maxY=(rect.origin.y+rect.size.height)-0.5;
if(objj_msgSend(_selectedRowIndexes,"count")>=1&&_294&CPTableViewSolidVerticalGridLineMask){
var _282=objj_msgSend(self,"columnIndexesInRect:",_27b),_295=[],_296=objj_msgSend(_282,"firstIndex"),_281=CPMakeRange(_296,objj_msgSend(_282,"lastIndex")-_296+1);
objj_msgSend(_282,"getIndexes:maxCount:inIndexRange:",_295,-1,_281);
var _297=objj_msgSend(_295,"count");
for(var c=_296;c<_297;c++){
var _298=objj_msgSend(self,"rectOfColumn:",_295[c]),colX=(_298.origin.x+_298.size.width)+0.5;
CGContextMoveToPoint(_27c,colX,minY);
CGContextAddLineToPoint(_27c,colX,maxY);
}
}
if(objj_msgSend(_27d,"containsObject:",_27d[i]+1)){
CGContextMoveToPoint(_27c,minX,maxY);
CGContextAddLineToPoint(_27c,maxX,maxY);
}
}
CGContextClosePath(_27c);
CGContextSetStrokeColor(_27c,objj_msgSend(self,"currentValueForThemeAttribute:","highlighted-grid-color"));
CGContextStrokePath(_27c);
}
}),new objj_method(sel_getUid("_drawGroupRowsForRects:"),function(self,_299,_29a){
with(self){
if((CPFeatureIsCompatible(CPHTMLCanvasFeature)&&_selectionHighlightStyle===CPTableViewSelectionHighlightStyleSourceList)||!_29a.length){
return;
}
var _29b=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),i=_29a.length;
CGContextBeginPath(_29b);
var _29c=objj_msgSend(self,"selectionGradientColors"),_29d=objj_msgSend(CPColor,"colorWithHexString:","d3d3d3"),_29e=objj_msgSend(CPColor,"colorWithHexString:","bebebd"),_29f=CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(),[220/255,220/255,220/255,1,199/255,199/255,199/255,1],[0,1],2),_2a0=YES;
while(i--){
var _2a1=_29a[i];
CGContextAddRect(_29b,_2a1);
if(_2a0){
var minX=CGRectGetMinX(_2a1),minY=CGRectGetMinY(_2a1),maxX=CGRectGetMaxX(_2a1),maxY=CGRectGetMaxY(_2a1);
CGContextDrawLinearGradient(_29b,_29f,_2a1.origin,CGPointMake(minX,maxY),0);
CGContextClosePath(_29b);
CGContextBeginPath(_29b);
CGContextMoveToPoint(_29b,minX,minY);
CGContextAddLineToPoint(_29b,maxX,minY);
CGContextClosePath(_29b);
CGContextSetStrokeColor(_29b,_29d);
CGContextStrokePath(_29b);
CGContextBeginPath(_29b);
CGContextMoveToPoint(_29b,minX,maxY);
CGContextAddLineToPoint(_29b,maxX,maxY-1);
CGContextClosePath(_29b);
CGContextSetStrokeColor(_29b,_29e);
CGContextStrokePath(_29b);
}
}
CGContextClosePath(_29b);
}
}),new objj_method(sel_getUid("_drawRows:clipRect:"),function(self,_2a2,_2a3,_2a4){
with(self){
var row=objj_msgSend(_2a3,"firstIndex");
while(row!==CPNotFound){
objj_msgSend(self,"drawRow:clipRect:",row,CGRectIntersection(_2a4,objj_msgSend(self,"rectOfRow:",row)));
row=objj_msgSend(_2a3,"indexGreaterThanIndex:",row);
}
}
}),new objj_method(sel_getUid("drawRow:clipRect:"),function(self,_2a5,row,rect){
with(self){
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_2a6){
with(self){
objj_msgSend(self,"load");
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(self,_2a7,_2a8){
with(self){
var _2a9=objj_msgSend(self,"superview"),_2aa=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_2a9){
objj_msgSend(_2aa,"removeObserver:name:object:",self,CPViewFrameDidChangeNotification,_2a9);
objj_msgSend(_2aa,"removeObserver:name:object:",self,CPViewBoundsDidChangeNotification,_2a9);
}
if(objj_msgSend(_2a8,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
objj_msgSend(_2a8,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_2a8,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_2aa,"addObserver:selector:name:object:",self,sel_getUid("superviewFrameChanged:"),CPViewFrameDidChangeNotification,_2a8);
objj_msgSend(_2aa,"addObserver:selector:name:object:",self,sel_getUid("superviewBoundsChanged:"),CPViewBoundsDidChangeNotification,_2a8);
}
}
}),new objj_method(sel_getUid("superviewBoundsChanged:"),function(self,_2ab,_2ac){
with(self){
_exposedRect=nil;
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("superviewFrameChanged:"),function(self,_2ad,_2ae){
with(self){
_exposedRect=nil;
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(self,_2af){
with(self){
return YES;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(self,_2b0,_2b1){
with(self){
objj_msgSend(objj_msgSend(self,"window"),"makeFirstResponder:",self);
var row=objj_msgSend(self,"rowAtPoint:",_2b1);
if(row<0&&_allowsEmptySelection){
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSet"),NO);
}
objj_msgSend(self,"_noteSelectionIsChanging");
if(objj_msgSend(self,"mouseDownFlags")&CPShiftKeyMask){
_selectionAnchorRow=(ABS(objj_msgSend(_selectedRowIndexes,"firstIndex")-row)<ABS(objj_msgSend(_selectedRowIndexes,"lastIndex")-row))?objj_msgSend(_selectedRowIndexes,"firstIndex"):objj_msgSend(_selectedRowIndexes,"lastIndex");
}else{
_selectionAnchorRow=row;
}
_startTrackingPoint=_2b1;
_startTrackingTimestamp=new Date();
if(_implementedDataSourceMethods&_3){
_trackingPointMovedOutOfClickSlop=NO;
}
if(row>=0&&!(_implementedDataSourceMethods&_7)){
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",row);
}
return YES;
}
}),new objj_method(sel_getUid("menuForEvent:"),function(self,_2b2,_2b3){
with(self){
if(!(_implementedDelegateMethods&_1d)){
return objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"menuForEvent:",_2b3);
}
var _2b4=objj_msgSend(self,"convertPoint:fromView:",objj_msgSend(_2b3,"locationInWindow"),nil),row=objj_msgSend(self,"rowAtPoint:",_2b4),_2b5=objj_msgSend(self,"columnAtPoint:",_2b4),_2b6=objj_msgSend(objj_msgSend(self,"tableColumns"),"objectAtIndex:",_2b5);
return objj_msgSend(_delegate,"tableView:menuForTableColumn:row:",self,_2b6,row);
}
}),new objj_method(sel_getUid("trackMouse:"),function(self,_2b7,_2b8){
with(self){
if(!objj_msgSend(_draggedRowIndexes,"count")){
objj_msgSend(self,"autoscroll:",_2b8);
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"trackMouse:",_2b8);
}else{
objj_msgSend(CPApp,"sendEvent:",_2b8);
}
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(self,_2b9,_2ba,_2bb){
with(self){
var row=objj_msgSend(self,"rowAtPoint:",_2bb);
if(!_isSelectingSession&&_implementedDataSourceMethods&_7){
if(row>=0&&(ABS(_startTrackingPoint.x-_2bb.x)>3||(_verticalMotionCanDrag&&ABS(_startTrackingPoint.y-_2bb.y)>3))||(objj_msgSend(_selectedRowIndexes,"containsIndex:",row))){
if(objj_msgSend(_selectedRowIndexes,"containsIndex:",row)){
_draggedRowIndexes=objj_msgSend(objj_msgSend(CPIndexSet,"alloc"),"initWithIndexSet:",_selectedRowIndexes);
}else{
_draggedRowIndexes=objj_msgSend(CPIndexSet,"indexSetWithIndex:",row);
}
var _2bc=objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard);
if(objj_msgSend(self,"canDragRowsWithIndexes:atPoint:",_draggedRowIndexes,_2bb)&&objj_msgSend(_dataSource,"tableView:writeRowsWithIndexes:toPasteboard:",self,_draggedRowIndexes,_2bc)){
var _2bd=objj_msgSend(CPApp,"currentEvent"),_2be=CPPointMakeZero(),_2bf=objj_msgSend(_tableColumns,"objectsAtIndexes:",_exposedColumns);
var view=objj_msgSend(self,"dragViewForRowsWithIndexes:tableColumns:event:offset:",_draggedRowIndexes,_2bf,_2bd,_2be);
if(!view){
var _2c0=objj_msgSend(self,"dragImageForRowsWithIndexes:tableColumns:event:offset:",_draggedRowIndexes,_2bf,_2bd,_2be);
view=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CPMakeRect(0,0,objj_msgSend(_2c0,"size").width,objj_msgSend(_2c0,"size").height));
objj_msgSend(view,"setImage:",_2c0);
}
var _2c1=objj_msgSend(view,"bounds"),_2c2=CPPointMake(_2bb.x-CGRectGetWidth(_2c1)/2+_2be.x,_2bb.y-CGRectGetHeight(_2c1)/2+_2be.y);
objj_msgSend(self,"dragView:at:offset:event:pasteboard:source:slideBack:",view,_2c2,CPPointMakeZero(),objj_msgSend(CPApp,"currentEvent"),_2bc,self,YES);
_startTrackingPoint=nil;
return NO;
}
_draggedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
}else{
if(ABS(_startTrackingPoint.x-_2bb.x)<5&&ABS(_startTrackingPoint.y-_2bb.y)<5){
return YES;
}
}
}
_isSelectingSession=YES;
if(row>=0&&row!==_lastTrackedRowIndex){
_lastTrackedRowIndex=row;
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",row);
}
if((_implementedDataSourceMethods&_3)&&!_trackingPointMovedOutOfClickSlop){
var _2c3=5;
if(ABS(_2bb.x-_startTrackingPoint.x)>_2c3||ABS(_2bb.y-_startTrackingPoint.y)>_2c3){
_trackingPointMovedOutOfClickSlop=YES;
}
}
return YES;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(self,_2c4,_2c5,_2c6,_2c7){
with(self){
_isSelectingSession=NO;
var _2c8=1000,_2c9,_2ca,_2cb,_2cc=YES;
if(_implementedDataSourceMethods&_7){
_2cb=objj_msgSend(self,"rowAtPoint:",_2c6);
if(_2cb!==-1){
if(objj_msgSend(_draggedRowIndexes,"count")>0){
_draggedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
return;
}
_previouslySelectedRowIndexes=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",_2cb);
}
}
if(_2c7&&!_trackingPointMovedOutOfClickSlop&&(objj_msgSend(objj_msgSend(CPApp,"currentEvent"),"clickCount")>1)&&((_implementedDataSourceMethods&_3)||objj_msgSend(self,"infoForBinding:","content"))){
_2c9=objj_msgSend(self,"columnAtPoint:",_2c5);
if(_2c9!==-1){
_2ca=_tableColumns[_2c9];
if(objj_msgSend(_2ca,"isEditable")){
_2cb=objj_msgSend(self,"rowAtPoint:",_2c6);
if(_2cb!==-1){
if(_implementedDelegateMethods&_12){
_2cc=objj_msgSend(_delegate,"tableView:shouldEditTableColumn:row:",self,_2ca,_2cb);
}
if(_2cc){
objj_msgSend(self,"editColumn:row:withEvent:select:",_2c9,_2cb,nil,YES);
return;
}
}
}
}
}
if(objj_msgSend(objj_msgSend(CPApp,"currentEvent"),"clickCount")===2&&_doubleAction){
_clickedRow=objj_msgSend(self,"rowAtPoint:",_2c6);
objj_msgSend(self,"sendAction:to:",_doubleAction,_target);
}
}
}),new objj_method(sel_getUid("draggingEntered:"),function(self,_2cd,_2ce){
with(self){
var _2cf=objj_msgSend(self,"convertPoint:fromView:",objj_msgSend(_2ce,"draggingLocation"),nil),_2d0=objj_msgSend(self,"_proposedDropOperationAtPoint:",_2cf),row=objj_msgSend(self,"_proposedRowAtPoint:",_2cf);
if(_retargetedDropRow!==nil){
row=_retargetedDropRow;
}
var _2d1=objj_msgSend(self,"registeredDraggedTypes"),_2d2=objj_msgSend(_2d1,"count"),i=0;
for(;i<_2d2;i++){
if(objj_msgSend(objj_msgSend(objj_msgSend(_2ce,"draggingPasteboard"),"types"),"containsObject:",objj_msgSend(_2d1,"objectAtIndex:",i))){
return objj_msgSend(self,"_validateDrop:proposedRow:proposedDropOperation:",_2ce,row,_2d0);
}
}
return CPDragOperationNone;
}
}),new objj_method(sel_getUid("draggingExited:"),function(self,_2d3,_2d4){
with(self){
objj_msgSend(_dropOperationFeedbackView,"removeFromSuperview");
}
}),new objj_method(sel_getUid("draggingEnded:"),function(self,_2d5,_2d6){
with(self){
objj_msgSend(self,"_draggingEnded");
}
}),new objj_method(sel_getUid("_draggingEnded"),function(self,_2d7){
with(self){
_retargetedDropOperation=nil;
_retargetedDropRow=nil;
_draggedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
objj_msgSend(_dropOperationFeedbackView,"removeFromSuperview");
}
}),new objj_method(sel_getUid("wantsPeriodicDraggingUpdates"),function(self,_2d8){
with(self){
return YES;
}
}),new objj_method(sel_getUid("_proposedDropOperationAtPoint:"),function(self,_2d9,_2da){
with(self){
if(_retargetedDropOperation!==nil){
return _retargetedDropOperation;
}
var row=objj_msgSend(self,"_proposedRowAtPoint:",_2da),_2db=objj_msgSend(self,"rectOfRow:",row);
if(objj_msgSend(self,"intercellSpacing").height<5){
_2db=CPRectInset(_2db,0,5-objj_msgSend(self,"intercellSpacing").height);
}
if(CGRectContainsPoint(_2db,_2da)&&row<_numberOfRows){
return CPTableViewDropOn;
}
return CPTableViewDropAbove;
}
}),new objj_method(sel_getUid("_proposedRowAtPoint:"),function(self,_2dc,_2dd){
with(self){
var row=objj_msgSend(self,"rowAtPoint:",_2dd),_2de=row+1,rect=objj_msgSend(self,"rectOfRow:",row),_2df=(rect.origin.y+rect.size.height),_2e0=_2df-((_2df-(rect.origin.y))*0.3),_2e1=objj_msgSend(self,"numberOfRows");
if(row<0){
row=((rect.origin.y+rect.size.height)<_2dd.y)?_2e1:row;
}else{
if(_2dd.y>MAX(_2e0,_2df-6)){
row=_2de;
}
}
row=MIN(_2e1,row);
return row;
}
}),new objj_method(sel_getUid("_validateDrop:proposedRow:proposedDropOperation:"),function(self,_2e2,info,row,_2e3){
with(self){
if(_implementedDataSourceMethods&_6){
return objj_msgSend(_dataSource,"tableView:validateDrop:proposedRow:proposedDropOperation:",self,info,row,_2e3);
}
return CPDragOperationNone;
}
}),new objj_method(sel_getUid("_rectForDropHighlightViewOnRow:"),function(self,_2e4,_2e5){
with(self){
if(_2e5>=objj_msgSend(self,"numberOfRows")){
_2e5=objj_msgSend(self,"numberOfRows")-1;
}
return objj_msgSend(self,"_rectOfRow:checkRange:",_2e5,NO);
}
}),new objj_method(sel_getUid("_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:"),function(self,_2e6,_2e7,_2e8,_2e9){
with(self){
if(_2e8>objj_msgSend(self,"numberOfRows")){
_2e8=objj_msgSend(self,"numberOfRows");
}
return objj_msgSend(self,"_rectOfRow:checkRange:",_2e8,NO);
}
}),new objj_method(sel_getUid("draggingUpdated:"),function(self,_2ea,_2eb){
with(self){
_retargetedDropRow=nil;
_retargetedDropOperation=nil;
var _2ec=objj_msgSend(self,"convertPoint:fromView:",objj_msgSend(_2eb,"draggingLocation"),nil),_2ed=objj_msgSend(self,"_proposedDropOperationAtPoint:",_2ec),_2ee=objj_msgSend(self,"numberOfRows"),row=objj_msgSend(self,"_proposedRowAtPoint:",_2ec),_2ef=objj_msgSend(self,"_validateDrop:proposedRow:proposedDropOperation:",_2eb,row,_2ed);
if(_retargetedDropRow!==nil){
row=_retargetedDropRow;
}
if(_retargetedDropOperation!==nil){
_2ed=_retargetedDropOperation;
}
if(_2ed===CPTableViewDropOn&&row>=_2ee){
row=_2ee-1;
}
var rect={origin:{x:0,y:0},size:{width:0,height:0}};
if(row===-1){
rect=objj_msgSend(self,"exposedRect");
}else{
if(_2ed===CPTableViewDropAbove){
rect=objj_msgSend(self,"_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:",row-1,row,_2ec);
}else{
rect=objj_msgSend(self,"_rectForDropHighlightViewOnRow:",row);
}
}
objj_msgSend(_dropOperationFeedbackView,"setDropOperation:",row!==-1?_2ed:CPDragOperationNone);
objj_msgSend(_dropOperationFeedbackView,"setHidden:",(_2ef==CPDragOperationNone));
objj_msgSend(_dropOperationFeedbackView,"setFrame:",rect);
objj_msgSend(_dropOperationFeedbackView,"setCurrentRow:",row);
objj_msgSend(self,"addSubview:",_dropOperationFeedbackView);
return _2ef;
}
}),new objj_method(sel_getUid("prepareForDragOperation:"),function(self,_2f0,_2f1){
with(self){
objj_msgSend(_dropOperationFeedbackView,"removeFromSuperview");
return (_implementedDataSourceMethods&_6);
}
}),new objj_method(sel_getUid("performDragOperation:"),function(self,_2f2,_2f3){
with(self){
var _2f4=objj_msgSend(self,"convertPoint:fromView:",objj_msgSend(_2f3,"draggingLocation"),nil),_2f5=objj_msgSend(self,"_proposedDropOperationAtPoint:",_2f4),row=_retargetedDropRow;
if(row===nil){
var row=objj_msgSend(self,"_proposedRowAtPoint:",_2f4);
}
return objj_msgSend(_dataSource,"tableView:acceptDrop:row:dropOperation:",self,_2f3,row,_2f5);
}
}),new objj_method(sel_getUid("concludeDragOperation:"),function(self,_2f6,_2f7){
with(self){
objj_msgSend(self,"reloadData");
}
}),new objj_method(sel_getUid("draggedImage:endedAt:operation:"),function(self,_2f8,_2f9,_2fa,_2fb){
with(self){
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:didEndDraggedImage:atPosition:operation:"))){
objj_msgSend(_dataSource,"tableView:didEndDraggedImage:atPosition:operation:",self,_2f9,_2fa,_2fb);
}
}
}),new objj_method(sel_getUid("draggedView:endedAt:operation:"),function(self,_2fc,_2fd,_2fe,_2ff){
with(self){
objj_msgSend(self,"_draggingEnded");
objj_msgSend(self,"draggedImage:endedAt:operation:",_2fd,_2fe,_2ff);
}
}),new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"),function(self,_300,aRow){
with(self){
if(aRow<0){
return;
}
var _301,_302=NO;
if(objj_msgSend(self,"mouseDownFlags")&(CPCommandKeyMask|CPControlKeyMask|CPAlternateKeyMask)){
if(objj_msgSend(_selectedRowIndexes,"containsIndex:",aRow)){
_301=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(_301,"removeIndex:",aRow);
}else{
if(_allowsMultipleSelection){
_301=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(_301,"addIndex:",aRow);
}else{
_301=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}
}
}else{
if(_allowsMultipleSelection){
_301=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(MIN(aRow,_selectionAnchorRow),ABS(aRow-_selectionAnchorRow)+1));
_302=objj_msgSend(self,"mouseDownFlags")&CPShiftKeyMask&&((_lastSelectedRow==objj_msgSend(_selectedRowIndexes,"lastIndex")&&aRow>_lastSelectedRow)||(_lastSelectedRow==objj_msgSend(_selectedRowIndexes,"firstIndex")&&aRow<_lastSelectedRow));
}else{
if(aRow>=0&&aRow<_numberOfRows){
_301=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}else{
_301=objj_msgSend(CPIndexSet,"indexSet");
}
}
}
if(objj_msgSend(_301,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
if(_implementedDelegateMethods&_9&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",self)){
return;
}
if(_implementedDelegateMethods&_11){
_301=objj_msgSend(_delegate,"tableView:selectionIndexesForProposedSelection:",self,_301);
}
if(_implementedDelegateMethods&_13){
var _303=[];
objj_msgSend(_301,"getIndexes:maxCount:inIndexRange:",_303,-1,nil);
var _304=_303.length;
while(_304--){
var _305=_303[_304];
if(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",self,_305)){
objj_msgSend(_301,"removeIndex:",_305);
}
}
if(objj_msgSend(_301,"count")===0){
return;
}
}
if(!_allowsEmptySelection&&objj_msgSend(_301,"count")===0){
return;
}
if(objj_msgSend(_301,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",_301,_302);
_lastSelectedRow=objj_msgSend(_301,"containsIndex:",aRow)?aRow:objj_msgSend(_301,"lastIndex");
}
}),new objj_method(sel_getUid("_noteSelectionIsChanging"),function(self,_306){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionIsChangingNotification,self,nil);
}
}),new objj_method(sel_getUid("_noteSelectionDidChange"),function(self,_307){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionDidChangeNotification,self,nil);
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(self,_308){
with(self){
return YES;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(self,_309){
with(self){
return YES;
}
}),new objj_method(sel_getUid("keyDown:"),function(self,_30a,_30b){
with(self){
var _30c=objj_msgSend(_30b,"charactersIgnoringModifiers"),_30d=objj_msgSend(_30b,"modifierFlags");
if(_30c===CPUpArrowFunctionKey||_30c===CPDownArrowFunctionKey){
if(objj_msgSend(self,"numberOfRows")!==0){
objj_msgSend(self,"_moveSelectionWithEvent:upward:",_30b,(_30c===CPUpArrowFunctionKey));
return;
}
}else{
if(_30c===CPDeleteCharacter||_30c===CPDeleteFunctionKey){
if(objj_msgSend(self,"_sendDelegateDeleteKeyPressed")){
return;
}
}
}
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"keyDown:",_30b);
}
}),new objj_method(sel_getUid("_selectionIsBroken"),function(self,_30e){
with(self){
return objj_msgSend(self,"selectedRowIndexes")._ranges.length!==1;
}
}),new objj_method(sel_getUid("_moveSelectionWithEvent:upward:"),function(self,_30f,_310,_311){
with(self){
if(_implementedDelegateMethods&_9&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",self)){
return;
}
var _312=objj_msgSend(self,"selectedRowIndexes");
if(objj_msgSend(_312,"count")>0){
var _313=((objj_msgSend(_310,"modifierFlags")&CPShiftKeyMask)&&_allowsMultipleSelection),i=objj_msgSend(self,"selectedRow");
if(objj_msgSend(self,"_selectionIsBroken")){
while(objj_msgSend(_312,"containsIndex:",i)){
_311?i--:i++;
}
_wasSelectionBroken=true;
}else{
if(_wasSelectionBroken&&((_311&&i!==objj_msgSend(_312,"firstIndex"))||(!_311&&i!==objj_msgSend(_312,"lastIndex")))){
_311?i=objj_msgSend(_312,"firstIndex")-1:i=objj_msgSend(_312,"lastIndex");
_wasSelectionBroken=false;
}else{
_311?i--:i++;
}
}
}else{
var _313=NO;
if(objj_msgSend(self,"numberOfRows")>0){
var i=_311?objj_msgSend(self,"numberOfRows")-1:0;
}
}
if(i>=objj_msgSend(self,"numberOfRows")||i<0){
return;
}
if(_implementedDelegateMethods&_13){
while(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",self,i)&&(i<objj_msgSend(self,"numberOfRows")||i>0)){
_311?i--:i++;
}
if(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",self,i)){
return;
}
}
if(_313&&objj_msgSend(_312,"containsIndex:",i)){
var _314=i;
_311?i++:i--;
objj_msgSend(_312,"removeIndex:",i);
_313=NO;
}else{
if(_313){
if(objj_msgSend(_312,"containsIndex:",i)){
i=_311?objj_msgSend(_312,"firstIndex")-1:objj_msgSend(_312,"lastIndex")+1;
i=MIN(MAX(i,0),objj_msgSend(self,"numberOfRows")-1);
}
objj_msgSend(_312,"addIndex:",i);
var _314=i;
}else{
_312=objj_msgSend(CPIndexSet,"indexSetWithIndex:",i);
var _314=i;
}
}
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",_312,_313);
_lastSelectedRow=_314;
if(i!==CPNotFound){
objj_msgSend(self,"scrollRowToVisible:",i);
}
}
})]);
class_addMethods(_1f,[new objj_method(sel_getUid("defaultThemeClass"),function(self,_315){
with(self){
return "tableview";
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_316){
with(self){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null")],["alternating-row-colors","grid-color","highlighted-grid-color","selection-color","sourcelist-selection-color","sort-image","sort-image-reversed","selection-radius"]);
}
})]);
var _1e=objj_getClass("CPTableView");
if(!_1e){
throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
}
var _1f=_1e.isa;
class_addMethods(_1e,[new objj_method(sel_getUid("_replacementKeyPathForBinding:"),function(self,_317,_318){
with(self){
if(_318==="selectionIndexes"){
return "selectedRowIndexes";
}
return objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"_replacementKeyPathForBinding:",_318);
}
}),new objj_method(sel_getUid("_establishBindingsIfUnbound:"),function(self,_319,_31a){
with(self){
if(objj_msgSend(objj_msgSend(self,"infoForBinding:","content"),"objectForKey:",CPObservedObjectKey)!==_31a){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"bind:toObject:withKeyPath:options:","content",_31a,"arrangedObjects",nil);
_contentBindingExpicitelySet=NO;
}
if(objj_msgSend(objj_msgSend(self,"infoForBinding:","selectionIndexes"),"objectForKey:",CPObservedObjectKey)!==_31a){
objj_msgSend(self,"bind:toObject:withKeyPath:options:","selectionIndexes",_31a,"selectionIndexes",nil);
}
}
}),new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"),function(self,_31b,_31c,_31d,_31e,_31f){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"bind:toObject:withKeyPath:options:",_31c,_31d,_31e,_31f);
if(_31c=="content"){
_contentBindingExpicitelySet=YES;
}
}
})]);
class_addMethods(_1f,[new objj_method(sel_getUid("_binderClassForBinding:"),function(self,_320,_321){
with(self){
if(_321=="content"){
return objj_msgSend(CPTableContentBinder,"class");
}
return objj_msgSendSuper({receiver:self,super_class:objj_getMetaClass("CPTableView").super_class},"_binderClassForBinding:",_321);
}
})]);
var _1e=objj_allocateClassPair(CPBinder,"CPTableContentBinder"),_1f=_1e.isa;
class_addIvars(_1e,[new objj_ivar("_content")]);
objj_registerClassPair(_1e);
class_addMethods(_1e,[new objj_method(sel_getUid("content"),function(self,_322){
with(self){
return _content;
}
}),new objj_method(sel_getUid("setContent:"),function(self,_323,_324){
with(self){
_content=_324;
}
}),new objj_method(sel_getUid("setValueFor:"),function(self,_325,_326){
with(self){
var _327=objj_msgSend(_info,"objectForKey:",CPObservedObjectKey),_328=objj_msgSend(_info,"objectForKey:",CPObservedKeyPathKey);
_content=objj_msgSend(_327,"valueForKey:",_328);
objj_msgSend(_source,"reloadData");
}
})]);
var _329="CPTableViewDataSourceKey",_32a="CPTableViewDelegateKey",_32b="CPTableViewHeaderViewKey",_32c="CPTableViewTableColumnsKey",_32d="CPTableViewRowHeightKey",_32e="CPTableViewIntercellSpacingKey",_32f="CPTableViewSelectionHighlightStyleKey",_330="CPTableViewMultipleSelectionKey",_331="CPTableViewEmptySelectionKey",_332="CPTableViewColumnReorderingKey",_333="CPTableViewColumnResizingKey",_334="CPTableViewColumnSelectionKey",_335="CPTableViewColumnAutoresizingStyleKey",_336="CPTableViewGridColorKey",_337="CPTableViewGridStyleMaskKey",_338="CPTableViewUsesAlternatingBackgroundKey",_339="CPTableViewAlternatingRowColorsKey",_32b="CPTableViewHeaderViewKey",_33a="CPTableViewCornerViewKey",_33b="CPTableViewAutosaveNameKey";
var _1e=objj_getClass("CPTableView");
if(!_1e){
throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
}
var _1f=_1e.isa;
class_addMethods(_1e,[new objj_method(sel_getUid("initWithCoder:"),function(self,_33c,_33d){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"initWithCoder:",_33d);
if(self){
_allowsColumnReordering=objj_msgSend(_33d,"decodeBoolForKey:",_332);
_allowsColumnResizing=objj_msgSend(_33d,"decodeBoolForKey:",_333);
_allowsMultipleSelection=objj_msgSend(_33d,"decodeBoolForKey:",_330);
_allowsEmptySelection=objj_msgSend(_33d,"decodeBoolForKey:",_331);
_allowsColumnSelection=objj_msgSend(_33d,"decodeBoolForKey:",_334);
_selectionHighlightStyle=objj_msgSend(_33d,"decodeIntForKey:",_32f);
_columnAutoResizingStyle=objj_msgSend(_33d,"decodeIntForKey:",_335);
_tableColumns=objj_msgSend(_33d,"decodeObjectForKey:",_32c)||[];
objj_msgSend(_tableColumns,"makeObjectsPerformSelector:withObject:",sel_getUid("setTableView:"),self);
_rowHeight=objj_msgSend(_33d,"decodeFloatForKey:",_32d)||23;
_intercellSpacing=objj_msgSend(_33d,"decodeSizeForKey:",_32e);
if((_intercellSpacing.width=={width:0,height:0}.width&&_intercellSpacing.height=={width:0,height:0}.height)){
_intercellSpacing={width:3,height:2};
}
objj_msgSend(self,"setGridColor:",objj_msgSend(_33d,"decodeObjectForKey:",_336));
_gridStyleMask=objj_msgSend(_33d,"decodeIntForKey:",_337);
_usesAlternatingRowBackgroundColors=objj_msgSend(_33d,"decodeObjectForKey:",_338);
objj_msgSend(self,"setAlternatingRowBackgroundColors:",objj_msgSend(_33d,"decodeObjectForKey:",_339));
_headerView=objj_msgSend(_33d,"decodeObjectForKey:",_32b);
_cornerView=objj_msgSend(_33d,"decodeObjectForKey:",_33a);
objj_msgSend(self,"setDataSource:",objj_msgSend(_33d,"decodeObjectForKey:",_329));
objj_msgSend(self,"setDelegate:",objj_msgSend(_33d,"decodeObjectForKey:",_32a));
objj_msgSend(self,"_init");
objj_msgSend(self,"viewWillMoveToSuperview:",objj_msgSend(self,"superview"));
objj_msgSend(self,"setAutosaveName:",objj_msgSend(_33d,"decodeObjectForKey:",_33b));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_33e,_33f){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTableView").super_class},"encodeWithCoder:",_33f);
objj_msgSend(_33f,"encodeObject:forKey:",_dataSource,_329);
objj_msgSend(_33f,"encodeObject:forKey:",_delegate,_32a);
objj_msgSend(_33f,"encodeFloat:forKey:",_rowHeight,_32d);
objj_msgSend(_33f,"encodeSize:forKey:",_intercellSpacing,_32e);
objj_msgSend(_33f,"encodeInt:forKey:",_selectionHighlightStyle,_32f);
objj_msgSend(_33f,"encodeInt:forKey:",_columnAutoResizingStyle,_335);
objj_msgSend(_33f,"encodeBool:forKey:",_allowsMultipleSelection,_330);
objj_msgSend(_33f,"encodeBool:forKey:",_allowsEmptySelection,_331);
objj_msgSend(_33f,"encodeBool:forKey:",_allowsColumnReordering,_332);
objj_msgSend(_33f,"encodeBool:forKey:",_allowsColumnResizing,_333);
objj_msgSend(_33f,"encodeBool:forKey:",_allowsColumnSelection,_334);
objj_msgSend(_33f,"encodeObject:forKey:",_tableColumns,_32c);
objj_msgSend(_33f,"encodeObject:forKey:",objj_msgSend(self,"gridColor"),_336);
objj_msgSend(_33f,"encodeInt:forKey:",_gridStyleMask,_337);
objj_msgSend(_33f,"encodeBool:forKey:",_usesAlternatingRowBackgroundColors,_338);
objj_msgSend(_33f,"encodeObject:forKey:",objj_msgSend(self,"alternatingRowBackgroundColors"),_339);
objj_msgSend(_33f,"encodeObject:forKey:",_cornerView,_33a);
objj_msgSend(_33f,"encodeObject:forKey:",_headerView,_32b);
objj_msgSend(_33f,"encodeObject:forKey:",_autosaveName,_33b);
}
})]);
var _1e=objj_getClass("CPIndexSet");
if(!_1e){
throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
}
var _1f=_1e.isa;
class_addMethods(_1e,[new objj_method(sel_getUid("removeMatches:"),function(self,_340,_341){
with(self){
var _342=objj_msgSend(self,"firstIndex"),_343=MIN(_342,objj_msgSend(_341,"firstIndex")),_344=(_343==_342);
while(_343!=CPNotFound){
var _345=(_344)?_341:self,_346=objj_msgSend(_345,"indexGreaterThanOrEqualToIndex:",_343);
if(_346==_343){
objj_msgSend(self,"removeIndex:",_343);
objj_msgSend(_341,"removeIndex:",_343);
}
_343=_346;
_344=!_344;
}
}
})]);
var _1e=objj_allocateClassPair(CPView,"_CPDropOperationDrawingView"),_1f=_1e.isa;
class_addIvars(_1e,[new objj_ivar("dropOperation"),new objj_ivar("tableView"),new objj_ivar("currentRow"),new objj_ivar("isBlinking")]);
objj_registerClassPair(_1e);
class_addMethods(_1e,[new objj_method(sel_getUid("dropOperation"),function(self,_347){
with(self){
return dropOperation;
}
}),new objj_method(sel_getUid("setDropOperation:"),function(self,_348,_349){
with(self){
dropOperation=_349;
}
}),new objj_method(sel_getUid("tableView"),function(self,_34a){
with(self){
return tableView;
}
}),new objj_method(sel_getUid("setTableView:"),function(self,_34b,_34c){
with(self){
tableView=_34c;
}
}),new objj_method(sel_getUid("currentRow"),function(self,_34d){
with(self){
return currentRow;
}
}),new objj_method(sel_getUid("setCurrentRow:"),function(self,_34e,_34f){
with(self){
currentRow=_34f;
}
}),new objj_method(sel_getUid("isBlinking"),function(self,_350){
with(self){
return isBlinking;
}
}),new objj_method(sel_getUid("setIsBlinking:"),function(self,_351,_352){
with(self){
isBlinking=_352;
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_353,_354){
with(self){
if(tableView._destinationDragStyle===CPTableViewDraggingDestinationFeedbackStyleNone||isBlinking){
return;
}
var _355=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_355,objj_msgSend(CPColor,"colorWithHexString:","4886ca"));
CGContextSetLineWidth(_355,3);
if(currentRow===-1){
CGContextStrokeRect(_355,objj_msgSend(self,"bounds"));
}else{
if(dropOperation===CPTableViewDropOn){
var _356=objj_msgSend(tableView,"selectedRowIndexes"),_357={origin:{x:_354.origin.x+2,y:_354.origin.y+2},size:{width:_354.size.width-4,height:_354.size.height-5}};
if(objj_msgSend(_356,"containsIndex:",currentRow)){
CGContextSetLineWidth(_355,2);
CGContextSetStrokeColor(_355,objj_msgSend(CPColor,"whiteColor"));
}else{
CGContextSetFillColor(_355,objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",72/255,134/255,202/255,0.25));
CGContextFillRoundedRectangleInRect(_355,_357,8,YES,YES,YES,YES);
}
CGContextStrokeRoundedRectangleInRect(_355,_357,8,YES,YES,YES,YES);
}else{
if(dropOperation===CPTableViewDropAbove){
objj_msgSend(self,"setFrameOrigin:",{x:_frame.origin.x,y:_frame.origin.y-8});
var _356=objj_msgSend(tableView,"selectedRowIndexes");
if(objj_msgSend(_356,"containsIndex:",currentRow-1)||objj_msgSend(_356,"containsIndex:",currentRow)){
CGContextSetStrokeColor(_355,objj_msgSend(CPColor,"whiteColor"));
CGContextSetLineWidth(_355,4);
CGContextStrokeEllipseInRect(_355,{origin:{x:_354.origin.x+4,y:_354.origin.y+4},size:{width:8,height:8}});
CGContextBeginPath(_355);
CGContextMoveToPoint(_355,10,_354.origin.y+8);
CGContextAddLineToPoint(_355,_354.size.width-_354.origin.y-8,_354.origin.y+8);
CGContextClosePath(_355);
CGContextStrokePath(_355);
CGContextSetStrokeColor(_355,objj_msgSend(CPColor,"colorWithHexString:","4886ca"));
CGContextSetLineWidth(_355,3);
}
CGContextStrokeEllipseInRect(_355,{origin:{x:_354.origin.x+4,y:_354.origin.y+4},size:{width:8,height:8}});
CGContextBeginPath(_355);
CGContextMoveToPoint(_355,10,_354.origin.y+8);
CGContextAddLineToPoint(_355,_354.size.width-_354.origin.y-8,_354.origin.y+8);
CGContextClosePath(_355);
CGContextStrokePath(_355);
}
}
}
}
}),new objj_method(sel_getUid("blink"),function(self,_358){
with(self){
if(dropOperation!==CPTableViewDropOn){
return;
}
isBlinking=YES;
var _359=function(){
objj_msgSend(self,"setHidden:",NO);
isBlinking=NO;
};
var _35a=function(){
objj_msgSend(self,"setHidden:",YES);
isBlinking=YES;
};
objj_msgSend(self,"setHidden:",YES);
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",0.1,_359,NO);
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",0.19,_35a,NO);
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",0.27,_359,NO);
}
})]);
var _1e=objj_allocateClassPair(CPView,"_CPColumnDragView"),_1f=_1e.isa;
class_addIvars(_1e,[new objj_ivar("_lineColor")]);
objj_registerClassPair(_1e);
class_addMethods(_1e,[new objj_method(sel_getUid("initWithLineColor:"),function(self,_35b,_35c){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPColumnDragView").super_class},"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
if(self){
_lineColor=_35c;
}
return self;
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_35d,_35e){
with(self){
var _35f=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_35f,_lineColor);
var _360=[{x:0.5,y:0},{x:0.5,y:_35e.size.height}];
CGContextStrokeLineSegments(_35f,_360,2);
_360=[{x:_35e.size.width-0.5,y:0},{x:_35e.size.width-0.5,y:_35e.size.height}];
CGContextStrokeLineSegments(_35f,_360,2);
}
})]);
