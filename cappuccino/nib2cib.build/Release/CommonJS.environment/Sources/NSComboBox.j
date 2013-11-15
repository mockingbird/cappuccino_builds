@STATIC;1.0;I;20;AppKit/CPTextField.jI;19;AppKit/CPComboBox.ji;13;NSTextField.jt;4810;objj_executeFile("AppKit/CPTextField.j", NO);objj_executeFile("AppKit/CPComboBox.j", NO);objj_executeFile("NSTextField.j", YES);{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPComboBox__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPComboBox__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "NS_initWithCell:", cell);
    self._items = objj_msgSend(cell, "itemList");
    self._usesDataSource = objj_msgSend(cell, "usesDataSource");
    self._completes = objj_msgSend(cell, "completes");
    self._numberOfVisibleItems = objj_msgSend(cell, "visibleItemCount");
    self._hasVerticalScroller = objj_msgSend(cell, "hasVerticalScroller");
    objj_msgSend(self, "setButtonBordered:", objj_msgSend(cell, "borderedButton"));
    objj_msgSend(self, "setEnabled:", objj_msgSend(cell, "isEnabled"));
    var theme = objj_msgSend(Nib2Cib, "defaultTheme"),
        maxSize = objj_msgSend(theme, "valueForAttributeWithName:forClass:", "max-size", objj_msgSend(CPComboBox, "class")),
        size = objj_msgSend(self, "frameSize"),
        widthOffset = -3;
    if (objj_msgSend(theme, "name") == "Aristo")
    {
        self._frame.origin.x += 1;
        widthOffset = -5;
    }
    objj_msgSend(self, "setFrameSize:", CGSizeMake(size.width + widthOffset, MIN(size.height, maxSize.height)));
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPComboBox, "NSComboBox"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSComboBox__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSComboBox__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPComboBox, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSTextFieldCell, "NSComboBoxCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_visibleItemCount"), new objj_ivar("_hasVerticalScroller"), new objj_ivar("_usesDataSource"), new objj_ivar("_completes"), new objj_ivar("_itemList"), new objj_ivar("_borderedButton")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("visibleItemCount"), function $NSComboBoxCell__visibleItemCount(self, _cmd)
{
    return self._visibleItemCount;
}
,["int"]), new objj_method(sel_getUid("hasVerticalScroller"), function $NSComboBoxCell__hasVerticalScroller(self, _cmd)
{
    return self._hasVerticalScroller;
}
,["BOOL"]), new objj_method(sel_getUid("usesDataSource"), function $NSComboBoxCell__usesDataSource(self, _cmd)
{
    return self._usesDataSource;
}
,["BOOL"]), new objj_method(sel_getUid("completes"), function $NSComboBoxCell__completes(self, _cmd)
{
    return self._completes;
}
,["BOOL"]), new objj_method(sel_getUid("itemList"), function $NSComboBoxCell__itemList(self, _cmd)
{
    return self._itemList;
}
,["CPArray"]), new objj_method(sel_getUid("borderedButton"), function $NSComboBoxCell__borderedButton(self, _cmd)
{
    return self._borderedButton;
}
,["BOOL"]), new objj_method(sel_getUid("initWithCoder:"), function $NSComboBoxCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSComboBoxCell").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._visibleItemCount = objj_msgSend(aCoder, "decodeIntForKey:", "NSVisibleItemCount");
        self._hasVerticalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", "NSHasVerticalScroller");
        self._usesDataSource = objj_msgSend(aCoder, "decodeBoolForKey:", "NSUsesDataSource");
        self._completes = objj_msgSend(aCoder, "decodeBoolForKey:", "NSCompletes");
        if (!self._usesDataSource)
            self._itemList = objj_msgSend(aCoder, "decodeObjectForKey:", "NSPopUpListData") || [];
        else
            self._itemList = [];
        self._borderedButton = objj_msgSend(aCoder, "containsValueForKey:", "NSButtonBordered") ? objj_msgSend(aCoder, "decodeBoolForKey:", "NSButtonBordered") : YES;
    }
    return self;
}
,["id","CPCoder"])]);
}