@STATIC;1.0;I;21;Foundation/CPObject.jI;31;Foundation/CPAttributedString.jt;518;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPAttributedString.j",NO);
var _1=objj_allocateClassPair(CPAttributedString,"NSAttributedString"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(CPAttributedString,"alloc"),"initWithString:","");
}
})]);
var _1=objj_allocateClassPair(NSAttributedString,"NSMutableAttributedString"),_2=_1.isa;
objj_registerClassPair(_1);
