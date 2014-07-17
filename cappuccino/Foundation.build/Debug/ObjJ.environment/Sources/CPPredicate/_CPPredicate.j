@STATIC;1.0;i;9;CPArray.ji;13;CPException.ji;8;CPNull.ji;10;CPObject.ji;11;CPScanner.ji;7;CPSet.ji;9;CPValue.ji;16;CPCharacterSet.ji;33;CPComparisonPredicate_Constants.ji;31;CPCompoundPredicate_Constants.ji;15;_CPExpression.jt;39597;objj_executeFile("CPArray.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPScanner.j", YES);objj_executeFile("CPSet.j", YES);objj_executeFile("CPValue.j", YES);objj_executeFile("CPCharacterSet.j", YES);objj_executeFile("CPComparisonPredicate_Constants.j", YES);objj_executeFile("CPCompoundPredicate_Constants.j", YES);objj_executeFile("_CPExpression.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPPredicate"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("predicateWithSubstitutionVariables:"), function $CPPredicate__predicateWithSubstitutionVariables_(self, _cmd, variables)
{
}
,["CPPredicate","CPDictionary"]), new objj_method(sel_getUid("evaluateWithObject:"), function $CPPredicate__evaluateWithObject_(self, _cmd, object)
{
}
,["BOOL","id"]), new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"), function $CPPredicate__evaluateWithObject_substitutionVariables_(self, _cmd, object, variables)
{
}
,["BOOL","id","CPDictionary"]), new objj_method(sel_getUid("predicateFormat"), function $CPPredicate__predicateFormat(self, _cmd)
{
}
,["CPString"]), new objj_method(sel_getUid("description"), function $CPPredicate__description(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "predicateFormat");
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("predicateWithFormat:"), function $CPPredicate__predicateWithFormat_(self, _cmd, format)
{
    if (!format)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, _cmd + " the format can't be 'nil'");
    var args = Array.prototype.slice.call(arguments, 3);
    return self.isa.objj_msgSend2(self, "predicateWithFormat:argumentArray:", arguments[2], args);
}
,["CPPredicate","CPString"]), new objj_method(sel_getUid("predicateWithFormat:argumentArray:"), function $CPPredicate__predicateWithFormat_argumentArray_(self, _cmd, format, args)
{
    if (!format)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, _cmd + " the format can't be 'nil'");
    var s = ((___r1 = (CPPredicateScanner == null ? null : CPPredicateScanner.isa.objj_msgSend0(CPPredicateScanner, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithString:args:", format, args)),
        p = (s == null ? null : s.isa.objj_msgSend0(s, "parse"));
    return p;
    var ___r1;
}
,["CPPredicate","CPString","CPArray"]), new objj_method(sel_getUid("predicateWithFormat:arguments:"), function $CPPredicate__predicateWithFormat_arguments_(self, _cmd, format, argList)
{
    return nil;
}
,["CPPredicate","CPString","va_list"]), new objj_method(sel_getUid("predicateWithValue:"), function $CPPredicate__predicateWithValue_(self, _cmd, value)
{
    return ((___r1 = (CPPredicate_BOOL == null ? null : CPPredicate_BOOL.isa.objj_msgSend0(CPPredicate_BOOL, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithBool:", value));
    var ___r1;
}
,["CPPredicate","BOOL"])]);
}{var the_class = objj_allocateClassPair(CPPredicate, "CPPredicate_BOOL"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_value")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBool:"), function $CPPredicate_BOOL__initWithBool_(self, _cmd, value)
{
    self._value = value;
    return self;
}
,["id","BOOL"]), new objj_method(sel_getUid("isEqual:"), function $CPPredicate_BOOL__isEqual_(self, _cmd, anObject)
{
    if (self === anObject)
        return YES;
    if (anObject === nil || self.isa !== anObject.isa || self._value !== (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "evaluateWithObject:", nil)))
        return NO;
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("evaluateWithObject:"), function $CPPredicate_BOOL__evaluateWithObject_(self, _cmd, object)
{
    return self._value;
}
,["BOOL","id"]), new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"), function $CPPredicate_BOOL__evaluateWithObject_substitutionVariables_(self, _cmd, object, variables)
{
    return self._value;
}
,["BOOL","id","CPDictionary"]), new objj_method(sel_getUid("predicateFormat"), function $CPPredicate_BOOL__predicateFormat(self, _cmd)
{
    return self._value ? "TRUEPREDICATE" : "FALSEPREDICATE";
}
,["CPString"])]);
}{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("filteredArrayUsingPredicate:"), function $CPArray__filteredArrayUsingPredicate_(self, _cmd, predicate)
{
    var count = self.isa.objj_msgSend0(self, "count"),
        result = CPArray.isa.objj_msgSend0(CPArray, "array"),
        i = 0;
    for (; i < count; i++)
    {
        var object = self.isa.objj_msgSend1(self, "objectAtIndex:", i);
        if ((predicate == null ? null : predicate.isa.objj_msgSend1(predicate, "evaluateWithObject:", object)))
            result.push(object);
    }
    return result;
}
,["CPArray","CPPredicate"]), new objj_method(sel_getUid("filterUsingPredicate:"), function $CPArray__filterUsingPredicate_(self, _cmd, predicate)
{
    var count = self.isa.objj_msgSend0(self, "count");
    while (count--)
    {
        if (!(predicate == null ? null : predicate.isa.objj_msgSend1(predicate, "evaluateWithObject:", self.isa.objj_msgSend1(self, "objectAtIndex:", count))))
            self.splice(count, 1);
    }
}
,["void","CPPredicate"])]);
}{
var the_class = objj_getClass("CPSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("filteredSetUsingPredicate:"), function $CPSet__filteredSetUsingPredicate_(self, _cmd, predicate)
{
    var count = self.isa.objj_msgSend0(self, "count"),
        result = CPSet.isa.objj_msgSend0(CPSet, "set"),
        i = 0;
    for (; i < count; i++)
    {
        var object = self.isa.objj_msgSend1(self, "objectAtIndex:", i);
        if ((predicate == null ? null : predicate.isa.objj_msgSend1(predicate, "evaluateWithObject:", object)))
            (result == null ? null : result.isa.objj_msgSend1(result, "addObject:", object));
    }
    return result;
}
,["CPSet","CPPredicate"]), new objj_method(sel_getUid("filterUsingPredicate:"), function $CPSet__filterUsingPredicate_(self, _cmd, predicate)
{
    var count = self.isa.objj_msgSend0(self, "count");
    while (--count >= 0)
    {
        var object = self.isa.objj_msgSend1(self, "objectAtIndex:", count);
        if (!(predicate == null ? null : predicate.isa.objj_msgSend1(predicate, "evaluateWithObject:", object)))
            self.isa.objj_msgSend1(self, "removeObjectAtIndex:", count);
    }
}
,["void","CPPredicate"])]);
}{var the_class = objj_allocateClassPair(CPScanner, "CPPredicateScanner"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_args"), new objj_ivar("_retrieved")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:args:"), function $CPPredicateScanner__initWithString_args_(self, _cmd, format, args)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateScanner").super_class }, "initWithString:", format);
    if (self)
    {
        self._args = (args == null ? null : args.isa.objj_msgSend0(args, "objectEnumerator"));
    }
    return self;
}
,["id","CPString","CPArray"]), new objj_method(sel_getUid("nextArg"), function $CPPredicateScanner__nextArg(self, _cmd)
{
    return ((___r1 = self._args), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "nextObject"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("scanPredicateKeyword:"), function $CPPredicateScanner__scanPredicateKeyword_(self, _cmd, key)
{
    var loc = self.isa.objj_msgSend0(self, "scanLocation");
    self.isa.objj_msgSend1(self, "setCaseSensitive:", NO);
    if (!self.isa.objj_msgSend2(self, "scanString:intoString:", key, NULL))
        return NO;
    if (self.isa.objj_msgSend0(self, "isAtEnd"))
        return YES;
    var c = ((___r1 = self.isa.objj_msgSend0(self, "string")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "characterAtIndex:", self.isa.objj_msgSend0(self, "scanLocation")));
    if (!((___r1 = CPCharacterSet.isa.objj_msgSend0(CPCharacterSet, "alphanumericCharacterSet")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "characterIsMember:", c)))
        return YES;
    self.isa.objj_msgSend1(self, "setScanLocation:", loc);
    return NO;
    var ___r1;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("parse"), function $CPPredicateScanner__parse(self, _cmd)
{
    var r = nil;
    try    {
        self.isa.objj_msgSend1(self, "setCharactersToBeSkipped:", CPCharacterSet.isa.objj_msgSend0(CPCharacterSet, "whitespaceCharacterSet"));
        r = self.isa.objj_msgSend0(self, "parsePredicate");
    }
    catch(error)     {
        CPLogConsole("Unable to parse predicate '" + self.isa.objj_msgSend0(self, "string") + "' with " + error);
    }    finally     {
        if (!self.isa.objj_msgSend0(self, "isAtEnd"))
        {
            var pstr = self.isa.objj_msgSend0(self, "string"),
                loc = self.isa.objj_msgSend0(self, "scanLocation");
            CPLogConsole("Format string contains extra characters: '" + (pstr == null ? null : pstr.isa.objj_msgSend1(pstr, "substringToIndex:", loc)) + "**" + (pstr == null ? null : pstr.isa.objj_msgSend1(pstr, "substringFromIndex:", loc)) + "**'");
        }
    }
    return r;
}
,["CPPredicate"]), new objj_method(sel_getUid("parsePredicate"), function $CPPredicateScanner__parsePredicate(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "parseAnd");
}
,["CPPredicate"]), new objj_method(sel_getUid("parseAnd"), function $CPPredicateScanner__parseAnd(self, _cmd)
{
    var l = self.isa.objj_msgSend0(self, "parseOr");
    while (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "AND") || self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "&&"))
    {
        var r = self.isa.objj_msgSend0(self, "parseOr");
        if ((r == null ? null : r.isa.objj_msgSend1(r, "isKindOfClass:", (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "class")))) && (r == null ? null : r.isa.objj_msgSend0(r, "compoundPredicateType")) == CPAndPredicateType)
        {
            if ((l == null ? null : l.isa.objj_msgSend1(l, "isKindOfClass:", (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "class")))) && (l == null ? null : l.isa.objj_msgSend0(l, "compoundPredicateType")) == CPAndPredicateType)
            {
                ((___r1 = (l == null ? null : l.isa.objj_msgSend0(l, "subpredicates"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObjectsFromArray:", (r == null ? null : r.isa.objj_msgSend0(r, "subpredicates"))));
            }
            else
            {
                ((___r1 = (r == null ? null : r.isa.objj_msgSend0(r, "subpredicates"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", l, 0));
                l = r;
            }
        }
        else if ((l == null ? null : l.isa.objj_msgSend1(l, "isKindOfClass:", (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "class")))) && (l == null ? null : l.isa.objj_msgSend0(l, "compoundPredicateType")) == CPAndPredicateType)
        {
            ((___r1 = (l == null ? null : l.isa.objj_msgSend0(l, "subpredicates"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", r));
        }
        else
        {
            l = (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend1(CPCompoundPredicate, "andPredicateWithSubpredicates:", CPArray.isa.objj_msgSend2(CPArray, "arrayWithObjects:", l, r)));
        }
    }
    return l;
    var ___r1;
}
,["CPPredicate"]), new objj_method(sel_getUid("parseNot"), function $CPPredicateScanner__parseNot(self, _cmd)
{
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "(", NULL))
    {
        var r = self.isa.objj_msgSend0(self, "parsePredicate");
        if (!self.isa.objj_msgSend2(self, "scanString:intoString:", ")", NULL))
            CPRaiseParseError(self, "predicate");
        return r;
    }
    if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "NOT") || self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "!"))
    {
        return (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend1(CPCompoundPredicate, "notPredicateWithSubpredicate:", self.isa.objj_msgSend0(self, "parseNot")));
    }
    if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "TRUEPREDICATE"))
    {
        return CPPredicate.isa.objj_msgSend1(CPPredicate, "predicateWithValue:", YES);
    }
    if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "FALSEPREDICATE"))
    {
        return CPPredicate.isa.objj_msgSend1(CPPredicate, "predicateWithValue:", NO);
    }
    return self.isa.objj_msgSend0(self, "parseComparison");
}
,["CPPredicate"]), new objj_method(sel_getUid("parseOr"), function $CPPredicateScanner__parseOr(self, _cmd)
{
    var l = self.isa.objj_msgSend0(self, "parseNot");
    while (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "OR") || self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "||"))
    {
        var r = self.isa.objj_msgSend0(self, "parseNot");
        if ((r == null ? null : r.isa.objj_msgSend1(r, "isKindOfClass:", (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "class")))) && (r == null ? null : r.isa.objj_msgSend0(r, "compoundPredicateType")) == CPOrPredicateType)
        {
            if ((l == null ? null : l.isa.objj_msgSend1(l, "isKindOfClass:", (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "class")))) && (l == null ? null : l.isa.objj_msgSend0(l, "compoundPredicateType")) == CPOrPredicateType)
            {
                ((___r1 = (l == null ? null : l.isa.objj_msgSend0(l, "subpredicates"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObjectsFromArray:", (r == null ? null : r.isa.objj_msgSend0(r, "subpredicates"))));
            }
            else
            {
                ((___r1 = (r == null ? null : r.isa.objj_msgSend0(r, "subpredicates"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", l, 0));
                l = r;
            }
        }
        else if ((l == null ? null : l.isa.objj_msgSend1(l, "isKindOfClass:", (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "class")))) && (l == null ? null : l.isa.objj_msgSend0(l, "compoundPredicateType")) == CPOrPredicateType)
        {
            ((___r1 = (l == null ? null : l.isa.objj_msgSend0(l, "subpredicates"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", r));
        }
        else
        {
            l = (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend1(CPCompoundPredicate, "orPredicateWithSubpredicates:", CPArray.isa.objj_msgSend2(CPArray, "arrayWithObjects:", l, r)));
        }
    }
    return l;
    var ___r1;
}
,["CPPredicate"]), new objj_method(sel_getUid("parseComparison"), function $CPPredicateScanner__parseComparison(self, _cmd)
{
    var modifier = CPDirectPredicateModifier,
        type = 0,
        opts = 0,
        left,
        right,
        p,
        negate = NO;
    if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "ANY"))
    {
        modifier = CPAnyPredicateModifier;
    }
    else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "ALL"))
    {
        modifier = CPAllPredicateModifier;
    }
    else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "NONE"))
    {
        modifier = CPAnyPredicateModifier;
        negate = YES;
    }
    else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "SOME"))
    {
        modifier = CPAllPredicateModifier;
        negate = YES;
    }
    left = self.isa.objj_msgSend0(self, "parseExpression");
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "!=", NULL) || self.isa.objj_msgSend2(self, "scanString:intoString:", "<>", NULL))
    {
        type = CPNotEqualToPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "<=", NULL) || self.isa.objj_msgSend2(self, "scanString:intoString:", "=<", NULL))
    {
        type = CPLessThanOrEqualToPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend2(self, "scanString:intoString:", ">=", NULL) || self.isa.objj_msgSend2(self, "scanString:intoString:", "=>", NULL))
    {
        type = CPGreaterThanOrEqualToPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "<", NULL))
    {
        type = CPLessThanPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend2(self, "scanString:intoString:", ">", NULL))
    {
        type = CPGreaterThanPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "==", NULL) || self.isa.objj_msgSend2(self, "scanString:intoString:", "=", NULL))
    {
        type = CPEqualToPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "MATCHES"))
    {
        type = CPMatchesPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "LIKE"))
    {
        type = CPLikePredicateOperatorType;
    }
    else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "BEGINSWITH"))
    {
        type = CPBeginsWithPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "ENDSWITH"))
    {
        type = CPEndsWithPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "IN"))
    {
        type = CPInPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "CONTAINS"))
    {
        type = CPContainsPredicateOperatorType;
    }
    else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "BETWEEN"))
    {
        type = CPBetweenPredicateOperatorType;
    }
    else
        CPRaiseParseError(self, "comparison predicate");
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "[cd]", NULL))
    {
        opts = CPCaseInsensitivePredicateOption | CPDiacriticInsensitivePredicateOption;
    }
    else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "[c]", NULL))
    {
        opts = CPCaseInsensitivePredicateOption;
    }
    else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "[d]", NULL))
    {
        opts = CPDiacriticInsensitivePredicateOption;
    }
    right = self.isa.objj_msgSend0(self, "parseExpression");
    p = (CPComparisonPredicate == null ? null : CPComparisonPredicate.isa.objj_msgSend(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:modifier:type:options:", left, right, modifier, type, opts));
    return negate ? (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend1(CPCompoundPredicate, "notPredicateWithSubpredicate:", p)) : p;
}
,["CPPredicate"]), new objj_method(sel_getUid("parseExpression"), function $CPPredicateScanner__parseExpression(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "parseBinaryExpression");
}
,["CPExpression"]), new objj_method(sel_getUid("parseSimpleExpression"), function $CPPredicateScanner__parseSimpleExpression(self, _cmd)
{
    var identifier,
        location,
        ident,
        dbl;
    if (self.isa.objj_msgSend1(self, "scanDouble:", function(__input) { if (arguments.length) return dbl = __input; return dbl; }))
        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", dbl);
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "-", NULL))
        return CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", "chs:", CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", self.isa.objj_msgSend0(self, "parseExpression")));
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "(", NULL))
    {
        var arg = self.isa.objj_msgSend0(self, "parseExpression");
        if (!self.isa.objj_msgSend2(self, "scanString:intoString:", ")", NULL))
            CPRaiseParseError(self, "expression");
        return arg;
    }
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "{", NULL))
    {
        var a = [];
        if (self.isa.objj_msgSend2(self, "scanString:intoString:", "}", NULL))
            return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", a);
        (a == null ? null : a.isa.objj_msgSend1(a, "addObject:", self.isa.objj_msgSend0(self, "parseExpression")));
        while (self.isa.objj_msgSend2(self, "scanString:intoString:", ",", NULL))
            (a == null ? null : a.isa.objj_msgSend1(a, "addObject:", self.isa.objj_msgSend0(self, "parseExpression")));
        if (!self.isa.objj_msgSend2(self, "scanString:intoString:", "}", NULL))
            CPRaiseParseError(self, "expression");
        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForAggregate:", a);
    }
    if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "NULL") || self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "NIL"))
    {
        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", CPNull.isa.objj_msgSend0(CPNull, "null"));
    }
    if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "TRUE") || self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "YES"))
    {
        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", CPNumber.isa.objj_msgSend1(CPNumber, "numberWithBool:", YES));
    }
    if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "FALSE") || self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "NO"))
    {
        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", CPNumber.isa.objj_msgSend1(CPNumber, "numberWithBool:", NO));
    }
    if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "SELF"))
    {
        return CPExpression.isa.objj_msgSend0(CPExpression, "expressionForEvaluatedObject");
    }
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "$", NULL))
    {
        var variable = self.isa.objj_msgSend0(self, "parseSimpleExpression");
        if (!(variable == null ? null : variable.isa.objj_msgSend0(variable, "keyPath")))
            CPRaiseParseError(self, "expression");
        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForVariable:", variable);
    }
    location = self.isa.objj_msgSend0(self, "scanLocation");
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "%", NULL))
    {
        if (self.isa.objj_msgSend0(self, "isAtEnd") == NO)
        {
            var c = ((___r1 = self.isa.objj_msgSend0(self, "string")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "characterAtIndex:", self.isa.objj_msgSend0(self, "scanLocation")));
            switch(c) {
            case '%':
                location = self.isa.objj_msgSend0(self, "scanLocation");
                break;
            case 'K':
                self.isa.objj_msgSend1(self, "setScanLocation:", self.isa.objj_msgSend0(self, "scanLocation") + 1);
                return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForKeyPath:", self.isa.objj_msgSend0(self, "nextArg"));
            case '@':
            case 'c':
            case 'C':
            case 'd':
            case 'D':
            case 'i':
            case 'o':
            case 'O':
            case 'u':
            case 'U':
            case 'x':
            case 'X':
            case 'e':
            case 'E':
            case 'f':
            case 'g':
            case 'G':
                self.isa.objj_msgSend1(self, "setScanLocation:", self.isa.objj_msgSend0(self, "scanLocation") + 1);
                return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", self.isa.objj_msgSend0(self, "nextArg"));
            case 'h':
                self.isa.objj_msgSend2(self, "scanString:intoString:", "h", NULL);
                if (self.isa.objj_msgSend0(self, "isAtEnd") == NO)
                {
                    c = ((___r1 = self.isa.objj_msgSend0(self, "string")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "characterAtIndex:", self.isa.objj_msgSend0(self, "scanLocation")));
                    if (c == 'i' || c == 'u')
                    {
                        self.isa.objj_msgSend1(self, "setScanLocation:", self.isa.objj_msgSend0(self, "scanLocation") + 1);
                        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", self.isa.objj_msgSend0(self, "nextArg"));
                    }
                }
                break;
            case 'q':
                self.isa.objj_msgSend2(self, "scanString:intoString:", "q", NULL);
                if (self.isa.objj_msgSend0(self, "isAtEnd") == NO)
                {
                    c = ((___r1 = self.isa.objj_msgSend0(self, "string")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "characterAtIndex:", self.isa.objj_msgSend0(self, "scanLocation")));
                    if (c == 'i' || c == 'u' || c == 'x' || c == 'X')
                    {
                        self.isa.objj_msgSend1(self, "setScanLocation:", self.isa.objj_msgSend0(self, "scanLocation") + 1);
                        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", self.isa.objj_msgSend0(self, "nextArg"));
                    }
                }
                break;
            }
        }
        self.isa.objj_msgSend1(self, "setScanLocation:", location);
    }
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "\"", NULL))
    {
        var skip = self.isa.objj_msgSend0(self, "charactersToBeSkipped"),
            str = "";
        self.isa.objj_msgSend1(self, "setCharactersToBeSkipped:", nil);
        self.isa.objj_msgSend2(self, "scanUpToString:intoString:", "\"", function(__input) { if (arguments.length) return str = __input; return str; });
        if (self.isa.objj_msgSend2(self, "scanString:intoString:", "\"", NULL) == NO)
            CPRaiseParseError(self, "expression");
        self.isa.objj_msgSend1(self, "setCharactersToBeSkipped:", skip);
        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", str);
    }
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "'", NULL))
    {
        var skip = self.isa.objj_msgSend0(self, "charactersToBeSkipped"),
            str = "";
        self.isa.objj_msgSend1(self, "setCharactersToBeSkipped:", nil);
        self.isa.objj_msgSend2(self, "scanUpToString:intoString:", "'", function(__input) { if (arguments.length) return str = __input; return str; });
        if (self.isa.objj_msgSend2(self, "scanString:intoString:", "'", NULL) == NO)
            CPRaiseParseError(self, "expression");
        self.isa.objj_msgSend1(self, "setCharactersToBeSkipped:", skip);
        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", str);
    }
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "@", NULL))
    {
        var e = self.isa.objj_msgSend0(self, "parseExpression");
        if (!(e == null ? null : e.isa.objj_msgSend0(e, "keyPath")))
            CPRaiseParseError(self, "expression");
        return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForKeyPath:", (e == null ? null : e.isa.objj_msgSend0(e, "keyPath")) + "@");
    }
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "SUBQUERY", NULL))
    {
        if (!self.isa.objj_msgSend2(self, "scanString:intoString:", "(", NULL))
            CPRaiseParseError(self, "expression");
        var collection = self.isa.objj_msgSend0(self, "parseExpression"),
            variableExpression,
            subpredicate;
        if (!self.isa.objj_msgSend2(self, "scanString:intoString:", ",", NULL))
            CPRaiseParseError(self, "expression");
        variableExpression = self.isa.objj_msgSend0(self, "parseExpression");
        if (!self.isa.objj_msgSend2(self, "scanString:intoString:", ",", NULL))
            CPRaiseParseError(self, "expression");
        subpredicate = self.isa.objj_msgSend0(self, "parsePredicate");
        if (!self.isa.objj_msgSend2(self, "scanString:intoString:", ")", NULL))
            CPRaiseParseError(self, "expression");
        return ((___r1 = (_CPSubqueryExpression == null ? null : _CPSubqueryExpression.isa.objj_msgSend0(_CPSubqueryExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithExpression:usingIteratorExpression:predicate:", collection, variableExpression, subpredicate));
    }
    if (self.isa.objj_msgSend2(self, "scanString:intoString:", "FUNCTION", NULL))
    {
        if (!self.isa.objj_msgSend2(self, "scanString:intoString:", "(", NULL))
            CPRaiseParseError(self, "expression");
        var args = CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", self.isa.objj_msgSend0(self, "parseExpression"));
        while (self.isa.objj_msgSend2(self, "scanString:intoString:", ",", NULL))
            (args == null ? null : args.isa.objj_msgSend1(args, "addObject:", self.isa.objj_msgSend0(self, "parseExpression")));
        if (!self.isa.objj_msgSend2(self, "scanString:intoString:", ")", NULL) || (args == null ? null : args.isa.objj_msgSend0(args, "count")) < 2 || ((___r1 = args[1]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "expressionType")) != CPConstantValueExpressionType)
            CPRaiseParseError(self, "expression");
        return CPExpression.isa.objj_msgSend3(CPExpression, "expressionForFunction:selectorName:arguments:", args[0], ((___r1 = args[1]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "constantValue")), args.slice(2));
    }
    self.isa.objj_msgSend2(self, "scanString:intoString:", "#", NULL);
    if (!identifier)
        identifier = CPCharacterSet.isa.objj_msgSend1(CPCharacterSet, "characterSetWithCharactersInString:", "_$abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
    if (!self.isa.objj_msgSend2(self, "scanCharactersFromSet:intoString:", identifier, function(__input) { if (arguments.length) return ident = __input; return ident; }))
        CPRaiseParseError(self, "expression");
    return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForKeyPath:", ident);
    var ___r1;
}
,["CPExpression"]), new objj_method(sel_getUid("parseFunctionalExpression"), function $CPPredicateScanner__parseFunctionalExpression(self, _cmd)
{
    var left = self.isa.objj_msgSend0(self, "parseSimpleExpression");
    while (YES)
    {
        if (self.isa.objj_msgSend2(self, "scanString:intoString:", ".", NULL))
        {
            var right = self.isa.objj_msgSend0(self, "parseSimpleExpression"),
                expressionType = (right == null ? null : right.isa.objj_msgSend0(right, "expressionType"));
            if (expressionType == CPKeyPathExpressionType)
                left = ((___r1 = (_CPKeyPathExpression == null ? null : _CPKeyPathExpression.isa.objj_msgSend0(_CPKeyPathExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithOperand:andKeyPath:", left, (right == null ? null : right.isa.objj_msgSend0(right, "keyPath"))));
            else if (expressionType == CPVariableExpressionType)
                left = CPExpression.isa.objj_msgSend3(CPExpression, "expressionForFunction:selectorName:arguments:", left, "valueForKey:", [right]);
            else
                CPRaiseParseError(self, "expression");
        }
        else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "[", NULL))
        {
            if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "FIRST"))
            {
                left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", "first:", CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", left));
            }
            else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "LAST"))
            {
                left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", "last:", CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", left));
            }
            else if (self.isa.objj_msgSend1(self, "scanPredicateKeyword:", "SIZE"))
            {
                left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", "count:", CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", left));
            }
            else
            {
                var index = self.isa.objj_msgSend0(self, "parseExpression");
                left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", "fromObject:index:", CPArray.isa.objj_msgSend2(CPArray, "arrayWithObjects:", left, index));
            }
            if (!self.isa.objj_msgSend2(self, "scanString:intoString:", "]", NULL))
                CPRaiseParseError(self, "expression");
        }
        else if (self.isa.objj_msgSend2(self, "scanString:intoString:", ":", NULL))
        {
            if (!(left == null ? null : left.isa.objj_msgSend0(left, "keyPath")))
                CPRaiseParseError(self, "expression");
            var selector = (left == null ? null : left.isa.objj_msgSend0(left, "keyPath")) + ":",
                args = [];
            if (!self.isa.objj_msgSend2(self, "scanString:intoString:", "(", NULL))
            {
                var str;
                self.isa.objj_msgSend2(self, "scanCharactersFromSet:intoString:", CPCharacterSet.isa.objj_msgSend0(CPCharacterSet, "lowercaseLetterCharacterSet"), function(__input) { if (arguments.length) return str = __input; return str; });
                if (!self.isa.objj_msgSend2(self, "scanString:intoString:", ":(", NULL))
                    CPRaiseParseError(self, "expression");
                selector += str + ":";
            }
            if (!self.isa.objj_msgSend2(self, "scanString:intoString:", ")", NULL))
            {
                (args == null ? null : args.isa.objj_msgSend1(args, "addObject:", self.isa.objj_msgSend0(self, "parseExpression")));
                while (self.isa.objj_msgSend2(self, "scanString:intoString:", ",", NULL))
                    (args == null ? null : args.isa.objj_msgSend1(args, "addObject:", self.isa.objj_msgSend0(self, "parseExpression")));
                if (!self.isa.objj_msgSend2(self, "scanString:intoString:", ")", NULL))
                    CPRaiseParseError(self, "expression");
            }
            left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", selector, args);
        }
        else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "UNION", NULL))
        {
            left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForUnionSet:with:", left, self.isa.objj_msgSend0(self, "parseExpression"));
        }
        else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "INTERSECT", NULL))
        {
            left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForIntersectSet:with:", left, self.isa.objj_msgSend0(self, "parseExpression"));
        }
        else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "MINUS", NULL))
        {
            left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForMinusSet:with:", left, self.isa.objj_msgSend0(self, "parseExpression"));
        }
        else
        {
            return left;
        }
    }
    var ___r1;
}
,["CPExpression"]), new objj_method(sel_getUid("parsePowerExpression"), function $CPPredicateScanner__parsePowerExpression(self, _cmd)
{
    var left = self.isa.objj_msgSend0(self, "parseFunctionalExpression");
    while (YES)
    {
        var right;
        if (self.isa.objj_msgSend2(self, "scanString:intoString:", "**", NULL))
        {
            right = self.isa.objj_msgSend0(self, "parseFunctionalExpression");
            left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", "raise:to:", CPArray.isa.objj_msgSend2(CPArray, "arrayWithObjects:", left, right));
        }
        else
        {
            return left;
        }
    }
}
,["CPExpression"]), new objj_method(sel_getUid("parseMultiplicationExpression"), function $CPPredicateScanner__parseMultiplicationExpression(self, _cmd)
{
    var left = self.isa.objj_msgSend0(self, "parsePowerExpression");
    while (YES)
    {
        var right;
        if (self.isa.objj_msgSend2(self, "scanString:intoString:", "*", NULL))
        {
            right = self.isa.objj_msgSend0(self, "parsePowerExpression");
            left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", "multiply:by:", CPArray.isa.objj_msgSend2(CPArray, "arrayWithObjects:", left, right));
        }
        else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "/", NULL))
        {
            right = self.isa.objj_msgSend0(self, "parsePowerExpression");
            left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", "divide:by:", CPArray.isa.objj_msgSend2(CPArray, "arrayWithObjects:", left, right));
        }
        else
        {
            return left;
        }
    }
}
,["CPExpression"]), new objj_method(sel_getUid("parseAdditionExpression"), function $CPPredicateScanner__parseAdditionExpression(self, _cmd)
{
    var left = self.isa.objj_msgSend0(self, "parseMultiplicationExpression");
    while (YES)
    {
        var right;
        if (self.isa.objj_msgSend2(self, "scanString:intoString:", "+", NULL))
        {
            right = self.isa.objj_msgSend0(self, "parseMultiplicationExpression");
            left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", "add:to:", CPArray.isa.objj_msgSend2(CPArray, "arrayWithObjects:", left, right));
        }
        else if (self.isa.objj_msgSend2(self, "scanString:intoString:", "-", NULL))
        {
            right = self.isa.objj_msgSend0(self, "parseMultiplicationExpression");
            left = CPExpression.isa.objj_msgSend2(CPExpression, "expressionForFunction:arguments:", "from:substract:", CPArray.isa.objj_msgSend2(CPArray, "arrayWithObjects:", left, right));
        }
        else
        {
            return left;
        }
    }
}
,["CPExpression"]), new objj_method(sel_getUid("parseBinaryExpression"), function $CPPredicateScanner__parseBinaryExpression(self, _cmd)
{
    var left = self.isa.objj_msgSend0(self, "parseAdditionExpression");
    while (YES)
    {
        var right;
        if (self.isa.objj_msgSend2(self, "scanString:intoString:", ":=", NULL))
        {
            right = self.isa.objj_msgSend0(self, "parseAdditionExpression");
        }
        else
        {
            return left;
        }
    }
}
,["CPExpression"])]);
}var CPRaiseParseError = function(aScanner, target)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "unable to parse " + target + " at index " + (aScanner == null ? null : aScanner.isa.objj_msgSend0(aScanner, "scanLocation")));
};
