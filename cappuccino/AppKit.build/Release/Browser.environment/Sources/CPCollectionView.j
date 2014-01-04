@STATIC;1.0;I;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;23;Foundation/CPIndexSet.jI;28;Foundation/CPKeyedArchiver.jI;30;Foundation/CPKeyedUnarchiver.ji;8;CPView.ji;22;CPCollectionViewItem.ji;17;CPCompatibility.jt;22506;
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPData.j",NO);
objj_executeFile("Foundation/CPIndexSet.j",NO);
objj_executeFile("Foundation/CPKeyedArchiver.j",NO);
objj_executeFile("Foundation/CPKeyedUnarchiver.j",NO);
objj_executeFile("CPView.j",YES);
objj_executeFile("CPCollectionViewItem.j",YES);
objj_executeFile("CPCompatibility.j",YES);
var _1=objj_allocateClassPair(CPView,"CPCollectionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_content"),new objj_ivar("_items"),new objj_ivar("_itemData"),new objj_ivar("_itemPrototype"),new objj_ivar("_itemForDragging"),new objj_ivar("_cachedItems"),new objj_ivar("_maxNumberOfRows"),new objj_ivar("_maxNumberOfColumns"),new objj_ivar("_minItemSize"),new objj_ivar("_maxItemSize"),new objj_ivar("_backgroundColors"),new objj_ivar("_tileWidth"),new objj_ivar("_isSelectable"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_selectionIndexes"),new objj_ivar("_itemSize"),new objj_ivar("_horizontalMargin"),new objj_ivar("_verticalMargin"),new objj_ivar("_numberOfRows"),new objj_ivar("_numberOfColumns"),new objj_ivar("_delegate"),new objj_ivar("_mouseDownEvent")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPCollectionView").super_class},"initWithFrame:",_5);
if(_3){
_items=[];
_content=[];
_cachedItems=[];
_itemSize=CGSizeMakeZero();
_minItemSize=CGSizeMakeZero();
_maxItemSize=CGSizeMakeZero();
objj_msgSend(_3,"setBackgroundColors:",nil);
_verticalMargin=5;
_tileWidth=-1;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_allowsEmptySelection=YES;
_isSelectable=YES;
}
return _3;
}
}),new objj_method(sel_getUid("setItemPrototype:"),function(_6,_7,_8){
with(_6){
_cachedItems=[];
_itemData=nil;
_itemForDragging=nil;
_itemPrototype=_8;
objj_msgSend(_6,"reloadContent");
}
}),new objj_method(sel_getUid("itemPrototype"),function(_9,_a){
with(_9){
return _itemPrototype;
}
}),new objj_method(sel_getUid("newItemForRepresentedObject:"),function(_b,_c,_d){
with(_b){
var _e=nil;
if(_cachedItems.length){
_e=_cachedItems.pop();
}else{
if(!_itemData){
if(_itemPrototype){
_itemData=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_itemPrototype);
}
}
_e=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_itemData);
}
objj_msgSend(_e,"setRepresentedObject:",_d);
objj_msgSend(objj_msgSend(_e,"view"),"setFrameSize:",_itemSize);
return _e;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_f,_10){
with(_f){
return YES;
}
}),new objj_method(sel_getUid("isFirstResponder"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(_11,"window"),"firstResponder")===_11;
}
}),new objj_method(sel_getUid("setContent:"),function(_13,_14,_15){
with(_13){
_content=_15;
objj_msgSend(_13,"reloadContent");
}
}),new objj_method(sel_getUid("content"),function(_16,_17){
with(_16){
return _content;
}
}),new objj_method(sel_getUid("items"),function(_18,_19){
with(_18){
return _items;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_1a,_1b,_1c){
with(_1a){
if(_isSelectable==_1c){
return;
}
_isSelectable=_1c;
if(!_isSelectable){
var _1d=CPNotFound,_1e=objj_msgSend(_items,"count");
while((_1d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_1d))!=CPNotFound&&_1d<_1e){
objj_msgSend(_items[_1d],"setSelected:",NO);
}
}
}
}),new objj_method(sel_getUid("isSelectable"),function(_1f,_20){
with(_1f){
return _isSelectable;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_21,_22,_23){
with(_21){
_allowsEmptySelection=_23;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_24,_25){
with(_24){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_26,_27,_28){
with(_26){
_allowsMultipleSelection=_28;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_29,_2a){
with(_29){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_2b,_2c,_2d){
with(_2b){
if(!_2d){
_2d=objj_msgSend(CPIndexSet,"indexSet");
}
if(!_isSelectable||objj_msgSend(_selectionIndexes,"isEqual:",_2d)){
return;
}
var _2e=CPNotFound,_2f=objj_msgSend(_items,"count");
while((_2e=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_2e))!==CPNotFound&&_2e<_2f){
objj_msgSend(_items[_2e],"setSelected:",NO);
}
_selectionIndexes=_2d;
var _2e=CPNotFound;
while((_2e=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_2e))!==CPNotFound){
objj_msgSend(_items[_2e],"setSelected:",YES);
}
var _30=objj_msgSend(objj_msgSend(_2b,"class"),"_binderClassForBinding:","selectionIndexes");
objj_msgSend(objj_msgSend(_30,"getBinding:forObject:","selectionIndexes",_2b),"reverseSetValueFor:","selectionIndexes");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionViewDidChangeSelection:"))){
objj_msgSend(_delegate,"collectionViewDidChangeSelection:",_2b);
}
}
}),new objj_method(sel_getUid("selectionIndexes"),function(_31,_32){
with(_31){
return objj_msgSend(_selectionIndexes,"copy");
}
}),new objj_method(sel_getUid("reloadContent"),function(_33,_34){
with(_33){
var _35=_items.length;
while(_35--){
objj_msgSend(objj_msgSend(_items[_35],"view"),"removeFromSuperview");
objj_msgSend(_items[_35],"setSelected:",NO);
_cachedItems.push(_items[_35]);
}
_items=[];
if(!_itemPrototype){
return;
}
var _36=0;
_35=_content.length;
for(;_36<_35;++_36){
_items.push(objj_msgSend(_33,"newItemForRepresentedObject:",_content[_36]));
objj_msgSend(_33,"addSubview:",objj_msgSend(_items[_36],"view"));
}
_36=CPNotFound;
while((_36=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_36))!=CPNotFound&&_36<_35){
objj_msgSend(_items[_36],"setSelected:",YES);
}
objj_msgSend(_33,"tile");
}
}),new objj_method(sel_getUid("tile"),function(_37,_38){
with(_37){
var _39=CGRectGetWidth(objj_msgSend(_37,"bounds"));
if(_39==_tileWidth){
return;
}
var _3a=CGSizeMakeCopy(_minItemSize);
_numberOfColumns=MAX(1,FLOOR(_39/_3a.width));
if(_maxNumberOfColumns>0){
_numberOfColumns=MIN(_maxNumberOfColumns,_numberOfColumns);
}
var _3b=_39-_numberOfColumns*_3a.width,_3c=NO;
if(_3b>0&&_3a.width<_maxItemSize.width){
_3a.width=MIN(_maxItemSize.width,_3a.width+FLOOR(_3b/_numberOfColumns));
}
if(_maxNumberOfColumns==1&&_3a.width<_maxItemSize.width&&_3a.width<_39){
_3a.width=MIN(_maxItemSize.width,_39);
}
if(!CGSizeEqualToSize(_itemSize,_3a)){
_itemSize=_3a;
_3c=YES;
}
var _3d=0,_3e=_items.length;
if(_maxNumberOfColumns>0&&_maxNumberOfRows>0){
_3e=MIN(_3e,_maxNumberOfColumns*_maxNumberOfRows);
}
_numberOfRows=CEIL(_3e/_numberOfColumns);
_horizontalMargin=FLOOR((_39-_numberOfColumns*_3a.width)/(_numberOfColumns+1));
var x=_horizontalMargin,y=-_3a.height;
for(;_3d<_3e;++_3d){
if(_3d%_numberOfColumns==0){
x=_horizontalMargin;
y+=_verticalMargin+_3a.height;
}
var _3f=objj_msgSend(_items[_3d],"view");
objj_msgSend(_3f,"setFrameOrigin:",CGPointMake(x,y));
if(_3c){
objj_msgSend(_3f,"setFrameSize:",_itemSize);
}
x+=_3a.width+_horizontalMargin;
}
var _40=objj_msgSend(_37,"superview"),_41=y+_3a.height+_verticalMargin;
if(objj_msgSend(_40,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
var _42=objj_msgSend(_40,"bounds").size;
_41=MAX(_42.height,_41);
}
_tileWidth=_39;
objj_msgSend(_37,"setFrameSize:",CGSizeMake(_39,_41));
_tileWidth=-1;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_43,_44,_45){
with(_43){
objj_msgSend(_43,"tile");
}
}),new objj_method(sel_getUid("setMaxNumberOfRows:"),function(_46,_47,_48){
with(_46){
if(_maxNumberOfRows==_48){
return;
}
_maxNumberOfRows=_48;
objj_msgSend(_46,"tile");
}
}),new objj_method(sel_getUid("maxNumberOfRows"),function(_49,_4a){
with(_49){
return _maxNumberOfRows;
}
}),new objj_method(sel_getUid("setMaxNumberOfColumns:"),function(_4b,_4c,_4d){
with(_4b){
if(_maxNumberOfColumns==_4d){
return;
}
_maxNumberOfColumns=_4d;
objj_msgSend(_4b,"tile");
}
}),new objj_method(sel_getUid("maxNumberOfColumns"),function(_4e,_4f){
with(_4e){
return _maxNumberOfColumns;
}
}),new objj_method(sel_getUid("numberOfRows"),function(_50,_51){
with(_50){
return _numberOfRows;
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_52,_53){
with(_52){
return _numberOfColumns;
}
}),new objj_method(sel_getUid("setMinItemSize:"),function(_54,_55,_56){
with(_54){
if(_56===nil||_56===undefined){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid value provided for minimum size");
}
if(CGSizeEqualToSize(_minItemSize,_56)){
return;
}
_minItemSize=CGSizeMakeCopy(_56);
objj_msgSend(_54,"tile");
}
}),new objj_method(sel_getUid("minItemSize"),function(_57,_58){
with(_57){
return _minItemSize;
}
}),new objj_method(sel_getUid("setMaxItemSize:"),function(_59,_5a,_5b){
with(_59){
if(CGSizeEqualToSize(_maxItemSize,_5b)){
return;
}
_maxItemSize=CGSizeMakeCopy(_5b);
objj_msgSend(_59,"tile");
}
}),new objj_method(sel_getUid("maxItemSize"),function(_5c,_5d){
with(_5c){
return _maxItemSize;
}
}),new objj_method(sel_getUid("setBackgroundColors:"),function(_5e,_5f,_60){
with(_5e){
if(_backgroundColors===_60){
return;
}
_backgroundColors=_60;
if(!_backgroundColors){
_backgroundColors=objj_msgSend(CPColor,"whiteColor");
}
if(objj_msgSend(_backgroundColors,"count")===1){
objj_msgSend(_5e,"setBackgroundColor:",_backgroundColors[0]);
}else{
objj_msgSend(_5e,"setBackgroundColor:",nil);
}
objj_msgSend(_5e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("backgroundColors"),function(_61,_62){
with(_61){
return _backgroundColors;
}
}),new objj_method(sel_getUid("mouseUp:"),function(_63,_64,_65){
with(_63){
if(objj_msgSend(_selectionIndexes,"count")&&objj_msgSend(_65,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"))){
objj_msgSend(_delegate,"collectionView:didDoubleClickOnItemAtIndex:",_63,objj_msgSend(_selectionIndexes,"firstIndex"));
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_66,_67,_68){
with(_66){
_mouseDownEvent=_68;
var _69=objj_msgSend(_66,"convertPoint:fromView:",objj_msgSend(_68,"locationInWindow"),nil),_6a=objj_msgSend(_66,"_indexAtPoint:",_69);
if(_6a>=0&&_6a<_items.length){
if(_allowsMultipleSelection&&(objj_msgSend(_68,"modifierFlags")&CPPlatformActionKeyMask||objj_msgSend(_68,"modifierFlags")&CPShiftKeyMask)){
if(objj_msgSend(_68,"modifierFlags")&CPPlatformActionKeyMask){
var _6b=objj_msgSend(_selectionIndexes,"copy");
if(objj_msgSend(_6b,"containsIndex:",_6a)){
objj_msgSend(_6b,"removeIndex:",_6a);
}else{
objj_msgSend(_6b,"addIndex:",_6a);
}
}else{
if(objj_msgSend(_68,"modifierFlags")&CPShiftKeyMask){
var _6c=objj_msgSend(objj_msgSend(_66,"selectionIndexes"),"firstIndex"),_6d=nil;
if(_6a<_6c){
_6d=CPMakeRange(_6a,(_6c-_6a)+1);
}else{
_6d=CPMakeRange(_6c,(_6a-_6c)+1);
}
_6b=objj_msgSend(objj_msgSend(_66,"selectionIndexes"),"copy");
objj_msgSend(_6b,"addIndexesInRange:",_6d);
}
}
}else{
_6b=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_6a);
}
objj_msgSend(_66,"setSelectionIndexes:",_6b);
objj_msgSend(objj_msgSend(_66,"window"),"makeFirstResponder:",_66);
}else{
if(_allowsEmptySelection){
objj_msgSend(_66,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
}
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_6e,_6f,_70){
with(_6e){
var _71=objj_msgSend(_70,"locationInWindow"),_72=objj_msgSend(_mouseDownEvent,"locationInWindow");
if((ABS(_71.x-_72.x)<3)&&(ABS(_71.y-_72.y)<3)){
return;
}
if(!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:dragTypesForItemsAtIndexes:"))){
return;
}
if(!objj_msgSend(_selectionIndexes,"count")){
return;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:canDragItemsAtIndexes:withEvent:"))&&!objj_msgSend(_delegate,"collectionView:canDragItemsAtIndexes:withEvent:",_6e,_selectionIndexes,_mouseDownEvent)){
return;
}
var _73=objj_msgSend(_delegate,"collectionView:dragTypesForItemsAtIndexes:",_6e,_selectionIndexes);
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",_73,_6e);
if(!_itemForDragging){
_itemForDragging=objj_msgSend(_6e,"newItemForRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
}else{
objj_msgSend(_itemForDragging,"setRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
}
var _74=objj_msgSend(_itemForDragging,"view");
objj_msgSend(_74,"setFrameSize:",_itemSize);
objj_msgSend(_74,"setAlphaValue:",0.7);
objj_msgSend(_6e,"dragView:at:offset:event:pasteboard:source:slideBack:",_74,objj_msgSend(objj_msgSend(_items[objj_msgSend(_selectionIndexes,"firstIndex")],"view"),"frame").origin,CGSizeMakeZero(),_mouseDownEvent,nil,_6e,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_75,_76,_77,_78){
with(_75){
objj_msgSend(_77,"setData:forType:",objj_msgSend(_delegate,"collectionView:dataForItemsAtIndexes:forType:",_75,_selectionIndexes,_78),_78);
}
}),new objj_method(sel_getUid("setVerticalMargin:"),function(_79,_7a,_7b){
with(_79){
if(_verticalMargin==_7b){
return;
}
_verticalMargin=_7b;
objj_msgSend(_79,"tile");
}
}),new objj_method(sel_getUid("verticalMargin"),function(_7c,_7d){
with(_7c){
return _verticalMargin;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_7e,_7f,_80){
with(_7e){
_delegate=_80;
}
}),new objj_method(sel_getUid("delegate"),function(_81,_82){
with(_81){
return _delegate;
}
}),new objj_method(sel_getUid("menuForEvent:"),function(_83,_84,_85){
with(_83){
if(!objj_msgSend(objj_msgSend(_83,"delegate"),"respondsToSelector:",sel_getUid("collectionView:menuForItemAtIndex:"))){
return objj_msgSendSuper({receiver:_83,super_class:objj_getClass("CPCollectionView").super_class},"menuForEvent:",_85);
}
var _86=objj_msgSend(_83,"convertPoint:fromView:",objj_msgSend(_85,"locationInWindow"),nil),_87=objj_msgSend(_83,"_indexAtPoint:",_86);
return objj_msgSend(_delegate,"collectionView:menuForItemAtIndex:",_83,_87);
}
}),new objj_method(sel_getUid("_indexAtPoint:"),function(_88,_89,_8a){
with(_88){
var row=FLOOR(_8a.y/(_itemSize.height+_verticalMargin)),_8b=FLOOR(_8a.x/(_itemSize.width+_horizontalMargin));
return row*_numberOfColumns+_8b;
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_8c,_8d,_8e){
with(_8c){
return objj_msgSend(_items,"objectAtIndex:",_8e);
}
}),new objj_method(sel_getUid("frameForItemAtIndex:"),function(_8f,_90,_91){
with(_8f){
return objj_msgSend(objj_msgSend(objj_msgSend(_8f,"itemAtIndex:",_91),"view"),"frame");
}
}),new objj_method(sel_getUid("frameForItemsAtIndexes:"),function(_92,_93,_94){
with(_92){
var _95=[],_96=CGRectNull;
objj_msgSend(_94,"getIndexes:maxCount:inIndexRange:",_95,-1,nil);
var _97=0,_98=objj_msgSend(_95,"count");
for(;_97<_98;++_97){
_96=CGRectUnion(_96,objj_msgSend(_92,"frameForItemAtIndex:",_95[_97]));
}
return _96;
}
})]);
var _1=objj_getClass("CPCollectionView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("_modifySelectionWithNewIndex:direction:expand:"),function(_99,_9a,_9b,_9c,_9d){
with(_99){
_9b=MIN(MAX(_9b,0),objj_msgSend(objj_msgSend(_99,"items"),"count")-1);
if(_allowsMultipleSelection&&_9d){
var _9e=objj_msgSend(_selectionIndexes,"copy"),_9f=objj_msgSend(_9e,"firstIndex"),_a0=objj_msgSend(_9e,"lastIndex");
if(_9c===-1){
objj_msgSend(_9e,"addIndexesInRange:",CPMakeRange(_9b,_9f-_9b+1));
}else{
objj_msgSend(_9e,"addIndexesInRange:",CPMakeRange(_a0,_9b-_a0+1));
}
}else{
_9e=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_9b);
}
objj_msgSend(_99,"setSelectionIndexes:",_9e);
objj_msgSend(_99,"_scrollToSelection");
}
}),new objj_method(sel_getUid("_scrollToSelection"),function(_a1,_a2){
with(_a1){
var _a3=objj_msgSend(_a1,"frameForItemsAtIndexes:",objj_msgSend(_a1,"selectionIndexes"));
if(!CGRectIsNull(_a3)){
objj_msgSend(_a1,"scrollRectToVisible:",_a3);
}
}
}),new objj_method(sel_getUid("moveLeft:"),function(_a4,_a5,_a6){
with(_a4){
var _a7=objj_msgSend(objj_msgSend(_a4,"selectionIndexes"),"firstIndex");
if(_a7===CPNotFound){
_a7=objj_msgSend(objj_msgSend(_a4,"items"),"count");
}
objj_msgSend(_a4,"_modifySelectionWithNewIndex:direction:expand:",_a7-1,-1,NO);
}
}),new objj_method(sel_getUid("moveLeftAndModifySelection:"),function(_a8,_a9,_aa){
with(_a8){
var _ab=objj_msgSend(objj_msgSend(_a8,"selectionIndexes"),"firstIndex");
if(_ab===CPNotFound){
_ab=objj_msgSend(objj_msgSend(_a8,"items"),"count");
}
objj_msgSend(_a8,"_modifySelectionWithNewIndex:direction:expand:",_ab-1,-1,YES);
}
}),new objj_method(sel_getUid("moveRight:"),function(_ac,_ad,_ae){
with(_ac){
objj_msgSend(_ac,"_modifySelectionWithNewIndex:direction:expand:",objj_msgSend(objj_msgSend(_ac,"selectionIndexes"),"lastIndex")+1,1,NO);
}
}),new objj_method(sel_getUid("moveRightAndModifySelection:"),function(_af,_b0,_b1){
with(_af){
objj_msgSend(_af,"_modifySelectionWithNewIndex:direction:expand:",objj_msgSend(objj_msgSend(_af,"selectionIndexes"),"lastIndex")+1,1,YES);
}
}),new objj_method(sel_getUid("moveDown:"),function(_b2,_b3,_b4){
with(_b2){
objj_msgSend(_b2,"_modifySelectionWithNewIndex:direction:expand:",objj_msgSend(objj_msgSend(_b2,"selectionIndexes"),"lastIndex")+objj_msgSend(_b2,"numberOfColumns"),1,NO);
}
}),new objj_method(sel_getUid("moveDownAndModifySelection:"),function(_b5,_b6,_b7){
with(_b5){
objj_msgSend(_b5,"_modifySelectionWithNewIndex:direction:expand:",objj_msgSend(objj_msgSend(_b5,"selectionIndexes"),"lastIndex")+objj_msgSend(_b5,"numberOfColumns"),1,YES);
}
}),new objj_method(sel_getUid("moveUp:"),function(_b8,_b9,_ba){
with(_b8){
var _bb=objj_msgSend(objj_msgSend(_b8,"selectionIndexes"),"firstIndex");
if(_bb==CPNotFound){
_bb=objj_msgSend(objj_msgSend(_b8,"items"),"count");
}
objj_msgSend(_b8,"_modifySelectionWithNewIndex:direction:expand:",_bb-objj_msgSend(_b8,"numberOfColumns"),-1,NO);
}
}),new objj_method(sel_getUid("moveUpAndModifySelection:"),function(_bc,_bd,_be){
with(_bc){
var _bf=objj_msgSend(objj_msgSend(_bc,"selectionIndexes"),"firstIndex");
if(_bf==CPNotFound){
_bf=objj_msgSend(objj_msgSend(_bc,"items"),"count");
}
objj_msgSend(_bc,"_modifySelectionWithNewIndex:direction:expand:",_bf-objj_msgSend(_bc,"numberOfColumns"),-1,YES);
}
}),new objj_method(sel_getUid("deleteBackward:"),function(_c0,_c1,_c2){
with(_c0){
if(objj_msgSend(objj_msgSend(_c0,"delegate"),"respondsToSelector:",sel_getUid("collectionView:shouldDeleteItemsAtIndexes:"))){
objj_msgSend(objj_msgSend(_c0,"delegate"),"collectionView:shouldDeleteItemsAtIndexes:",_c0,objj_msgSend(_c0,"selectionIndexes"));
var _c3=objj_msgSend(objj_msgSend(_c0,"selectionIndexes"),"firstIndex");
if(_c3>objj_msgSend(objj_msgSend(_c0,"content"),"count")-1){
objj_msgSend(_c0,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(objj_msgSend(_c0,"content"),"count")-1));
}
objj_msgSend(_c0,"_scrollToSelection");
objj_msgSend(_c0,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("keyDown:"),function(_c4,_c5,_c6){
with(_c4){
objj_msgSend(_c4,"interpretKeyEvents:",[_c6]);
}
})]);
var _1=objj_getClass("CPCollectionView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("rectForItemAtIndex:"),function(_c7,_c8,_c9){
with(_c7){
_CPReportLenientDeprecation(objj_msgSend(_c7,"class"),_c8,sel_getUid("frameForItemAtIndex:"));
return objj_msgSend(_c7,"frameForItemAtIndex:",_c9);
}
}),new objj_method(sel_getUid("rectForItemsAtIndexes:"),function(_ca,_cb,_cc){
with(_ca){
_CPReportLenientDeprecation(objj_msgSend(_ca,"class"),_cb,sel_getUid("frameForItemsAtIndexes:"));
return objj_msgSend(_ca,"frameForItemsAtIndexes:",_cc);
}
})]);
var _cd="CPCollectionViewMinItemSizeKey",_ce="CPCollectionViewMaxItemSizeKey",_cf="CPCollectionViewVerticalMarginKey",_d0="CPCollectionViewMaxNumberOfRowsKey",_d1="CPCollectionViewMaxNumberOfColumnsKey",_d2="CPCollectionViewSelectableKey",_d3="CPCollectionViewAllowsMultipleSelectionKey",_d4="CPCollectionViewBackgroundColorsKey";
var _1=objj_getClass("CPCollectionView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("awakeFromCib"),function(_d5,_d6){
with(_d5){
objj_msgSendSuper({receiver:_d5,super_class:objj_getClass("CPCollectionView").super_class},"awakeFromCib");
var _d7=objj_msgSend(_itemPrototype,"view");
if(_d7&&(CGSizeEqualToSize(_minItemSize,CGSizeMakeZero())||CGSizeEqualToSize(_maxItemSize,CGSizeMakeZero()))){
var _d8=_itemPrototype;
if(CGSizeEqualToSize(_minItemSize,CGSizeMakeZero())){
_minItemSize=objj_msgSend(_d7,"frameSize");
}else{
if(CGSizeEqualToSize(_maxItemSize,CGSizeMakeZero())){
_maxItemSize=objj_msgSend(_d7,"frameSize");
}
}
}
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_d9,_da,_db){
with(_d9){
_d9=objj_msgSendSuper({receiver:_d9,super_class:objj_getClass("CPCollectionView").super_class},"initWithCoder:",_db);
if(_d9){
_items=[];
_content=[];
_cachedItems=[];
_itemSize=CGSizeMakeZero();
_minItemSize=objj_msgSend(_db,"decodeSizeForKey:",_cd);
_maxItemSize=objj_msgSend(_db,"decodeSizeForKey:",_ce);
_maxNumberOfRows=objj_msgSend(_db,"decodeIntForKey:",_d0);
_maxNumberOfColumns=objj_msgSend(_db,"decodeIntForKey:",_d1);
_verticalMargin=objj_msgSend(_db,"decodeFloatForKey:",_cf);
_isSelectable=objj_msgSend(_db,"decodeBoolForKey:",_d2);
_allowsMultipleSelection=objj_msgSend(_db,"decodeBoolForKey:",_d3);
objj_msgSend(_d9,"setBackgroundColors:",objj_msgSend(_db,"decodeObjectForKey:",_d4));
_tileWidth=-1;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_allowsEmptySelection=YES;
}
return _d9;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_dc,_dd,_de){
with(_dc){
objj_msgSendSuper({receiver:_dc,super_class:objj_getClass("CPCollectionView").super_class},"encodeWithCoder:",_de);
if(!CGSizeEqualToSize(_minItemSize,CGSizeMakeZero())){
objj_msgSend(_de,"encodeSize:forKey:",_minItemSize,_cd);
}
if(!CGSizeEqualToSize(_maxItemSize,CGSizeMakeZero())){
objj_msgSend(_de,"encodeSize:forKey:",_maxItemSize,_ce);
}
objj_msgSend(_de,"encodeInt:forKey:",_maxNumberOfRows,_d0);
objj_msgSend(_de,"encodeInt:forKey:",_maxNumberOfColumns,_d1);
objj_msgSend(_de,"encodeBool:forKey:",_isSelectable,_d2);
objj_msgSend(_de,"encodeBool:forKey:",_allowsMultipleSelection,_d3);
objj_msgSend(_de,"encodeFloat:forKey:",_verticalMargin,_cf);
objj_msgSend(_de,"encodeObject:forKey:",_backgroundColors,_d4);
}
})]);
