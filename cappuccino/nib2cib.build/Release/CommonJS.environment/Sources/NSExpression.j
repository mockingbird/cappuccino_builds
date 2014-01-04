@STATIC;1.0;I;25;Foundation/CPExpression.jt;6156;
objj_executeFile("Foundation/CPExpression.j",NO);
var _1=objj_allocateClassPair(_CPKeyPathExpression,"NSKeyPathExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"NS_initWithCoder:",_5);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_6,_7){
with(_6){
return objj_msgSend(_CPKeyPathExpression,"class");
}
})]);
var _1=objj_allocateClassPair(_CPConstantValueExpression,"_CPKeyPathSpecifierExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_8,_9,_a){
with(_8){
var _b=objj_msgSend(_a,"decodeObjectForKey:","NSKeyPath");
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("_CPKeyPathSpecifierExpression").super_class},"initWithValue:",_b);
return _8;
}
})]);
var _1=objj_allocateClassPair(_CPKeyPathSpecifierExpression,"NSKeyPathSpecifierExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_c,_d,_e){
with(_c){
return objj_msgSend(_c,"NS_initWithCoder:",_e);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_f,_10){
with(_f){
return objj_msgSend(_CPConstantValueExpression,"class");
}
})]);
var _1=objj_getClass("_CPConstantValueExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPConstantValueExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_11,_12,_13){
with(_11){
var _14=objj_msgSend(_13,"decodeObjectForKey:","NSConstantValue");
return objj_msgSend(_11,"initWithValue:",_14);
}
})]);
var _1=objj_allocateClassPair(_CPConstantValueExpression,"NSConstantValueExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_15,_16,_17){
with(_15){
return objj_msgSend(_15,"NS_initWithCoder:",_17);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_18,_19){
with(_18){
return objj_msgSend(_CPConstantValueExpression,"class");
}
})]);
var _1=objj_getClass("_CPFunctionExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPFunctionExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=objj_msgSend(_1c,"decodeIntForKey:","NSExpressionType"),_1e=objj_msgSend(_1c,"decodeObjectForKey:","NSOperand"),_1f=CPSelectorFromString(objj_msgSend(_1c,"decodeObjectForKey:","NSSelectorName")),_20=objj_msgSend(_1c,"decodeObjectForKey:","NSArguments");
return objj_msgSend(_1a,"initWithTarget:selector:arguments:type:",_1e,_1f,_20,_1d);
}
})]);
var _1=objj_allocateClassPair(_CPFunctionExpression,"NSFunctionExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(_21,"NS_initWithCoder:",_23);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_24,_25){
with(_24){
return objj_msgSend(_CPFunctionExpression,"class");
}
})]);
var _1=objj_getClass("_CPSetExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPSetExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_28,"decodeIntForKey:","NSExpressionType"),_2a=objj_msgSend(_28,"decodeObjectForKey:","NSLeftExpression"),_2b=objj_msgSend(_28,"decodeObjectForKey:","NSRightExpression");
return objj_msgSend(_26,"initWithType:left:right:",_29,_2a,_2b);
}
})]);
var _1=objj_allocateClassPair(_CPSetExpression,"NSSetExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_2c,_2d,_2e){
with(_2c){
return objj_msgSend(_2c,"NS_initWithCoder:",_2e);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_2f,_30){
with(_2f){
return objj_msgSend(_CPSetExpression,"class");
}
})]);
var _1=objj_allocateClassPair(_CPSelfExpression,"NSSelfExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_31,_32,_33){
with(_31){
return objj_msgSendSuper({receiver:_31,super_class:objj_getClass("NSSelfExpression").super_class},"init");
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_34,_35){
with(_34){
return objj_msgSend(_CPSelfExpression,"class");
}
})]);
var _1=objj_getClass("_CPVariableExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPVariableExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_36,_37,_38){
with(_36){
var _39=objj_msgSend(_38,"decodeObjectForKey:","NSVariable");
return objj_msgSend(_36,"initWithVariable:",_39);
}
})]);
var _1=objj_allocateClassPair(_CPVariableExpression,"NSVariableExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3a,_3b,_3c){
with(_3a){
return objj_msgSend(_3a,"NS_initWithCoder:",_3c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_3d,_3e){
with(_3d){
return objj_msgSend(_CPVariableExpression,"class");
}
})]);
var _1=objj_getClass("_CPAggregateExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPAggregateExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3f,_40,_41){
with(_3f){
var _42=objj_msgSend(_41,"decodeObjectForKey:","NSCollection");
return objj_msgSend(_3f,"initWithAggregate:",_42);
}
})]);
var _1=objj_allocateClassPair(_CPAggregateExpression,"NSAggregateExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_43,_44,_45){
with(_43){
return objj_msgSend(_43,"NS_initWithCoder:",_45);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_46,_47){
with(_46){
return objj_msgSend(_CPAggregateExpression,"class");
}
})]);
