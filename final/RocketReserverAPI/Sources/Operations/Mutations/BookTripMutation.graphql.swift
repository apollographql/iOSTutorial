// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class BookTripMutation: GraphQLMutation {
  public static let operationName: String = "BookTrip"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    operationIdentifier: "6669e04c6fbeb58333331f745fb8f913bbbf14358309fba9ebb934ec35bbf2e9",
    definition: .init(
      #"mutation BookTrip($id: ID!) { bookTrips(launchIds: [$id]) { __typename success message launches { __typename ...LaunchListDetail isBooked } } }"#,
      fragments: [LaunchListDetail.self]
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: RocketReserverAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("bookTrips", BookTrips.self, arguments: ["launchIds": [.variable("id")]]),
    ] }

    public var bookTrips: BookTrips { __data["bookTrips"] }

    /// BookTrips
    ///
    /// Parent Type: `TripUpdateResponse`
    public struct BookTrips: RocketReserverAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.TripUpdateResponse }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("success", Bool.self),
        .field("message", String?.self),
        .field("launches", [Launch?]?.self),
      ] }

      public var success: Bool { __data["success"] }
      public var message: String? { __data["message"] }
      public var launches: [Launch?]? { __data["launches"] }

      /// BookTrips.Launch
      ///
      /// Parent Type: `Launch`
      public struct Launch: RocketReserverAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Launch }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("isBooked", Bool.self),
          .fragment(LaunchListDetail.self),
        ] }

        public var isBooked: Bool { __data["isBooked"] }
        public var id: RocketReserverAPI.ID { __data["id"] }
        public var site: String? { __data["site"] }
        public var mission: Mission? { __data["mission"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var launchListDetail: LaunchListDetail { _toFragment() }
        }

        public typealias Mission = LaunchListDetail.Mission
      }
    }
  }
}
