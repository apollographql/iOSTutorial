// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import RocketReserverAPI

public class TripUpdateResponse: MockObject {
  public static let objectType: Object = RocketReserverAPI.Objects.TripUpdateResponse
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<TripUpdateResponse>>

  public struct MockFields {
    @Field<String>("message") public var message
    @Field<Bool>("success") public var success
  }
}

public extension Mock where O == TripUpdateResponse {
  convenience init(
    message: String? = nil,
    success: Bool? = nil
  ) {
    self.init()
    _setScalar(message, for: \.message)
    _setScalar(success, for: \.success)
  }
}
