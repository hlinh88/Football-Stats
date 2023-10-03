// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum StringAssets {
  /// Favourite
  internal static let favourite = StringAssets.tr("Localizable", "favourite", fallback: "Favourite")
  /// heart.circle
  internal static let imageFavourite = StringAssets.tr("Localizable", "imageFavourite", fallback: "heart.circle")
  /// Localizable.strings
  ///   FootballStats
  /// 
  ///   Created by Hoang Linh Nguyen on 3/10/2023.
  internal static let imageNewspaper = StringAssets.tr("Localizable", "imageNewspaper", fallback: "newspaper")
  /// calendar.circle
  internal static let imageSchedule = StringAssets.tr("Localizable", "imageSchedule", fallback: "calendar.circle")
  /// 123.rectangle
  internal static let imageStanding = StringAssets.tr("Localizable", "imageStanding", fallback: "123.rectangle")
  /// chart.bar.xaxis
  internal static let imageStats = StringAssets.tr("Localizable", "imageStats", fallback: "chart.bar.xaxis")
  /// Newspaper
  internal static let newspaper = StringAssets.tr("Localizable", "newspaper", fallback: "Newspaper")
  /// Schedule
  internal static let schedule = StringAssets.tr("Localizable", "schedule", fallback: "Schedule")
  /// heart.circle.fill
  internal static let selectedFavourite = StringAssets.tr("Localizable", "selectedFavourite", fallback: "heart.circle.fill")
  /// newspaper.fill
  internal static let selectedNewspaper = StringAssets.tr("Localizable", "selectedNewspaper", fallback: "newspaper.fill")
  /// calendar.circle.fill
  internal static let selectedSchedule = StringAssets.tr("Localizable", "selectedSchedule", fallback: "calendar.circle.fill")
  /// 123.rectangle.fill
  internal static let selectedStanding = StringAssets.tr("Localizable", "selectedStanding", fallback: "123.rectangle.fill")
  /// chart.bar.xaxis
  internal static let selectedStats = StringAssets.tr("Localizable", "selectedStats", fallback: "chart.bar.xaxis")
  /// Standing
  internal static let standing = StringAssets.tr("Localizable", "standing", fallback: "Standing")
  /// Stats
  internal static let stats = StringAssets.tr("Localizable", "stats", fallback: "Stats")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension StringAssets {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
