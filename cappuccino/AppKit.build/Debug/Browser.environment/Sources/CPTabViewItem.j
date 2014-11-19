@STATIC;1.0;I;21;Foundation/CPObject.ji;8;CPView.jt;4900;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPView.j", YES);CPSelectedTab = 0;
CPBackgroundTab = 1;
CPPressedTab = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPTabViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_label"), new objj_ivar("_view"), new objj_ivar("_auxiliaryView"), new objj_ivar("_tabView"), new objj_ivar("_tabState")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPTabViewItem__init(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "initWithIdentifier:", "");
}
,["id"]), new objj_method(sel_getUid("initWithIdentifier:"), function $CPTabViewItem__initWithIdentifier_(self, _cmd, anIdentifier)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTabViewItem").super_class }, "init");
    if (self)
        self._identifier = anIdentifier;
    return self;
}
,["id","id"]), new objj_method(sel_getUid("setLabel:"), function $CPTabViewItem__setLabel_(self, _cmd, aLabel)
{
    self._label = aLabel;
    ((___r1 = self._tabView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("label"), function $CPTabViewItem__label(self, _cmd)
{
    return self._label;
}
,["CPString"]), new objj_method(sel_getUid("tabState"), function $CPTabViewItem__tabState(self, _cmd)
{
    return self._tabState;
}
,["CPTabState"]), new objj_method(sel_getUid("setIdentifier:"), function $CPTabViewItem__setIdentifier_(self, _cmd, anIdentifier)
{
    self._identifier = anIdentifier;
}
,["void","id"]), new objj_method(sel_getUid("identifier"), function $CPTabViewItem__identifier(self, _cmd)
{
    return self._identifier;
}
,["id"]), new objj_method(sel_getUid("setView:"), function $CPTabViewItem__setView_(self, _cmd, aView)
{
    if (self._view == aView)
        return;
    self._view = aView;
    if (((___r1 = self._tabView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedTabViewItem")) == self)
        ((___r1 = self._tabView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setContentViewFromItem:", self));
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("view"), function $CPTabViewItem__view(self, _cmd)
{
    return self._view;
}
,["CPView"]), new objj_method(sel_getUid("setAuxiliaryView:"), function $CPTabViewItem__setAuxiliaryView_(self, _cmd, anAuxiliaryView)
{
    self._auxiliaryView = anAuxiliaryView;
}
,["void","CPView"]), new objj_method(sel_getUid("auxiliaryView"), function $CPTabViewItem__auxiliaryView(self, _cmd)
{
    return self._auxiliaryView;
}
,["CPView"]), new objj_method(sel_getUid("tabView"), function $CPTabViewItem__tabView(self, _cmd)
{
    return self._tabView;
}
,["CPTabView"]), new objj_method(sel_getUid("_setTabView:"), function $CPTabViewItem___setTabView_(self, _cmd, aView)
{
    self._tabView = aView;
}
,["void","CPTabView"])]);
}var CPTabViewItemIdentifierKey = "CPTabViewItemIdentifierKey",
    CPTabViewItemLabelKey = "CPTabViewItemLabelKey",
    CPTabViewItemViewKey = "CPTabViewItemViewKey",
    CPTabViewItemAuxViewKey = "CPTabViewItemAuxViewKey";
{
var the_class = objj_getClass("CPTabViewItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTabViewItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTabViewItem__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTabViewItem").super_class }, "init");
    if (self)
    {
        self._identifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTabViewItemIdentifierKey));
        self._label = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTabViewItemLabelKey));
        self._view = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTabViewItemViewKey));
        self._auxiliaryView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTabViewItemAuxViewKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTabViewItem__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._identifier, CPTabViewItemIdentifierKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._label, CPTabViewItemLabelKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._view, CPTabViewItemViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._auxiliaryView, CPTabViewItemAuxViewKey));
}
,["void","CPCoder"])]);
}