@STATIC;1.0;I;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;9;CPImage.ji;8;CPMenu.ji;8;CPView.ji;17;_CPMenuItemView.jt;17408;
objj_executeFile("Foundation/CPCoder.j",NO);
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("CPImage.j",YES);
objj_executeFile("CPMenu.j",YES);
objj_executeFile("CPView.j",YES);
objj_executeFile("_CPMenuItemView.j",YES);
var _1=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1,"setObject:forKey:","⎋",CPEscapeFunctionKey);
objj_msgSend(_1,"setObject:forKey:","⇥",CPTabCharacter);
objj_msgSend(_1,"setObject:forKey:","⇤",CPBackTabCharacter);
objj_msgSend(_1,"setObject:forKey:","␣",CPSpaceFunctionKey);
objj_msgSend(_1,"setObject:forKey:","⏎",CPCarriageReturnCharacter);
objj_msgSend(_1,"setObject:forKey:","⌫",CPBackspaceCharacter);
objj_msgSend(_1,"setObject:forKey:","⌫",CPDeleteFunctionKey);
objj_msgSend(_1,"setObject:forKey:","⌦",CPDeleteCharacter);
objj_msgSend(_1,"setObject:forKey:","⇱",CPHomeFunctionKey);
objj_msgSend(_1,"setObject:forKey:","⇲",CPEndFunctionKey);
objj_msgSend(_1,"setObject:forKey:","⇞",CPPageUpFunctionKey);
objj_msgSend(_1,"setObject:forKey:","⇟",CPPageDownFunctionKey);
objj_msgSend(_1,"setObject:forKey:","↑",CPUpArrowFunctionKey);
objj_msgSend(_1,"setObject:forKey:","↓",CPDownArrowFunctionKey);
objj_msgSend(_1,"setObject:forKey:","←",CPLeftArrowFunctionKey);
objj_msgSend(_1,"setObject:forKey:","→",CPRightArrowFunctionKey);
objj_msgSend(_1,"setObject:forKey:","⌧",CPClearDisplayFunctionKey);
var _2=objj_allocateClassPair(CPObject,"CPMenuItem"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_isSeparator"),new objj_ivar("_title"),new objj_ivar("_font"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_isHidden"),new objj_ivar("_tag"),new objj_ivar("_state"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_onStateImage"),new objj_ivar("_offStateImage"),new objj_ivar("_mixedStateImage"),new objj_ivar("_submenu"),new objj_ivar("_menu"),new objj_ivar("_keyEquivalent"),new objj_ivar("_keyEquivalentModifierMask"),new objj_ivar("_mnemonicLocation"),new objj_ivar("_isAlternate"),new objj_ivar("_indentationLevel"),new objj_ivar("_toolTip"),new objj_ivar("_representedObject"),new objj_ivar("_view"),new objj_ivar("_changeCount"),new objj_ivar("_menuItemView")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
return objj_msgSend(_4,"initWithTitle:action:keyEquivalent:","",nil,nil);
}
}),new objj_method(sel_getUid("initWithTitle:action:keyEquivalent:"),function(_6,_7,_8,_9,_a){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPMenuItem").super_class},"init");
if(_6){
_changeCount=0;
_isSeparator=NO;
_title=_8;
_action=_9;
_isEnabled=YES;
_isHidden=NO;
_tag=0;
_state=CPOffState;
_keyEquivalent=_a||"";
_keyEquivalentModifierMask=CPPlatformActionKeyMask;
_indentationLevel=0;
_mnemonicLocation=CPNotFound;
}
return _6;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_b,_c,_d){
with(_b){
if(_isEnabled===_d){
return;
}
_isEnabled=!!_d;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_b);
}
}),new objj_method(sel_getUid("isEnabled"),function(_e,_f){
with(_e){
return _isEnabled;
}
}),new objj_method(sel_getUid("setHidden:"),function(_10,_11,_12){
with(_10){
if(_isHidden==_12){
return;
}
_isHidden=_12;
objj_msgSend(_menu,"itemChanged:",_10);
}
}),new objj_method(sel_getUid("isHidden"),function(_13,_14){
with(_13){
return _isHidden;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_15,_16){
with(_15){
if(_isHidden){
return YES;
}
var _17=objj_msgSend(_menu,"supermenu");
if(objj_msgSend(objj_msgSend(_17,"itemAtIndex:",objj_msgSend(_17,"indexOfItemWithSubmenu:",_menu)),"isHiddenOrHasHiddenAncestor")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("setTarget:"),function(_18,_19,_1a){
with(_18){
_target=_1a;
}
}),new objj_method(sel_getUid("target"),function(_1b,_1c){
with(_1b){
return _target;
}
}),new objj_method(sel_getUid("setAction:"),function(_1d,_1e,_1f){
with(_1d){
_action=_1f;
}
}),new objj_method(sel_getUid("action"),function(_20,_21){
with(_20){
return _action;
}
}),new objj_method(sel_getUid("setTitle:"),function(_22,_23,_24){
with(_22){
_mnemonicLocation=CPNotFound;
if(_title==_24){
return;
}
_title=_24;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_22);
}
}),new objj_method(sel_getUid("title"),function(_25,_26){
with(_25){
return _title;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_27,_28,_29){
with(_27){
}
}),new objj_method(sel_getUid("setFont:"),function(_2a,_2b,_2c){
with(_2a){
if(objj_msgSend(_font,"isEqual:",_2c)){
return;
}
_font=_2c;
objj_msgSend(_menu,"itemChanged:",_2a);
objj_msgSend(_menuItemView,"setDirty");
}
}),new objj_method(sel_getUid("font"),function(_2d,_2e){
with(_2d){
return _font;
}
}),new objj_method(sel_getUid("setTag:"),function(_2f,_30,_31){
with(_2f){
_tag=_31;
}
}),new objj_method(sel_getUid("tag"),function(_32,_33){
with(_32){
return _tag;
}
}),new objj_method(sel_getUid("setState:"),function(_34,_35,_36){
with(_34){
if(_state==_36){
return;
}
_state=_36;
objj_msgSend(_menu,"itemChanged:",_34);
objj_msgSend(_menuItemView,"setDirty");
}
}),new objj_method(sel_getUid("state"),function(_37,_38){
with(_37){
return _state;
}
}),new objj_method(sel_getUid("setImage:"),function(_39,_3a,_3b){
with(_39){
if(_image==_3b){
return;
}
_image=_3b;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_39);
}
}),new objj_method(sel_getUid("image"),function(_3c,_3d){
with(_3c){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_3e,_3f,_40){
with(_3e){
_alternateImage=_40;
}
}),new objj_method(sel_getUid("alternateImage"),function(_41,_42){
with(_41){
return _alternateImage;
}
}),new objj_method(sel_getUid("setOnStateImage:"),function(_43,_44,_45){
with(_43){
if(_onStateImage==_45){
return;
}
_onStateImage=_45;
objj_msgSend(_menu,"itemChanged:",_43);
}
}),new objj_method(sel_getUid("onStateImage"),function(_46,_47){
with(_46){
return _onStateImage;
}
}),new objj_method(sel_getUid("setOffStateImage:"),function(_48,_49,_4a){
with(_48){
if(_offStateImage==_4a){
return;
}
_offStateImage=_4a;
objj_msgSend(_menu,"itemChanged:",_48);
}
}),new objj_method(sel_getUid("offStateImage"),function(_4b,_4c){
with(_4b){
return _offStateImage;
}
}),new objj_method(sel_getUid("setMixedStateImage:"),function(_4d,_4e,_4f){
with(_4d){
if(_mixedStateImage==_4f){
return;
}
_mixedStateImage=_4f;
objj_msgSend(_menu,"itemChanged:",_4d);
}
}),new objj_method(sel_getUid("mixedStateImage"),function(_50,_51){
with(_50){
return _mixedStateImage;
}
}),new objj_method(sel_getUid("setSubmenu:"),function(_52,_53,_54){
with(_52){
if(_submenu===_54){
return;
}
var _55=objj_msgSend(_submenu,"supermenu");
if(_55){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Can't add submenu \""+objj_msgSend(_54,"title")+"\" to item \""+objj_msgSend(_52,"title")+"\", because it is already submenu of \""+objj_msgSend(objj_msgSend(_54,"supermenu"),"title")+"\"");
}
_submenu=_54;
if(_submenu){
objj_msgSend(_submenu,"setSupermenu:",_menu);
objj_msgSend(_submenu,"setTitle:",objj_msgSend(_52,"title"));
objj_msgSend(_52,"setTarget:",_menu);
objj_msgSend(_52,"setAction:",sel_getUid("submenuAction:"));
}else{
objj_msgSend(_52,"setTarget:",nil);
objj_msgSend(_52,"setAction:",NULL);
}
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_52);
}
}),new objj_method(sel_getUid("submenu"),function(_56,_57){
with(_56){
return _submenu;
}
}),new objj_method(sel_getUid("hasSubmenu"),function(_58,_59){
with(_58){
return _submenu?YES:NO;
}
}),new objj_method(sel_getUid("isSeparatorItem"),function(_5a,_5b){
with(_5a){
return _isSeparator;
}
}),new objj_method(sel_getUid("setMenu:"),function(_5c,_5d,_5e){
with(_5c){
_menu=_5e;
}
}),new objj_method(sel_getUid("menu"),function(_5f,_60){
with(_5f){
return _menu;
}
}),new objj_method(sel_getUid("setKeyEquivalent:"),function(_61,_62,_63){
with(_61){
_keyEquivalent=_63||"";
}
}),new objj_method(sel_getUid("keyEquivalent"),function(_64,_65){
with(_64){
return _keyEquivalent;
}
}),new objj_method(sel_getUid("setKeyEquivalentModifierMask:"),function(_66,_67,_68){
with(_66){
_keyEquivalentModifierMask=_68;
}
}),new objj_method(sel_getUid("keyEquivalentModifierMask"),function(_69,_6a){
with(_69){
return _keyEquivalentModifierMask;
}
}),new objj_method(sel_getUid("keyEquivalentStringRepresentation"),function(_6b,_6c){
with(_6b){
if(!objj_msgSend(_keyEquivalent,"length")){
return "";
}
var _6d=_keyEquivalent.toUpperCase(),_6e=_keyEquivalentModifierMask&CPShiftKeyMask||(_6d===_keyEquivalent&&_keyEquivalent.toLowerCase()!==_keyEquivalent.toUpperCase());
if(objj_msgSend(_1,"objectForKey:",_6d)){
_6d=objj_msgSend(_1,"objectForKey:",_6d);
}
if(CPBrowserIsOperatingSystem(CPMacOperatingSystem)){
if(_keyEquivalentModifierMask&CPCommandKeyMask){
_6d="⌘"+_6d;
}
if(_6e){
_6d="⇧"+_6d;
}
if(_keyEquivalentModifierMask&CPAlternateKeyMask){
_6d="⌥"+_6d;
}
if(_keyEquivalentModifierMask&CPControlKeyMask){
_6d="⌃"+_6d;
}
}else{
if(_6e){
_6d="Shift-"+_6d;
}
if(_keyEquivalentModifierMask&CPAlternateKeyMask){
_6d="Alt-"+_6d;
}
if(_keyEquivalentModifierMask&CPControlKeyMask||_keyEquivalentModifierMask&CPCommandKeyMask){
_6d="Ctrl-"+_6d;
}
}
return _6d;
}
}),new objj_method(sel_getUid("setMnemonicLocation:"),function(_6f,_70,_71){
with(_6f){
_mnemonicLocation=_71;
}
}),new objj_method(sel_getUid("mnemonicLocation"),function(_72,_73){
with(_72){
return _mnemonicLocation;
}
}),new objj_method(sel_getUid("setTitleWithMnemonicLocation:"),function(_74,_75,_76){
with(_74){
var _77=objj_msgSend(_76,"rangeOfString:","&").location;
if(_77==CPNotFound){
objj_msgSend(_74,"setTitle:",_76);
}else{
objj_msgSend(_74,"setTitle:",objj_msgSend(_76,"substringToIndex:",_77)+objj_msgSend(_76,"substringFromIndex:",_77+1));
objj_msgSend(_74,"setMnemonicLocation:",_77);
}
}
}),new objj_method(sel_getUid("mnemonic"),function(_78,_79){
with(_78){
return _mnemonicLocation==CPNotFound?"":objj_msgSend(_title,"characterAtIndex:",_mnemonicLocation);
}
}),new objj_method(sel_getUid("setAlternate:"),function(_7a,_7b,_7c){
with(_7a){
_isAlternate=_7c;
}
}),new objj_method(sel_getUid("isAlternate"),function(_7d,_7e){
with(_7d){
return _isAlternate;
}
}),new objj_method(sel_getUid("setIndentationLevel:"),function(_7f,_80,_81){
with(_7f){
if(_81<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"setIndentationLevel: argument must be greater than or equal to 0.");
}
_indentationLevel=MIN(15,_81);
}
}),new objj_method(sel_getUid("indentationLevel"),function(_82,_83){
with(_82){
return _indentationLevel;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_84,_85,_86){
with(_84){
_toolTip=_86;
}
}),new objj_method(sel_getUid("toolTip"),function(_87,_88){
with(_87){
return _toolTip;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_89,_8a,_8b){
with(_89){
_representedObject=_8b;
}
}),new objj_method(sel_getUid("representedObject"),function(_8c,_8d){
with(_8c){
return _representedObject;
}
}),new objj_method(sel_getUid("setView:"),function(_8e,_8f,_90){
with(_8e){
if(_view===_90){
return;
}
_view=_90;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_8e);
}
}),new objj_method(sel_getUid("view"),function(_91,_92){
with(_91){
return _view;
}
}),new objj_method(sel_getUid("isHighlighted"),function(_93,_94){
with(_93){
return objj_msgSend(objj_msgSend(_93,"menu"),"highlightedItem")==_93;
}
}),new objj_method(sel_getUid("copy"),function(_95,_96){
with(_95){
var _97=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"init");
_97._isSeparator=_isSeparator;
objj_msgSend(_97,"setTitle:",_title);
objj_msgSend(_97,"setFont:",_font);
objj_msgSend(_97,"setTarget:",_target);
objj_msgSend(_97,"setAction:",_action);
objj_msgSend(_97,"setEnabled:",_isEnabled);
objj_msgSend(_97,"setHidden:",_isHidden);
objj_msgSend(_97,"setTag:",_tag);
objj_msgSend(_97,"setState:",_state);
objj_msgSend(_97,"setImage:",_image);
objj_msgSend(_97,"setAlternateImage:",_alternateImage);
objj_msgSend(_97,"setOnStateImage:",_onStateImage);
objj_msgSend(_97,"setOffStateImage:",_offStateImage);
objj_msgSend(_97,"setMixedStateImage:",_mixedStateImage);
objj_msgSend(_97,"setKeyEquivalent:",_keyEquivalent);
objj_msgSend(_97,"setKeyEquivalentModifierMask:",_keyEquivalentModifierMask);
objj_msgSend(_97,"setMnemonicLocation:",_mnemonicLocation);
objj_msgSend(_97,"setAlternate:",_isAlternate);
objj_msgSend(_97,"setIndentationLevel:",_indentationLevel);
objj_msgSend(_97,"setToolTip:",_toolTip);
objj_msgSend(_97,"setRepresentedObject:",_representedObject);
return _97;
}
}),new objj_method(sel_getUid("mutableCopy"),function(_98,_99){
with(_98){
return objj_msgSend(_98,"copy");
}
}),new objj_method(sel_getUid("_menuItemView"),function(_9a,_9b){
with(_9a){
if(!_menuItemView){
_menuItemView=objj_msgSend(objj_msgSend(_CPMenuItemView,"alloc"),"initWithFrame:forMenuItem:",CGRectMakeZero(),_9a);
}
return _menuItemView;
}
}),new objj_method(sel_getUid("_isSelectable"),function(_9c,_9d){
with(_9c){
return !objj_msgSend(_9c,"submenu")||objj_msgSend(_9c,"action")!==sel_getUid("submenuAction:")||objj_msgSend(_9c,"target")!==objj_msgSend(_9c,"menu");
}
}),new objj_method(sel_getUid("_isMenuBarButton"),function(_9e,_9f){
with(_9e){
return !objj_msgSend(_9e,"submenu")&&objj_msgSend(_9e,"menu")===objj_msgSend(CPApp,"mainMenu");
}
}),new objj_method(sel_getUid("description"),function(_a0,_a1){
with(_a0){
return objj_msgSendSuper({receiver:_a0,super_class:objj_getClass("CPMenuItem").super_class},"description")+" target: "+objj_msgSend(_a0,"target")+" action: "+CPStringFromSelector(objj_msgSend(_a0,"action"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("separatorItem"),function(_a2,_a3){
with(_a2){
var _a4=objj_msgSend(objj_msgSend(_a2,"alloc"),"initWithTitle:action:keyEquivalent:","",nil,nil);
_a4._isSeparator=YES;
return _a4;
}
})]);
var _a5="CPMenuItemIsSeparatorKey",_a6="CPMenuItemTitleKey",_a7="CPMenuItemTargetKey",_a8="CPMenuItemActionKey",_a9="CPMenuItemIsEnabledKey",_aa="CPMenuItemIsHiddenKey",_ab="CPMenuItemTagKey",_ac="CPMenuItemStateKey",_ad="CPMenuItemImageKey",_ae="CPMenuItemAlternateImageKey",_af="CPMenuItemSubmenuKey",_b0="CPMenuItemMenuKey",_b1="CPMenuItemKeyEquivalentKey",_b2="CPMenuItemKeyEquivalentModifierMaskKey",_b3="CPMenuItemIndentationLevelKey",_b4="CPMenuItemRepresentedObjectKey",_b5="CPMenuItemViewKey";
var _2=objj_getClass("CPMenuItem");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPMenuItem\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_b6,_b7,_b8){
with(_b6){
_b6=objj_msgSendSuper({receiver:_b6,super_class:objj_getClass("CPMenuItem").super_class},"init");
if(_b6){
_changeCount=0;
_isSeparator=objj_msgSend(_b8,"containsValueForKey:",_a5)&&objj_msgSend(_b8,"decodeBoolForKey:",_a5);
_title=objj_msgSend(_b8,"decodeObjectForKey:",_a6);
_target=objj_msgSend(_b8,"decodeObjectForKey:",_a7);
_action=objj_msgSend(_b8,"decodeObjectForKey:",_a8);
_isEnabled=objj_msgSend(_b8,"containsValueForKey:",(_a9))?objj_msgSend(_b8,"decodeObjectForKey:",(_a9)):(YES);
_isHidden=objj_msgSend(_b8,"decodeBoolForKey:",_aa);
_tag=objj_msgSend(_b8,"decodeIntForKey:",_ab);
_state=objj_msgSend(_b8,"decodeIntForKey:",_ac);
_image=objj_msgSend(_b8,"decodeObjectForKey:",_ad);
_alternateImage=objj_msgSend(_b8,"decodeObjectForKey:",_ae);
_menu=objj_msgSend(_b8,"decodeObjectForKey:",_b0);
objj_msgSend(_b6,"setSubmenu:",objj_msgSend(_b8,"decodeObjectForKey:",_af));
_keyEquivalent=objj_msgSend(_b8,"decodeObjectForKey:",_b1)||"";
_keyEquivalentModifierMask=objj_msgSend(_b8,"decodeIntForKey:",_b2);
objj_msgSend(_b6,"setIndentationLevel:",objj_msgSend(_b8,"decodeIntForKey:",_b3));
_representedObject=objj_msgSend(_b8,"decodeObjectForKey:",_b4);
_view=objj_msgSend(_b8,"decodeObjectForKey:",_b5);
}
return _b6;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_b9,_ba,_bb){
with(_b9){
if(_isSeparator){
objj_msgSend(_bb,"encodeBool:forKey:",_isSeparator,_a5);
}
objj_msgSend(_bb,"encodeObject:forKey:",_title,_a6);
objj_msgSend(_bb,"encodeObject:forKey:",_target,_a7);
objj_msgSend(_bb,"encodeObject:forKey:",_action,_a8);
if((_isEnabled)!==(YES)){
objj_msgSend(_bb,"encodeObject:forKey:",(_isEnabled),(_a9));
}
if((_isHidden)!==(NO)){
objj_msgSend(_bb,"encodeObject:forKey:",(_isHidden),(_aa));
}
if((_tag)!==(0)){
objj_msgSend(_bb,"encodeObject:forKey:",(_tag),(_ab));
}
if((_state)!==(CPOffState)){
objj_msgSend(_bb,"encodeObject:forKey:",(_state),(_ac));
}
if((_image)!==(nil)){
objj_msgSend(_bb,"encodeObject:forKey:",(_image),(_ad));
}
if((_alternateImage)!==(nil)){
objj_msgSend(_bb,"encodeObject:forKey:",(_alternateImage),(_ae));
}
if((_submenu)!==(nil)){
objj_msgSend(_bb,"encodeObject:forKey:",(_submenu),(_af));
}
if((_menu)!==(nil)){
objj_msgSend(_bb,"encodeObject:forKey:",(_menu),(_b0));
}
if(_keyEquivalent&&_keyEquivalent.length){
objj_msgSend(_bb,"encodeObject:forKey:",_keyEquivalent,_b1);
}
if(_keyEquivalentModifierMask){
objj_msgSend(_bb,"encodeObject:forKey:",_keyEquivalentModifierMask,_b2);
}
if(_indentationLevel>0){
objj_msgSend(_bb,"encodeInt:forKey:",_indentationLevel,_b3);
}
if((_representedObject)!==(nil)){
objj_msgSend(_bb,"encodeObject:forKey:",(_representedObject),(_b4));
}
if((_view)!==(nil)){
objj_msgSend(_bb,"encodeObject:forKey:",(_view),(_b5));
}
}
})]);
