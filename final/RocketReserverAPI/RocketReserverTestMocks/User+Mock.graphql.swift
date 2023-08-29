// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import RocketReserverAPI

public class User: MockObject {
  public static let objectType: Object = RocketReserverAPI.Objects.User
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<User>>

  public struct MockFields {
    @Field<String>("token") public var token
  }
}

public extension Mock where O == User {
  convenience init(
    token: String? = nil
  ) {
    self.init()
    _setScalar(token, for: \.token)
  }
}
