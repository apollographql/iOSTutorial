// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CancelTripMutation: GraphQLMutation {
  public static let operationName: String = "CancelTrip"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CancelTrip($launchId: ID!) { cancelTrip(launchId: $launchId) { __typename success message } }"#
    ))

  public var launchId: ID

  public init(launchId: ID) {
    self.launchId = launchId
  }

  public var __variables: Variables? { ["launchId": launchId] }

  public struct Data: RocketReserverAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { RocketReserverAPI.Objects.Mutation }
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

      public static var __parentType: ApolloAPI.ParentType { RocketReserverAPI.Objects.TripUpdateResponse }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("success", Bool.self),
        .field("message", String?.self),
      ] }

      public var success: Bool { __data["success"] }
      public var message: String? { __data["message"] }
    }
  }
}
