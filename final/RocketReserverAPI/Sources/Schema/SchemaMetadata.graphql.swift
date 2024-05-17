// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == RocketReserverAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == RocketReserverAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == RocketReserverAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == RocketReserverAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Mutation": return RocketReserverAPI.Objects.Mutation
    case "User": return RocketReserverAPI.Objects.User
    case "Query": return RocketReserverAPI.Objects.Query
    case "Launch": return RocketReserverAPI.Objects.Launch
    case "Mission": return RocketReserverAPI.Objects.Mission
    case "Rocket": return RocketReserverAPI.Objects.Rocket
    case "TripUpdateResponse": return RocketReserverAPI.Objects.TripUpdateResponse
    case "Subscription": return RocketReserverAPI.Objects.Subscription
    case "LaunchConnection": return RocketReserverAPI.Objects.LaunchConnection
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
