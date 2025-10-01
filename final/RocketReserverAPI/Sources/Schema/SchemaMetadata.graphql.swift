// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == RocketReserverAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == RocketReserverAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == RocketReserverAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == RocketReserverAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  @_spi(Execution) public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Launch": return RocketReserverAPI.Objects.Launch
    case "LaunchConnection": return RocketReserverAPI.Objects.LaunchConnection
    case "Mission": return RocketReserverAPI.Objects.Mission
    case "Mutation": return RocketReserverAPI.Objects.Mutation
    case "Query": return RocketReserverAPI.Objects.Query
    case "Rocket": return RocketReserverAPI.Objects.Rocket
    case "Subscription": return RocketReserverAPI.Objects.Subscription
    case "TripUpdateResponse": return RocketReserverAPI.Objects.TripUpdateResponse
    case "User": return RocketReserverAPI.Objects.User
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
