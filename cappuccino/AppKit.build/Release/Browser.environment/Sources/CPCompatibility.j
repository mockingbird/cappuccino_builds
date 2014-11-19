@STATIC;1.0;i;19;CPEvent_Constants.ji;12;CPPlatform.jt;10187;objj_executeFile("CPEvent_Constants.j", YES);objj_executeFile("CPPlatform.j", YES);CPUnknownBrowserEngine = 0;
CPGeckoBrowserEngine = 1;
CPInternetExplorerBrowserEngine = 2;
CPKHTMLBrowserEngine = 3;
CPOperaBrowserEngine = 4;
CPWebKitBrowserEngine = 5;
CPMacOperatingSystem = 0;
CPWindowsOperatingSystem = 1;
CPOtherOperatingSystem = 2;
CPCSSRGBAFeature = 5;
CPHTMLCanvasFeature = 6;
CPHTMLContentEditableFeature = 7;
CPHTMLDragAndDropFeature = 8;
CPJavaScriptInnerTextFeature = 9;
CPJavaScriptTextContentFeature = 10;
CPJavaScriptClipboardEventsFeature = 11;
CPJavaScriptClipboardAccessFeature = 12;
CPJavaScriptCanvasDrawFeature = 13;
CPJavaScriptCanvasTransformFeature = 14;
CPVMLFeature = 15;
CPJavaScriptRemedialKeySupport = 16;
CPJavaScriptShadowFeature = 20;
CPJavaScriptNegativeMouseWheelValues = 22;
CPJavaScriptMouseWheelValues_8_15 = 23;
CPOpacityRequiresFilterFeature = 24;
CPInputTypeCanBeChangedFeature = 25;
CPHTML5DragAndDropSourceYOffBy1 = 26;
CPSOPDisabledFromFileURLs = 27;
CPInputSetFontOutsideOfDOM = 28;
CPInput1PxLeftPadding = 29;
CPInputOnInputEventFeature = 30;
CPFileAPIFeature = 31;
CPAltEnterTextAreaFeature = 32;
CPCanvasParentDrawErrorsOnMovementBug = 1 << 0;
CPJavaScriptPasteRequiresEditableTarget = 1 << 1;
CPJavaScriptPasteCantRefocus = 1 << 2;
var USER_AGENT = "",
    PLATFORM_ENGINE = CPUnknownBrowserEngine,
    PLATFORM_FEATURES = [],
    PLATFORM_BUGS = 0,
    PLATFORM_STYLE_JS_PROPERTIES = {};
PLATFORM_FEATURES[CPInputTypeCanBeChangedFeature] = YES;
PLATFORM_FEATURES[CPInputSetFontOutsideOfDOM] = YES;
PLATFORM_FEATURES[CPAltEnterTextAreaFeature] = YES;
if (typeof window !== "undefined" && typeof window.navigator !== "undefined")
    USER_AGENT = window.navigator.userAgent;
if (typeof window !== "undefined" && window.opera)
{
    PLATFORM_ENGINE = CPOperaBrowserEngine;
    PLATFORM_FEATURES[CPJavaScriptCanvasDrawFeature] = YES;
}else if (typeof window !== "undefined" && window.attachEvent)
{
    PLATFORM_ENGINE = CPInternetExplorerBrowserEngine;
    PLATFORM_FEATURES[CPVMLFeature] = YES;
    PLATFORM_FEATURES[CPJavaScriptRemedialKeySupport] = YES;
    PLATFORM_FEATURES[CPJavaScriptShadowFeature] = YES;
    PLATFORM_FEATURES[CPOpacityRequiresFilterFeature] = YES;
    PLATFORM_FEATURES[CPInputTypeCanBeChangedFeature] = NO;
    PLATFORM_FEATURES[CPInputSetFontOutsideOfDOM] = NO;
    PLATFORM_FEATURES[CPJavaScriptClipboardAccessFeature] = YES;
}else if (USER_AGENT.indexOf("AppleWebKit/") != -1)
{
    PLATFORM_ENGINE = CPWebKitBrowserEngine;
    PLATFORM_FEATURES[CPCSSRGBAFeature] = YES;
    PLATFORM_FEATURES[CPHTMLContentEditableFeature] = YES;
    PLATFORM_FEATURES[CPJavaScriptClipboardEventsFeature] = YES;
    PLATFORM_FEATURES[CPJavaScriptClipboardAccessFeature] = NO;
    PLATFORM_FEATURES[CPJavaScriptShadowFeature] = YES;
    var versionStart = USER_AGENT.indexOf("AppleWebKit/") + "AppleWebKit/".length,
        versionEnd = USER_AGENT.indexOf(" ", versionStart),
        versionString = USER_AGENT.substring(versionStart, versionEnd),
        versionDivision = versionString.indexOf('.'),
        majorVersion = parseInt(versionString.substring(0, versionDivision)),
        minorVersion = parseInt(versionString.substr(versionDivision + 1));
    if (USER_AGENT.indexOf("Safari") !== CPNotFound && (majorVersion > 525 || majorVersion === 525 && minorVersion > 14) || USER_AGENT.indexOf("Chrome") !== CPNotFound)
        PLATFORM_FEATURES[CPJavaScriptRemedialKeySupport] = YES;
    if (!CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
        PLATFORM_FEATURES[CPJavaScriptRemedialKeySupport] = YES;
    if (majorVersion < 532 || majorVersion === 532 && minorVersion < 6)
        PLATFORM_FEATURES[CPHTML5DragAndDropSourceYOffBy1] = YES;
    if (majorVersion < 537)
        PLATFORM_FEATURES[CPInput1PxLeftPadding] = YES;
    if (USER_AGENT.indexOf("Chrome") === CPNotFound)
    {
        PLATFORM_FEATURES[CPSOPDisabledFromFileURLs] = YES;
        PLATFORM_FEATURES[CPHTMLDragAndDropFeature] = YES;
        PLATFORM_BUGS |= CPJavaScriptPasteRequiresEditableTarget;
        PLATFORM_BUGS |= CPJavaScriptPasteCantRefocus;
    }
    if (majorVersion > 533)
        PLATFORM_BUGS |= CPCanvasParentDrawErrorsOnMovementBug;
}else if (USER_AGENT.indexOf("KHTML") != -1)
{
    PLATFORM_ENGINE = CPKHTMLBrowserEngine;
}else if (USER_AGENT.indexOf("Gecko") !== -1)
{
    PLATFORM_ENGINE = CPGeckoBrowserEngine;
    PLATFORM_FEATURES[CPJavaScriptCanvasDrawFeature] = YES;
    var index = USER_AGENT.indexOf("Firefox"),
        version = index === -1 ? 2.0 : parseFloat(USER_AGENT.substring(index + "Firefox".length + 1));
    if (version >= 3.0)
        PLATFORM_FEATURES[CPCSSRGBAFeature] = YES;
    if (version < 3.0)
        PLATFORM_FEATURES[CPJavaScriptMouseWheelValues_8_15] = YES;
    PLATFORM_FEATURES[CPInput1PxLeftPadding] = YES;
    PLATFORM_FEATURES[CPAltEnterTextAreaFeature] = NO;
}if (typeof document != "undefined")
{
    var canvasElement = document.createElement("canvas");
    if (canvasElement && canvasElement.getContext)
    {
        PLATFORM_FEATURES[CPHTMLCanvasFeature] = YES;
        PLATFORM_FEATURES[CPOpacityRequiresFilterFeature] = NO;
        var context = (document.createElement("canvas")).getContext("2d");
        if (context && context.setTransform && context.transform)
            PLATFORM_FEATURES[CPJavaScriptCanvasTransformFeature] = YES;
    }
    var DOMElement = document.createElement("div");
    if (DOMElement.innerText != undefined)
        PLATFORM_FEATURES[CPJavaScriptInnerTextFeature] = YES;
    else if (DOMElement.textContent != undefined)
        PLATFORM_FEATURES[CPJavaScriptTextContentFeature] = YES;
    var DOMInputElement = document.createElement("input");
    if ("oninput" in DOMInputElement)
        PLATFORM_FEATURES[CPInputOnInputEventFeature] = YES;
    else if (typeof DOMInputElement.setAttribute === "function")
    {
        DOMInputElement.setAttribute("oninput", "return;");
        if (typeof DOMInputElement.oninput === "function")
            PLATFORM_FEATURES[CPInputOnInputEventFeature] = YES;
    }
    if (typeof DOMInputElement.setAttribute === "function")
    {
        DOMInputElement.setAttribute("type", "file");
        PLATFORM_FEATURES[CPFileAPIFeature] = !!DOMInputElement["files"];
    }
    else
        PLATFORM_FEATURES[CPFileAPIFeature] = NO;
}CPFeatureIsCompatible = function(aFeature)
{
    return !!PLATFORM_FEATURES[aFeature];
}
CPPlatformHasBug = function(aBug)
{
    return PLATFORM_BUGS & aBug;
}
CPBrowserIsEngine = function(anEngine)
{
    return PLATFORM_ENGINE === anEngine;
}
CPBrowserIsOperatingSystem = function(anOperatingSystem)
{
    return OPERATING_SYSTEM === anOperatingSystem;
}
OPERATING_SYSTEM = CPOtherOperatingSystem;
if (USER_AGENT.indexOf("Mac") !== -1)
{
    OPERATING_SYSTEM = CPMacOperatingSystem;
    CPPlatformActionKeyMask = CPCommandKeyMask;
    CPUndoKeyEquivalent = "z";
    CPRedoKeyEquivalent = "Z";
    CPUndoKeyEquivalentModifierMask = CPCommandKeyMask;
    CPRedoKeyEquivalentModifierMask = CPCommandKeyMask;
}else
{
    if (USER_AGENT.indexOf("Windows") !== -1)
        OPERATING_SYSTEM = CPWindowsOperatingSystem;
    CPPlatformActionKeyMask = CPControlKeyMask;
    CPUndoKeyEquivalent = "z";
    CPRedoKeyEquivalent = "y";
    CPUndoKeyEquivalentModifierMask = CPControlKeyMask;
    CPRedoKeyEquivalentModifierMask = CPControlKeyMask;
}CPBrowserStyleProperty = function(aProperty)
{
    var lowerProperty = aProperty.toLowerCase();
    if (PLATFORM_STYLE_JS_PROPERTIES[lowerProperty] === undefined)
    {
        var r = nil;
        var testElement = document.createElement('div');
        switch(lowerProperty) {
        case 'transitionend':
            var candidates = {'WebkitTransition': 'webkitTransitionEnd', 'MozTransition': 'transitionend', 'OTransition': 'oTransitionEnd', 'msTransition': 'MSTransitionEnd', 'transition': 'transitionend'};
            r = candidates[PLATFORM_STYLE_JS_PROPERTIES['transition']] || nil;
            break;
        case 'transformorigin':
            var candidates = {'WebkitTransform': 'WebkitTransformOrigin', 'MozTransform': 'MozTransformOrigin', 'OTransform': 'OTransformOrigin', 'msTransform': 'MSTransformOrigin', 'transform': 'transformOrigin'};
            r = candidates[PLATFORM_STYLE_JS_PROPERTIES['transform']] || nil;
            break;
default:
            var prefixes = ["Webkit", "Moz", "O", "ms"],
                strippedProperty = (aProperty.split('-')).join(' '),
                capProperty = ((strippedProperty == null ? null : strippedProperty.isa.objj_msgSend0(strippedProperty, "capitalizedString")).split(' ')).join('');
            for (var i = 0; i < prefixes.length; i++)
            {
                if (prefixes[i] + aProperty in testElement.style)
                {
                    r = prefixes[i] + aProperty;
                    break;
                }
                else if (prefixes[i] + capProperty in testElement.style)
                {
                    r = prefixes[i] + capProperty;
                    break;
                }
            }
            if (!r && lowerProperty in testElement.style)
                r = lowerProperty;
            break;
        }
        PLATFORM_STYLE_JS_PROPERTIES[lowerProperty] = r;
    }
    return PLATFORM_STYLE_JS_PROPERTIES[lowerProperty];
}
CPBrowserCSSProperty = function(aProperty)
{
    var browserProperty = CPBrowserStyleProperty(aProperty);
    if (!browserProperty)
        return nil;
    var prefixes = {'Webkit': '-webkit-', 'Moz': '-moz-', 'O': '-o-', 'ms': '-ms-'};
    for (var prefix in prefixes)
    {
        if (browserProperty.substring(0, prefix.length) == prefix)
        {
            var browserPropertyWithoutPrefix = browserProperty.substring(prefix.length),
                parts = browserPropertyWithoutPrefix.match(/[A-Z][a-z]+/g);
            if (parts && parts.length > 0)
                browserPropertyWithoutPrefix = parts.join("-");
            return prefixes[prefix] + browserPropertyWithoutPrefix.toLowerCase();
        }
    }
    var parts = browserProperty.match(/[A-Z][a-z]+/g);
    if (parts && parts.length > 0)
        browserProperty = parts.join("-");
    return browserProperty.toLowerCase();
}
