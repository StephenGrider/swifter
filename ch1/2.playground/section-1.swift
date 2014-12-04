let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// Remove the conversion to String from above. What's the error?

let badWidthLabel = label + width
// Cannot invoke + with an argument list of String, and Int
