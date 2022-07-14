//
// Copyright © 2022 osy. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import SwiftUI

struct VMSettingsAddDeviceMenuView: View {
    @ObservedObject var config: UTMQemuConfiguration
    
    var body: some View {
        Menu {
            Button {
                config.displays.append(UTMQemuConfigurationDisplay())
            } label: {
                Label("Display", systemImage: "rectangle.on.rectangle")
            }.disabled(config.system.architecture.displayDeviceType.allRawValues.isEmpty)
            Button {
                config.serials.append(UTMQemuConfigurationSerial())
            } label: {
                Label("Serial", systemImage: "cable.connector")
            }.disabled(config.system.architecture.serialDeviceType.allRawValues.isEmpty)
            Button {
                config.networks.append(UTMQemuConfigurationNetwork())
            } label: {
                Label("Network", systemImage: "network")
            }.disabled(config.system.architecture.networkDeviceType.allRawValues.isEmpty)
            Button {
                config.sound.append(UTMQemuConfigurationSound())
            } label: {
                Label("Sound", systemImage: "speaker.wave.2")
            }.disabled(config.system.architecture.soundDeviceType.allRawValues.isEmpty)
        } label: {
            Label("New…", systemImage: "plus")
        }.help("Add a new device.")
        .menuStyle(.borderlessButton)
    }
}

struct VMSettingsAddDeviceMenuView_Previews: PreviewProvider {
    @StateObject static private var config = UTMQemuConfiguration()
    
    static var previews: some View {
        VMSettingsAddDeviceMenuView(config: config)
    }
}
