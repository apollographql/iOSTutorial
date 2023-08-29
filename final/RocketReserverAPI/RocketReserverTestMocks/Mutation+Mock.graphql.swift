// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import RocketReserverAPI

public class Mutation: MockObject {
  public static let objectType: Object = RocketReserverAPI.Objects.Mutation
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Mutation>>

  public struct MockFields {
    @Field<TripUpdateResponse>("bookTrips") public var bookTrips
    @Field<TripUpdateResponse>("cancelTrip") public var cancelTrip
    @Field<User>("login") public var login
  }
}

public extension Mock where O == Mutation {
  convenience init(
    bookTrips: Mock<TripUpdateResponse>? = nil,
    cancelTrip: Mock<TripUpdateResponse>? = nil,
    login: Mock<User>? = nil
  ) {
    self.init()
    _setEntity(bookTrips, for: \.bookTrips)
    _setEntity(cancelTrip, for: \.cancelTrip)
    _setEntity(login, for: \.login)
  }
}
