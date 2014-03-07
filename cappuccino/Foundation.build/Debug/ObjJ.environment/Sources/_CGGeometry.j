@STATIC;1.0;t;9165;CGPointMake = function(x, y)
{
    return {x: x, y: y};
}
CGPointMakeZero = function()
{
    return {x: 0, y: 0};
}
CGPointMakeCopy = function(aPoint)
{
    return {x: aPoint.x, y: aPoint.y};
}
CGPointCreateCopy = CGPointMakeCopy;
CGPointEqualToPoint = function(lhsPoint, rhsPoint)
{
    return lhsPoint.x == rhsPoint.x && lhsPoint.y == rhsPoint.y;
}
CGStringFromPoint = function(aPoint)
{
    return "{" + aPoint.x + ", " + aPoint.y + "}";
}
CGSizeMake = function(width, height)
{
    return {width: width, height: height};
}
CGSizeMakeZero = function()
{
    return {width: 0, height: 0};
}
CGSizeMakeCopy = function(aSize)
{
    return {width: aSize.width, height: aSize.height};
}
CGSizeCreateCopy = CGSizeMakeCopy;
CGSizeEqualToSize = function(lhsSize, rhsSize)
{
    return lhsSize.width == rhsSize.width && lhsSize.height == rhsSize.height;
}
CGStringFromSize = function(aSize)
{
    return "{" + aSize.width + ", " + aSize.height + "}";
}
CGRectMake = function(x, y, width, height)
{
    return {origin: {x: x, y: y}, size: {width: width, height: height}};
}
CGRectMakeZero = function()
{
    return {origin: {x: 0, y: 0}, size: {width: 0, height: 0}};
}
CGRectMakeCopy = function(aRect)
{
    return {origin: {x: aRect.origin.x, y: aRect.origin.y}, size: {width: aRect.size.width, height: aRect.size.height}};
}
CGRectCreateCopy = CGRectMakeCopy;
CGRectEqualToRect = function(lhsRect, rhsRect)
{
    return lhsRect.origin.x == rhsRect.origin.x && lhsRect.origin.y == rhsRect.origin.y && lhsRect.size.width == rhsRect.size.width && lhsRect.size.height == rhsRect.size.height;
}
CGStringFromRect = function(aRect)
{
    return "{" + CGStringFromPoint(aRect.origin) + ", " + CGStringFromSize(aRect.size) + "}";
}
CGRectOffset = function(aRect, dX, dY)
{
    return {origin: {x: aRect.origin.x + dX, y: aRect.origin.y + dY}, size: {width: aRect.size.width, height: aRect.size.height}};
}
CGRectInset = function(aRect, dX, dY)
{
    return {origin: {x: aRect.origin.x + dX, y: aRect.origin.y + dY}, size: {width: aRect.size.width - 2 * dX, height: aRect.size.height - 2 * dY}};
}
CGRectGetHeight = function(aRect)
{
    return aRect.size.height;
}
CGRectGetMaxX = function(aRect)
{
    return aRect.origin.x + aRect.size.width;
}
CGRectGetMaxY = function(aRect)
{
    return aRect.origin.y + aRect.size.height;
}
CGRectGetMidX = function(aRect)
{
    return aRect.origin.x + aRect.size.width / 2.0;
}
CGRectGetMidY = function(aRect)
{
    return aRect.origin.y + aRect.size.height / 2.0;
}
CGRectGetMinX = function(aRect)
{
    return aRect.origin.x;
}
CGRectGetMinY = function(aRect)
{
    return aRect.origin.y;
}
CGRectGetWidth = function(aRect)
{
    return aRect.size.width;
}
CGRectIsEmpty = function(aRect)
{
    return aRect.size.width <= 0.0 || aRect.size.height <= 0.0 || aRect.origin.x === Infinity || aRect.origin.y === Infinity;
}
CGRectIsNull = function(aRect)
{
    return aRect.origin.x === Infinity || aRect.origin.y === Infinity;
}
CGRectContainsPoint = function(aRect, aPoint)
{
    return aPoint.x >= aRect.origin.x && aPoint.y >= aRect.origin.y && aPoint.x < CGRectGetMaxX(aRect) && aPoint.y < CGRectGetMaxY(aRect);
}
CGInsetMake = function(top, right, bottom, left)
{
    return {top: top, right: right, bottom: bottom, left: left};
}
CGInsetMakeZero = function()
{
    return {top: 0, right: 0, bottom: 0, left: 0};
}
CGInsetMakeCopy = function(anInset)
{
    return {top: anInset.top, right: anInset.right, bottom: anInset.bottom, left: anInset.left};
}
CGInsetMakeInvertedCopy = function(anInset)
{
    return {top: -anInset.top, right: -anInset.right, bottom: -anInset.bottom, left: -anInset.left};
}
CGInsetIsEmpty = function(anInset)
{
    return anInset.top === 0 && anInset.right === 0 && anInset.bottom === 0 && anInset.left === 0;
}
CGInsetEqualToInset = function(lhsInset, rhsInset)
{
    return lhsInset.top === rhsInset.top && lhsInset.right === rhsInset.right && lhsInset.bottom === rhsInset.bottom && lhsInset.left === rhsInset.left;
}
CGMinXEdge = 0;
CGMinYEdge = 1;
CGMaxXEdge = 2;
CGMaxYEdge = 3;
CGRectNull = CGRectMake(Infinity, Infinity, 0.0, 0.0);
CGRectDivide = function(inRect, slice, rem, amount, edge)
{
    slice.origin = CGPointMakeCopy(inRect.origin);
    slice.size = CGSizeMakeCopy(inRect.size);
    rem.origin = CGPointMakeCopy(inRect.origin);
    rem.size = CGSizeMakeCopy(inRect.size);
    switch(edge) {
    case CGMinXEdge:
        slice.size.width = amount;
        rem.origin.x += amount;
        rem.size.width -= amount;
        break;
    case CGMaxXEdge:
        slice.origin.x = CGRectGetMaxX(slice) - amount;
        slice.size.width = amount;
        rem.size.width -= amount;
        break;
    case CGMinYEdge:
        slice.size.height = amount;
        rem.origin.y += amount;
        rem.size.height -= amount;
        break;
    case CGMaxYEdge:
        slice.origin.y = CGRectGetMaxY(slice) - amount;
        slice.size.height = amount;
        rem.size.height -= amount;
    }
}
CGRectContainsRect = function(lhsRect, rhsRect)
{
    var union = CGRectUnion(lhsRect, rhsRect);
    return CGRectEqualToRect(union, lhsRect);
}
CGRectIntersectsRect = function(lhsRect, rhsRect)
{
    var intersection = CGRectIntersection(lhsRect, rhsRect);
    return !CGRectIsEmpty(intersection);
}
CGRectIntegral = function(aRect)
{
    aRect = CGRectStandardize(aRect);
    var x = FLOOR(CGRectGetMinX(aRect)),
        y = FLOOR(CGRectGetMinY(aRect));
    aRect.size.width = CEIL(CGRectGetMaxX(aRect)) - x;
    aRect.size.height = CEIL(CGRectGetMaxY(aRect)) - y;
    aRect.origin.x = x;
    aRect.origin.y = y;
    return aRect;
}
CGRectIntersection = function(lhsRect, rhsRect)
{
    var intersection = CGRectMake(MAX(CGRectGetMinX(lhsRect), CGRectGetMinX(rhsRect)), MAX(CGRectGetMinY(lhsRect), CGRectGetMinY(rhsRect)), 0, 0);
    intersection.size.width = MIN(CGRectGetMaxX(lhsRect), CGRectGetMaxX(rhsRect)) - CGRectGetMinX(intersection);
    intersection.size.height = MIN(CGRectGetMaxY(lhsRect), CGRectGetMaxY(rhsRect)) - CGRectGetMinY(intersection);
    return CGRectIsEmpty(intersection) ? CGRectMakeZero() : intersection;
}
CGRectStandardize = function(aRect)
{
    var width = CGRectGetWidth(aRect),
        height = CGRectGetHeight(aRect),
        standardized = CGRectMakeCopy(aRect);
    if (width < 0.0)
    {
        standardized.origin.x += width;
        standardized.size.width = -width;
    }
    if (height < 0.0)
    {
        standardized.origin.y += height;
        standardized.size.height = -height;
    }
    return standardized;
}
CGRectUnion = function(lhsRect, rhsRect)
{
    var lhsRectIsNull = !lhsRect || lhsRect === CGRectNull,
        rhsRectIsNull = !rhsRect || rhsRect === CGRectNull;
    if (lhsRectIsNull)
        return rhsRectIsNull ? CGRectNull : rhsRect;
    if (rhsRectIsNull)
        return lhsRectIsNull ? CGRectNull : lhsRect;
    var minX = MIN(CGRectGetMinX(lhsRect), CGRectGetMinX(rhsRect)),
        minY = MIN(CGRectGetMinY(lhsRect), CGRectGetMinY(rhsRect)),
        maxX = MAX(CGRectGetMaxX(lhsRect), CGRectGetMaxX(rhsRect)),
        maxY = MAX(CGRectGetMaxY(lhsRect), CGRectGetMaxY(rhsRect));
    return CGRectMake(minX, minY, maxX - minX, maxY - minY);
}
CGRectInsetByInset = function(aRect, anInset)
{
    return CGRectMake(aRect.origin.x + anInset.left, aRect.origin.y + anInset.top, aRect.size.width - anInset.left - anInset.right, aRect.size.height - anInset.top - anInset.bottom);
}
CGPointFromString = function(aString)
{
    var comma = aString.indexOf(',');
    return {x: parseFloat(aString.substr(1, comma - 1)), y: parseFloat(aString.substring(comma + 1, aString.length))};
}
CGSizeFromString = function(aString)
{
    var comma = aString.indexOf(',');
    return {width: parseFloat(aString.substr(1, comma - 1)), height: parseFloat(aString.substring(comma + 1, aString.length))};
}
CGRectFromString = function(aString)
{
    var comma = aString.indexOf(',', aString.indexOf(',') + 1);
    return {origin: CGPointFromString(aString.substr(1, comma - 1)), size: CGSizeFromString(aString.substring(comma + 2, aString.length - 1))};
}
CGPointFromEvent = function(anEvent)
{
    return CGPointMake(anEvent.clientX, anEvent.clientY);
}
CGInsetUnion = function(lhsInset, rhsInset)
{
    return CGInsetMake(lhsInset.top + rhsInset.top, lhsInset.right + rhsInset.right, lhsInset.bottom + rhsInset.bottom, lhsInset.left + rhsInset.left);
}
CGInsetDifference = function(lhsInset, rhsInset)
{
    return CGInsetMake(lhsInset.top - rhsInset.top, lhsInset.right - rhsInset.right, lhsInset.bottom - rhsInset.bottom, lhsInset.left - rhsInset.left);
}
CGInsetFromString = function(aString)
{
    var numbers = (aString.substr(1, aString.length - 2)).split(',');
    return CGInsetMake(parseFloat(numbers[0]), parseFloat(numbers[1]), parseFloat(numbers[2]), parseFloat(numbers[3]));
}
CGInsetFromCPString = CGInsetFromString;
CPStringFromCGInset = function(anInset)
{
    return "{" + anInset.top + ", " + anInset.left + ", " + anInset.bottom + ", " + anInset.right + "}";
}
CGAlignStroke = function(coord, strokeWidth)
{
    return FLOOR(coord) === coord ? coord + strokeWidth / 2 : coord;
}
CGAlignCoordinate = function(coord)
{
    return FLOOR(coord);
}
