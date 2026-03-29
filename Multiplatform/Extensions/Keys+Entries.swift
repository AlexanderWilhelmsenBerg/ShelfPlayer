//
//  Defaults+Keys.swift
//  iOS
//
//  Created by Rasmus Krämer on 03.02.24.
//

import Foundation
import ShelfPlayback

extension Defaults.Keys {
    static let lastTabValue = Key<TabValue?>("lastTabValue")

    static let carPlayTabBarLibraries = Key<[Library]?>("carPlayTabBarLibraries", default: nil)
    static let carPlayShowOtherLibraries = Key<Bool>("carPlayShowOtherLibraries", default: true)
    static let enableHapticFeedback = Key<Bool>("enableHapticFeedback", default: true)

    static let audiobookDetailDefaultTab = Key<AudiobookDetailTab>("audiobookDetailDefaultTab", default: .timeline)
}

extension RFNotification.IsolatedNotification {
    static var _navigate: IsolatedNotification<ItemIdentifier> { .init("io.rfk.shelfPlayer.navigate.two") }
    static var setGlobalSearch: IsolatedNotification<(String, SearchViewModel.SearchScope)> { .init("io.rfk.shelfPlayer.setGlobalSearch") }
}
