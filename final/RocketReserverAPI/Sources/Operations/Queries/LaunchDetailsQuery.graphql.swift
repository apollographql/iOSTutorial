// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct LaunchDetailsQuery: GraphQLQuery {
  public static let operationName: String = "LaunchDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query LaunchDetails($launchId: ID!) { launch(id: $launchId) { __typename id site mission { __typename name missionPatch(size: LARGE) } rocket { __typename name type } isBooked } }"#
    ))

  public var launchId: ID

  public init(launchId: ID) {
    self.launchId = launchId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["launchId": launchId] }

  public struct Data: RocketReserverAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("launch", Launch?.self, arguments: ["id": .variable("launchId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      LaunchDetailsQuery.Data.self
    ] }

    public var launch: Launch? { __data["launch"] }

    /// Launch
    ///
    /// Parent Type: `Launch`
    public struct Launch: RocketReserverAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Launch }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", RocketReserverAPI.ID.self),
        .field("site", String?.self),
        .field("mission", Mission?.self),
        .field("rocket", Rocket?.self),
        .field("isBooked", Bool.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        LaunchDetailsQuery.Data.Launch.self
      ] }

      public var id: RocketReserverAPI.ID { __data["id"] }
      public var site: String? { __data["site"] }
      public var mission: Mission? { __data["mission"] }
      public var rocket: Rocket? { __data["rocket"] }
      public var isBooked: Bool { __data["isBooked"] }

      /// Launch.Mission
      ///
      /// Parent Type: `Mission`
      public struct Mission: RocketReserverAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Mission }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
          .field("missionPatch", String?.self, arguments: ["size": "LARGE"]),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          LaunchDetailsQuery.Data.Launch.Mission.self
        ] }

        public var name: String? { __data["name"] }
        public var missionPatch: String? { __data["missionPatch"] }
      }

      /// Launch.Rocket
      ///
      /// Parent Type: `Rocket`
      public struct Rocket: RocketReserverAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Rocket }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
          .field("type", String?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          LaunchDetailsQuery.Data.Launch.Rocket.self
        ] }

        public var name: String? { __data["name"] }
        public var type: String? { __data["type"] }
      }
    }
  }
}
