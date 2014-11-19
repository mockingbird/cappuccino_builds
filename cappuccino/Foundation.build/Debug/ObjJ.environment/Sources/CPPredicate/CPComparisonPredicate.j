@STATIC;1.0;i;33;CPComparisonPredicate_Constants.ji;9;CPArray.ji;14;CPEnumerator.ji;8;CPNull.ji;10;CPString.ji;15;_CPExpression.ji;14;_CPPredicate.jt;19417;objj_executeFile("CPComparisonPredicate_Constants.j", YES);objj_executeFile("CPArray.j", YES);objj_executeFile("CPEnumerator.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("_CPExpression.j", YES);objj_executeFile("_CPPredicate.j", YES);var CPComparisonPredicateModifier,
    CPPredicateOperatorType;
{var the_class = objj_allocateClassPair(CPPredicate, "CPComparisonPredicate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_left"), new objj_ivar("_right"), new objj_ivar("_modifier"), new objj_ivar("_type"), new objj_ivar("_options"), new objj_ivar("_customSelector")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithLeftExpression:rightExpression:customSelector:"), function $CPComparisonPredicate__initWithLeftExpression_rightExpression_customSelector_(self, _cmd, left, right, selector)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComparisonPredicate").super_class }, "init");
    if (self)
    {
        self._left = left;
        self._right = right;
        self._modifier = CPDirectPredicateModifier;
        self._type = CPCustomSelectorPredicateOperatorType;
        self._options = 0;
        self._customSelector = selector;
    }
    return self;
}
,["id","CPExpression","CPExpression","SEL"]), new objj_method(sel_getUid("initWithLeftExpression:rightExpression:modifier:type:options:"), function $CPComparisonPredicate__initWithLeftExpression_rightExpression_modifier_type_options_(self, _cmd, left, right, modifier, type, options)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComparisonPredicate").super_class }, "init");
    if (self)
    {
        self._left = left;
        self._right = right;
        self._modifier = modifier;
        self._type = type;
        self._options = type != CPMatchesPredicateOperatorType && type != CPLikePredicateOperatorType && type != CPBeginsWithPredicateOperatorType && type != CPEndsWithPredicateOperatorType && type != CPInPredicateOperatorType && type != CPContainsPredicateOperatorType ? 0 : options;
        self._customSelector = NULL;
    }
    return self;
}
,["id","CPExpression","CPExpression","CPComparisonPredicateModifier","CPPredicateOperatorType","unsigned"]), new objj_method(sel_getUid("comparisonPredicateModifier"), function $CPComparisonPredicate__comparisonPredicateModifier(self, _cmd)
{
    return self._modifier;
}
,["CPComparisonPredicateModifier"]), new objj_method(sel_getUid("customSelector"), function $CPComparisonPredicate__customSelector(self, _cmd)
{
    return self._customSelector;
}
,["SEL"]), new objj_method(sel_getUid("leftExpression"), function $CPComparisonPredicate__leftExpression(self, _cmd)
{
    return self._left;
}
,["CPExpression"]), new objj_method(sel_getUid("options"), function $CPComparisonPredicate__options(self, _cmd)
{
    return self._options;
}
,["unsigned"]), new objj_method(sel_getUid("predicateOperatorType"), function $CPComparisonPredicate__predicateOperatorType(self, _cmd)
{
    return self._type;
}
,["CPPredicateOperatorType"]), new objj_method(sel_getUid("rightExpression"), function $CPComparisonPredicate__rightExpression(self, _cmd)
{
    return self._right;
}
,["CPExpression"]), new objj_method(sel_getUid("predicateFormat"), function $CPComparisonPredicate__predicateFormat(self, _cmd)
{
    var modifier;
    switch(self._modifier) {
    case CPDirectPredicateModifier:
        modifier = "";
        break;
    case CPAllPredicateModifier:
        modifier = "ALL ";
        break;
    case CPAnyPredicateModifier:
        modifier = "ANY ";
        break;
default:
        modifier = "";
        break;
    }
    var options;
    switch(self._options) {
    case CPCaseInsensitivePredicateOption:
        options = "[c]";
        break;
    case CPDiacriticInsensitivePredicateOption:
        options = "[d]";
        break;
    case CPCaseInsensitivePredicateOption | CPDiacriticInsensitivePredicateOption:
        options = "[cd]";
        break;
default:
        options = "";
        break;
    }
    var operator;
    switch(self._type) {
    case CPLessThanPredicateOperatorType:
        operator = "<";
        break;
    case CPLessThanOrEqualToPredicateOperatorType:
        operator = "<=";
        break;
    case CPGreaterThanPredicateOperatorType:
        operator = ">";
        break;
    case CPGreaterThanOrEqualToPredicateOperatorType:
        operator = ">=";
        break;
    case CPEqualToPredicateOperatorType:
        operator = "==";
        break;
    case CPNotEqualToPredicateOperatorType:
        operator = "!=";
        break;
    case CPMatchesPredicateOperatorType:
        operator = "MATCHES";
        break;
    case CPLikePredicateOperatorType:
        operator = "LIKE";
        break;
    case CPBeginsWithPredicateOperatorType:
        operator = "BEGINSWITH";
        break;
    case CPEndsWithPredicateOperatorType:
        operator = "ENDSWITH";
        break;
    case CPInPredicateOperatorType:
        operator = "IN";
        break;
    case CPContainsPredicateOperatorType:
        operator = "CONTAINS";
        break;
    case CPCustomSelectorPredicateOperatorType:
        operator = CPStringFromSelector(self._customSelector);
        break;
    }
    return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "%s%s %s%s %s", modifier, ((___r1 = self._left), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")), operator, options, ((___r1 = self._right), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("predicateWithSubstitutionVariables:"), function $CPComparisonPredicate__predicateWithSubstitutionVariables_(self, _cmd, variables)
{
    var left = ((___r1 = self._left), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_expressionWithSubstitutionVariables:", variables)),
        right = ((___r1 = self._right), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_expressionWithSubstitutionVariables:", variables));
    if (self._type != CPCustomSelectorPredicateOperatorType)
        return CPComparisonPredicate.isa.objj_msgSend(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:modifier:type:options:", left, right, self._modifier, self._type, self._options);
    else
        return CPComparisonPredicate.isa.objj_msgSend3(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:customSelector:", left, right, self._customSelector);
    var ___r1;
}
,["CPPredicate","CPDictionary"]), new objj_method(sel_getUid("isEqual:"), function $CPComparisonPredicate__isEqual_(self, _cmd, anObject)
{
    if (self === anObject)
        return YES;
    if (anObject === nil || anObject.isa !== self.isa || self._modifier !== (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "comparisonPredicateModifier")) || self._type !== (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "predicateOperatorType")) || self._options !== (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "options")) || self._customSelector !== (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "customSelector")) || !((___r1 = self._left), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "leftExpression")))) || !((___r1 = self._right), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "rightExpression")))))
        return NO;
    return YES;
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("_evaluateValue:rightValue:"), function $CPComparisonPredicate___evaluateValue_rightValue_(self, _cmd, lhs, rhs)
{
    var leftIsNil = lhs == nil || (lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "isEqual:", CPNull.isa.objj_msgSend0(CPNull, "null"))),
        rightIsNil = rhs == nil || (rhs == null ? null : rhs.isa.objj_msgSend1(rhs, "isEqual:", CPNull.isa.objj_msgSend0(CPNull, "null")));
    if ((leftIsNil || rightIsNil) && self._type != CPCustomSelectorPredicateOperatorType)
        return leftIsNil == rightIsNil && (self._type == CPEqualToPredicateOperatorType || self._type == CPLessThanOrEqualToPredicateOperatorType || self._type == CPGreaterThanOrEqualToPredicateOperatorType);
    var string_compare_options = 0;
    switch(self._type) {
    case CPLessThanPredicateOperatorType:
        return (lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "compare:", rhs)) == CPOrderedAscending;
    case CPLessThanOrEqualToPredicateOperatorType:
        return (lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "compare:", rhs)) != CPOrderedDescending;
    case CPGreaterThanPredicateOperatorType:
        return (lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "compare:", rhs)) == CPOrderedDescending;
    case CPGreaterThanOrEqualToPredicateOperatorType:
        return (lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "compare:", rhs)) != CPOrderedAscending;
    case CPEqualToPredicateOperatorType:
        return (lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "isEqual:", rhs));
    case CPNotEqualToPredicateOperatorType:
        return !(lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "isEqual:", rhs));
    case CPMatchesPredicateOperatorType:
        var commut = self._options & CPCaseInsensitivePredicateOption ? "gi" : "g";
        if (self._options & CPDiacriticInsensitivePredicateOption)
        {
            lhs = lhs.stripDiacritics();
            rhs = rhs.stripDiacritics();
        }
        return (new RegExp(rhs, commut)).test(lhs);
    case CPLikePredicateOperatorType:
        if (self._options & CPDiacriticInsensitivePredicateOption)
        {
            lhs = lhs.stripDiacritics();
            rhs = rhs.stripDiacritics();
        }
        var commut = self._options & CPCaseInsensitivePredicateOption ? "gi" : "g",
            reg = new RegExp(rhs.escapeForRegExp(), commut);
        return reg.test(lhs);
    case CPBeginsWithPredicateOperatorType:
        var range = CPMakeRange(0, MIN((lhs == null ? null : lhs.isa.objj_msgSend0(lhs, "length")), (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "length"))));
        if (self._options & CPCaseInsensitivePredicateOption)
            string_compare_options |= CPCaseInsensitiveSearch;
        if (self._options & CPDiacriticInsensitivePredicateOption)
            string_compare_options |= CPDiacriticInsensitiveSearch;
        return (lhs == null ? null : lhs.isa.objj_msgSend3(lhs, "compare:options:range:", rhs, string_compare_options, range)) == CPOrderedSame;
    case CPEndsWithPredicateOperatorType:
        var range = CPMakeRange(MAX((lhs == null ? null : lhs.isa.objj_msgSend0(lhs, "length")) - (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "length")), 0), MIN((lhs == null ? null : lhs.isa.objj_msgSend0(lhs, "length")), (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "length"))));
        if (self._options & CPCaseInsensitivePredicateOption)
            string_compare_options |= CPCaseInsensitiveSearch;
        if (self._options & CPDiacriticInsensitivePredicateOption)
            string_compare_options |= CPDiacriticInsensitiveSearch;
        return (lhs == null ? null : lhs.isa.objj_msgSend3(lhs, "compare:options:range:", rhs, string_compare_options, range)) == CPOrderedSame;
    case CPCustomSelectorPredicateOperatorType:
        return (lhs == null ? null : lhs.isa.objj_msgSend2(lhs, "performSelector:withObject:", self._customSelector, rhs));
    case CPInPredicateOperatorType:
        var a = lhs;
        lhs = rhs;
        rhs = a;
    case CPContainsPredicateOperatorType:
        if (!(lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "isKindOfClass:", CPString.isa.objj_msgSend0(CPString, "class"))))
        {
            if (!(lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "respondsToSelector:", sel_getUid("objectEnumerator"))))
                CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "The left/right hand side for a CONTAINS/IN  operator must be a collection or a string");
            return (lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "containsObject:", rhs));
        }
        if (self._options & CPCaseInsensitivePredicateOption)
            string_compare_options |= CPCaseInsensitiveSearch;
        if (self._options & CPDiacriticInsensitivePredicateOption)
            string_compare_options |= CPDiacriticInsensitiveSearch;
        return (lhs == null ? null : lhs.isa.objj_msgSend2(lhs, "rangeOfString:options:", rhs, string_compare_options)).location != CPNotFound;
    case CPBetweenPredicateOperatorType:
        if ((rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "count")) < 2)
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "The right hand side for a BETWEEN operator must contain 2 objects");
        return (lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "compare:", rhs[0])) == CPOrderedDescending && (lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "compare:", rhs[1])) == CPOrderedAscending;
default:
        return NO;
    }
}
,["BOOL","id","id"]), new objj_method(sel_getUid("evaluateWithObject:"), function $CPComparisonPredicate__evaluateWithObject_(self, _cmd, object)
{
    return self.isa.objj_msgSend2(self, "evaluateWithObject:substitutionVariables:", object, nil);
}
,["BOOL","id"]), new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"), function $CPComparisonPredicate__evaluateWithObject_substitutionVariables_(self, _cmd, object, variables)
{
    var leftValue = ((___r1 = self._left), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "expressionValueWithObject:context:", object, variables)),
        rightValue = ((___r1 = self._right), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "expressionValueWithObject:context:", object, variables));
    leftValue = typeof leftValue == "boolean" ? CPNumber.isa.objj_msgSend1(CPNumber, "numberWithBool:", leftValue) : leftValue;
    rightValue = typeof rightValue == "boolean" ? CPNumber.isa.objj_msgSend1(CPNumber, "numberWithBool:", rightValue) : rightValue;
    if (self._modifier == CPDirectPredicateModifier)
        return self.isa.objj_msgSend2(self, "_evaluateValue:rightValue:", leftValue, rightValue);
    else
    {
        if (!(leftValue == null ? null : leftValue.isa.objj_msgSend1(leftValue, "respondsToSelector:", sel_getUid("objectEnumerator"))))
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "The left hand side for an ALL or ANY operator must be either a CPArray or a CPSet");
        var e = (leftValue == null ? null : leftValue.isa.objj_msgSend0(leftValue, "objectEnumerator")),
            result = self._modifier == CPAllPredicateModifier,
            value;
        while ((value = (e == null ? null : e.isa.objj_msgSend0(e, "nextObject"))) !== nil)
        {
            var eval = self.isa.objj_msgSend2(self, "_evaluateValue:rightValue:", value, rightValue);
            if (eval != result)
                return eval;
        }
        return result;
    }
    var ___r1;
}
,["BOOL","id","CPDictionary"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("predicateWithLeftExpression:rightExpression:customSelector:"), function $CPComparisonPredicate__predicateWithLeftExpression_rightExpression_customSelector_(self, _cmd, left, right, selector)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithLeftExpression:rightExpression:customSelector:", left, right, selector));
    var ___r1;
}
,["CPPredicate","CPExpression","CPExpression","SEL"]), new objj_method(sel_getUid("predicateWithLeftExpression:rightExpression:modifier:type:options:"), function $CPComparisonPredicate__predicateWithLeftExpression_rightExpression_modifier_type_options_(self, _cmd, left, right, modifier, type, options)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithLeftExpression:rightExpression:modifier:type:options:", left, right, modifier, type, options));
    var ___r1;
}
,["CPPredicate","CPExpression","CPExpression","CPComparisonPredicateModifier","int","unsigned"])]);
}{
var the_class = objj_getClass("CPComparisonPredicate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComparisonPredicate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPComparisonPredicate__initWithCoder_(self, _cmd, coder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComparisonPredicate").super_class }, "init");
    if (self != nil)
    {
        self._left = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", "CPComparisonPredicateLeftExpression"));
        self._right = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", "CPComparisonPredicateRightExpression"));
        self._modifier = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", "CPComparisonPredicateModifier"));
        self._type = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", "CPComparisonPredicateType"));
        self._options = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", "CPComparisonPredicateOptions"));
        self._customSelector = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", "CPComparisonPredicateCustomSelector"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPComparisonPredicate__encodeWithCoder_(self, _cmd, coder)
{
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._left, "CPComparisonPredicateLeftExpression"));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._right, "CPComparisonPredicateRightExpression"));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._modifier, "CPComparisonPredicateModifier"));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._type, "CPComparisonPredicateType"));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._options, "CPComparisonPredicateOptions"));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._customSelector, "CPComparisonPredicateCustomSelector"));
}
,["void","CPCoder"])]);
}var source = ['*', '?', '(', ')', '{', '}', '.', '+', '|', '/', '$', '^'],
    dest = ['.*', '.?', '\\(', '\\)', '\\{', '\\}', '\\.', '\\+', '\\|', '\\/', '\\$', '\\^'];
String.prototype.escapeForRegExp = function()
{
    var foundChar = false,
        i = 0;
    for (; i < source.length; ++i)
    {
        if (this.indexOf(source[i]) !== -1)
        {
            foundChar = true;
            break;
        }
    }
    if (!foundChar)
        return this;
    var result = "";
    for (i = 0; i < this.length; ++i)
    {
        var sourceIndex = source.indexOf(this.charAt(i));
        if (sourceIndex !== -1)
            result += dest[sourceIndex];
        else
            result += this.charAt(i);
    }
    return result;
};
