func anyCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1,2,3], [1])

// The above function will return true if the two sequences passed in have any common elements
// Modify the function to make a function that returns the an array of hte elements that any two sequences have in common
// Editor: Note the fixed type references on line 1.

func getCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> [T.Generator.Element] {
    var seq: [T.Generator.Element] = []
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                seq.append(lhsItem)
            }
        }
    }
    return seq
}

getCommonElements([1,2,3, 30], [1, 10, 30])
