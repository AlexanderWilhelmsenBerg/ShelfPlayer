//
//  SchemaV3.swift
//  ShelfPlayerKit
//
//  Created by Rasmus Krämer on 29.03.25.
//

import Foundation
import SwiftData

enum SchemaV3: VersionedSchema {
    static var versionIdentifier: Schema.Version {
        .init(3, 0, 0)
    }
    static var models: [any PersistentModel.Type] {[
        PersistedAudiobook.self,
        PersistedEpisode.self,
        PersistedPodcast.self,

        PersistedAsset.self,
        PersistedBookmark.self,
        PersistedChapter.self,

        PersistedProgress.self,
        PersistedPlaybackSession.self,

        PersistedKeyValueEntity.self,
        PersistedSearchIndexEntry.self,

        PersistedDiscoveredConnection.self,

        LocalPlaybackEvent.self,
    ]}
}
