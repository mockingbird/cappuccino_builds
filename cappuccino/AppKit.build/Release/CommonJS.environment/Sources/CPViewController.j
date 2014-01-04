@STATIC;1.0;I;20;Foundation/CPArray.ji;15;CPApplication.ji;7;CPCib.ji;13;CPResponder.jt;6482;
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("CPApplication.j",YES);
objj_executeFile("CPCib.j",YES);
objj_executeFile("CPResponder.j",YES);
var _1;
var _2=objj_allocateClassPair(CPResponder,"CPViewController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_view"),new objj_ivar("_isLoading"),new objj_ivar("_isLazy"),new objj_ivar("_isViewLoaded"),new objj_ivar("_representedObject"),new objj_ivar("_title"),new objj_ivar("_cibName"),new objj_ivar("_cibBundle"),new objj_ivar("_cibExternalNameTable")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("view"),function(_4,_5){
with(_4){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_6,_7,_8){
with(_6){
_view=_8;
}
}),new objj_method(sel_getUid("isViewLoaded"),function(_9,_a){
with(_9){
return _isViewLoaded;
}
}),new objj_method(sel_getUid("_setIsViewLoaded:"),function(_b,_c,_d){
with(_b){
_isViewLoaded=_d;
}
}),new objj_method(sel_getUid("representedObject"),function(_e,_f){
with(_e){
return _representedObject;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_10,_11,_12){
with(_10){
_representedObject=_12;
}
}),new objj_method(sel_getUid("title"),function(_13,_14){
with(_13){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_15,_16,_17){
with(_15){
_title=_17;
}
}),new objj_method(sel_getUid("cibName"),function(_18,_19){
with(_18){
return _cibName;
}
}),new objj_method(sel_getUid("cibBundle"),function(_1a,_1b){
with(_1a){
return _cibBundle;
}
}),new objj_method(sel_getUid("cibExternalNameTable"),function(_1c,_1d){
with(_1c){
return _cibExternalNameTable;
}
}),new objj_method(sel_getUid("init"),function(_1e,_1f){
with(_1e){
return objj_msgSend(_1e,"initWithCibName:bundle:",nil,nil);
}
}),new objj_method(sel_getUid("initWithCibName:bundle:"),function(_20,_21,_22,_23){
with(_20){
return objj_msgSend(_20,"initWithCibName:bundle:externalNameTable:",_22,_23,nil);
}
}),new objj_method(sel_getUid("initWithCibName:bundle:owner:"),function(_24,_25,_26,_27,_28){
with(_24){
return objj_msgSend(_24,"initWithCibName:bundle:externalNameTable:",_26,_27,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_28,CPCibOwner));
}
}),new objj_method(sel_getUid("initWithCibName:bundle:externalNameTable:"),function(_29,_2a,_2b,_2c,_2d){
with(_29){
_29=objj_msgSendSuper({receiver:_29,super_class:objj_getClass("CPViewController").super_class},"init");
if(_29){
_cibName=_2b;
_cibBundle=_2c||objj_msgSend(CPBundle,"mainBundle");
_cibExternalNameTable=_2d||objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_29,CPCibOwner);
_isLoading=NO;
_isLazy=NO;
}
return _29;
}
}),new objj_method(sel_getUid("loadView"),function(_2e,_2f){
with(_2e){
if(_view){
return;
}
if(_cibName){
var cib=objj_msgSend(_1,"objectForKey:",_cibName);
if(!cib){
cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithCibNamed:bundle:",_cibName,_cibBundle);
objj_msgSend(_1,"setObject:forKey:",cib,_cibName);
}
objj_msgSend(cib,"instantiateCibWithExternalNameTable:",_cibExternalNameTable);
}else{
_view=objj_msgSend(CPView,"new");
}
}
}),new objj_method(sel_getUid("view"),function(_30,_31){
with(_30){
if(!_view){
_isLoading=YES;
var _32=objj_msgSend(_cibExternalNameTable,"objectForKey:",CPCibOwner);
if(objj_msgSend(_32,"respondsToSelector:",sel_getUid("viewControllerWillLoadCib:"))){
objj_msgSend(_32,"viewControllerWillLoadCib:",_30);
}
objj_msgSend(_30,"loadView");
if(_view===nil&&objj_msgSend(_32,"isKindOfClass:",objj_msgSend(CPDocument,"class"))){
objj_msgSend(_30,"setView:",objj_msgSend(_32,"valueForKey:","view"));
}
if(!_view){
var _33=objj_msgSend(CPString,"stringWithFormat:","View for %@ could not be loaded from Cib or no view specified. Override loadView to load the view manually.",_30);
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_33);
}
if(objj_msgSend(_32,"respondsToSelector:",sel_getUid("viewControllerDidLoadCib:"))){
objj_msgSend(_32,"viewControllerDidLoadCib:",_30);
}
_isLoading=NO;
objj_msgSend(_30,"_viewDidLoad");
}else{
if(_isLazy){
_isLazy=NO;
objj_msgSend(_30,"_viewDidLoad");
}
}
return _view;
}
}),new objj_method(sel_getUid("_viewDidLoad"),function(_34,_35){
with(_34){
objj_msgSend(_34,"willChangeValueForKey:","isViewLoaded");
objj_msgSend(_34,"viewDidLoad");
isViewLoaded=YES;
objj_msgSend(_34,"didChangeValueForKey:","isViewLoaded");
}
}),new objj_method(sel_getUid("viewDidLoad"),function(_36,_37){
with(_36){
}
}),new objj_method(sel_getUid("setView:"),function(_38,_39,_3a){
with(_38){
var _3b=(_isViewLoaded==NO&&_3a!=nil)||(_isViewLoaded==YES&&_3a==nil);
if(_3b){
objj_msgSend(_38,"willChangeValueForKey:","isViewLoaded");
}
_view=_3a;
_isViewLoaded=_3a!==nil;
if(_3b){
objj_msgSend(_38,"didChangeValueForKey:","isViewLoaded");
}
}
}),new objj_method(sel_getUid("automaticallyNotifiesObserversOfIsViewLoaded"),function(_3c,_3d){
with(_3c){
return NO;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_3e,_3f){
with(_3e){
if(_3e!==objj_msgSend(CPViewController,"class")){
return;
}
_1=objj_msgSend(CPDictionary,"dictionary");
}
})]);
var _40="CPViewControllerViewKey",_41="CPViewControllerTitleKey",_42="CPViewControllerCibNameKey",_43="CPViewControllerBundleKey";
var _2=objj_getClass("CPViewController");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPViewController\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_44,_45,_46){
with(_44){
_44=objj_msgSendSuper({receiver:_44,super_class:objj_getClass("CPViewController").super_class},"initWithCoder:",_46);
if(_44){
_view=objj_msgSend(_46,"decodeObjectForKey:",_40);
_title=objj_msgSend(_46,"decodeObjectForKey:",_41);
_cibName=objj_msgSend(_46,"decodeObjectForKey:",_42);
var _47=objj_msgSend(_46,"decodeObjectForKey:",_43);
_cibBundle=_47?objj_msgSend(CPBundle,"bundleWithPath:",_47):objj_msgSend(CPBundle,"mainBundle");
_cibExternalNameTable=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_44,CPCibOwner);
_isLazy=YES;
}
return _44;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_48,_49,_4a){
with(_48){
objj_msgSendSuper({receiver:_48,super_class:objj_getClass("CPViewController").super_class},"encodeWithCoder:",_4a);
objj_msgSend(_4a,"encodeObject:forKey:",_view,_40);
objj_msgSend(_4a,"encodeObject:forKey:",_title,_41);
objj_msgSend(_4a,"encodeObject:forKey:",_cibName,_42);
objj_msgSend(_4a,"encodeObject:forKey:",objj_msgSend(_cibBundle,"bundlePath"),_43);
}
})]);
