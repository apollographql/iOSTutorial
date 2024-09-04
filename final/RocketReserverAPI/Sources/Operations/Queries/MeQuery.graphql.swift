// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MeQuery: GraphQLQuery {
  public static let operationName: String = "Me"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    operationIdentifier: "461f1e9fef673b78d9c0aeea35efcca1e89930d36c124f5e2988eb2d3e47b6fc",
    definition: .init(
      #"query Me { me { __typename trips { __typename ...LaunchListDetail isBooked } } }"#,
      fragments: [LaunchListDetail.self]
    ))

  public init() {}

  public struct Data: RocketReserverAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("me", Me?.self),
    ] }

    public var me: Me? { __data["me"] }

    /// Me
    ///
    /// Parent Type: `User`
    public struct Me: RocketReserverAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("trips", [Trip?].self),
      ] }

      public var trips: [Trip?] { __data["trips"] }

      /// Me.Trip
      ///
      /// Parent Type: `Launch`
      public struct Trip: RocketReserverAPI.SelectionSet {
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
