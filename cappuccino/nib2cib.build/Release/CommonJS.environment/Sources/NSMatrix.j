@STATIC;1.0;I;21;Foundation/CPObject.jI;16;AppKit/CPRadio.jI;15;AppKit/CPView.ji;8;NSView.jt;6061;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("AppKit/CPRadio.j", NO);objj_executeFile("AppKit/CPView.j", NO);objj_executeFile("NSView.j", YES);var NSMatrixRadioModeMask = 0x40000000,
    NSMatrixDrawsBackgroundMask = 0x01000000;
{var the_class = objj_allocateClassPair(CPView, "NSMatrix"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSMatrix__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCoder:"), function $NSMatrix__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSMatrix").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var numberOfRows = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSNumRows")),
            numberOfColumns = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSNumCols")),
            cellSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", "NSCellSize")),
            intercellSpacing = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", "NSIntercellSpacing")),
            flags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSMatrixFlags")),
            isRadioMode = flags & NSMatrixRadioModeMask,
            drawsBackground = flags & NSMatrixDrawsBackgroundMask,
            backgroundColor = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSBackgroundColor")),
            cells = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCells")),
            selectedCell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSelectedCell"));
        if (isRadioMode)
        {
            var radioGroup = CPRadioGroup.isa.objj_msgSend0(CPRadioGroup, "new"),
                frame = CGRectMake(0.0, 0.0, cellSize.width, cellSize.height);
            for (var rowIndex = 0; rowIndex < numberOfRows; ++rowIndex)
            {
                frame.origin.x = 0;
                for (var columnIndex = 0; columnIndex < numberOfColumns; ++columnIndex)
                {
                    var cell = cells[rowIndex * numberOfColumns + columnIndex],
                        cellView = ((___r1 = CPRadio.isa.objj_msgSend0(CPRadio, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithFrame:radioGroup:cell:", frame, radioGroup, cell));
                    (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", cellView));
                    NIB_CONNECTION_EQUIVALENCY_TABLE[(cell == null ? null : cell.isa.objj_msgSend0(cell, "UID"))] = cellView;
                    frame.origin.x = CGRectGetMaxX(frame) + intercellSpacing.width;
                }
                frame.origin.y = CGRectGetMaxY(frame) + intercellSpacing.height;
            }
            if (drawsBackground)
                (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColor:", backgroundColor));
            self.isa = CPView.isa.objj_msgSend0(CPView, "class");
            NIB_CONNECTION_EQUIVALENCY_TABLE[(self == null ? null : self.isa.objj_msgSend0(self, "UID"))] = radioGroup;
        }
        else
        {
            self = nil;
        }
    }
    return self;
    var ___r1;
}
,["id","CPCoder"])]);
}{
var the_class = objj_getClass("CPRadio")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPRadio\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:radioGroup:cell:"), function $CPRadio__initWithFrame_radioGroup_cell_(self, _cmd, aFrame, aRadioGroup, aCell)
{
    self = (self == null ? null : self.isa.objj_msgSend2(self, "initWithFrame:radioGroup:", aFrame, aRadioGroup));
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTitle:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "title"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "clearColor")));
        (self == null ? null : self.isa.objj_msgSend1(self, "setFont:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "font"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAlignment:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "alignment"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setLineBreakMode:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "lineBreakMode"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setImagePosition:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "imagePosition"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setKeyEquivalent:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "keyEquivalent"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setKeyEquivalentModifierMask:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "keyEquivalentModifierMask"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAllowsMixedState:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "allowsMixedState"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setObjectValue:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "objectValue"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setEnabled:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "isEnabled"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTag:", (aCell == null ? null : aCell.isa.objj_msgSend0(aCell, "tag"))));
    }
    return self;
}
,["id","CGRect","CPRadioGroup","NSButtonCell"])]);
}