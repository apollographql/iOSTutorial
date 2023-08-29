// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import RocketReserverAPI

public class Rocket: MockObject {
  public static let objectType: Object = RocketReserverAPI.Objects.Rocket
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Rocket>>

  public struct MockFields {
    @Field<String>("name") public var name
    @Field<String>("type") public var type
  }
}

public extension Mock where O == Rocket {
  convenience init(
    name: String? = nil,
    type: String? = nil
  ) {
    self.init()
    _setScalar(name, for: \.name)
    _setScalar(type, for: \.type)
  }
}
