// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct LaunchListDetail: RocketReserverAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment LaunchListDetail on Launch { __typename id site mission { __typename name missionPatch(size: SMALL) } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Launch }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", RocketReserverAPI.ID.self),
    .field("site", String?.self),
    .field("mission", Mission?.self),
  ] }

  public var id: RocketReserverAPI.ID { __data["id"] }
  public var site: String? { __data["site"] }
  public var mission: Mission? { __data["mission"] }

  /// Mission
  ///
  /// Parent Type: `Mission`
  public struct Mission: RocketReserverAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Mission }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("name", String?.self),
      .field("missionPatch", String?.self, arguments: ["size": "SMALL"]),
    ] }

    public var name: String? { __data["name"] }
    public var missionPatch: String? { __data["missionPatch"] }
  }
}
