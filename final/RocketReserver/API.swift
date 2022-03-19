// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class BookTripMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation BookTrip($id: ID!) {
      bookTrips(launchIds: [$id]) {
        __typename
        success
        message
        launches {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "BookTrip"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("bookTrips", arguments: ["launchIds": [GraphQLVariable("id")]], type: .nonNull(.object(BookTrip.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(bookTrips: BookTrip) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "bookTrips": bookTrips.resultMap])
    }

    public var bookTrips: BookTrip {
      get {
        return BookTrip(unsafeResultMap: resultMap["bookTrips"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "bookTrips")
      }
    }

    public struct BookTrip: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TripUpdateResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("message", type: .scalar(String.self)),
          GraphQLField("launches", type: .list(.object(Launch.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(success: Bool, message: String? = nil, launches: [Launch?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "TripUpdateResponse", "success": success, "message": message, "launches": launches.flatMap { (value: [Launch?]) -> [ResultMap?] in value.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var success: Bool {
        get {
          return resultMap["success"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "success")
        }
      }

      public var message: String? {
        get {
          return resultMap["message"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }

      public var launches: [Launch?]? {
        get {
          return (resultMap["launches"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Launch?] in value.map { (value: ResultMap?) -> Launch? in value.flatMap { (value: ResultMap) -> Launch in Launch(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Launch?]) -> [ResultMap?] in value.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } } }, forKey: "launches")
        }
      }

      public struct Launch: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Launch"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Launch", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class CancelTripMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CancelTrip($id: ID!) {
      cancelTrip(launchId: $id) {
        __typename
        success
        message
        launches {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "CancelTrip"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("cancelTrip", arguments: ["launchId": GraphQLVariable("id")], type: .nonNull(.object(CancelTrip.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(cancelTrip: CancelTrip) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "cancelTrip": cancelTrip.resultMap])
    }

    public var cancelTrip: CancelTrip {
      get {
        return CancelTrip(unsafeResultMap: resultMap["cancelTrip"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "cancelTrip")
      }
    }

    public struct CancelTrip: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TripUpdateResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("message", type: .scalar(String.self)),
          GraphQLField("launches", type: .list(.object(Launch.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(success: Bool, message: String? = nil, launches: [Launch?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "TripUpdateResponse", "success": success, "message": message, "launches": launches.flatMap { (value: [Launch?]) -> [ResultMap?] in value.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var success: Bool {
        get {
          return resultMap["success"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "success")
        }
      }

      public var message: String? {
        get {
          return resultMap["message"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }

      public var launches: [Launch?]? {
        get {
          return (resultMap["launches"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Launch?] in value.map { (value: ResultMap?) -> Launch? in value.flatMap { (value: ResultMap) -> Launch in Launch(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Launch?]) -> [ResultMap?] in value.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } } }, forKey: "launches")
        }
      }

      public struct Launch: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Launch"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Launch", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class LaunchDetailsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LaunchDetails($launchId: ID!) {
      launch(id: $launchId) {
        __typename
        id
        site
        mission {
          __typename
          name
          missionPatch(size: LARGE)
        }
        rocket {
          __typename
          name
          type
        }
        isBooked
      }
    }
    """

  public let operationName: String = "LaunchDetails"

  public var launchId: GraphQLID

  public init(launchId: GraphQLID) {
    self.launchId = launchId
  }

  public var variables: GraphQLMap? {
    return ["launchId": launchId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launch", arguments: ["id": GraphQLVariable("launchId")], type: .object(Launch.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launch: Launch? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launch": launch.flatMap { (value: Launch) -> ResultMap in value.resultMap }])
    }

    public var launch: Launch? {
      get {
        return (resultMap["launch"] as? ResultMap).flatMap { Launch(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "launch")
      }
    }

    public struct Launch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("site", type: .scalar(String.self)),
          GraphQLField("mission", type: .object(Mission.selections)),
          GraphQLField("rocket", type: .object(Rocket.selections)),
          GraphQLField("isBooked", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, site: String? = nil, mission: Mission? = nil, rocket: Rocket? = nil, isBooked: Bool) {
        self.init(unsafeResultMap: ["__typename": "Launch", "id": id, "site": site, "mission": mission.flatMap { (value: Mission) -> ResultMap in value.resultMap }, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }, "isBooked": isBooked])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var site: String? {
        get {
          return resultMap["site"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "site")
        }
      }

      public var mission: Mission? {
        get {
          return (resultMap["mission"] as? ResultMap).flatMap { Mission(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mission")
        }
      }

      public var rocket: Rocket? {
        get {
          return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
        }
      }

      public var isBooked: Bool {
        get {
          return resultMap["isBooked"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isBooked")
        }
      }

      public struct Mission: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mission"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("missionPatch", arguments: ["size": "LARGE"], type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, missionPatch: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Mission", "name": name, "missionPatch": missionPatch])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var missionPatch: String? {
          get {
            return resultMap["missionPatch"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "missionPatch")
          }
        }
      }

      public struct Rocket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Rocket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, type: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Rocket", "name": name, "type": type])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }
      }
    }
  }
}

public final class LaunchListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LaunchList($cursor: String) {
      launches(after: $cursor) {
        __typename
        hasMore
        cursor
        launches {
          __typename
          id
          site
          mission {
            __typename
            name
            missionPatch(size: SMALL)
          }
        }
      }
    }
    """

  public let operationName: String = "LaunchList"

  public var cursor: String?

  public init(cursor: String? = nil) {
    self.cursor = cursor
  }

  public var variables: GraphQLMap? {
    return ["cursor": cursor]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launches", arguments: ["after": GraphQLVariable("cursor")], type: .nonNull(.object(Launch.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launches: Launch) {
      self.init(unsafeResultMap: ["__typename": "Query", "launches": launches.resultMap])
    }

    public var launches: Launch {
      get {
        return Launch(unsafeResultMap: resultMap["launches"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "launches")
      }
    }

    public struct Launch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LaunchConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("hasMore", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
          GraphQLField("launches", type: .nonNull(.list(.object(Launch.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(hasMore: Bool, cursor: String, launches: [Launch?]) {
        self.init(unsafeResultMap: ["__typename": "LaunchConnection", "hasMore": hasMore, "cursor": cursor, "launches": launches.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var hasMore: Bool {
        get {
          return resultMap["hasMore"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "hasMore")
        }
      }

      public var cursor: String {
        get {
          return resultMap["cursor"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cursor")
        }
      }

      public var launches: [Launch?] {
        get {
          return (resultMap["launches"] as! [ResultMap?]).map { (value: ResultMap?) -> Launch? in value.flatMap { (value: ResultMap) -> Launch in Launch(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } }, forKey: "launches")
        }
      }

      public struct Launch: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Launch"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("site", type: .scalar(String.self)),
            GraphQLField("mission", type: .object(Mission.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, site: String? = nil, mission: Mission? = nil) {
          self.init(unsafeResultMap: ["__typename": "Launch", "id": id, "site": site, "mission": mission.flatMap { (value: Mission) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var site: String? {
          get {
            return resultMap["site"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site")
          }
        }

        public var mission: Mission? {
          get {
            return (resultMap["mission"] as? ResultMap).flatMap { Mission(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "mission")
          }
        }

        public struct Mission: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Mission"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("missionPatch", arguments: ["size": "SMALL"], type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, missionPatch: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Mission", "name": name, "missionPatch": missionPatch])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var missionPatch: String? {
            get {
              return resultMap["missionPatch"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "missionPatch")
            }
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($loginEmail: String) {
      login(email: $loginEmail) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "Login"

  public var loginEmail: String?

  public init(loginEmail: String? = nil) {
    self.loginEmail = loginEmail
  }

  public var variables: GraphQLMap? {
    return ["loginEmail": loginEmail]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["email": GraphQLVariable("loginEmail")], type: .object(Login.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class TripsBookedSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription TripsBooked {
      tripsBooked
    }
    """

  public let operationName: String = "TripsBooked"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("tripsBooked", type: .scalar(Int.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(tripsBooked: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "tripsBooked": tripsBooked])
    }

    public var tripsBooked: Int? {
      get {
        return resultMap["tripsBooked"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "tripsBooked")
      }
    }
  }
}
