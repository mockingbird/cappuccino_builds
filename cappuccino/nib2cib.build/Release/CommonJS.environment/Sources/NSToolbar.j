@STATIC;1.0;I;18;AppKit/CPToolbar.ji;15;NSToolbarItem.jt;1924;
objj_executeFile("AppKit/CPToolbar.j",NO);
objj_executeFile("NSToolbarItem.j",YES);
var _1=objj_getClass("CPToolbar");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPToolbar\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3){
_identifier=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarIdentifier");
_displayMode=objj_msgSend(_5,"decodeIntForKey:","NSToolbarDisplayMode");
_showsBaselineSeparator=objj_msgSend(_5,"decodeBoolForKey:","NSToolbarShowsBaselineSeparator");
_allowsUserCustomization=objj_msgSend(_5,"decodeBoolForKey:","NSToolbarAllowsUserCustomization");
_isVisible=objj_msgSend(_5,"decodeBoolForKey:","NSToolbarPrefersToBeShown");
_identifiedItems=objj_msgSend(CPMutableDictionary,"dictionary");
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarIBIdentifiedItems"),_7=nil,_8=objj_msgSend(_6,"keyEnumerator");
while((_7=objj_msgSend(_8,"nextObject"))!==nil){
var _9=NS_CPToolbarItemIdentifierMap[_7]||_7;
objj_msgSend(_identifiedItems,"setObject:forKey:",objj_msgSend(_6,"objectForKey:",_7),_9);
}
_defaultItems=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarIBDefaultItems");
_allowedItems=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarIBAllowedItems");
_selectableItems=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarIBSelectableItems");
_sizeMode=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarSizeMode")||CPToolbarSizeModeDefault;
_delegate=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarDelegate");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPToolbar,"NSToolbar"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"NS_initWithCoder:",_c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_d,_e){
with(_d){
return objj_msgSend(CPToolbar,"class");
}
})]);
