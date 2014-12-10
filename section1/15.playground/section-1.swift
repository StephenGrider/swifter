// Add a third case to ServerResponse and the switch

enum ServerResponse {
    case Result(String, String)
    case Error(String)
    case MysteryError(String)
}

let success = ServerResponse.Result("6:08", "7:10")
let failure = ServerResponse.Error("Error occured.")
let mysteryError = ServerResponse.MysteryError("No clue what happened")


func parseResponse(response: ServerResponse) -> String {
    var serverResponse: String
    switch response {
    case let .Result(sunrise, sunset):
        serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
    case let .Error(message):
        serverResponse = "Failure... \(message)"
    case let .MysteryError(message):
        serverResponse = message
    }
    
    return serverResponse
}

parseResponse(success)
parseResponse(failure)
parseResponse(mysteryError)
