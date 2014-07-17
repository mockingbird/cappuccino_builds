@STATIC;1.0;I;25;AppKit/CPLevelIndicator.jI;22;AppKit/CPTableColumn.jI;26;AppKit/CPTableHeaderView.jI;17;AppKit/CPButton.ji;10;NSButton.ji;13;NSImageView.ji;18;NSLevelIndicator.ji;13;NSTextField.jt;8414;objj_executeFile("AppKit/CPLevelIndicator.j", NO);objj_executeFile("AppKit/CPTableColumn.j", NO);objj_executeFile("AppKit/CPTableHeaderView.j", NO);objj_executeFile("AppKit/CPButton.j", NO);objj_executeFile("NSButton.j", YES);objj_executeFile("NSImageView.j", YES);objj_executeFile("NSLevelIndicator.j", YES);objj_executeFile("NSTextField.j", YES);var IBDefaultFontSizeTableHeader = 11.0;
{
var the_class = objj_getClass("CPTableColumn")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableColumn\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTableColumn__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend0(self, "init"));
    if (self)
    {
        self._identifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSIdentifier"));
        var dataViewCell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSDataCell")),
            viewClass = nil;
        if ((dataViewCell == null ? null : dataViewCell.isa.objj_msgSend1(dataViewCell, "isKindOfClass:", NSImageCell.isa.objj_msgSend0(NSImageCell, "class"))))
            viewClass = CPImageView;
        else if ((dataViewCell == null ? null : dataViewCell.isa.objj_msgSend1(dataViewCell, "isKindOfClass:", NSTextFieldCell.isa.objj_msgSend0(NSTextFieldCell, "class"))))
            viewClass = CPTextField;
        else if ((dataViewCell == null ? null : dataViewCell.isa.objj_msgSend1(dataViewCell, "isKindOfClass:", NSButtonCell.isa.objj_msgSend0(NSButtonCell, "class"))))
            viewClass = CPButton;
        else if ((dataViewCell == null ? null : dataViewCell.isa.objj_msgSend1(dataViewCell, "isKindOfClass:", NSLevelIndicatorCell.isa.objj_msgSend0(NSLevelIndicatorCell, "class"))))
            viewClass = CPLevelIndicator;
        if (viewClass)
            self._dataView = (self == null ? null : self.isa.objj_msgSend2(self, "makeDataViewOfClass:withCell:", viewClass, dataViewCell));
        ((___r1 = self._dataView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forThemeAttribute:", (dataViewCell == null ? null : dataViewCell.isa.objj_msgSend0(dataViewCell, "alignment")), "alignment"));
        var headerCell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSHeaderCell")),
            headerView = ((___r1 = _CPTableColumnHeaderView.isa.objj_msgSend0(_CPTableColumnHeaderView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero())),
            theme = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "defaultTheme"));
        (headerView == null ? null : headerView.isa.objj_msgSend1(headerView, "setStringValue:", (headerCell == null ? null : headerCell.isa.objj_msgSend0(headerCell, "objectValue"))));
        (headerView == null ? null : headerView.isa.objj_msgSend1(headerView, "setFont:", (headerCell == null ? null : headerCell.isa.objj_msgSend0(headerCell, "font"))));
        (headerView == null ? null : headerView.isa.objj_msgSend1(headerView, "setAlignment:", (headerCell == null ? null : headerCell.isa.objj_msgSend0(headerCell, "alignment"))));
        if (((___r1 = (headerCell == null ? null : headerCell.isa.objj_msgSend0(headerCell, "font"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "familyName")) === IBDefaultFontFace && ((___r1 = (headerCell == null ? null : headerCell.isa.objj_msgSend0(headerCell, "font"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "size")) == IBDefaultFontSizeTableHeader)
        {
            (headerView == null ? null : headerView.isa.objj_msgSend1(headerView, "setTextColor:", (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "text-color", _CPTableColumnHeaderView))));
            (headerView == null ? null : headerView.isa.objj_msgSend1(headerView, "setFont:", (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "font", _CPTableColumnHeaderView))));
        }
        (self == null ? null : self.isa.objj_msgSend1(self, "setHeaderView:", headerView));
        self._width = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSWidth"));
        self._minWidth = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSMinWidth"));
        self._maxWidth = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSMaxWidth"));
        self._resizingMask = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSResizingMask"));
        self._isHidden = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSHidden"));
        self._isEditable = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSIsEditable"));
        self._sortDescriptorPrototype = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSortDescriptorPrototype"));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("makeDataViewOfClass:withCell:"), function $CPTableColumn__makeDataViewOfClass_withCell_(self, _cmd, aClass, aCell)
{
    var dataView = ((___r1 = (aClass == null ? null : aClass.isa.objj_msgSend0(aClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setThemeState:", CPThemeStateTableDataView));
    (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "NS_initWithCell:", aCell));
    if (aClass === CPTextField)
    {
        ((___r1 = (Converter == null ? null : Converter.isa.objj_msgSend0(Converter, "sharedConverter"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "replaceFontForObject:", dataView));
        var textColor = (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "textColor")),
            defaultColor = self.isa.objj_msgSend2(self, "valueForDataViewThemeAttribute:inState:", "text-color", CPThemeStateNormal);
        if (!(textColor == null ? null : textColor.isa.objj_msgSend1(textColor, "isEqual:", defaultColor)))
        {
            var selectedColor = self.isa.objj_msgSend2(self, "valueForDataViewThemeAttribute:inState:", "text-color", CPThemeState(CPThemeStateTableDataView, CPThemeStateSelectedDataView));
            (dataView == null ? null : dataView.isa.objj_msgSend3(dataView, "setValue:forThemeAttribute:inState:", selectedColor, "text-color", CPThemeState(CPThemeStateTableDataView, CPThemeStateSelectedDataView)));
            (dataView == null ? null : dataView.isa.objj_msgSend3(dataView, "setValue:forThemeAttribute:inState:", textColor, "text-color", CPThemeState(CPThemeStateTableDataView, CPThemeStateSelectedDataView, CPThemeStateEditing)));
        }
    }
    return dataView;
    var ___r1;
}
,["id","Class","NSCell"]), new objj_method(sel_getUid("valueForDataViewThemeAttribute:inState:"), function $CPTableColumn__valueForDataViewThemeAttribute_inState_(self, _cmd, attribute, state)
{
    var themes = ((___r1 = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "sharedNib2Cib"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "themes"));
    for (var i = 0; i < themes.length; ++i)
    {
        var value = ((___r1 = themes[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "valueForAttributeWithName:inState:forClass:", attribute, state, CPTextField));
        if (value)
            return value;
    }
    return nil;
    var ___r1;
}
,["id","CPString","int"])]);
}{var the_class = objj_allocateClassPair(CPTableColumn, "NSTableColumn"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTableColumn__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTableColumn__classForKeyedArchiver(self, _cmd)
{
    return CPTableColumn.isa.objj_msgSend0(CPTableColumn, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSActionCell, "NSTableHeaderCell"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}