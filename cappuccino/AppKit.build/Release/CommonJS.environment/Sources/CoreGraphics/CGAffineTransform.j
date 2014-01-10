@STATIC;1.0;i;12;CGGeometry.jt;5113;objj_executeFile("CGGeometry.j", YES);CGAffineTransformMake = function(a, b, c, d, tx, ty)
{
    return {a: a, b: b, c: c, d: d, tx: tx, ty: ty};
}
CGAffineTransformMakeIdentity = function()
{
    return {a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0};
}
CGAffineTransformMakeCopy = function(anAffineTransform)
{
    return {a: anAffineTransform.a, b: anAffineTransform.b, c: anAffineTransform.c, d: anAffineTransform.d, tx: anAffineTransform.tx, ty: anAffineTransform.ty};
}
CGAffineTransformMakeScale = function(sx, sy)
{
    return {a: sx, b: 0.0, c: 0.0, d: sy, tx: 0.0, ty: 0.0};
}
CGAffineTransformMakeTranslation = function(tx, ty)
{
    return {a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: tx, ty: ty};
}
CGAffineTransformTranslate = function(aTransform, tx, ty)
{
    return CGAffineTransformMake(aTransform.a, aTransform.b, aTransform.c, aTransform.d, aTransform.tx + aTransform.a * tx + aTransform.c * ty, aTransform.ty + aTransform.b * tx + aTransform.d * ty);
}
CGAffineTransformScale = function(aTransform, sx, sy)
{
    return CGAffineTransformMake(aTransform.a * sx, aTransform.b * sx, aTransform.c * sy, aTransform.d * sy, aTransform.tx, aTransform.ty);
}
CGAffineTransformConcat = function(lhs, rhs)
{
    return CGAffineTransformMake(lhs.a * rhs.a + lhs.b * rhs.c, lhs.a * rhs.b + lhs.b * rhs.d, lhs.c * rhs.a + lhs.d * rhs.c, lhs.c * rhs.b + lhs.d * rhs.d, lhs.tx * rhs.a + lhs.ty * rhs.c + rhs.tx, lhs.tx * rhs.b + lhs.ty * rhs.d + rhs.ty);
}
CGAffineTransformConcatTo = function(lhs, rhs, to)
{
    var tx = lhs.tx * rhs.a + lhs.ty * rhs.c + rhs.tx;
    to.ty = lhs.tx * rhs.b + lhs.ty * rhs.d + rhs.ty;
    to.tx = tx;
    var a = lhs.a * rhs.a + lhs.b * rhs.c,
        b = lhs.a * rhs.b + lhs.b * rhs.d,
        c = lhs.c * rhs.a + lhs.d * rhs.c;
    to.d = lhs.c * rhs.b + lhs.d * rhs.d;
    to.a = a;
    to.b = b;
    to.c = c;
}
CGPointApplyAffineTransform = function(aPoint, aTransform)
{
    return {x: aPoint.x * aTransform.a + aPoint.y * aTransform.c + aTransform.tx, y: aPoint.x * aTransform.b + aPoint.y * aTransform.d + aTransform.ty};
}
CGSizeApplyAffineTransform = function(aSize, aTransform)
{
    return {width: aSize.width * aTransform.a + aSize.height * aTransform.c, height: aSize.width * aTransform.b + aSize.height * aTransform.d};
}
CGAffineTransformIsIdentity = function(aTransform)
{
    return aTransform.a === 1.0 && aTransform.b === 0.0 && aTransform.c === 0.0 && aTransform.d === 1.0 && aTransform.tx === 0.0 && aTransform.ty === 0.0;
}
CGAffineTransformEqualToTransform = function(lhs, rhs)
{
    return lhs.a === rhs.a && lhs.b === rhs.b && lhs.c === rhs.c && lhs.d === rhs.d && lhs.tx === rhs.tx && lhs.ty === rhs.ty;
}
CGStringCreateWithCGAffineTransform = function(aTransform)
{
    return " [[ " + aTransform.a + ", " + aTransform.b + ", 0 ], [ " + aTransform.c + ", " + aTransform.d + ", 0 ], [ " + aTransform.tx + ", " + aTransform.ty + ", 1]]";
}
CGAffineTransformCreateCopy = CGAffineTransformMakeCopy;
CGAffineTransformMakeRotation = function(anAngle)
{
    var sin = SIN(anAngle),
        cos = COS(anAngle);
    return CGAffineTransformMake(cos, sin, -sin, cos, 0.0, 0.0);
}
CGAffineTransformRotate = function(aTransform, anAngle)
{
    var sin = SIN(anAngle),
        cos = COS(anAngle);
    return {a: aTransform.a * cos + aTransform.c * sin, b: aTransform.b * cos + aTransform.d * sin, c: aTransform.c * cos - aTransform.a * sin, d: aTransform.d * cos - aTransform.b * sin, tx: aTransform.tx, ty: aTransform.ty};
}
CGAffineTransformInvert = function(aTransform)
{
    var determinant = 1 / (aTransform.a * aTransform.d - aTransform.b * aTransform.c);
    return {a: determinant * aTransform.d, b: -determinant * aTransform.b, c: -determinant * aTransform.c, d: determinant * aTransform.a, tx: determinant * (aTransform.c * aTransform.ty - aTransform.d * aTransform.tx), ty: determinant * (aTransform.b * aTransform.tx - aTransform.a * aTransform.ty)};
}
CGRectApplyAffineTransform = function(aRect, anAffineTransform)
{
    var top = CGRectGetMinY(aRect),
        left = CGRectGetMinX(aRect),
        right = CGRectGetMaxX(aRect),
        bottom = CGRectGetMaxY(aRect),
        topLeft = CGPointApplyAffineTransform(CGPointMake(left, top), anAffineTransform),
        topRight = CGPointApplyAffineTransform(CGPointMake(right, top), anAffineTransform),
        bottomLeft = CGPointApplyAffineTransform(CGPointMake(left, bottom), anAffineTransform),
        bottomRight = CGPointApplyAffineTransform(CGPointMake(right, bottom), anAffineTransform),
        minX = MIN(topLeft.x, topRight.x, bottomLeft.x, bottomRight.x),
        maxX = MAX(topLeft.x, topRight.x, bottomLeft.x, bottomRight.x),
        minY = MIN(topLeft.y, topRight.y, bottomLeft.y, bottomRight.y),
        maxY = MAX(topLeft.y, topRight.y, bottomLeft.y, bottomRight.y);
    return CGRectMake(minX, minY, maxX - minX, maxY - minY);
}
CPStringFromCGAffineTransform = function(anAffineTransform)
{
    return '{' + anAffineTransform.a + ", " + anAffineTransform.b + ", " + anAffineTransform.c + ", " + anAffineTransform.d + ", " + anAffineTransform.tx + ", " + anAffineTransform.ty + '}';
}
