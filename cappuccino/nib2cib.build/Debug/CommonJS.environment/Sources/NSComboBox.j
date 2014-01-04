@STATIC;1.0;I;20;AppKit/CPTextField.jI;19;AppKit/CPComboBox.ji;13;NSTextField.jt;4379;objj_executeFile("AppKit/CPTextField.j", NO);
objj_executeFile("AppKit/CPComboBox.j", NO);

objj_executeFile("NSTextField.j", YES);


{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPComboBox__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");

        _items = objj_msgSend(cell, "itemList");
        _usesDataSource = objj_msgSend(cell, "usesDataSource");
        _completes = objj_msgSend(cell, "completes");
        _numberOfVisibleItems = objj_msgSend(cell, "visibleItemCount");
        _hasVerticalScroller = objj_msgSend(cell, "hasVerticalScroller");
        objj_msgSend(self, "setButtonBordered:", objj_msgSend(cell, "borderedButton"));


        var maxSize = objj_msgSend(objj_msgSend(objj_msgSend(Converter, "sharedConverter"), "themes")[0], "valueForAttributeWithName:forClass:", "max-size", objj_msgSend(CPComboBox, "class")),
            size = objj_msgSend(self, "frameSize");

        objj_msgSend(self, "setFrameSize:", CGSizeMake(size.width, MIN(size.height, maxSize.height)));


        _frame.origin.x += 1;
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPComboBox, "NSComboBox"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSComboBox__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSComboBox__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPComboBox, "class");
}
},["Class"])]);
}

{var the_class = objj_allocateClassPair(NSTextFieldCell, "NSComboBoxCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_visibleItemCount"), new objj_ivar("_hasVerticalScroller"), new objj_ivar("_usesDataSource"), new objj_ivar("_completes"), new objj_ivar("_itemList"), new objj_ivar("_borderedButton")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("visibleItemCount"), function $NSComboBoxCell__visibleItemCount(self, _cmd)
{ with(self)
{
return _visibleItemCount;
}
},["id"]),
new objj_method(sel_getUid("hasVerticalScroller"), function $NSComboBoxCell__hasVerticalScroller(self, _cmd)
{ with(self)
{
return _hasVerticalScroller;
}
},["id"]),
new objj_method(sel_getUid("usesDataSource"), function $NSComboBoxCell__usesDataSource(self, _cmd)
{ with(self)
{
return _usesDataSource;
}
},["id"]),
new objj_method(sel_getUid("completes"), function $NSComboBoxCell__completes(self, _cmd)
{ with(self)
{
return _completes;
}
},["id"]),
new objj_method(sel_getUid("itemList"), function $NSComboBoxCell__itemList(self, _cmd)
{ with(self)
{
return _itemList;
}
},["id"]),
new objj_method(sel_getUid("borderedButton"), function $NSComboBoxCell__borderedButton(self, _cmd)
{ with(self)
{
return _borderedButton;
}
},["id"]), new objj_method(sel_getUid("initWithCoder:"), function $NSComboBoxCell__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSComboBoxCell").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        _visibleItemCount = objj_msgSend(aCoder, "decodeIntForKey:", "NSVisibleItemCount");
        _hasVerticalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", "NSHasVerticalScroller");
        _usesDataSource = objj_msgSend(aCoder, "decodeBoolForKey:", "NSUsesDataSource");
        _completes = objj_msgSend(aCoder, "decodeBoolForKey:", "NSCompletes");

        if (!_usesDataSource)
            _itemList = objj_msgSend(aCoder, "decodeObjectForKey:", "NSPopUpListData") || [];
        else
            _itemList = [];


        _borderedButton = objj_msgSend(aCoder, "containsValueForKey:", "NSButtonBordered") ? objj_msgSend(aCoder, "decodeBoolForKey:", "NSButtonBordered") : YES;
    }

    return self;
}
},["id","CPCoder"])]);
}

