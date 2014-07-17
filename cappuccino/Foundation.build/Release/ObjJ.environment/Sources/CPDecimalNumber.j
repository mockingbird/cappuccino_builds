@STATIC;1.0;i;11;CPDecimal.ji;13;CPException.ji;10;CPNumber.ji;10;CPObject.ji;10;CPString.jt;37317;objj_executeFile("CPDecimal.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPNumber.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);var CPDefaultDcmHandler = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPDecimalNumberHandler"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_roundingMode"), new objj_ivar("_scale"), new objj_ivar("_raiseOnExactness"), new objj_ivar("_raiseOnOverflow"), new objj_ivar("_raiseOnUnderflow"), new objj_ivar("_raiseOnDivideByZero")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPDecimalNumberHandler__init(self, _cmd)
{
    return self.isa.objj_msgSend(self, "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", CPRoundPlain, 0, NO, YES, YES, YES);
}
,["id"]), new objj_method(sel_getUid("initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:"), function $CPDecimalNumberHandler__initWithRoundingMode_scale_raiseOnExactness_raiseOnOverflow_raiseOnUnderflow_raiseOnDivideByZero_(self, _cmd, roundingMode, scale, exact, overflow, underflow, divideByZero)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDecimalNumberHandler").super_class }, "init"))
    {
        self._roundingMode = roundingMode;
        self._scale = scale;
        self._raiseOnExactness = exact;
        self._raiseOnOverflow = overflow;
        self._raiseOnUnderflow = underflow;
        self._raiseOnDivideByZero = divideByZero;
    }
    return self;
}
,["id","CPRoundingMode","short","BOOL","BOOL","BOOL","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:"), function $CPDecimalNumberHandler__decimalNumberHandlerWithRoundingMode_scale_raiseOnExactness_raiseOnOverflow_raiseOnUnderflow_raiseOnDivideByZero_(self, _cmd, roundingMode, scale, exact, overflow, underflow, divideByZero)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", roundingMode, scale, exact, overflow, underflow, divideByZero));
    var ___r1;
}
,["id","CPRoundingMode","short","BOOL","BOOL","BOOL","BOOL"]), new objj_method(sel_getUid("defaultDecimalNumberHandler"), function $CPDecimalNumberHandler__defaultDecimalNumberHandler(self, _cmd)
{
    if (!CPDefaultDcmHandler)
        CPDefaultDcmHandler = ((___r1 = CPDecimalNumberHandler.isa.objj_msgSend0(CPDecimalNumberHandler, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return CPDefaultDcmHandler;
    var ___r1;
}
,["id"])]);
}{var the_protocol = objj_allocateProtocol("CPDecimalNumberBehaviors");
objj_registerProtocol(the_protocol);
protocol_addMethodDescriptions(the_protocol, [new objj_method(sel_getUid("roundingMode"), Nil
,["CPRoundingMode"]), new objj_method(sel_getUid("scale"), Nil
,["short"]), new objj_method(sel_getUid("exceptionDuringOperation:error:leftOperand:rightOperand:"), Nil
,["CPDecimalNumber","SEL","CPCalculationError","CPDecimalNumber","CPDecimalNumber"])], true, true);
}{
var the_class = objj_getClass("CPDecimalNumberHandler")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDecimalNumberHandler\"");
var meta_class = the_class.isa;
var aProtocol = objj_getProtocol("CPDecimalNumberBehaviors");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPDecimalNumberBehaviors\"");
class_addProtocol(the_class, aProtocol);class_addMethods(the_class, [new objj_method(sel_getUid("roundingMode"), function $CPDecimalNumberHandler__roundingMode(self, _cmd)
{
    return self._roundingMode;
}
,["CPRoundingMode"]), new objj_method(sel_getUid("scale"), function $CPDecimalNumberHandler__scale(self, _cmd)
{
    return self._scale;
}
,["short"]), new objj_method(sel_getUid("exceptionDuringOperation:error:leftOperand:rightOperand:"), function $CPDecimalNumberHandler__exceptionDuringOperation_error_leftOperand_rightOperand_(self, _cmd, operation, error, leftOperand, rightOperand)
{
    switch(error) {
    case CPCalculationNoError:
        break;
    case CPCalculationOverflow:
        if (self._raiseOnOverflow)
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPDecimalNumberOverflowException, "A CPDecimalNumber overflow has occurred. (Left operand= '" + (leftOperand == null ? null : leftOperand.isa.objj_msgSend1(leftOperand, "descriptionWithLocale:", nil)) + "' Right operand= '" + (rightOperand == null ? null : rightOperand.isa.objj_msgSend1(rightOperand, "descriptionWithLocale:", nil)) + "' Selector= '" + operation + "')");
        else
            return (CPDecimalNumber == null ? null : CPDecimalNumber.isa.objj_msgSend0(CPDecimalNumber, "notANumber"));
        break;
    case CPCalculationUnderflow:
        if (self._raiseOnUnderflow)
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPDecimalNumberUnderflowException, "A CPDecimalNumber underflow has occurred. (Left operand= '" + (leftOperand == null ? null : leftOperand.isa.objj_msgSend1(leftOperand, "descriptionWithLocale:", nil)) + "' Right operand= '" + (rightOperand == null ? null : rightOperand.isa.objj_msgSend1(rightOperand, "descriptionWithLocale:", nil)) + "' Selector= '" + operation + "')");
        else
            return (CPDecimalNumber == null ? null : CPDecimalNumber.isa.objj_msgSend0(CPDecimalNumber, "notANumber"));
        break;
    case CPCalculationLossOfPrecision:
        if (self._raiseOnExactness)
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPDecimalNumberExactnessException, "A CPDecimalNumber has been rounded off during a calculation. (Left operand= '" + (leftOperand == null ? null : leftOperand.isa.objj_msgSend1(leftOperand, "descriptionWithLocale:", nil)) + "' Right operand= '" + (rightOperand == null ? null : rightOperand.isa.objj_msgSend1(rightOperand, "descriptionWithLocale:", nil)) + "' Selector= '" + operation + "')");
        break;
    case CPCalculationDivideByZero:
        if (self._raiseOnDivideByZero)
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPDecimalNumberDivideByZeroException, "A CPDecimalNumber divide by zero has occurred. (Left operand= '" + (leftOperand == null ? null : leftOperand.isa.objj_msgSend1(leftOperand, "descriptionWithLocale:", nil)) + "' Right operand= '" + (rightOperand == null ? null : rightOperand.isa.objj_msgSend1(rightOperand, "descriptionWithLocale:", nil)) + "' Selector= '" + operation + "')");
        else
            return (CPDecimalNumber == null ? null : CPDecimalNumber.isa.objj_msgSend0(CPDecimalNumber, "notANumber"));
        break;
default:
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "An unknown CPDecimalNumber error has occurred. (Left operand= '" + (leftOperand == null ? null : leftOperand.isa.objj_msgSend1(leftOperand, "descriptionWithLocale:", nil)) + "' Right operand= '" + (rightOperand == null ? null : rightOperand.isa.objj_msgSend1(rightOperand, "descriptionWithLocale:", nil)) + "' Selector= '" + operation + "')");
    }
    return nil;
}
,["CPDecimalNumber","SEL","CPCalculationError","CPDecimalNumber","CPDecimalNumber"])]);
}var CPDecimalNumberHandlerRoundingModeKey = "CPDecimalNumberHandlerRoundingModeKey",
    CPDecimalNumberHandlerScaleKey = "CPDecimalNumberHandlerScaleKey",
    CPDecimalNumberHandlerRaiseOnExactKey = "CPDecimalNumberHandlerRaiseOnExactKey",
    CPDecimalNumberHandlerRaiseOnOverflowKey = "CPDecimalNumberHandlerRaiseOnOverflowKey",
    CPDecimalNumberHandlerRaiseOnUnderflowKey = "CPDecimalNumberHandlerRaiseOnUnderflowKey",
    CPDecimalNumberHandlerDivideByZeroKey = "CPDecimalNumberHandlerDivideByZeroKey";
{
var the_class = objj_getClass("CPDecimalNumberHandler")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDecimalNumberHandler\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPDecimalNumberHandler__initWithCoder_(self, _cmd, aCoder)
{
    if (self)
    {
        self.isa.objj_msgSend(self, "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPDecimalNumberHandlerRoundingModeKey)), (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPDecimalNumberHandlerScaleKey)), (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPDecimalNumberHandlerRaiseOnExactKey)), (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPDecimalNumberHandlerRaiseOnOverflowKey)), (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPDecimalNumberHandlerRaiseOnUnderflowKey)), (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPDecimalNumberHandlerDivideByZeroKey)));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPDecimalNumberHandler__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self.isa.objj_msgSend0(self, "roundingMode"), CPDecimalNumberHandlerRoundingModeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self.isa.objj_msgSend0(self, "scale"), CPDecimalNumberHandlerScaleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._raiseOnExactness, CPDecimalNumberHandlerRaiseOnExactKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._raiseOnOverflow, CPDecimalNumberHandlerRaiseOnOverflowKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._raiseOnUnderflow, CPDecimalNumberHandlerRaiseOnUnderflowKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._raiseOnDivideByZero, CPDecimalNumberHandlerDivideByZeroKey));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPNumber, "CPDecimalNumber"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_data")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPDecimalNumber__init(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "initWithDecimal:", CPDecimalMakeNaN());
}
,["id"]), new objj_method(sel_getUid("initWithDecimal:"), function $CPDecimalNumber__initWithDecimal_(self, _cmd, dcm)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDecimalNumber").super_class }, "init"))
        self._data = CPDecimalCopy(dcm);
    return self;
}
,["id","CPDecimal"]), new objj_method(sel_getUid("initWithMantissa:exponent:isNegative:"), function $CPDecimalNumber__initWithMantissa_exponent_isNegative_(self, _cmd, mantissa, exponent, flag)
{
    if (self = (self == null ? null : self.isa.objj_msgSend0(self, "init")))
    {
        if (flag)
            mantissa *= -1;
        self._data = CPDecimalMakeWithParts(mantissa, exponent);
    }
    return self;
}
,["id","unsigned long long","short","BOOL"]), new objj_method(sel_getUid("initWithString:"), function $CPDecimalNumber__initWithString_(self, _cmd, numberValue)
{
    return self.isa.objj_msgSend2(self, "initWithString:locale:", numberValue, nil);
}
,["id","CPString"]), new objj_method(sel_getUid("initWithString:locale:"), function $CPDecimalNumber__initWithString_locale_(self, _cmd, numberValue, locale)
{
    if (self = (self == null ? null : self.isa.objj_msgSend0(self, "init")))
    {
        self._data = CPDecimalMakeWithString(numberValue, locale);
    }
    return self;
}
,["id","CPString","CPDictionary"]), new objj_method(sel_getUid("decimalNumberByAdding:"), function $CPDecimalNumber__decimalNumberByAdding_(self, _cmd, decimalNumber)
{
    return self.isa.objj_msgSend2(self, "decimalNumberByAdding:withBehavior:", decimalNumber, CPDecimalNumber.isa.objj_msgSend0(CPDecimalNumber, "defaultBehavior"));
}
,["CPDecimalNumber","CPDecimalNumber"]), new objj_method(sel_getUid("decimalNumberByAdding:withBehavior:"), function $CPDecimalNumber__decimalNumberByAdding_withBehavior_(self, _cmd, decimalNumber, behavior)
{
    var result = CPDecimalMakeZero(),
        error = CPDecimalAdd(result, self.isa.objj_msgSend0(self, "decimalValue"), (decimalNumber == null ? null : decimalNumber.isa.objj_msgSend0(decimalNumber, "decimalValue")), (behavior == null ? null : behavior.isa.objj_msgSend0(behavior, "roundingMode")));
    if (error > CPCalculationNoError)
    {
        var res = (behavior == null ? null : behavior.isa.objj_msgSend(behavior, "exceptionDuringOperation:error:leftOperand:rightOperand:", _cmd, error, self, decimalNumber));
        if (res != nil)
            return res;
    }
    return CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithDecimal:", result);
}
,["CPDecimalNumber","CPDecimalNumber","id"]), new objj_method(sel_getUid("decimalNumberBySubtracting:"), function $CPDecimalNumber__decimalNumberBySubtracting_(self, _cmd, decimalNumber)
{
    return self.isa.objj_msgSend2(self, "decimalNumberBySubtracting:withBehavior:", decimalNumber, CPDecimalNumber.isa.objj_msgSend0(CPDecimalNumber, "defaultBehavior"));
}
,["CPDecimalNumber","CPDecimalNumber"]), new objj_method(sel_getUid("decimalNumberBySubtracting:withBehavior:"), function $CPDecimalNumber__decimalNumberBySubtracting_withBehavior_(self, _cmd, decimalNumber, behavior)
{
    var result = CPDecimalMakeZero(),
        error = CPDecimalSubtract(result, self.isa.objj_msgSend0(self, "decimalValue"), (decimalNumber == null ? null : decimalNumber.isa.objj_msgSend0(decimalNumber, "decimalValue")), (behavior == null ? null : behavior.isa.objj_msgSend0(behavior, "roundingMode")));
    if (error > CPCalculationNoError)
    {
        var res = (behavior == null ? null : behavior.isa.objj_msgSend(behavior, "exceptionDuringOperation:error:leftOperand:rightOperand:", _cmd, error, self, decimalNumber));
        if (res != nil)
            return res;
    }
    return CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithDecimal:", result);
}
,["CPDecimalNumber","CPDecimalNumber","id"]), new objj_method(sel_getUid("decimalNumberByDividingBy:"), function $CPDecimalNumber__decimalNumberByDividingBy_(self, _cmd, decimalNumber)
{
    return self.isa.objj_msgSend2(self, "decimalNumberByDividingBy:withBehavior:", decimalNumber, CPDecimalNumber.isa.objj_msgSend0(CPDecimalNumber, "defaultBehavior"));
}
,["CPDecimalNumber","CPDecimalNumber"]), new objj_method(sel_getUid("decimalNumberByDividingBy:withBehavior:"), function $CPDecimalNumber__decimalNumberByDividingBy_withBehavior_(self, _cmd, decimalNumber, behavior)
{
    var result = CPDecimalMakeZero(),
        error = CPDecimalDivide(result, self.isa.objj_msgSend0(self, "decimalValue"), (decimalNumber == null ? null : decimalNumber.isa.objj_msgSend0(decimalNumber, "decimalValue")), (behavior == null ? null : behavior.isa.objj_msgSend0(behavior, "roundingMode")));
    if (error > CPCalculationNoError)
    {
        var res = (behavior == null ? null : behavior.isa.objj_msgSend(behavior, "exceptionDuringOperation:error:leftOperand:rightOperand:", _cmd, error, self, decimalNumber));
        if (res != nil)
            return res;
    }
    return CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithDecimal:", result);
}
,["CPDecimalNumber","CPDecimalNumber","id"]), new objj_method(sel_getUid("decimalNumberByMultiplyingBy:"), function $CPDecimalNumber__decimalNumberByMultiplyingBy_(self, _cmd, decimalNumber)
{
    return self.isa.objj_msgSend2(self, "decimalNumberByMultiplyingBy:withBehavior:", decimalNumber, CPDecimalNumber.isa.objj_msgSend0(CPDecimalNumber, "defaultBehavior"));
}
,["CPDecimalNumber","CPDecimalNumber"]), new objj_method(sel_getUid("decimalNumberByMultiplyingBy:withBehavior:"), function $CPDecimalNumber__decimalNumberByMultiplyingBy_withBehavior_(self, _cmd, decimalNumber, behavior)
{
    var result = CPDecimalMakeZero(),
        error = CPDecimalMultiply(result, self.isa.objj_msgSend0(self, "decimalValue"), (decimalNumber == null ? null : decimalNumber.isa.objj_msgSend0(decimalNumber, "decimalValue")), (behavior == null ? null : behavior.isa.objj_msgSend0(behavior, "roundingMode")));
    if (error > CPCalculationNoError)
    {
        var res = (behavior == null ? null : behavior.isa.objj_msgSend(behavior, "exceptionDuringOperation:error:leftOperand:rightOperand:", _cmd, error, self, decimalNumber));
        if (res != nil)
            return res;
    }
    return CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithDecimal:", result);
}
,["CPDecimalNumber","CPDecimalNumber","id"]), new objj_method(sel_getUid("decimalNumberByMultiplyingByPowerOf10:"), function $CPDecimalNumber__decimalNumberByMultiplyingByPowerOf10_(self, _cmd, power)
{
    return self.isa.objj_msgSend2(self, "decimalNumberByMultiplyingByPowerOf10:withBehavior:", power, CPDecimalNumber.isa.objj_msgSend0(CPDecimalNumber, "defaultBehavior"));
}
,["CPDecimalNumber","short"]), new objj_method(sel_getUid("decimalNumberByMultiplyingByPowerOf10:withBehavior:"), function $CPDecimalNumber__decimalNumberByMultiplyingByPowerOf10_withBehavior_(self, _cmd, power, behavior)
{
    var result = CPDecimalMakeZero(),
        error = CPDecimalMultiplyByPowerOf10(result, self.isa.objj_msgSend0(self, "decimalValue"), power, (behavior == null ? null : behavior.isa.objj_msgSend0(behavior, "roundingMode")));
    if (error > CPCalculationNoError)
    {
        var res = (behavior == null ? null : behavior.isa.objj_msgSend(behavior, "exceptionDuringOperation:error:leftOperand:rightOperand:", _cmd, error, self, CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithString:", power.toString())));
        if (res != nil)
            return res;
    }
    return CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithDecimal:", result);
}
,["CPDecimalNumber","short","id"]), new objj_method(sel_getUid("decimalNumberByRaisingToPower:"), function $CPDecimalNumber__decimalNumberByRaisingToPower_(self, _cmd, power)
{
    return self.isa.objj_msgSend2(self, "decimalNumberByRaisingToPower:withBehavior:", power, CPDecimalNumber.isa.objj_msgSend0(CPDecimalNumber, "defaultBehavior"));
}
,["CPDecimalNumber","unsigned"]), new objj_method(sel_getUid("decimalNumberByRaisingToPower:withBehavior:"), function $CPDecimalNumber__decimalNumberByRaisingToPower_withBehavior_(self, _cmd, power, behavior)
{
    if (power < 0)
        return (behavior == null ? null : behavior.isa.objj_msgSend(behavior, "exceptionDuringOperation:error:leftOperand:rightOperand:", _cmd, -1, self, CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithString:", power.toString())));
    var result = CPDecimalMakeZero(),
        error = CPDecimalPower(result, self.isa.objj_msgSend0(self, "decimalValue"), power, (behavior == null ? null : behavior.isa.objj_msgSend0(behavior, "roundingMode")));
    if (error > CPCalculationNoError)
    {
        var res = (behavior == null ? null : behavior.isa.objj_msgSend(behavior, "exceptionDuringOperation:error:leftOperand:rightOperand:", _cmd, error, self, CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithString:", power.toString())));
        if (res != nil)
            return res;
    }
    return CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithDecimal:", result);
}
,["CPDecimalNumber","unsigned","id"]), new objj_method(sel_getUid("decimalNumberByRoundingAccordingToBehavior:"), function $CPDecimalNumber__decimalNumberByRoundingAccordingToBehavior_(self, _cmd, behavior)
{
    var result = CPDecimalMakeZero();
    CPDecimalRound(result, self.isa.objj_msgSend0(self, "decimalValue"), (behavior == null ? null : behavior.isa.objj_msgSend0(behavior, "scale")), (behavior == null ? null : behavior.isa.objj_msgSend0(behavior, "roundingMode")));
    return CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithDecimal:", result);
}
,["CPDecimalNumber","id"]), new objj_method(sel_getUid("compare:"), function $CPDecimalNumber__compare_(self, _cmd, aNumber)
{
    if (!(aNumber == null ? null : aNumber.isa.objj_msgSend1(aNumber, "isKindOfClass:", CPDecimalNumber.isa.objj_msgSend0(CPDecimalNumber, "class"))))
        aNumber = CPDecimalNumber.isa.objj_msgSend1(CPDecimalNumber, "decimalNumberWithString:", aNumber.toString());
    return CPDecimalCompare(self.isa.objj_msgSend0(self, "decimalValue"), (aNumber == null ? null : aNumber.isa.objj_msgSend0(aNumber, "decimalValue")));
}
,["CPComparisonResult","CPNumber"]), new objj_method(sel_getUid("objCType"), function $CPDecimalNumber__objCType(self, _cmd)
{
    return "d";
}
,["CPString"]), new objj_method(sel_getUid("description"), function $CPDecimalNumber__description(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "descriptionWithLocale:", nil);
}
,["CPString"]), new objj_method(sel_getUid("descriptionWithLocale:"), function $CPDecimalNumber__descriptionWithLocale_(self, _cmd, locale)
{
    return CPDecimalString(self._data, locale);
}
,["CPString","CPDictionary"]), new objj_method(sel_getUid("stringValue"), function $CPDecimalNumber__stringValue(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "description");
}
,["CPString"]), new objj_method(sel_getUid("decimalValue"), function $CPDecimalNumber__decimalValue(self, _cmd)
{
    return CPDecimalCopy(self._data);
}
,["CPDecimal"]), new objj_method(sel_getUid("doubleValue"), function $CPDecimalNumber__doubleValue(self, _cmd)
{
    return parseFloat(self.isa.objj_msgSend0(self, "stringValue"));
}
,["double"]), new objj_method(sel_getUid("boolValue"), function $CPDecimalNumber__boolValue(self, _cmd)
{
    return CPDecimalIsZero(self._data) ? NO : YES;
}
,["BOOL"]), new objj_method(sel_getUid("charValue"), function $CPDecimalNumber__charValue(self, _cmd)
{
    return parseInt(self.isa.objj_msgSend0(self, "stringValue"));
}
,["char"]), new objj_method(sel_getUid("floatValue"), function $CPDecimalNumber__floatValue(self, _cmd)
{
    return parseFloat(self.isa.objj_msgSend0(self, "stringValue"));
}
,["float"]), new objj_method(sel_getUid("intValue"), function $CPDecimalNumber__intValue(self, _cmd)
{
    return parseInt(self.isa.objj_msgSend0(self, "stringValue"));
}
,["int"]), new objj_method(sel_getUid("longLongValue"), function $CPDecimalNumber__longLongValue(self, _cmd)
{
    return parseInt(self.isa.objj_msgSend0(self, "stringValue"));
}
,["long long"]), new objj_method(sel_getUid("longValue"), function $CPDecimalNumber__longValue(self, _cmd)
{
    return parseInt(self.isa.objj_msgSend0(self, "stringValue"));
}
,["long"]), new objj_method(sel_getUid("shortValue"), function $CPDecimalNumber__shortValue(self, _cmd)
{
    return parseInt(self.isa.objj_msgSend0(self, "stringValue"));
}
,["short"]), new objj_method(sel_getUid("unsignedCharValue"), function $CPDecimalNumber__unsignedCharValue(self, _cmd)
{
    return parseInt(self.isa.objj_msgSend0(self, "stringValue"));
}
,["unsigned char"]), new objj_method(sel_getUid("unsignedIntValue"), function $CPDecimalNumber__unsignedIntValue(self, _cmd)
{
    return parseInt(self.isa.objj_msgSend0(self, "stringValue"));
}
,["unsigned int"]), new objj_method(sel_getUid("unsignedLongValue"), function $CPDecimalNumber__unsignedLongValue(self, _cmd)
{
    return parseInt(self.isa.objj_msgSend0(self, "stringValue"));
}
,["unsigned long"]), new objj_method(sel_getUid("unsignedShortValue"), function $CPDecimalNumber__unsignedShortValue(self, _cmd)
{
    return parseInt(self.isa.objj_msgSend0(self, "stringValue"));
}
,["unsigned short"]), new objj_method(sel_getUid("isEqualToNumber:"), function $CPDecimalNumber__isEqualToNumber_(self, _cmd, aNumber)
{
    return CPDecimalCompare(CPDecimalMakeWithString(aNumber.toString(), nil), self._data) == CPOrderedSame ? YES : NO;
}
,["BOOL","CPNumber"]), new objj_method(sel_getUid("initWithBool:"), function $CPDecimalNumber__initWithBool_(self, _cmd, value)
{
    if (self = (self == null ? null : self.isa.objj_msgSend0(self, "init")))
        self._data = CPDecimalMakeWithParts(value ? 1 : 0, 0);
    return self;
}
,["id","BOOL"]), new objj_method(sel_getUid("initWithChar:"), function $CPDecimalNumber__initWithChar_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","char"]), new objj_method(sel_getUid("initWithDouble:"), function $CPDecimalNumber__initWithDouble_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","double"]), new objj_method(sel_getUid("initWithFloat:"), function $CPDecimalNumber__initWithFloat_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","float"]), new objj_method(sel_getUid("initWithInt:"), function $CPDecimalNumber__initWithInt_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","int"]), new objj_method(sel_getUid("initWithLong:"), function $CPDecimalNumber__initWithLong_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","long"]), new objj_method(sel_getUid("initWithLongLong:"), function $CPDecimalNumber__initWithLongLong_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","long long"]), new objj_method(sel_getUid("initWithShort:"), function $CPDecimalNumber__initWithShort_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","short"]), new objj_method(sel_getUid("initWithUnsignedChar:"), function $CPDecimalNumber__initWithUnsignedChar_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","unsigned char"]), new objj_method(sel_getUid("initWithUnsignedInt:"), function $CPDecimalNumber__initWithUnsignedInt_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","unsigned"]), new objj_method(sel_getUid("initWithUnsignedLong:"), function $CPDecimalNumber__initWithUnsignedLong_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","unsigned long"]), new objj_method(sel_getUid("initWithUnsignedLongLong:"), function $CPDecimalNumber__initWithUnsignedLongLong_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","unsigned long long"]), new objj_method(sel_getUid("initWithUnsignedShort:"), function $CPDecimalNumber__initWithUnsignedShort_(self, _cmd, value)
{
    return self.isa.objj_msgSend1(self, "_initWithJSNumber:", value);
}
,["id","unsigned short"]), new objj_method(sel_getUid("_initWithJSNumber:"), function $CPDecimalNumber___initWithJSNumber_(self, _cmd, value)
{
    if (self = (self == null ? null : self.isa.objj_msgSend0(self, "init")))
        self._data = CPDecimalMakeWithString(value.toString(), nil);
    return self;
}
,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPDecimalNumber__alloc(self, _cmd)
{
    return class_createInstance(self);
}
,["id"]), new objj_method(sel_getUid("decimalNumberWithDecimal:"), function $CPDecimalNumber__decimalNumberWithDecimal_(self, _cmd, dcm)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithDecimal:", dcm));
    var ___r1;
}
,["CPDecimalNumber","CPDecimal"]), new objj_method(sel_getUid("decimalNumberWithMantissa:exponent:isNegative:"), function $CPDecimalNumber__decimalNumberWithMantissa_exponent_isNegative_(self, _cmd, mantissa, exponent, flag)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithMantissa:exponent:isNegative:", mantissa, exponent, flag));
    var ___r1;
}
,["CPDecimalNumber","unsigned long long","short","BOOL"]), new objj_method(sel_getUid("decimalNumberWithString:"), function $CPDecimalNumber__decimalNumberWithString_(self, _cmd, numberValue)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithString:", numberValue));
    var ___r1;
}
,["CPDecimalNumber","CPString"]), new objj_method(sel_getUid("decimalNumberWithString:locale:"), function $CPDecimalNumber__decimalNumberWithString_locale_(self, _cmd, numberValue, locale)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithString:locale:", numberValue, locale));
    var ___r1;
}
,["CPDecimalNumber","CPString","CPDictionary"]), new objj_method(sel_getUid("defaultBehavior"), function $CPDecimalNumber__defaultBehavior(self, _cmd)
{
    return CPDecimalNumberHandler.isa.objj_msgSend0(CPDecimalNumberHandler, "defaultDecimalNumberHandler");
}
,["id"]), new objj_method(sel_getUid("setDefaultBehavior:"), function $CPDecimalNumber__setDefaultBehavior_(self, _cmd, behavior)
{
    CPDefaultDcmHandler = behavior;
}
,["void","id"]), new objj_method(sel_getUid("maximumDecimalNumber"), function $CPDecimalNumber__maximumDecimalNumber(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithDecimal:", _CPDecimalMakeMaximum()));
    var ___r1;
}
,["CPDecimalNumber"]), new objj_method(sel_getUid("minimumDecimalNumber"), function $CPDecimalNumber__minimumDecimalNumber(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithDecimal:", _CPDecimalMakeMinimum()));
    var ___r1;
}
,["CPDecimalNumber"]), new objj_method(sel_getUid("notANumber"), function $CPDecimalNumber__notANumber(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithDecimal:", CPDecimalMakeNaN()));
    var ___r1;
}
,["CPDecimalNumber"]), new objj_method(sel_getUid("zero"), function $CPDecimalNumber__zero(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithDecimal:", CPDecimalMakeZero()));
    var ___r1;
}
,["CPDecimalNumber"]), new objj_method(sel_getUid("one"), function $CPDecimalNumber__one(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithDecimal:", CPDecimalMakeOne()));
    var ___r1;
}
,["CPDecimalNumber"]), new objj_method(sel_getUid("numberWithBool:"), function $CPDecimalNumber__numberWithBool_(self, _cmd, aBoolean)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithBool:", aBoolean));
    var ___r1;
}
,["id","BOOL"]), new objj_method(sel_getUid("numberWithChar:"), function $CPDecimalNumber__numberWithChar_(self, _cmd, aChar)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithChar:", aChar));
    var ___r1;
}
,["id","char"]), new objj_method(sel_getUid("numberWithDouble:"), function $CPDecimalNumber__numberWithDouble_(self, _cmd, aDouble)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithDouble:", aDouble));
    var ___r1;
}
,["id","double"]), new objj_method(sel_getUid("numberWithFloat:"), function $CPDecimalNumber__numberWithFloat_(self, _cmd, aFloat)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFloat:", aFloat));
    var ___r1;
}
,["id","float"]), new objj_method(sel_getUid("numberWithInt:"), function $CPDecimalNumber__numberWithInt_(self, _cmd, anInt)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithInt:", anInt));
    var ___r1;
}
,["id","int"]), new objj_method(sel_getUid("numberWithLong:"), function $CPDecimalNumber__numberWithLong_(self, _cmd, aLong)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithLong:", aLong));
    var ___r1;
}
,["id","long"]), new objj_method(sel_getUid("numberWithLongLong:"), function $CPDecimalNumber__numberWithLongLong_(self, _cmd, aLongLong)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithLongLong:", aLongLong));
    var ___r1;
}
,["id","long long"]), new objj_method(sel_getUid("numberWithShort:"), function $CPDecimalNumber__numberWithShort_(self, _cmd, aShort)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithShort:", aShort));
    var ___r1;
}
,["id","short"]), new objj_method(sel_getUid("numberWithUnsignedChar:"), function $CPDecimalNumber__numberWithUnsignedChar_(self, _cmd, aChar)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithUnsignedChar:", aChar));
    var ___r1;
}
,["id","unsigned char"]), new objj_method(sel_getUid("numberWithUnsignedInt:"), function $CPDecimalNumber__numberWithUnsignedInt_(self, _cmd, anUnsignedInt)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithUnsignedInt:", anUnsignedInt));
    var ___r1;
}
,["id","unsigned"]), new objj_method(sel_getUid("numberWithUnsignedLong:"), function $CPDecimalNumber__numberWithUnsignedLong_(self, _cmd, anUnsignedLong)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithUnsignedLong:", anUnsignedLong));
    var ___r1;
}
,["id","unsigned long"]), new objj_method(sel_getUid("numberWithUnsignedLongLong:"), function $CPDecimalNumber__numberWithUnsignedLongLong_(self, _cmd, anUnsignedLongLong)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithUnsignedLongLong:", anUnsignedLongLong));
    var ___r1;
}
,["id","unsigned long"]), new objj_method(sel_getUid("numberWithUnsignedShort:"), function $CPDecimalNumber__numberWithUnsignedShort_(self, _cmd, anUnsignedShort)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithUnsignedShort:", anUnsignedShort));
    var ___r1;
}
,["id","unsigned short"])]);
}var CPDecimalNumberDecimalExponent = "CPDecimalNumberDecimalExponent",
    CPDecimalNumberDecimalIsNegative = "CPDecimalNumberDecimalIsNegative",
    CPDecimalNumberDecimalIsCompact = "CPDecimalNumberDecimalIsCompact",
    CPDecimalNumberDecimalIsNaN = "CPDecimalNumberDecimalIsNaN",
    CPDecimalNumberDecimalMantissa = "CPDecimalNumberDecimalMantissa";
{
var the_class = objj_getClass("CPDecimalNumber")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDecimalNumber\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPDecimalNumber__initWithCoder_(self, _cmd, aCoder)
{
    if (self)
    {
        var dcm = CPDecimalMakeZero();
        dcm._exponent = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPDecimalNumberDecimalExponent));
        dcm._isNegative = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPDecimalNumberDecimalIsNegative));
        dcm._isCompact = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPDecimalNumberDecimalIsCompact));
        dcm._isNaN = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPDecimalNumberDecimalIsNaN));
        dcm._mantissa = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPDecimalNumberDecimalMantissa));
        self.isa.objj_msgSend1(self, "initWithDecimal:", dcm);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPDecimalNumber__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._data._exponent, CPDecimalNumberDecimalExponent));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._data._isNegative, CPDecimalNumberDecimalIsNegative));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._data._isCompact, CPDecimalNumberDecimalIsCompact));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._data._isNaN, CPDecimalNumberDecimalIsNaN));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._data._mantissa, CPDecimalNumberDecimalMantissa));
}
,["void","CPCoder"])]);
}