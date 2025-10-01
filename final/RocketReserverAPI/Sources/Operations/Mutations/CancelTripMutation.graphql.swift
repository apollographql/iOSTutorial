// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct CancelTripMutation: GraphQLMutation {
  public static let operationName: String = "CancelTrip"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CancelTrip($launchId: ID!) { cancelTrip(launchId: $launchId) { __typename success message } }"#
    ))

  public var launchId: ID

  public init(launchId: ID) {
    self.launchId = launchId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["launchId": launchId] }

  public struct Data: RocketReserverAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("cancelTrip", CancelTrip.self, arguments: ["launchId": .variable("launchId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      CancelTripMutation.Data.self
    ] }

    public var cancelTrip: CancelTrip { __data["cancelTrip"] }

    /// CancelTrip
    ///
    /// Parent Type: `TripUpdateResponse`
    public struct CancelTrip: RocketReserverAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.TripUpdateResponse }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("success", Bool.self),
        .field("message", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        CancelTripMutation.Data.CancelTrip.self
      ] }

      public var success: Bool { __data["success"] }
      public var message: String? { __data["message"] }
    }
  }
}
