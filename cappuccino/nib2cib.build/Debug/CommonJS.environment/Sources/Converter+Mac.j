@STATIC;1.0;i;11;Converter.ji;24;Nib2CibKeyedUnarchiver.ji;8;NSFont.jt;4887;objj_executeFile("Converter.j", YES);objj_executeFile("Nib2CibKeyedUnarchiver.j", YES);objj_executeFile("NSFont.j", YES);{
var the_class = objj_getClass("Converter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"Converter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("convertedDataFromMacData:"), function $Converter__convertedDataFromMacData_(self, _cmd, data)
{
    var unarchiver = objj_msgSend(objj_msgSend(Nib2CibKeyedUnarchiver, "alloc"), "initForReadingWithData:", data);
    objj_msgSend(unarchiver, "setDelegate:", self);
    var objectData = objj_msgSend(unarchiver, "decodeObjectForKey:", "IB.objectdata"),
        objects = objj_msgSend(unarchiver, "allObjects"),
        count = objj_msgSend(objects, "count");
    while (count--)
    {
        var object = objects[count];
        objj_msgSend(self, "replaceFontForObject:", object);
        if (objj_msgSend(object, "respondsToSelector:", sel_getUid("awakeFromNib")))
            objj_msgSend(object, "awakeFromNib");
    }
    var convertedData = objj_msgSend(CPData, "data"),
        archiver = objj_msgSend(objj_msgSend(CPKeyedArchiver, "alloc"), "initForWritingWithMutableData:", convertedData);
    objj_msgSend(archiver, "encodeObject:forKey:", objectData, "CPCibObjectDataKey");
    objj_msgSend(archiver, "finishEncoding");
    return convertedData;
}
,["void","CPData"]), new objj_method(sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"), function $Converter__unarchiver_cannotDecodeObjectOfClassName_originalClasses_(self, _cmd, unarchiver, name, classNames)
{
    objj_msgSend(CPException, "raise:format:", CPInvalidUnarchiveOperationException, "%@ objects are not supported by nib2cib.", name);
}
,["Class","CPKeyedUnarchiver","CPString","CPArray"]), new objj_method(sel_getUid("replaceFontForObject:"), function $Converter__replaceFontForObject_(self, _cmd, object)
{
    if (objj_msgSend(object, "respondsToSelector:", sel_getUid("font")) && objj_msgSend(object, "respondsToSelector:", sel_getUid("setFont:")))
    {
        var nibFont = objj_msgSend(object, "font");
        if (nibFont)
            objj_msgSend(self, "replaceFont:forObject:", nibFont, object);
    }
    else if (objj_msgSend(object, "isKindOfClass:", objj_msgSend(CPView, "class")))
    {
        var subviews = objj_msgSend(object, "subviews"),
            count = objj_msgSend(subviews, "count");
        if (count && objj_msgSend(subviews[0], "isKindOfClass:", objj_msgSend(CPRadio, "class")))
        {
            while (count--)
            {
                var radio = subviews[count];
                objj_msgSend(self, "replaceFont:forObject:", objj_msgSend(radio, "font"), radio);
            }
        }
    }
}
,["void","id"]), new objj_method(sel_getUid("replaceFont:forObject:"), function $Converter__replaceFont_forObject_(self, _cmd, nibFont, object)
{
    var cibFont = nil;
    if (objj_msgSend(object, "respondsToSelector:", sel_getUid("cibFontForNibFont:")))
        cibFont = objj_msgSend(object, "cibFontForNibFont:", objj_msgSend(object, "font"));
    else
        cibFont = objj_msgSend(objj_msgSend(object, "font"), "cibFontForNibFont");
    if (!cibFont || !objj_msgSend(cibFont, "isEqual:", nibFont))
    {
        var source = "";
        if (!cibFont)
        {
            var bold = objj_msgSend(nibFont, "isBold"),
                themes = objj_msgSend(objj_msgSend(Nib2Cib, "sharedNib2Cib"), "themes");
            for (var i = 0; i < themes.length; ++i)
            {
                cibFont = objj_msgSend(themes[i], "valueForAttributeWithName:inState:forClass:", "font", objj_msgSend(object, "themeState"), objj_msgSend(object, "class"));
                if (cibFont)
                {
                    source = " (from " + objj_msgSend(themes[i], "name") + ")";
                    break;
                }
            }
            if (!cibFont || objj_msgSend(cibFont, "isSystem"))
            {
                var size = objj_msgSend(cibFont, "size") || CPFontDefaultSystemFontSize;
                bold = cibFont ? objj_msgSend(cibFont, "isBold") : bold;
                if (size === CPFontDefaultSystemFontSize)
                    size = CPFontCurrentSystemSize;
                cibFont = bold ? objj_msgSend(CPFont, "boldSystemFontOfSize:", size) : objj_msgSend(CPFont, "systemFontOfSize:", size);
            }
        }
        var replacement = "System " + (bold ? "bold " : "") + (objj_msgSend(cibFont, "isSystemSize") ? "(current size)" : objj_msgSend(cibFont, "size"));
        objj_msgSend(object, "setFont:", cibFont);
        CPLog.debug("%s: substituted <%s>%s for <%s>", objj_msgSend(object, "className"), replacement || objj_msgSend(NSFont, "descriptorForFont:", cibFont), source, objj_msgSend(NSFont, "descriptorForFont:", nibFont));
    }
}
,["void","CPFont","id"])]);
}