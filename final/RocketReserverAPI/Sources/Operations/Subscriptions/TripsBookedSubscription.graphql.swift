// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class TripsBookedSubscription: GraphQLSubscription {
  public static let operationName: String = "TripsBooked"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"subscription TripsBooked { tripsBooked }"#
    ))

  public init() {}

  public struct Data: RocketReserverAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { RocketReserverAPI.Objects.Subscription }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("tripsBooked", Int?.self),
    ] }

    public var tripsBooked: Int? { __data["tripsBooked"] }
  }
}
