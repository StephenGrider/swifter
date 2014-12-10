let vegetable = "red pepper"
switch vegetable {
    case "celery":
        let vegetableComment = "Add some raisins"
    case let y where y.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(y)?"
    default:
        let vegetableComment = "Everything tastes good in soup"
}

// Try removing the default case.  What error do you get?


switch vegetable {
    case "celery":
        let vegetableComment = "Add some raisins"
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(x)?"
}
// (!) Switch must be exhaustive, consider adding a default clause