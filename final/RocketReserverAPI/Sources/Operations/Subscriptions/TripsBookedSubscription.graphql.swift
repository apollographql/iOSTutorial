// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct TripsBookedSubscription: GraphQLSubscription {
  public static let operationName: String = "TripsBooked"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"subscription TripsBooked { tripsBooked }"#
    ))

  public init() {}

  public struct Data: RocketReserverAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Subscription }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("tripsBooked", Int?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      TripsBookedSubscription.Data.self
    ] }

    public var tripsBooked: Int? { __data["tripsBooked"] }
  }
}
