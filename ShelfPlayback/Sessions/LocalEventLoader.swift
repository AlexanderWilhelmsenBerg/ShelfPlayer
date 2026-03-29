//
//  LocalEventLoader.swift
//  ShelfPlayback
//
//  Created by Rasmus Krämer on 29.03.25.
//

import Foundation
import SwiftUI
import RFNotifications
import ShelfPlayerKit

@MainActor @Observable
public final class LocalEventLoader {
    public private(set) var events: [LocalPlaybackEvent] = []

    public init() {}

    public func load(for itemID: ItemIdentifier) async {
        let description = itemID.description

        do {
            events = try await PersistenceManager.shared.localEvents.events(for: description)
        } catch {
            events = []
        }
    }
}

public extension LocalEventLoader {
    func subscribe(for itemID: ItemIdentifier) {
        RFNotification[.localPlaybackEventRecorded].subscribe { [weak self] event in
            guard event.itemID == itemID else {
                return
            }

            Task { @MainActor [weak self] in
                await self?.load(for: itemID)
            }
        }
    }
}
