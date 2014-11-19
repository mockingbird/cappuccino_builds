@STATIC;1.0;i;31;CPCompoundPredicate_Constants.ji;9;CPArray.ji;14;_CPPredicate.jt;9125;objj_executeFile("CPCompoundPredicate_Constants.j", YES);objj_executeFile("CPArray.j", YES);objj_executeFile("_CPPredicate.j", YES);var CPCompoundPredicateType;
{var the_class = objj_allocateClassPair(CPPredicate, "CPCompoundPredicate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_type"), new objj_ivar("_predicates")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithType:subpredicates:"), function $CPCompoundPredicate__initWithType_subpredicates_(self, _cmd, type, predicates)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCompoundPredicate").super_class }, "init");
    if (self)
    {
        self._type = type;
        self._predicates = predicates;
    }
    return self;
}
,["id","CPCompoundPredicateType","CPArray"]), new objj_method(sel_getUid("compoundPredicateType"), function $CPCompoundPredicate__compoundPredicateType(self, _cmd)
{
    return self._type;
}
,["CPCompoundPredicateType"]), new objj_method(sel_getUid("subpredicates"), function $CPCompoundPredicate__subpredicates(self, _cmd)
{
    return self._predicates;
}
,["CPArray"]), new objj_method(sel_getUid("predicateWithSubstitutionVariables:"), function $CPCompoundPredicate__predicateWithSubstitutionVariables_(self, _cmd, variables)
{
    var subp = CPArray.isa.objj_msgSend0(CPArray, "array"),
        count = (subp == null ? null : subp.isa.objj_msgSend0(subp, "count")),
        i = 0;
    for (; i < count; i++)
    {
        var p = (subp == null ? null : subp.isa.objj_msgSend1(subp, "objectAtIndex:", i)),
            sp = (p == null ? null : p.isa.objj_msgSend1(p, "predicateWithSubstitutionVariables:", variables));
        (subp == null ? null : subp.isa.objj_msgSend1(subp, "addObject:", sp));
    }
    return ((___r1 = CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithType:subpredicates:", self._type, subp));
    var ___r1;
}
,["CPPredicate","CPDictionary"]), new objj_method(sel_getUid("predicateFormat"), function $CPCompoundPredicate__predicateFormat(self, _cmd)
{
    var result = "",
        args = CPArray.isa.objj_msgSend0(CPArray, "array"),
        count = ((___r1 = self._predicates), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        i = 0;
    if (count == 0)
        return "TRUEPREDICATE";
    for (; i < count; i++)
    {
        var subpredicate = ((___r1 = self._predicates), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i)),
            precedence = (subpredicate == null ? null : subpredicate.isa.objj_msgSend0(subpredicate, "predicateFormat"));
        if ((subpredicate == null ? null : subpredicate.isa.objj_msgSend1(subpredicate, "isKindOfClass:", CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "class"))) && ((___r1 = (subpredicate == null ? null : subpredicate.isa.objj_msgSend0(subpredicate, "subpredicates"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 1 && (subpredicate == null ? null : subpredicate.isa.objj_msgSend0(subpredicate, "compoundPredicateType")) != self._type)
            precedence = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "(%s)", precedence);
        if (precedence != nil)
            (args == null ? null : args.isa.objj_msgSend1(args, "addObject:", precedence));
    }
    switch(self._type) {
    case CPNotPredicateType:
        result += "NOT " + (args == null ? null : args.isa.objj_msgSend1(args, "objectAtIndex:", 0));
        break;
    case CPAndPredicateType:
        result += (args == null ? null : args.isa.objj_msgSend1(args, "objectAtIndex:", 0));
        var count = (args == null ? null : args.isa.objj_msgSend0(args, "count"));
        for (var j = 1; j < count; j++)
            result += " AND " + (args == null ? null : args.isa.objj_msgSend1(args, "objectAtIndex:", j));
        break;
    case CPOrPredicateType:
        result += (args == null ? null : args.isa.objj_msgSend1(args, "objectAtIndex:", 0));
        var count = (args == null ? null : args.isa.objj_msgSend0(args, "count"));
        for (var j = 1; j < count; j++)
            result += " OR " + (args == null ? null : args.isa.objj_msgSend1(args, "objectAtIndex:", j));
        break;
    }
    return result;
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("evaluateWithObject:"), function $CPCompoundPredicate__evaluateWithObject_(self, _cmd, object)
{
    return self.isa.objj_msgSend2(self, "evaluateWithObject:substitutionVariables:", object, nil);
}
,["BOOL","id"]), new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"), function $CPCompoundPredicate__evaluateWithObject_substitutionVariables_(self, _cmd, object, variables)
{
    var result = NO,
        count = ((___r1 = self._predicates), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        i = 0;
    if (count == 0)
        return YES;
    for (; i < count; i++)
    {
        var predicate = ((___r1 = self._predicates), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i));
        switch(self._type) {
        case CPNotPredicateType:
            return !(predicate == null ? null : predicate.isa.objj_msgSend2(predicate, "evaluateWithObject:substitutionVariables:", object, variables));
        case CPAndPredicateType:
            if (i == 0)
                result = (predicate == null ? null : predicate.isa.objj_msgSend2(predicate, "evaluateWithObject:substitutionVariables:", object, variables));
            else
                result = result && (predicate == null ? null : predicate.isa.objj_msgSend2(predicate, "evaluateWithObject:substitutionVariables:", object, variables));
            if (!result)
                return NO;
            break;
        case CPOrPredicateType:
            if ((predicate == null ? null : predicate.isa.objj_msgSend2(predicate, "evaluateWithObject:substitutionVariables:", object, variables)))
                return YES;
            break;
        }
    }
    return result;
    var ___r1;
}
,["BOOL","id","CPDictionary"]), new objj_method(sel_getUid("isEqual:"), function $CPCompoundPredicate__isEqual_(self, _cmd, anObject)
{
    if (self === anObject)
        return YES;
    if (anObject === nil || anObject.isa !== self.isa || self._type !== (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "compoundPredicateType")) || !((___r1 = self._predicates), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToArray:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "subpredicates")))))
        return NO;
    return YES;
    var ___r1;
}
,["BOOL","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("notPredicateWithSubpredicate:"), function $CPCompoundPredicate__notPredicateWithSubpredicate_(self, _cmd, predicate)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithType:subpredicates:", CPNotPredicateType, CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", predicate)));
    var ___r1;
}
,["CPPredicate","CPPredicate"]), new objj_method(sel_getUid("andPredicateWithSubpredicates:"), function $CPCompoundPredicate__andPredicateWithSubpredicates_(self, _cmd, subpredicates)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithType:subpredicates:", CPAndPredicateType, subpredicates));
    var ___r1;
}
,["CPPredicate","CPArray"]), new objj_method(sel_getUid("orPredicateWithSubpredicates:"), function $CPCompoundPredicate__orPredicateWithSubpredicates_(self, _cmd, predicates)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithType:subpredicates:", CPOrPredicateType, predicates));
    var ___r1;
}
,["CPPredicate","CPArray"])]);
}{
var the_class = objj_getClass("CPCompoundPredicate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCompoundPredicate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCompoundPredicate__initWithCoder_(self, _cmd, coder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCompoundPredicate").super_class }, "init");
    if (self != nil)
    {
        self._predicates = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", "CPCompoundPredicateSubpredicates"));
        self._type = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", "CPCompoundPredicateType"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCompoundPredicate__encodeWithCoder_(self, _cmd, coder)
{
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._predicates, "CPCompoundPredicateSubpredicates"));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._type, "CPCompoundPredicateType"));
}
,["void","CPCoder"])]);
}