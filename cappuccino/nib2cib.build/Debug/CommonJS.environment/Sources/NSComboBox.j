@STATIC;1.0;I;20;AppKit/CPTextField.jI;19;AppKit/CPComboBox.ji;13;NSTextField.jt;5051;objj_executeFile("AppKit/CPTextField.j", NO);objj_executeFile("AppKit/CPComboBox.j", NO);objj_executeFile("NSTextField.j", YES);{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPComboBox__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPComboBox__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "NS_initWithCell:", cell);
    self._items = (cell == null ? null : cell.isa.objj_msgSend0(cell, "itemList"));
    self._usesDataSource = (cell == null ? null : cell.isa.objj_msgSend0(cell, "usesDataSource"));
    self._completes = (cell == null ? null : cell.isa.objj_msgSend0(cell, "completes"));
    self._numberOfVisibleItems = (cell == null ? null : cell.isa.objj_msgSend0(cell, "visibleItemCount"));
    self._hasVerticalScroller = (cell == null ? null : cell.isa.objj_msgSend0(cell, "hasVerticalScroller"));
    self.isa.objj_msgSend1(self, "setButtonBordered:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "borderedButton")));
    self.isa.objj_msgSend1(self, "setEnabled:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isEnabled")));
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPComboBox, "NSComboBox"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSComboBox__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
        (self == null ? null : self.isa.objj_msgSend0(self, "_adjustNib2CibSize"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSComboBox__classForKeyedArchiver(self, _cmd)
{
    return CPComboBox.isa.objj_msgSend0(CPComboBox, "class");
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
        self._visibleItemCount = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSVisibleItemCount"));
        self._hasVerticalScroller = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSHasVerticalScroller"));
        self._usesDataSource = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSUsesDataSource"));
        self._completes = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSCompletes"));
        if (!self._usesDataSource)
            self._itemList = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSPopUpListData")) || [];
        else
            self._itemList = [];
        self._borderedButton = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSButtonBordered")) ? (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSButtonBordered")) : YES;
    }
    return self;
}
,["id","CPCoder"])]);
}