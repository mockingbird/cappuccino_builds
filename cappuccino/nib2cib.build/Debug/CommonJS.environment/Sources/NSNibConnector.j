@STATIC;1.0;I;23;AppKit/CPCibConnector.jI;30;AppKit/CPCibControlConnector.jI;29;AppKit/CPCibOutletConnector.jI;40;AppKit/CPCibRuntimeAttributesConnector.jI;27;AppKit/CPCibHelpConnector.jt;9621;objj_executeFile("AppKit/CPCibConnector.j", NO);
objj_executeFile("AppKit/CPCibControlConnector.j", NO);
objj_executeFile("AppKit/CPCibOutletConnector.j", NO);
objj_executeFile("AppKit/CPCibRuntimeAttributesConnector.j", NO);
objj_executeFile("AppKit/CPCibHelpConnector.j", NO);

NIB_CONNECTION_EQUIVALENCY_TABLE = {};

{
var the_class = objj_getClass("CPCibConnector")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCibConnector\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPCibConnector__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibConnector").super_class }, "init");

    if (self)
    {
        _source = objj_msgSend(aCoder, "decodeObjectForKey:", "NSSource");
        _destination = objj_msgSend(aCoder, "decodeObjectForKey:", "NSDestination");
        _label = objj_msgSend(aCoder, "decodeObjectForKey:", "NSLabel");

        var sourceUID = objj_msgSend(_source, "UID"),
            destinationUID = objj_msgSend(_destination, "UID");

        if (sourceUID in NIB_CONNECTION_EQUIVALENCY_TABLE)
        {
            CPLog.debug("NSNibConnector: swapped object: " + _source + " for object: " + NIB_CONNECTION_EQUIVALENCY_TABLE[sourceUID]);
            _source = NIB_CONNECTION_EQUIVALENCY_TABLE[sourceUID];
        }

        if (destinationUID in NIB_CONNECTION_EQUIVALENCY_TABLE)
        {
            CPLog.debug("NSNibConnector: swapped object: " + _destination + " for object: " + NIB_CONNECTION_EQUIVALENCY_TABLE[destinationUID]);
            _destination = NIB_CONNECTION_EQUIVALENCY_TABLE[destinationUID];
        }

        if (_source && _destination)
            CPLog.debug("NSNibConnector: connection: " + objj_msgSend(_source, "description") + " " + objj_msgSend(_destination, "description") + " " + _label);
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPCibConnector, "NSNibConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSNibConnector__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSNibConnector__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPCibConnector, "class");
}
},["Class"])]);
}

{var the_class = objj_allocateClassPair(CPCibControlConnector, "NSNibControlConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSNibControlConnector__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSNibControlConnector__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPCibControlConnector, "class");
}
},["Class"])]);
}

{var the_class = objj_allocateClassPair(CPCibOutletConnector, "NSNibOutletConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSNibOutletConnector__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSNibOutletConnector__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPCibOutletConnector, "class");
}
},["Class"])]);
}

var NSTransformers = objj_msgSend(CPSet, "setWithObjects:", 
                        "NSNegateBoolean",
                        "NSIsNil",
                        "NSIsNotNil",
                        "NSUnarchiveFromData",
                        "NSKeyedUnarchiveFromData");

{
var the_class = objj_getClass("CPCibBindingConnector")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCibBindingConnector\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPCibBindingConnector__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibBindingConnector").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        _binding = objj_msgSend(aCoder, "decodeObjectForKey:", "NSBinding");
        _keyPath = objj_msgSend(aCoder, "decodeObjectForKey:", "NSKeyPath");

        _options = objj_msgSend(CPDictionary, "dictionary");

        var NSOptions = objj_msgSend(aCoder, "decodeObjectForKey:", "NSOptions"),
            keyEnumerator = objj_msgSend(NSOptions, "keyEnumerator"),
            key;

        while ((key = objj_msgSend(keyEnumerator, "nextObject")) !== nil)
        {
            var CPKey = "CP" + key.substring(2),
                NSValue = objj_msgSend(NSOptions, "objectForKey:", key);

            if (CPKey === CPValueTransformerNameBindingOption && objj_msgSend(NSTransformers, "containsObject:", NSValue))
                NSValue = "CP" + NSValue.substring(2);

            objj_msgSend(_options, "setObject:forKey:", NSValue, CPKey);
        }

        CPLog.debug("NSNibConnector: binding connector: " + objj_msgSend(_binding, "description") + " to: " + _destination + " " + objj_msgSend(_keyPath, "description") + " " + objj_msgSend(_options, "description"));
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPCibBindingConnector, "NSNibBindingConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSNibBindingConnector__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSNibBindingConnector__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPCibBindingConnector, "class");
}
},["Class"])]);
}

{
var the_class = objj_getClass("CPCibRuntimeAttributesConnector")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCibRuntimeAttributesConnector\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPCibRuntimeAttributesConnector__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibRuntimeAttributesConnector").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        _source = objj_msgSend(aCoder, "decodeObjectForKey:", "NSObject");
        _keyPaths = objj_msgSend(aCoder, "decodeObjectForKey:", "NSKeyPaths");
        _values = objj_msgSend(aCoder, "decodeObjectForKey:", "NSValues");

        var count = objj_msgSend(_keyPaths, "count");

        CPLog.debug("NSNibConnector: runtime attributes connector: " + objj_msgSend(_source, "description"));

        while (count--)
        {
            var value = _values[count],
                type = typeof(value) === "boolean" ? "BOOL" : objj_msgSend(value, "className");

            CPLog.debug("   %s (%s): %s", _keyPaths[count], type, value);
        }
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPCibRuntimeAttributesConnector, "NSIBUserDefinedRuntimeAttributesConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSIBUserDefinedRuntimeAttributesConnector__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSIBUserDefinedRuntimeAttributesConnector__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPCibRuntimeAttributesConnector, "class");
}
},["Class"])]);
}

{
var the_class = objj_getClass("CPCibHelpConnector")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCibHelpConnector\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPCibHelpConnector__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibHelpConnector").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        _destination = objj_msgSend(aCoder, "decodeObjectForKey:", "NSDestination");
        _file = objj_msgSend(aCoder, "decodeObjectForKey:", "NSFile");
        _marker = objj_msgSend(aCoder, "decodeObjectForKey:", "NSMarker");
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPCibHelpConnector, "NSIBHelpConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSIBHelpConnector__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSIBHelpConnector__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPCibHelpConnector, "class");
}
},["Class"])]);
}

