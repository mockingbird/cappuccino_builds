@STATIC;1.0;I;21;Foundation/CPObject.jI;18;AppKit/CPControl.ji;8;NSFont.jt;6619;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("AppKit/CPControl.j", NO);objj_executeFile("NSFont.j", YES);{var the_class = objj_allocateClassPair(CPObject, "NSCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_state"), new objj_ivar("_isHighlighted"), new objj_ivar("_isEnabled"), new objj_ivar("_isEditable"), new objj_ivar("_isBordered"), new objj_ivar("_isBezeled"), new objj_ivar("_isSelectable"), new objj_ivar("_isScrollable"), new objj_ivar("_isContinuous"), new objj_ivar("_scrolls"), new objj_ivar("_wraps"), new objj_ivar("_truncates"), new objj_ivar("_sendsActionOnEndEditing"), new objj_ivar("_alignment"), new objj_ivar("_controlSize"), new objj_ivar("_objectValue"), new objj_ivar("_font"), new objj_ivar("_lineBreakMode"), new objj_ivar("_formatter"), new objj_ivar("_tag"), new objj_ivar("_usesSingleLineMode")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("state"), function $NSCell__state(self, _cmd)
{
    return self._state;
}
,["int"]), new objj_method(sel_getUid("isHighlighted"), function $NSCell__isHighlighted(self, _cmd)
{
    return self._isHighlighted;
}
,["BOOL"]), new objj_method(sel_getUid("isEnabled"), function $NSCell__isEnabled(self, _cmd)
{
    return self._isEnabled;
}
,["BOOL"]), new objj_method(sel_getUid("isEditable"), function $NSCell__isEditable(self, _cmd)
{
    return self._isEditable;
}
,["BOOL"]), new objj_method(sel_getUid("isBordered"), function $NSCell__isBordered(self, _cmd)
{
    return self._isBordered;
}
,["BOOL"]), new objj_method(sel_getUid("isBezeled"), function $NSCell__isBezeled(self, _cmd)
{
    return self._isBezeled;
}
,["BOOL"]), new objj_method(sel_getUid("isSelectable"), function $NSCell__isSelectable(self, _cmd)
{
    return self._isSelectable;
}
,["BOOL"]), new objj_method(sel_getUid("isScrollable"), function $NSCell__isScrollable(self, _cmd)
{
    return self._isScrollable;
}
,["BOOL"]), new objj_method(sel_getUid("isContinuous"), function $NSCell__isContinuous(self, _cmd)
{
    return self._isContinuous;
}
,["BOOL"]), new objj_method(sel_getUid("scrolls"), function $NSCell__scrolls(self, _cmd)
{
    return self._scrolls;
}
,["BOOL"]), new objj_method(sel_getUid("wraps"), function $NSCell__wraps(self, _cmd)
{
    return self._wraps;
}
,["BOOL"]), new objj_method(sel_getUid("truncates"), function $NSCell__truncates(self, _cmd)
{
    return self._truncates;
}
,["BOOL"]), new objj_method(sel_getUid("sendsActionOnEndEditing"), function $NSCell__sendsActionOnEndEditing(self, _cmd)
{
    return self._sendsActionOnEndEditing;
}
,["BOOL"]), new objj_method(sel_getUid("alignment"), function $NSCell__alignment(self, _cmd)
{
    return self._alignment;
}
,["CPTextAlignment"]), new objj_method(sel_getUid("controlSize"), function $NSCell__controlSize(self, _cmd)
{
    return self._controlSize;
}
,["CPControlSize"]), new objj_method(sel_getUid("objectValue"), function $NSCell__objectValue(self, _cmd)
{
    return self._objectValue;
}
,["id"]), new objj_method(sel_getUid("font"), function $NSCell__font(self, _cmd)
{
    return self._font;
}
,["CPFont"]), new objj_method(sel_getUid("lineBreakMode"), function $NSCell__lineBreakMode(self, _cmd)
{
    return self._lineBreakMode;
}
,["int"]), new objj_method(sel_getUid("formatter"), function $NSCell__formatter(self, _cmd)
{
    return self._formatter;
}
,["CPFormatter"]), new objj_method(sel_getUid("tag"), function $NSCell__tag(self, _cmd)
{
    return self._tag;
}
,["int"]), new objj_method(sel_getUid("usesSingleLineMode"), function $NSCell__usesSingleLineMode(self, _cmd)
{
    return self._usesSingleLineMode;
}
,["BOOL"]), new objj_method(sel_getUid("initWithCoder:"), function $NSCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSCell").super_class }, "init");
    if (self)
    {
        var flags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSCellFlags")),
            flags2 = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSCellFlags2"));
        self._state = flags & 0x80000000 ? CPOnState : CPOffState;
        self._isHighlighted = flags & 0x40000000 ? YES : NO;
        self._isEnabled = flags & 0x20000000 ? NO : YES;
        self._isEditable = flags & 0x10000000 ? YES : NO;
        self._isBordered = flags & 0x00800000 ? YES : NO;
        self._isBezeled = flags & 0x00400000 ? YES : NO;
        self._isSelectable = flags & 0x00200000 ? YES : NO;
        self._isScrollable = flags & 0x00100000 ? YES : NO;
        self._isContinuous = flags & 0x00080100 ? YES : NO;
        self._scrolls = flags & 0x00100000 && flags & 0x00000040 ? YES : NO;
        self._wraps = !(flags & 0x00100000) && !(flags & 0x00000040) ? YES : NO;
        self._truncates = flags & 0x00100000 && !(flags & 0x00000040) ? YES : NO;
        self._alignment = (flags2 & 0x1c000000) >> 26;
        self._lineBreakMode = (flags2 & 0x0E00) >> 9;
        self._controlSize = (flags2 & 0xE0000) >> 17;
        self._sendsActionOnEndEditing = flags2 & 0x00400000 ? YES : NO;
        self._usesSingleLineMode = flags2 & 0xF4240 ? YES : NO;
        self._tag = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSTag"));
        self._objectValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSContents"));
        self._font = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSupport"));
        self._formatter = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSFormatter"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("replacementObjectForCoder:"), function $NSCell__replacementObjectForCoder_(self, _cmd, aCoder)
{
    return nil;
}
,["id","CPCoder"]), new objj_method(sel_getUid("stringValue"), function $NSCell__stringValue(self, _cmd)
{
    if (((___r1 = self._objectValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPString.isa.objj_msgSend0(CPString, "class"))))
        return self._objectValue;
    if (((___r1 = self._objectValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("attributedStringValue"))))
        return ((___r1 = self._objectValue), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "attributedStringValue"));
    return "";
    var ___r1;
}
,["CPString"])]);
}{var the_class = objj_allocateClassPair(NSCell, "NSActionCell"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}