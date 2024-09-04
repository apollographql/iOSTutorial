// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CancelTripMutation: GraphQLMutation {
  public static let operationName: String = "CancelTrip"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    operationIdentifier: "fc0763adcfa1b9ae4d3cb5e876beb0a00f66205598c8bf2d401333bba6000024",
    definition: .init(
      #"mutation CancelTrip($launchId: ID!) { cancelTrip(launchId: $launchId) { __typename success message launches { __typename id isBooked } } }"#
    ))

  public var launchId: ID

  public init(launchId: ID) {
    self.launchId = launchId
  }

  public var __variables: Variables? { ["launchId": launchId] }

  public struct Data: RocketReserverAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("cancelTrip", CancelTrip.self, arguments: ["launchId": .variable("launchId")]),
    ] }

    public var cancelTrip: CancelTrip { __data["cancelTrip"] }

    /// CancelTrip
    ///
    /// Parent Type: `TripUpdateResponse`
    public struct CancelTrip: RocketReserverAPI.SelectionSet {
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

      /// CancelTrip.Launch
      ///
      /// Parent Type: `Launch`
      public struct Launch: RocketReserverAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Launch }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", RocketReserverAPI.ID.self),
          .field("isBooked", Bool.self),
        ] }

        public var id: RocketReserverAPI.ID { __data["id"] }
        public var isBooked: Bool { __data["isBooked"] }
      }
    }
  }
}
