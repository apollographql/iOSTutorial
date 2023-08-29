//
//  TestMocksTest.swift
//  RocketReserver
//
//  Created by Chase McElroy on 8/29/23.
//

import Foundation
import RocketReserverAPI
import ApolloTestSupport
import RocketReserverTestMocks

func testStuffTest() {
    let mockLaunch = Mock<Launch>()
    let query = LaunchListQuery.Data.Launches.from(mockLaunch)
}
