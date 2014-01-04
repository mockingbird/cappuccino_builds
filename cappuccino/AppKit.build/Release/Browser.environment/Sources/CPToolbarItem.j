@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;9;CPImage.ji;8;CPView.ji;29;_CPToolbarFlexibleSpaceItem.ji;26;_CPToolbarShowColorsItem.ji;25;_CPToolbarSeparatorItem.ji;21;_CPToolbarSpaceItem.jt;13683;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("CPImage.j",YES);
objj_executeFile("CPView.j",YES);
CPToolbarItemVisibilityPriorityStandard=0;
CPToolbarItemVisibilityPriorityLow=-1000;
CPToolbarItemVisibilityPriorityHigh=1000;
CPToolbarItemVisibilityPriorityUser=2000;
CPToolbarSeparatorItemIdentifier="CPToolbarSeparatorItem";
CPToolbarSpaceItemIdentifier="CPToolbarSpaceItem";
CPToolbarFlexibleSpaceItemIdentifier="CPToolbarFlexibleSpaceItem";
CPToolbarShowColorsItemIdentifier="CPToolbarShowColorsItem";
CPToolbarShowFontsItemIdentifier="CPToolbarShowFontsItem";
CPToolbarCustomizeToolbarItemIdentifier="CPToolbarCustomizeToolbarItem";
CPToolbarPrintItemIdentifier="CPToolbarPrintItem";
var _1=objj_allocateClassPair(CPObject,"CPToolbarItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_itemIdentifier"),new objj_ivar("_toolbar"),new objj_ivar("_label"),new objj_ivar("_paletteLabel"),new objj_ivar("_toolTip"),new objj_ivar("_tag"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_view"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_visibilityPriority"),new objj_ivar("_autovalidates")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithItemIdentifier:","");
}
}),new objj_method(sel_getUid("initWithItemIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPToolbarItem").super_class},"init");
if(_5){
_itemIdentifier=_7;
_tag=0;
_isEnabled=YES;
_minSize=CGSizeMakeZero();
_maxSize=CGSizeMakeZero();
_visibilityPriority=CPToolbarItemVisibilityPriorityStandard;
_autovalidates=YES;
}
return _5;
}
}),new objj_method(sel_getUid("itemIdentifier"),function(_8,_9){
with(_8){
return _itemIdentifier;
}
}),new objj_method(sel_getUid("toolbar"),function(_a,_b){
with(_a){
return _toolbar;
}
}),new objj_method(sel_getUid("_setToolbar:"),function(_c,_d,_e){
with(_c){
_toolbar=_e;
}
}),new objj_method(sel_getUid("label"),function(_f,_10){
with(_f){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_11,_12,_13){
with(_11){
_label=_13;
}
}),new objj_method(sel_getUid("paletteLabel"),function(_14,_15){
with(_14){
return _paletteLabel;
}
}),new objj_method(sel_getUid("setPaletteLabel:"),function(_16,_17,_18){
with(_16){
_paletteLabel=_18;
}
}),new objj_method(sel_getUid("toolTip"),function(_19,_1a){
with(_19){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("toolTip"))){
return objj_msgSend(_view,"toolTip");
}
return _toolTip;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_1b,_1c,_1d){
with(_1b){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setToolTip:"))){
objj_msgSend(_view,"setToolTip:",_1d);
}
_toolTip=_1d;
}
}),new objj_method(sel_getUid("tag"),function(_1e,_1f){
with(_1e){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("tag"))){
return objj_msgSend(_view,"tag");
}
return _tag;
}
}),new objj_method(sel_getUid("setTag:"),function(_20,_21,_22){
with(_20){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_22);
}
_tag=_22;
}
}),new objj_method(sel_getUid("target"),function(_23,_24){
with(_23){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("target"))?objj_msgSend(_view,"target"):nil;
}
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_25,_26,_27){
with(_25){
if(!_view){
_target=_27;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_view,"setTarget:",_27);
}
}
}
}),new objj_method(sel_getUid("action"),function(_28,_29){
with(_28){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("action"))?objj_msgSend(_view,"action"):nil;
}
return _action;
}
}),new objj_method(sel_getUid("setAction:"),function(_2a,_2b,_2c){
with(_2a){
if(!_view){
_action=_2c;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_view,"setAction:",_2c);
}
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_2d,_2e){
with(_2d){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("isEnabled"))){
return objj_msgSend(_view,"isEnabled");
}
return _isEnabled;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_2f,_30,_31){
with(_2f){
if(_isEnabled===_31){
return;
}
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(_view,"setEnabled:",_31);
}
_isEnabled=_31;
}
}),new objj_method(sel_getUid("image"),function(_32,_33){
with(_32){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("image"))){
return objj_msgSend(_view,"image");
}
return _image;
}
}),new objj_method(sel_getUid("setImage:"),function(_34,_35,_36){
with(_34){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setImage:"))){
objj_msgSend(_view,"setImage:",_36);
}
_image=_36;
if(!_image){
return;
}
if(_minSize.width===0&&_minSize.height===0&&_maxSize.width===0&&_maxSize.height===0){
var _37=objj_msgSend(_image,"size");
if(_37.width>0||_37.height>0){
objj_msgSend(_34,"setMinSize:",_37);
objj_msgSend(_34,"setMaxSize:",_37);
}
}
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_38,_39,_3a){
with(_38){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAlternateImage:"))){
objj_msgSend(_view,"setAlternateImage:",_3a);
}
_alternateImage=_3a;
}
}),new objj_method(sel_getUid("alternateImage"),function(_3b,_3c){
with(_3b){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("alternateIamge"))){
return objj_msgSend(_view,"alternateImage");
}
return _alternateImage;
}
}),new objj_method(sel_getUid("view"),function(_3d,_3e){
with(_3d){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_3f,_40,_41){
with(_3f){
if(_view==_41){
return;
}
_view=_41;
if(_view){
if(_tag!==0&&objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_tag);
}
_target=nil;
_action=nil;
}
}
}),new objj_method(sel_getUid("minSize"),function(_42,_43){
with(_42){
return _minSize;
}
}),new objj_method(sel_getUid("setMinSize:"),function(_44,_45,_46){
with(_44){
if(!_46.height||!_46.width){
return;
}
_minSize=CGSizeMakeCopy(_46);
_maxSize=CGSizeMake(MAX(_minSize.width,_maxSize.width),MAX(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("maxSize"),function(_47,_48){
with(_47){
return _maxSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_49,_4a,_4b){
with(_49){
if(!_4b.height||!_4b.width){
return;
}
_maxSize=CGSizeMakeCopy(_4b);
_minSize=CGSizeMake(MIN(_minSize.width,_maxSize.width),MIN(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("visibilityPriority"),function(_4c,_4d){
with(_4c){
return _visibilityPriority;
}
}),new objj_method(sel_getUid("setVisibilityPriority:"),function(_4e,_4f,_50){
with(_4e){
_visibilityPriority=_50;
}
}),new objj_method(sel_getUid("validate"),function(_51,_52){
with(_51){
var _53=objj_msgSend(_51,"action"),_54=objj_msgSend(_51,"target");
if(_view){
if(objj_msgSend(_54,"respondsToSelector:",sel_getUid("validateToolbarItem:"))){
var _55=objj_msgSend(_54,"validateToolbarItem:",_51);
if(_isEnabled!==_55){
objj_msgSend(_51,"setEnabled:",_55);
}
}
return;
}
if(!_53){
if(_isEnabled){
return objj_msgSend(_51,"setEnabled:",NO);
}
return;
}
if(_54&&!objj_msgSend(_54,"respondsToSelector:",_53)){
if(_isEnabled){
return objj_msgSend(_51,"setEnabled:",NO);
}
return;
}
_54=objj_msgSend(CPApp,"targetForAction:to:from:",_53,_54,_51);
if(!_54){
if(_isEnabled){
return objj_msgSend(_51,"setEnabled:",NO);
}
return;
}
if(objj_msgSend(_54,"respondsToSelector:",sel_getUid("validateToolbarItem:"))){
var _55=objj_msgSend(_54,"validateToolbarItem:",_51);
if(_isEnabled!==_55){
objj_msgSend(_51,"setEnabled:",_55);
}
}else{
if(!_isEnabled){
objj_msgSend(_51,"setEnabled:",YES);
}
}
}
}),new objj_method(sel_getUid("autovalidates"),function(_56,_57){
with(_56){
return _autovalidates;
}
}),new objj_method(sel_getUid("setAutovalidates:"),function(_58,_59,_5a){
with(_58){
_autovalidates=!!_5a;
}
})]);
var _5b="CPToolbarItemItemIdentifierKey",_5c="CPToolbarItemLabelKey",_5d="CPToolbarItemPaletteLabelKey",_5e="CPToolbarItemToolTipKey",_5f="CPToolbarItemTagKey",_60="CPToolbarItemTargetKey",_61="CPToolbarItemActionKey",_62="CPToolbarItemEnabledKey",_63="CPToolbarItemImageKey",_64="CPToolbarItemAlternateImageKey",_65="CPToolbarItemViewKey",_66="CPToolbarItemMinSizeKey",_67="CPToolbarItemMaxSizeKey",_68="CPToolbarItemVisibilityPriorityKey",_69="CPToolbarItemAutovalidatesKey";
var _1=objj_getClass("CPToolbarItem");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6a,_6b,_6c){
with(_6a){
_6a=objj_msgSendSuper({receiver:_6a,super_class:objj_getClass("CPToolbarItem").super_class},"init");
if(_6a){
_itemIdentifier=objj_msgSend(_6c,"decodeObjectForKey:",_5b);
_minSize=objj_msgSend(_6c,"decodeSizeForKey:",_66);
_maxSize=objj_msgSend(_6c,"decodeSizeForKey:",_67);
objj_msgSend(_6a,"setLabel:",objj_msgSend(_6c,"decodeObjectForKey:",_5c));
objj_msgSend(_6a,"setPaletteLabel:",objj_msgSend(_6c,"decodeObjectForKey:",_5d));
objj_msgSend(_6a,"setToolTip:",objj_msgSend(_6c,"decodeObjectForKey:",_5e));
objj_msgSend(_6a,"setTag:",objj_msgSend(_6c,"decodeObjectForKey:",_5f));
objj_msgSend(_6a,"setTarget:",objj_msgSend(_6c,"decodeObjectForKey:",_60));
objj_msgSend(_6a,"setAction:",CPSelectorFromString(objj_msgSend(_6c,"decodeObjectForKey:",_61)));
objj_msgSend(_6a,"setEnabled:",objj_msgSend(_6c,"decodeBoolForKey:",_62));
objj_msgSend(_6a,"setImage:",objj_msgSend(_6c,"decodeObjectForKey:",_63));
objj_msgSend(_6a,"setAlternateImage:",objj_msgSend(_6c,"decodeObjectForKey:",_64));
objj_msgSend(_6a,"setView:",objj_msgSend(_6c,"decodeObjectForKey:",_65));
objj_msgSend(_6a,"setVisibilityPriority:",objj_msgSend(_6c,"decodeIntForKey:",_68));
objj_msgSend(_6a,"setAutovalidates:",objj_msgSend(_6c,"decodeBoolForKey:",_69));
}
return _6a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_6d,_6e,_6f){
with(_6d){
objj_msgSend(_6f,"encodeObject:forKey:",_itemIdentifier,_5b);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"label"),_5c);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"paletteLabel"),_5d);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"toolTip"),_5e);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"tag"),_5f);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"target"),_60);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"action"),_61);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"isEnabled"),_62);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"image"),_63);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"alternateImage"),_64);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"view"),_65);
objj_msgSend(_6f,"encodeSize:forKey:",objj_msgSend(_6d,"minSize"),_66);
objj_msgSend(_6f,"encodeSize:forKey:",objj_msgSend(_6d,"maxSize"),_67);
objj_msgSend(_6f,"encodeObject:forKey:",objj_msgSend(_6d,"visibilityPriority"),_68);
objj_msgSend(_6f,"encodeBool:forKey:",objj_msgSend(_6d,"autovalidates"),_69);
}
})]);
var _1=objj_getClass("CPToolbarItem");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_70,_71){
with(_70){
var _72=objj_msgSend(objj_msgSend(objj_msgSend(_70,"class"),"alloc"),"initWithItemIdentifier:",_itemIdentifier);
if(_view){
objj_msgSend(_72,"setView:",objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_view)));
}
objj_msgSend(_72,"_setToolbar:",_toolbar);
objj_msgSend(_72,"setLabel:",_label);
objj_msgSend(_72,"setPaletteLabel:",_paletteLabel);
objj_msgSend(_72,"setToolTip:",objj_msgSend(_70,"toolTip"));
objj_msgSend(_72,"setTag:",objj_msgSend(_70,"tag"));
objj_msgSend(_72,"setTarget:",objj_msgSend(_70,"target"));
objj_msgSend(_72,"setAction:",objj_msgSend(_70,"action"));
objj_msgSend(_72,"setEnabled:",objj_msgSend(_70,"isEnabled"));
objj_msgSend(_72,"setImage:",objj_msgSend(_70,"image"));
objj_msgSend(_72,"setAlternateImage:",objj_msgSend(_70,"alternateImage"));
objj_msgSend(_72,"setMinSize:",_minSize);
objj_msgSend(_72,"setMaxSize:",_maxSize);
objj_msgSend(_72,"setVisibilityPriority:",objj_msgSend(_70,"visibilityPriority"));
objj_msgSend(_72,"setAutovalidates:",objj_msgSend(_70,"autovalidates"));
return _72;
}
})]);
var _1=objj_getClass("CPToolbarItem");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("_standardItemWithItemIdentifier:"),function(_73,_74,_75){
with(_73){
switch(_75){
case CPToolbarSeparatorItemIdentifier:
return objj_msgSend(_CPToolbarSeparatorItem,"new");
case CPToolbarSpaceItemIdentifier:
return objj_msgSend(_CPToolbarSpaceItem,"new");
case CPToolbarFlexibleSpaceItemIdentifier:
return objj_msgSend(_CPToolbarFlexibleSpaceItem,"new");
case CPToolbarShowColorsItemIdentifier:
return objj_msgSend(_CPToolbarShowColorsItem,"new");
case CPToolbarShowFontsItemIdentifier:
return nil;
case CPToolbarCustomizeToolbarItemIdentifier:
return nil;
case CPToolbarPrintItemIdentifier:
return nil;
}
return nil;
}
})]);
objj_executeFile("_CPToolbarFlexibleSpaceItem.j",YES);
objj_executeFile("_CPToolbarShowColorsItem.j",YES);
objj_executeFile("_CPToolbarSeparatorItem.j",YES);
objj_executeFile("_CPToolbarSpaceItem.j",YES);
