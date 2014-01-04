@STATIC;1.0;I;21;Foundation/CPString.jI;24;Foundation/CPFormatter.jI;28;Foundation/CPDecimalNumber.jt;8361;
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPFormatter.j",NO);
objj_executeFile("Foundation/CPDecimalNumber.j",NO);
CPNumberFormatterNoStyle=0;
CPNumberFormatterDecimalStyle=1;
CPNumberFormatterCurrencyStyle=2;
CPNumberFormatterPercentStyle=3;
CPNumberFormatterScientificStyle=4;
CPNumberFormatterSpellOutStyle=5;
CPNumberFormatterRoundCeiling=CPRoundUp;
CPNumberFormatterRoundFloor=CPRoundDown;
CPNumberFormatterRoundDown=CPRoundDown;
CPNumberFormatterRoundUp=CPRoundUp;
CPNumberFormatterRoundHalfEven=CPRoundBankers;
CPNumberFormatterRoundHalfDown=_CPRoundHalfDown;
CPNumberFormatterRoundHalfUp=CPRoundPlain;
var _1=objj_allocateClassPair(CPFormatter,"CPNumberFormatter"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_numberStyle"),new objj_ivar("_perMillSymbol"),new objj_ivar("_groupingSeparator"),new objj_ivar("_roundingMode"),new objj_ivar("_minimumFractionDigits"),new objj_ivar("_maximumFractionDigits"),new objj_ivar("_currencyCode"),new objj_ivar("_currencySymbol"),new objj_ivar("_generatesDecimalNumbers"),new objj_ivar("_numberHandler")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("numberStyle"),function(_3,_4){
with(_3){
return _numberStyle;
}
}),new objj_method(sel_getUid("setNumberStyle:"),function(_5,_6,_7){
with(_5){
_numberStyle=_7;
}
}),new objj_method(sel_getUid("perMillSymbol"),function(_8,_9){
with(_8){
return _perMillSymbol;
}
}),new objj_method(sel_getUid("setPerMillSymbol:"),function(_a,_b,_c){
with(_a){
_perMillSymbol=_c;
}
}),new objj_method(sel_getUid("groupingSeparator"),function(_d,_e){
with(_d){
return _groupingSeparator;
}
}),new objj_method(sel_getUid("setGroupingSeparator:"),function(_f,_10,_11){
with(_f){
_groupingSeparator=_11;
}
}),new objj_method(sel_getUid("roundingMode"),function(_12,_13){
with(_12){
return _roundingMode;
}
}),new objj_method(sel_getUid("setRoundingMode:"),function(_14,_15,_16){
with(_14){
_roundingMode=_16;
}
}),new objj_method(sel_getUid("minimumFractionDigits"),function(_17,_18){
with(_17){
return _minimumFractionDigits;
}
}),new objj_method(sel_getUid("setMinimumFractionDigits:"),function(_19,_1a,_1b){
with(_19){
_minimumFractionDigits=_1b;
}
}),new objj_method(sel_getUid("maximumFractionDigits"),function(_1c,_1d){
with(_1c){
return _maximumFractionDigits;
}
}),new objj_method(sel_getUid("setMaximumFractionDigits:"),function(_1e,_1f,_20){
with(_1e){
_maximumFractionDigits=_20;
}
}),new objj_method(sel_getUid("currencyCode"),function(_21,_22){
with(_21){
return _currencyCode;
}
}),new objj_method(sel_getUid("setCurrencyCode:"),function(_23,_24,_25){
with(_23){
_currencyCode=_25;
}
}),new objj_method(sel_getUid("currencySymbol"),function(_26,_27){
with(_26){
return _currencySymbol;
}
}),new objj_method(sel_getUid("setCurrencySymbol:"),function(_28,_29,_2a){
with(_28){
_currencySymbol=_2a;
}
}),new objj_method(sel_getUid("generatesDecimalNumbers"),function(_2b,_2c){
with(_2b){
return _generatesDecimalNumbers;
}
}),new objj_method(sel_getUid("setGeneratesDecimalNumbers:"),function(_2d,_2e,_2f){
with(_2d){
_generatesDecimalNumbers=_2f;
}
}),new objj_method(sel_getUid("init"),function(_30,_31){
with(_30){
if(_30=objj_msgSendSuper({receiver:_30,super_class:objj_getClass("CPNumberFormatter").super_class},"init")){
_roundingMode=CPNumberFormatterRoundHalfEven;
_minimumFractionDigits=0;
_maximumFractionDigits=0;
_groupingSeparator=",";
_generatesDecimalNumbers=YES;
_currencyCode="USD";
_currencySymbol="$";
}
return _30;
}
}),new objj_method(sel_getUid("stringFromNumber:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_34,"isKindOfClass:",CPDecimalNumber)?_34:objj_msgSend(objj_msgSend(CPDecimalNumber,"alloc"),"_initWithJSNumber:",_34);
switch(_numberStyle){
case CPNumberFormatterCurrencyStyle:
case CPNumberFormatterDecimalStyle:
if(!_numberHandler){
_numberHandler=objj_msgSend(CPDecimalNumberHandler,"decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:",_roundingMode,_maximumFractionDigits,NO,NO,NO,YES);
}
_35=objj_msgSend(_35,"decimalNumberByRoundingAccordingToBehavior:",_numberHandler);
var _36=objj_msgSend(_35,"descriptionWithLocale:",nil),_37=objj_msgSend(_36,"componentsSeparatedByString:","."),_38=_37[0],_39=_37.length>1?_37[1]:"",_3a=objj_msgSend(_38,"length"),_3b=3;
while(_39.length<_minimumFractionDigits){
_39+="0";
}
if(_groupingSeparator){
for(var _3b=3,_3c=objj_msgSend(_38,"length");_3b<_3c;_3b+=4){
_38=objj_msgSend(_38,"stringByReplacingCharactersInRange:withString:",CPMakeRange(_3c-_3b,0),_groupingSeparator);
_3c+=1;
}
}
var _3d=_38;
if(_39){
_3d+="."+_39;
}
if(_numberStyle===CPNumberFormatterCurrencyStyle){
if(_currencySymbol){
_3d=_currencySymbol+_3d;
}else{
_3d=_currencyCode+_3d;
}
}
return _3d;
default:
return objj_msgSend(_34,"description");
}
}
}),new objj_method(sel_getUid("numberFromString:"),function(_3e,_3f,_40){
with(_3e){
if(_generatesDecimalNumbers){
return objj_msgSend(CPDecimalNumber,"decimalNumberWithString:",_40);
}else{
return parseFloat(_40);
}
}
}),new objj_method(sel_getUid("stringForObjectValue:"),function(_41,_42,_43){
with(_41){
if(objj_msgSend(_43,"isKindOfClass:",objj_msgSend(CPNumber,"class"))){
return objj_msgSend(_41,"stringFromNumber:",_43);
}else{
return objj_msgSend(_43,"description");
}
}
}),new objj_method(sel_getUid("editingStringForObjectValue:"),function(_44,_45,_46){
with(_44){
return objj_msgSend(_44,"stringForObjectValue:",_46);
}
}),new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"),function(_47,_48,_49,_4a,_4b){
with(_47){
var _4c=objj_msgSend(_47,"numberFromString:",_4a);
_49(_4c);
return YES;
}
}),new objj_method(sel_getUid("setNumberStyle:"),function(_4d,_4e,_4f){
with(_4d){
_numberStyle=_4f;
switch(_4f){
case CPNumberFormatterDecimalStyle:
_minimumFractionDigits=0;
_maximumFractionDigits=3;
_numberHandler=nil;
break;
case CPNumberFormatterCurrencyStyle:
_minimumFractionDigits=2;
_maximumFractionDigits=2;
_numberHandler=nil;
break;
}
}
}),new objj_method(sel_getUid("setRoundingMode:"),function(_50,_51,_52){
with(_50){
_roundingMode=_52;
_numberHandler=nil;
}
}),new objj_method(sel_getUid("setMinimumFractionDigits:"),function(_53,_54,_55){
with(_53){
_minimumFractionDigits=_55;
_numberHandler=nil;
}
}),new objj_method(sel_getUid("setMaximumFractionDigits:"),function(_56,_57,_58){
with(_56){
_maximumFractionDigits=_58;
_numberHandler=nil;
}
})]);
var _59="CPNumberFormatterStyleKey",_5a="CPNumberFormatterMinimumFractionDigitsKey",_5b="CPNumberFormatterMaximumFractionDigitsKey",_5c="CPNumberFormatterRoundingModeKey",_5d="CPNumberFormatterGroupingSeparatorKey",_5e="CPNumberFormatterCurrencyCodeKey",_5f="CPNumberFormatterCurrencySymbolKey",_60="CPNumberFormatterGeneratesDecimalNumbers";
var _1=objj_getClass("CPNumberFormatter");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPNumberFormatter\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_61,_62,_63){
with(_61){
_61=objj_msgSendSuper({receiver:_61,super_class:objj_getClass("CPNumberFormatter").super_class},"initWithCoder:",_63);
if(_61){
_numberStyle=objj_msgSend(_63,"decodeIntForKey:",_59);
_minimumFractionDigits=objj_msgSend(_63,"decodeIntForKey:",_5a);
_maximumFractionDigits=objj_msgSend(_63,"decodeIntForKey:",_5b);
_roundingMode=objj_msgSend(_63,"decodeIntForKey:",_5c);
_groupingSeparator=objj_msgSend(_63,"decodeObjectForKey:",_5d);
_currencyCode=objj_msgSend(_63,"decodeObjectForKey:",_5e);
_currencySymbol=objj_msgSend(_63,"decodeObjectForKey:",_5f);
_generatesDecimalNumbers=objj_msgSend(_63,"decodeBoolForKey:",_60);
}
return _61;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_64,_65,_66){
with(_64){
objj_msgSendSuper({receiver:_64,super_class:objj_getClass("CPNumberFormatter").super_class},"encodeWithCoder:",_66);
objj_msgSend(_66,"encodeInt:forKey:",_numberStyle,_59);
objj_msgSend(_66,"encodeInt:forKey:",_minimumFractionDigits,_5a);
objj_msgSend(_66,"encodeInt:forKey:",_maximumFractionDigits,_5b);
objj_msgSend(_66,"encodeInt:forKey:",_roundingMode,_5c);
objj_msgSend(_66,"encodeObject:forKey:",_groupingSeparator,_5d);
objj_msgSend(_66,"encodeObject:forKey:",_currencyCode,_5e);
objj_msgSend(_66,"encodeObject:forKey:",_currencySymbol,_5f);
objj_msgSend(_66,"encodeBool:forKey:",_generatesDecimalNumbers,_60);
}
})]);
