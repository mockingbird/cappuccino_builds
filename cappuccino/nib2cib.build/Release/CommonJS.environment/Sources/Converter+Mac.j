@STATIC;1.0;i;11;Converter.ji;24;Nib2CibKeyedUnarchiver.ji;8;NSFont.jt;6714;objj_executeFile("Converter.j", YES);objj_executeFile("Nib2CibKeyedUnarchiver.j", YES);objj_executeFile("NSFont.j", YES);{
var the_class = objj_getClass("Converter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"Converter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("convertedDataFromMacData:"), function $Converter__convertedDataFromMacData_(self, _cmd, data)
{
    var unarchiver = ((___r1 = Nib2CibKeyedUnarchiver.isa.objj_msgSend0(Nib2CibKeyedUnarchiver, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initForReadingWithData:", data));
    (unarchiver == null ? null : unarchiver.isa.objj_msgSend1(unarchiver, "setDelegate:", self));
    var objectData = (unarchiver == null ? null : unarchiver.isa.objj_msgSend1(unarchiver, "decodeObjectForKey:", "IB.objectdata")),
        objects = (unarchiver == null ? null : unarchiver.isa.objj_msgSend0(unarchiver, "allObjects")),
        count = (objects == null ? null : objects.isa.objj_msgSend0(objects, "count"));
    while (count--)
    {
        var object = objects[count];
        self.isa.objj_msgSend1(self, "replaceFontForObject:", object);
        if ((object == null ? null : object.isa.objj_msgSend1(object, "respondsToSelector:", sel_getUid("awakeFromNib"))))
            (object == null ? null : object.isa.objj_msgSend0(object, "awakeFromNib"));
    }
    var convertedData = CPData.isa.objj_msgSend0(CPData, "data"),
        archiver = ((___r1 = CPKeyedArchiver.isa.objj_msgSend0(CPKeyedArchiver, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initForWritingWithMutableData:", convertedData));
    (archiver == null ? null : archiver.isa.objj_msgSend2(archiver, "encodeObject:forKey:", objectData, "CPCibObjectDataKey"));
    (archiver == null ? null : archiver.isa.objj_msgSend0(archiver, "finishEncoding"));
    return convertedData;
    var ___r1;
}
,["void","CPData"]), new objj_method(sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"), function $Converter__unarchiver_cannotDecodeObjectOfClassName_originalClasses_(self, _cmd, unarchiver, name, classNames)
{
    CPException.isa.objj_msgSend3(CPException, "raise:format:", CPInvalidUnarchiveOperationException, "%@ objects are not supported by nib2cib.", name);
}
,["Class","CPKeyedUnarchiver","CPString","CPArray"]), new objj_method(sel_getUid("replaceFontForObject:"), function $Converter__replaceFontForObject_(self, _cmd, object)
{
    if ((object == null ? null : object.isa.objj_msgSend1(object, "respondsToSelector:", sel_getUid("font"))) && (object == null ? null : object.isa.objj_msgSend1(object, "respondsToSelector:", sel_getUid("setFont:"))))
    {
        var nibFont = (object == null ? null : object.isa.objj_msgSend0(object, "font"));
        if (nibFont)
            self.isa.objj_msgSend2(self, "replaceFont:forObject:", nibFont, object);
    }
    else if ((object == null ? null : object.isa.objj_msgSend1(object, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))))
    {
        var subviews = (object == null ? null : object.isa.objj_msgSend0(object, "subviews")),
            count = (subviews == null ? null : subviews.isa.objj_msgSend0(subviews, "count"));
        if (count && ((___r1 = subviews[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPRadio.isa.objj_msgSend0(CPRadio, "class"))))
        {
            while (count--)
            {
                var radio = subviews[count];
                self.isa.objj_msgSend2(self, "replaceFont:forObject:", (radio == null ? null : radio.isa.objj_msgSend0(radio, "font")), radio);
            }
        }
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("replaceFont:forObject:"), function $Converter__replaceFont_forObject_(self, _cmd, nibFont, object)
{
    var cibFont = nil;
    if ((object == null ? null : object.isa.objj_msgSend1(object, "respondsToSelector:", sel_getUid("cibFontForNibFont:"))))
        cibFont = (object == null ? null : object.isa.objj_msgSend1(object, "cibFontForNibFont:", (object == null ? null : object.isa.objj_msgSend0(object, "font"))));
    else
        cibFont = ((___r1 = (object == null ? null : object.isa.objj_msgSend0(object, "font"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cibFontForNibFont"));
    if (!cibFont || !(cibFont == null ? null : cibFont.isa.objj_msgSend1(cibFont, "isEqual:", nibFont)))
    {
        var source = "";
        if (!cibFont)
        {
            var bold = (nibFont == null ? null : nibFont.isa.objj_msgSend0(nibFont, "isBold")),
                themes = ((___r1 = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "sharedNib2Cib"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "themes"));
            for (var i = 0; i < themes.length; ++i)
            {
                cibFont = ((___r1 = themes[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "valueForAttributeWithName:inState:forClass:", "font", (object == null ? null : object.isa.objj_msgSend0(object, "themeState")), (object == null ? null : object.isa.objj_msgSend0(object, "class"))));
                if (cibFont)
                {
                    source = " (from " + ((___r1 = themes[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "name")) + ")";
                    break;
                }
            }
            if (!cibFont || (cibFont == null ? null : cibFont.isa.objj_msgSend0(cibFont, "isSystem")))
            {
                var size = (cibFont == null ? null : cibFont.isa.objj_msgSend0(cibFont, "size")) || CPFontDefaultSystemFontSize;
                bold = cibFont ? (cibFont == null ? null : cibFont.isa.objj_msgSend0(cibFont, "isBold")) : bold;
                if (size === CPFontDefaultSystemFontSize)
                    size = CPFontCurrentSystemSize;
                cibFont = bold ? CPFont.isa.objj_msgSend1(CPFont, "boldSystemFontOfSize:", size) : CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", size);
            }
        }
        var replacement = "System " + (bold ? "bold " : "") + ((cibFont == null ? null : cibFont.isa.objj_msgSend0(cibFont, "isSystemSize")) ? "(current size)" : (cibFont == null ? null : cibFont.isa.objj_msgSend0(cibFont, "size")));
        (object == null ? null : object.isa.objj_msgSend1(object, "setFont:", cibFont));
        CPLog.debug("%s: substituted <%s>%s for <%s>", (object == null ? null : object.isa.objj_msgSend0(object, "className")), replacement || NSFont.isa.objj_msgSend1(NSFont, "descriptorForFont:", cibFont), source, NSFont.isa.objj_msgSend1(NSFont, "descriptorForFont:", nibFont));
    }
    var ___r1;
}
,["void","CPFont","id"])]);
}