// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import RocketReserverAPI

public class Subscription: MockObject {
  public static let objectType: Object = RocketReserverAPI.Objects.Subscription
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Subscription>>

  public struct MockFields {
    @Field<Int>("tripsBooked") public var tripsBooked
  }
}

public extension Mock where O == Subscription {
  convenience init(
    tripsBooked: Int? = nil
  ) {
    self.init()
    _setScalar(tripsBooked, for: \.tripsBooked)
  }
}
