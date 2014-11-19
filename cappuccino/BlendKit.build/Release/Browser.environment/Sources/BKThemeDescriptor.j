@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;16;AppKit/CPColor.jI;16;AppKit/CPImage.jI;15;AppKit/CPView.jI;29;AppKit/_CPCibCustomResource.jt;14082;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("AppKit/CPColor.j", NO);objj_executeFile("AppKit/CPImage.j", NO);objj_executeFile("AppKit/CPView.j", NO);objj_executeFile("AppKit/_CPCibCustomResource.j", NO);PatternIsHorizontal = CPColorPatternIsHorizontal;
PatternIsVertical = CPColorPatternIsVertical;
var ItemSizes = {},
    ThemedObjects = {},
    ThemedShowcaseObjects = {},
    BackgroundColors = {},
    LightCheckersColor = nil,
    DarkCheckersColor = nil,
    WindowBackgroundColor = nil;
{var the_class = objj_allocateClassPair(CPObject, "BKThemeDescriptor"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("allThemeDescriptorClasses"), function $BKThemeDescriptor__allThemeDescriptorClasses(self, _cmd)
{
    var themeDescriptorClasses = [];
    for (candidate in global)
    {
        var theClass = objj_getClass(candidate),
            theClassName = class_getName(theClass);
        if (theClassName === "BKThemeDescriptor")
            continue;
        var index = theClassName.indexOf("ThemeDescriptor");
        if (index >= 0 && index === theClassName.length - "ThemeDescriptor".length)
            themeDescriptorClasses.push(theClass);
    }
    (themeDescriptorClasses == null ? null : themeDescriptorClasses.isa.objj_msgSend1(themeDescriptorClasses, "sortUsingSelector:", sel_getUid("compare:")));
    return themeDescriptorClasses;
}
,["CPArray"]), new objj_method(sel_getUid("lightCheckersColor"), function $BKThemeDescriptor__lightCheckersColor(self, _cmd)
{
    if (!LightCheckersColor)
        LightCheckersColor = CPColor.isa.objj_msgSend1(CPColor, "colorWithPatternImage:", ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", ((___r2 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", BKThemeDescriptor.isa.objj_msgSend0(BKThemeDescriptor, "class"))), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "pathForResource:", "light-checkers.png")), CGSizeMake(12.0, 12.0))));
    return LightCheckersColor;
    var ___r1, ___r2;
}
,["CPColor"]), new objj_method(sel_getUid("darkCheckersColor"), function $BKThemeDescriptor__darkCheckersColor(self, _cmd)
{
    if (!DarkCheckersColor)
        DarkCheckersColor = CPColor.isa.objj_msgSend1(CPColor, "colorWithPatternImage:", ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", ((___r2 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", BKThemeDescriptor.isa.objj_msgSend0(BKThemeDescriptor, "class"))), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "pathForResource:", "dark-checkers.png")), CGSizeMake(12.0, 12.0))));
    return DarkCheckersColor;
    var ___r1, ___r2;
}
,["CPColor"]), new objj_method(sel_getUid("windowBackgroundColor"), function $BKThemeDescriptor__windowBackgroundColor(self, _cmd)
{
    return CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 0.95, 1.0);
}
,["CPColor"]), new objj_method(sel_getUid("defaultShowcaseBackgroundColor"), function $BKThemeDescriptor__defaultShowcaseBackgroundColor(self, _cmd)
{
    return CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 0.95, 1.0);
}
,["CPColor"]), new objj_method(sel_getUid("showcaseBackgroundColor"), function $BKThemeDescriptor__showcaseBackgroundColor(self, _cmd)
{
    var className = self.isa.objj_msgSend0(self, "className");
    if (!BackgroundColors[className])
        BackgroundColors[className] = self.isa.objj_msgSend0(self, "defaultShowcaseBackgroundColor");
    return BackgroundColors[className];
}
,["CPColor"]), new objj_method(sel_getUid("setShowcaseBackgroundColor:"), function $BKThemeDescriptor__setShowcaseBackgroundColor_(self, _cmd, aColor)
{
    BackgroundColors[self.isa.objj_msgSend0(self, "className")] = aColor;
}
,["void","CPColor"]), new objj_method(sel_getUid("itemSize"), function $BKThemeDescriptor__itemSize(self, _cmd)
{
    var className = self.isa.objj_msgSend0(self, "className");
    if (!ItemSizes[className])
        self.isa.objj_msgSend0(self, "calculateThemedObjectTemplates");
    return CGSizeMakeCopy(ItemSizes[className]);
}
,["CGSize"]), new objj_method(sel_getUid("themedObjectTemplates"), function $BKThemeDescriptor__themedObjectTemplates(self, _cmd)
{
    var className = self.isa.objj_msgSend0(self, "className");
    if (!ThemedObjects[className])
        self.isa.objj_msgSend0(self, "calculateThemedObjectTemplates");
    return ThemedObjects[className];
}
,["CPArray"]), new objj_method(sel_getUid("themedShowcaseObjectTemplates"), function $BKThemeDescriptor__themedShowcaseObjectTemplates(self, _cmd)
{
    var className = self.isa.objj_msgSend0(self, "className");
    if (!ThemedShowcaseObjects[className])
        self.isa.objj_msgSend0(self, "calculateThemedObjectTemplates");
    return ThemedShowcaseObjects[className];
}
,["CPArray"]), new objj_method(sel_getUid("calculateThemedObjectTemplates"), function $BKThemeDescriptor__calculateThemedObjectTemplates(self, _cmd)
{
    var templates = [],
        showcaseTemplates = [],
        itemSize = CGSizeMake(0.0, 0.0),
        methods = class_copyMethodList(self.isa.objj_msgSend0(self, "class").isa),
        index = 0,
        count = (methods == null ? null : methods.isa.objj_msgSend0(methods, "count")),
        excludes = [];
    if (self.isa.objj_msgSend1(self, "respondsToSelector:", sel_getUid("themeShowcaseExcludes")))
        excludes = self.isa.objj_msgSend0(self, "themeShowcaseExcludes");
    for (; index < excludes.length; ++index)
    {
        var name = excludes[index].toLowerCase();
        if (name && name.indexOf("themed") !== 0)
            excludes[index] = "themed" + name;
        else
            excludes[index] = name;
    }
    for (index = 0; index < count; ++index)
    {
        var method = methods[index],
            selector = method_getName(method);
        if (selector.indexOf("themed") !== 0)
            continue;
        var impl = method_getImplementation(method),
            object = impl(self, selector);
        if (!object)
            continue;
        var template = ((___r1 = (BKThemedObjectTemplate == null ? null : BKThemedObjectTemplate.isa.objj_msgSend0(BKThemedObjectTemplate, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")),
            excluded = (excludes == null ? null : excludes.isa.objj_msgSend1(excludes, "containsObject:", selector.toLowerCase()));
        (template == null ? null : template.isa.objj_msgSend2(template, "setValue:forKey:", object, "themedObject"));
        (template == null ? null : template.isa.objj_msgSend2(template, "setValue:forKey:", BKLabelFromIdentifier(selector), "label"));
        (templates == null ? null : templates.isa.objj_msgSend1(templates, "addObject:", template));
        if (!excluded)
        {
            if ((object == null ? null : object.isa.objj_msgSend1(object, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))))
            {
                var size = (object == null ? null : object.isa.objj_msgSend0(object, "frame")).size,
                    labelWidth = ((___r1 = (template == null ? null : template.isa.objj_msgSend1(template, "valueForKey:", "label"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sizeWithFont:", CPFont.isa.objj_msgSend1(CPFont, "boldSystemFontOfSize:", 0))).width + 20.0;
                if (size.width > itemSize.width)
                    itemSize.width = size.width;
                if (labelWidth > itemSize.width)
                    itemSize.width = labelWidth;
                if (size.height > itemSize.height)
                    itemSize.height = size.height;
            }
            (showcaseTemplates == null ? null : showcaseTemplates.isa.objj_msgSend1(showcaseTemplates, "addObject:", template));
        }
    }
    var className = self.isa.objj_msgSend0(self, "className");
    ItemSizes[className] = itemSize;
    ThemedObjects[className] = templates;
    ThemedShowcaseObjects[className] = showcaseTemplates;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("compare:"), function $BKThemeDescriptor__compare_(self, _cmd, aThemeDescriptor)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "themeName")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "compare:", (aThemeDescriptor == null ? null : aThemeDescriptor.isa.objj_msgSend0(aThemeDescriptor, "themeName"))));
    var ___r1;
}
,["int","BKThemeDescriptor"]), new objj_method(sel_getUid("registerThemeValues:forView:"), function $BKThemeDescriptor__registerThemeValues_forView_(self, _cmd, themeValues, aView)
{
    for (var i = 0; i < themeValues.length; ++i)
    {
        var attributeValueState = themeValues[i],
            attribute = attributeValueState[0],
            value = attributeValueState[1],
            state = attributeValueState[2];
        if (state)
            (aView == null ? null : aView.isa.objj_msgSend3(aView, "setValue:forThemeAttribute:inState:", value, attribute, state));
        else
            (aView == null ? null : aView.isa.objj_msgSend2(aView, "setValue:forThemeAttribute:", value, attribute));
    }
}
,["void","CPArray","CPView"]), new objj_method(sel_getUid("registerThemeValues:forView:inherit:"), function $BKThemeDescriptor__registerThemeValues_forView_inherit_(self, _cmd, themeValues, aView, inheritedValues)
{
    if (inheritedValues)
    {
        var themeName = self.isa.objj_msgSend0(self, "themeName"),
            index = themeName.indexOf("-");
        if (index < 0)
        {
            self.isa.objj_msgSend2(self, "registerThemeValues:forView:", inheritedValues, aView);
        }
        else
        {
            var themePath = themeName.substr(index + 1) + "/";
            for (var i = 0; i < inheritedValues.length; ++i)
            {
                var attributeValueState = inheritedValues[i],
                    attribute = attributeValueState[0],
                    value = attributeValueState[1],
                    state = attributeValueState[2],
                    pattern = nil;
                if (typeof value === "object" && value.hasOwnProperty("isa") && (value == null ? null : value.isa.objj_msgSend1(value, "isKindOfClass:", CPColor)) && (pattern = (value == null ? null : value.isa.objj_msgSend0(value, "patternImage"))))
                {
                    if ((pattern == null ? null : pattern.isa.objj_msgSend0(pattern, "isThreePartImage")) || (pattern == null ? null : pattern.isa.objj_msgSend0(pattern, "isNinePartImage")))
                    {
                        var slices = (pattern == null ? null : pattern.isa.objj_msgSend0(pattern, "imageSlices")),
                            newSlices = [];
                        for (var sliceIndex = 0; sliceIndex < slices.length; ++sliceIndex)
                        {
                            var slice = slices[sliceIndex],
                                filename = themePath + ((___r1 = (slice == null ? null : slice.isa.objj_msgSend0(slice, "filename"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastPathComponent")),
                                size = (slice == null ? null : slice.isa.objj_msgSend0(slice, "size"));
                            newSlices.push([filename, size.width, size.height]);
                        }
                        if ((pattern == null ? null : pattern.isa.objj_msgSend0(pattern, "isThreePartImage")))
                            value = PatternColor(newSlices, (pattern == null ? null : pattern.isa.objj_msgSend0(pattern, "isVertical")));
                        else
                            value = PatternColor(newSlices);
                    }
                    else
                    {
                        var filename = themePath + ((___r1 = (pattern == null ? null : pattern.isa.objj_msgSend0(pattern, "filename"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastPathComponent")),
                            size = (pattern == null ? null : pattern.isa.objj_msgSend0(pattern, "size"));
                        value = PatternColor(filename, size.width, size.height);
                    }
                }
                if (state)
                    (aView == null ? null : aView.isa.objj_msgSend3(aView, "setValue:forThemeAttribute:inState:", value, attribute, state));
                else
                    (aView == null ? null : aView.isa.objj_msgSend2(aView, "setValue:forThemeAttribute:", value, attribute));
            }
        }
    }
    if (themeValues)
        self.isa.objj_msgSend2(self, "registerThemeValues:forView:", themeValues, aView);
    var ___r1;
}
,["void","CPArray","CPView","CPArray"])]);
}BKLabelFromIdentifier = function(anIdentifier)
{
    var string = anIdentifier.substr("themed".length),
        index = 0,
        count = string.length,
        label = "",
        lastCapital = null,
        isLeadingCapital = YES;
    for (; index < count; ++index)
    {
        var character = string.charAt(index),
            isCapital = /^[A-Z]/.test(character);
        if (isCapital)
        {
            if (!isLeadingCapital)
            {
                if (lastCapital === null)
                    label += ' ' + character.toLowerCase();
                else
                    label += character;
            }
            lastCapital = character;
        }
        else
        {
            if (isLeadingCapital && lastCapital !== null)
                label += lastCapital;
            label += character;
            lastCapital = null;
            isLeadingCapital = NO;
        }
    }
    return label;
}
PatternImage = function(name, width, height)
{
    return _CPCibCustomResource.isa.objj_msgSend2(_CPCibCustomResource, "imageResourceWithName:size:", name, CGSizeMake(width, height));
}
PatternColor = function()
{
    var args = Array.prototype.slice.apply(arguments);
    args.push(PatternImage);
    return CPColorWithImages.apply(this, args);
}
