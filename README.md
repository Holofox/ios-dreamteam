# App with using VIPER architecture
Languages, libraries and tools used
* [Swift](https://developer.apple.com/swift/)
* [Realm](https://realm.io/docs/swift/latest/)

## Requirements
* [Xcode 10.1+](https://developer.apple.com/documentation/xcode_release_notes/xcode_10_1_release_notes)
* Swift 4.2.1+
* [macOS High Sierra 10.13.6+](https://support.apple.com/en_AU/downloads/high-siera)

## Architecture
This project follows iOS architecture guidelines that are based on VIPER.

## Project structure
- Database
  - Entity
- Models
- TabBar
- Navigation
    - Base
    - Entries
        - Detail
        - List
    - Add
    - Edit
        - Detail
        - List
    - Group
        - Add
        - List
- Shared
- Common
    - Controls

## Overview
A little fox organizer. The project was completed as part of a test task.

Entries                    |  Entry detail             |  Add entry
:-------------------------:|:-------------------------:|:-------------------------:
![alt-entries](https://github.com/Holofox/ios-dreamteam/blob/master/Screenshots/entries_screen.png "Entries")  |  ![alt-entry-detail](https://github.com/Holofox/ios-dreamteam/blob/master/Screenshots/entries_detail_screen.png "Entry Detail") | ![alt-add-entry](https://github.com/Holofox/ios-dreamteam/blob/master/Screenshots/add_entry_screen.png "Add entry")
Edit entry                 |  Add group          |  Groups
![alt-edit-entry](https://github.com/Holofox/ios-dreamteam/blob/master/Screenshots/edit_screen.png "Edit entry")  |  ![alt-add-group](https://github.com/Holofox/ios-dreamteam/blob/master/Screenshots/add_group_screen.png "Add group") | ![alt-groups](https://github.com/Holofox/ios-dreamteam/blob/master/Screenshots/groups_screen.png "Groups")

## License

This source is released under the [MIT License](https://github.com/Holofox/ios-dreamteam/blob/master/LICENSE).
