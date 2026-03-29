//
//  AudiobookDefaultTabPreference.swift
//  Multiplatform
//
//  Created by Rasmus Krämer on 29.03.25.
//

import SwiftUI
import ShelfPlayback

struct AudiobookDefaultTabPreference: View {
    @Default(.audiobookDetailDefaultTab) private var defaultTab

    var body: some View {
        HStack {
            Text("settings.audiobookDefaultTab")

            Spacer()

            Picker("settings.audiobookDefaultTab", selection: $defaultTab) {
                ForEach(AudiobookDetailTab.allCases, id: \.self) { tab in
                    Text(LocalizedStringKey("settings.audiobookDefaultTab.\(tab.rawValue)"))
                        .tag(tab)
                }
            }
            .pickerStyle(.menu)
            .labelsHidden()
        }
    }
}

#if DEBUG
#Preview {
    List {
        AudiobookDefaultTabPreference()
    }
}
#endif
