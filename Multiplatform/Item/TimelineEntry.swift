//
//  TimelineEntry.swift
//  Multiplatform
//
//  Created by Rasmus Krämer on 29.03.25.
//

import Foundation
import ShelfPlayback

enum AppTimelineEntry: Identifiable {
    case nowPlaying
    case serverSession(SessionPayload)
    case localEvent(LocalPlaybackEvent)
    case releaseDate(String)

    var id: String {
        switch self {
            case .nowPlaying:
                "nowPlaying"
            case .serverSession(let session):
                "session-\(session.id)"
            case .localEvent(let event):
                "localEvent-\(event.id.uuidString)"
            case .releaseDate(let released):
                "releaseDate-\(released)"
        }
    }

    var sortDate: Date {
        switch self {
            case .nowPlaying:
                .distantFuture
            case .serverSession(let session):
                session.startDate
            case .localEvent(let event):
                event.timestamp
            case .releaseDate:
                .distantPast
        }
    }
}
