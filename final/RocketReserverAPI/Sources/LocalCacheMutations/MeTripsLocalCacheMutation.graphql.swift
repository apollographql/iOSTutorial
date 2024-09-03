// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MeTripsLocalCacheMutation: LocalCacheMutation {
  public static let operationType: GraphQLOperationType = .query

  public init() {}

  public struct Data: RocketReserverAPI.MutableSelectionSet {
    public var __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("me", Me?.self),
    ] }

    public var me: Me? {
      get { __data["me"] }
      set { __data["me"] = newValue }
    }

    public init(
      me: Me? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": RocketReserverAPI.Objects.Query.typename,
          "me": me._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(MeTripsLocalCacheMutation.Data.self)
        ]
      ))
    }

    /// Me
    ///
    /// Parent Type: `User`
    public struct Me: RocketReserverAPI.MutableSelectionSet {
      public var __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("trips", [Trip?].self),
      ] }

      public var trips: [Trip?] {
        get { __data["trips"] }
        set { __data["trips"] = newValue }
      }

      public init(
        trips: [Trip?]
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": RocketReserverAPI.Objects.User.typename,
            "trips": trips._fieldData,
          ],
          fulfilledFragments: [
            ObjectIdentifier(MeTripsLocalCacheMutation.Data.Me.self)
          ]
        ))
      }

      /// Me.Trip
      ///
      /// Parent Type: `Launch`
      public struct Trip: RocketReserverAPI.MutableSelectionSet {
        public var __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { RocketReserverAPI.Objects.Launch }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("isBooked", Bool.self),
          .fragment(LaunchListDetail.self),
        ] }

        public var isBooked: Bool {
          get { __data["isBooked"] }
          set { __data["isBooked"] = newValue }
        }
        public var id: RocketReserverAPI.ID {
          get { __data["id"] }
          set { __data["id"] = newValue }
        }
        public var site: String? {
          get { __data["site"] }
          set { __data["site"] = newValue }
        }
        public var mission: Mission? {
          get { __data["mission"] }
          set { __data["mission"] = newValue }
        }

        public struct Fragments: FragmentContainer {
          public var __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var launchListDetail: LaunchListDetail {
            get { _toFragment() }
            _modify { var f = launchListDetail; yield &f; __data = f.__data }
          }
        }

        public init(
          isBooked: Bool,
          id: RocketReserverAPI.ID,
          site: String? = nil,
          mission: Mission? = nil
        ) {
          self.init(_dataDict: DataDict(
            data: [
              "__typename": RocketReserverAPI.Objects.Launch.typename,
              "isBooked": isBooked,
              "id": id,
              "site": site,
              "mission": mission._fieldData,
            ],
            fulfilledFragments: [
              ObjectIdentifier(MeTripsLocalCacheMutation.Data.Me.Trip.self),
              ObjectIdentifier(LaunchListDetail.self)
            ]
          ))
        }

        public typealias Mission = LaunchListDetail.Mission
      }
    }
  }
}
