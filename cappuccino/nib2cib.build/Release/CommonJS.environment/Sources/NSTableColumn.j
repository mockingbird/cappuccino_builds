@STATIC;1.0;I;25;AppKit/CPLevelIndicator.jI;22;AppKit/CPTableColumn.jI;26;AppKit/CPTableHeaderView.jI;17;AppKit/CPButton.ji;10;NSButton.ji;13;NSImageView.ji;18;NSLevelIndicator.ji;13;NSTextField.jt;6110;objj_executeFile("AppKit/CPLevelIndicator.j", NO);objj_executeFile("AppKit/CPTableColumn.j", NO);objj_executeFile("AppKit/CPTableHeaderView.j", NO);objj_executeFile("AppKit/CPButton.j", NO);objj_executeFile("NSButton.j", YES);objj_executeFile("NSImageView.j", YES);objj_executeFile("NSLevelIndicator.j", YES);objj_executeFile("NSTextField.j", YES);var IBDefaultFontSizeTableHeader = 11.0;
{
var the_class = objj_getClass("CPTableColumn")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableColumn\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTableColumn__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        self._identifier = objj_msgSend(aCoder, "decodeObjectForKey:", "NSIdentifier");
        var dataViewCell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSDataCell"),
            viewClass = nil;
        if (objj_msgSend(dataViewCell, "isKindOfClass:", objj_msgSend(NSImageCell, "class")))
            viewClass = CPImageView;
        else if (objj_msgSend(dataViewCell, "isKindOfClass:", objj_msgSend(NSTextFieldCell, "class")))
            viewClass = CPTextField;
        else if (objj_msgSend(dataViewCell, "isKindOfClass:", objj_msgSend(NSButtonCell, "class")))
            viewClass = CPButton;
        else if (objj_msgSend(dataViewCell, "isKindOfClass:", objj_msgSend(NSLevelIndicatorCell, "class")))
            viewClass = CPLevelIndicator;
        if (viewClass)
            self._dataView = objj_msgSend(self, "makeDataViewOfClass:withCell:", viewClass, dataViewCell);
        objj_msgSend(self._dataView, "setValue:forThemeAttribute:", objj_msgSend(dataViewCell, "alignment"), "alignment");
        var headerCell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSHeaderCell"),
            headerView = objj_msgSend(objj_msgSend(_CPTableColumnHeaderView, "alloc"), "initWithFrame:", CGRectMakeZero()),
            theme = objj_msgSend(Nib2Cib, "defaultTheme");
        objj_msgSend(headerView, "setStringValue:", objj_msgSend(headerCell, "objectValue"));
        objj_msgSend(headerView, "setFont:", objj_msgSend(headerCell, "font"));
        objj_msgSend(headerView, "setAlignment:", objj_msgSend(headerCell, "alignment"));
        if (objj_msgSend(objj_msgSend(headerCell, "font"), "familyName") === IBDefaultFontFace && objj_msgSend(objj_msgSend(headerCell, "font"), "size") == IBDefaultFontSizeTableHeader)
        {
            objj_msgSend(headerView, "setTextColor:", objj_msgSend(theme, "valueForAttributeWithName:forClass:", "text-color", _CPTableColumnHeaderView));
            objj_msgSend(headerView, "setFont:", objj_msgSend(theme, "valueForAttributeWithName:forClass:", "font", _CPTableColumnHeaderView));
        }
        objj_msgSend(self, "setHeaderView:", headerView);
        self._width = objj_msgSend(aCoder, "decodeFloatForKey:", "NSWidth");
        self._minWidth = objj_msgSend(aCoder, "decodeFloatForKey:", "NSMinWidth");
        self._maxWidth = objj_msgSend(aCoder, "decodeFloatForKey:", "NSMaxWidth");
        self._resizingMask = objj_msgSend(aCoder, "decodeIntForKey:", "NSResizingMask");
        self._isHidden = objj_msgSend(aCoder, "decodeBoolForKey:", "NSHidden");
        self._isEditable = objj_msgSend(aCoder, "decodeBoolForKey:", "NSIsEditable");
        self._sortDescriptorPrototype = objj_msgSend(aCoder, "decodeObjectForKey:", "NSSortDescriptorPrototype");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("makeDataViewOfClass:withCell:"), function $CPTableColumn__makeDataViewOfClass_withCell_(self, _cmd, aClass, aCell)
{
    var dataView = objj_msgSend(objj_msgSend(aClass, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(dataView, "setThemeState:", CPThemeStateTableDataView);
    objj_msgSend(dataView, "NS_initWithCell:", aCell);
    if (aClass === CPTextField)
    {
        objj_msgSend(objj_msgSend(Converter, "sharedConverter"), "replaceFontForObject:", dataView);
        var textColor = objj_msgSend(aCell, "textColor"),
            defaultColor = objj_msgSend(self, "valueForDataViewThemeAttribute:inState:", "text-color", CPThemeStateNormal);
        if (!objj_msgSend(textColor, "isEqual:", defaultColor))
        {
            var selectedColor = objj_msgSend(self, "valueForDataViewThemeAttribute:inState:", "text-color", CPThemeState(CPThemeStateTableDataView, CPThemeStateSelectedDataView));
            objj_msgSend(dataView, "setValue:forThemeAttribute:inState:", selectedColor, "text-color", CPThemeState(CPThemeStateTableDataView, CPThemeStateSelectedDataView));
            objj_msgSend(dataView, "setValue:forThemeAttribute:inState:", textColor, "text-color", CPThemeState(CPThemeStateTableDataView, CPThemeStateSelectedDataView, CPThemeStateEditing));
        }
    }
    return dataView;
}
,["id","Class","NSCell"]), new objj_method(sel_getUid("valueForDataViewThemeAttribute:inState:"), function $CPTableColumn__valueForDataViewThemeAttribute_inState_(self, _cmd, attribute, state)
{
    var themes = objj_msgSend(objj_msgSend(Nib2Cib, "sharedNib2Cib"), "themes");
    for (var i = 0; i < themes.length; ++i)
    {
        var value = objj_msgSend(themes[i], "valueForAttributeWithName:inState:forClass:", attribute, state, CPTextField);
        if (value)
            return value;
    }
    return nil;
}
,["id","CPString","int"])]);
}{var the_class = objj_allocateClassPair(CPTableColumn, "NSTableColumn"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTableColumn__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTableColumn__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPTableColumn, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSActionCell, "NSTableHeaderCell"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}