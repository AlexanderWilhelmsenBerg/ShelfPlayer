//
//  LocalPlaybackEvent.swift
//  ShelfPlayerKit
//
//  Created by Rasmus Krämer on 29.03.25.
//

import Foundation
import SwiftData

public enum LocalPlaybackEventType: String, Sendable, Codable {
    case paused
    case stopped
    case sleepTimerEnded
}

extension SchemaV3 {
    @Model
    public final class LocalPlaybackEvent {
        @Attribute(.unique)
        private(set) var id: UUID

        var rawEventType: String
        var _itemID: String

        var timestamp: Date
        var currentTime: TimeInterval
        var duration: TimeInterval
        var chapterTitle: String?
        var progressPercentage: Double

        init(eventType: LocalPlaybackEventType, itemID: ItemIdentifier, timestamp: Date, currentTime: TimeInterval, duration: TimeInterval, chapterTitle: String?, progressPercentage: Double) {
            id = .init()
            rawEventType = eventType.rawValue
            _itemID = itemID.description
            self.timestamp = timestamp
            self.currentTime = currentTime
            self.duration = duration
            self.chapterTitle = chapterTitle
            self.progressPercentage = progressPercentage
        }

        public var eventType: LocalPlaybackEventType {
            LocalPlaybackEventType(rawValue: rawEventType) ?? .stopped
        }

        public var itemID: ItemIdentifier {
            .init(string: _itemID)
        }
    }
}
