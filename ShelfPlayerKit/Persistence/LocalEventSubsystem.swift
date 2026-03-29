//
//  LocalEventSubsystem.swift
//  ShelfPlayerKit
//
//  Created by Rasmus Krämer on 29.03.25.
//

import Foundation
import SwiftData
import OSLog

extension PersistenceManager {
    @ModelActor
    public final actor LocalEventSubsystem {
        let logger = Logger(subsystem: "io.rfk.shelfPlayerKit", category: "LocalEvents")

        public func insert(_ event: LocalPlaybackEvent) throws {
            modelContext.insert(event)
            try modelContext.save()
        }

        public func events(for itemID: String) throws -> [LocalPlaybackEvent] {
            let events = try modelContext.fetch(FetchDescriptor<LocalPlaybackEvent>(predicate: #Predicate {
                $0._itemID == itemID
            }))

            return events.sorted { $0.timestamp > $1.timestamp }
        }

        public func deleteAll(for itemID: String) throws {
            try modelContext.delete(model: LocalPlaybackEvent.self, where: #Predicate {
                $0._itemID == itemID
            })
            try modelContext.save()
        }

        public func pruneOldEvents(olderThan date: Date) throws {
            try modelContext.delete(model: LocalPlaybackEvent.self, where: #Predicate {
                $0.timestamp < date
            })
            try modelContext.save()
        }
    }
}
