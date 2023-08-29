// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import RocketReserverAPI

public class Launch: MockObject {
  public static let objectType: Object = RocketReserverAPI.Objects.Launch
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Launch>>

  public struct MockFields {
    @Field<RocketReserverAPI.ID>("id") public var id
    @Field<Bool>("isBooked") public var isBooked
    @Field<Mission>("mission") public var mission
    @Field<Rocket>("rocket") public var rocket
    @Field<String>("site") public var site
  }
}

public extension Mock where O == Launch {
  convenience init(
    id: RocketReserverAPI.ID? = nil,
    isBooked: Bool? = nil,
    mission: Mock<Mission>? = nil,
    rocket: Mock<Rocket>? = nil,
    site: String? = nil
  ) {
    self.init()
    _setScalar(id, for: \.id)
    _setScalar(isBooked, for: \.isBooked)
    _setEntity(mission, for: \.mission)
    _setEntity(rocket, for: \.rocket)
    _setScalar(site, for: \.site)
  }
}
