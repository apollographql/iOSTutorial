// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import RocketReserverAPI

public class Mission: MockObject {
  public static let objectType: Object = RocketReserverAPI.Objects.Mission
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Mission>>

  public struct MockFields {
    @Field<String>("missionPatch") public var missionPatch
    @Field<String>("name") public var name
  }
}

public extension Mock where O == Mission {
  convenience init(
    missionPatch: String? = nil,
    name: String? = nil
  ) {
    self.init()
    _setScalar(missionPatch, for: \.missionPatch)
    _setScalar(name, for: \.name)
  }
}
